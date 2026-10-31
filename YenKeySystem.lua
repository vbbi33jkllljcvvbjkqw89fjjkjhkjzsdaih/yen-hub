-- Yen key system, checks the game, asks for a key and the terms, then loads that game's script

local Repo = "https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/"

local Settings = {
	Name = "Yen",
	Placeholder = "Key goes here",
	Remember = true,
	Duration = 3600,

	GetKeyLink = "",
	DiscordLink = "",
	TutorialLink = "",

	-- "Static" checks Keys, "Http" asks your server which must answer true or {"valid":true}
	Provider = "Static",
	Keys = { "yen" },
	HttpUrl = "https://example.com/validate?key={Key}&hwid={Hwid}",
}

-- Match by PlaceId or GameId, Script is a repo path or a full url
local Games = {
	{ Name = "Baseplate (test)", PlaceIds = { 123974602339071 }, Script = "Hub.lua" },
	{ Name = "Practical Basketball", GameIds = { 7529591378 }, Script = "Hub.lua" },
}

-- Raise Version to make everyone accept again
local Terms = {
	Version = 1,
	Title = "Terms of Service",
	Text = [[By using Yen you agree to these terms.

1. Licence. Your key gives you a personal, non-transferable, revocable licence to run Yen. It is not a sale.

2. No tampering. You will not modify, decompile, deobfuscate, dump, hook, debug, trace or reverse engineer Yen or any part of its code, interface, key system or network traffic. You will not try to bypass, spoof or remove its key, licence or game checks.

3. No sharing. You will not copy, redistribute, resell, leak or publish Yen, its source code or your key. One key, one person.

4. Your risk. Running scripts breaks Roblox's rules and can get your account banned. Yen is provided as is, with no warranty, and we are not liable for bans, losses or damages.

5. Data. To check your key we may process your key and a device identifier. We never ask for your password.

6. Enforcement. Breaking these terms ends your licence immediately without refund, and we may blacklist your key and device.

7. Changes. We may update these terms. If they change you will be asked to accept them again.

Press Accept only if you agree.]],
}

local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local Env = getgenv()
local KeyFile = "YenHub/key.txt"
local TermsFile = "YenHub/tos.txt"

local function Notify(Text)
	pcall(function()
		StarterGui:SetCore("SendNotification", { Title = Settings.Name, Text = Text, Duration = 6 })
	end)
end

local function Get(Path)
	return game:HttpGet(string.find(Path, "^https?://") and Path or Repo .. Path)
end

if Env.YenLoading then
	return Notify("Yen is already loading.")
end

-- Import gives Farcal its font, Spring and error reporting
local ImportOk, Import = pcall(function()
	return loadstring(Get("Import.lua"))()
end)

if not ImportOk or type(Import) ~= "table" then
	return Notify("Could not load Yen. Check your connection and try again.")
end

local function FindGame()
	for _, Entry in Games do
		if table.find(Entry.PlaceIds or {}, game.PlaceId) or table.find(Entry.GameIds or {}, game.GameId) then
			return Entry
		end
	end
end

local function OpenFarcal()
	local Library = Import.Load("Libraries/Farcal.lua")

	for Name, Color in Import.Load("Theme.lua").Farcal do
		Library.Theme[Name] = Color
	end

	return Library
end

local function Hwid()
	local Ok, Id = pcall(function()
		return game:GetService("RbxAnalyticsService"):GetClientId()
	end)

	return Ok and Id or ""
end

local function CheckKey(Key)
	if Settings.Provider == "Http" then
		local Url = Settings.HttpUrl
			:gsub("{Key}", function() return HttpService:UrlEncode(Key) end)
			:gsub("{Hwid}", function() return HttpService:UrlEncode(Hwid()) end)

		local Body = string.lower(game:HttpGet(Url))

		return string.match(Body, "^%s*true%s*$") ~= nil or string.find(Body, '"valid"%s*:%s*true') ~= nil
	end

	for _, Valid in Settings.Keys do
		if string.lower(Valid) == string.lower(Key) then
			return true
		end
	end

	return false
end

-- A saved key only counts inside Duration
local function SavedStamp()
	if not Settings.Remember or not isfile(KeyFile) then
		return
	end

	local Key, Stamp = string.match(readfile(KeyFile), "^(.-)\n(%d+)$")

	Stamp = tonumber(Stamp)

	if Key and Key ~= "" and Stamp and os.time() - Stamp < Settings.Duration then
		local Ok, Valid = pcall(CheckKey, Key)

		if Ok and Valid then
			return Stamp
		end
	end
end

local function ForgetKey()
	pcall(function()
		if isfile(KeyFile) then
			delfile(KeyFile)
		end
	end)
end

-- Returns the expiry time once a key is accepted
local function AskKey(Fresh)
	local Stamp = not Fresh and SavedStamp()

	if Stamp then
		return Stamp + Settings.Duration
	end

	local Library = OpenFarcal()

	local Result = Library:KeySystem({
		Name = Settings.Name,
		Placeholder = Settings.Placeholder,
		GetKeyLink = Settings.GetKeyLink,
		DiscordLink = Settings.DiscordLink,
		TutorialLink = Settings.TutorialLink,
		Validate = function(Key)
			if not CheckKey(Key) then
				return false
			end

			Stamp = os.time()

			if Settings.Remember then
				writefile(KeyFile, Key .. "\n" .. Stamp)
			end

			return true
		end,
	})

	Library:Exit()

	if Result and Result.Unlocked == true then
		return (Stamp or os.time()) + Settings.Duration
	end
end

-- Accepted terms stay accepted until Version changes
local function AcceptTerms()
	if isfile(TermsFile) and readfile(TermsFile) == tostring(Terms.Version) then
		return true
	end

	local Library = OpenFarcal()
	local Answer = Instance.new("BindableEvent")

	Library:Notify({
		Title = Terms.Title,
		Description = Terms.Text,
		Width = 540,
		MaxHeight = 720,
		Buttons = {
			{ Name = "Accept", Callback = function() Answer:Fire(true) end },
			{ Name = "Decline", TextColor = Color3.fromRGB(216, 19, 29), Callback = function() Answer:Fire(false) end },
		},
	})

	local Accepted = Answer.Event:Wait()

	Answer:Destroy()
	task.delay(1, Import.Safe("Terms", function() Library:Exit() end))

	if Accepted then
		writefile(TermsFile, tostring(Terms.Version))
	end

	return Accepted
end

local function NotSupported()
	local Library = OpenFarcal()

	Library:Notify({
		Title = "Game not supported",
		Description = "This game is not on our supported list yet. Check back after a future update.",
		Buttons = {
			{ Name = "Okay!", Callback = function() task.delay(1, Import.Safe("Notice", function() Library:Exit() end)) end },
		},
	})
end

local Entry = FindGame()

if not Entry then
	return NotSupported()
end

local Token = {}
local Start

Env.YenWatch = Token

-- When the key runs out the hub is unloaded and the key window comes back
local function Watch(ExpiresAt)
	task.delay(math.max(ExpiresAt - os.time(), 0), Import.Safe("Relock", function()
		if Env.YenWatch ~= Token then
			return
		end

		if Env.YenHub then
			pcall(Env.YenHub.Unload)
		end

		ForgetKey()
		Env.YenKeyExpires = nil

		Notify("Your key expired. Enter it again to keep using Yen.")
		Start(true)
	end))
end

Start = function(Fresh)
	Env.YenLoading = true

	local Ok, Err = pcall(function()
		local ExpiresAt = AskKey(Fresh)

		if not ExpiresAt then
			return
		end

		if not AcceptTerms() then
			return Notify("You must accept the Terms of Service to use Yen.")
		end

		Env.YenGame = Entry
		Env.YenKeyExpires = ExpiresAt

		local Chunk = assert(loadstring(Get(Entry.Script), "=" .. Entry.Script))

		Chunk(Import)
		Watch(ExpiresAt)
	end)

	Env.YenLoading = false

	if not Ok then
		Import.Report("KeySystem", Err)
		Notify("Yen could not load. Check your connection and try again.")
	end
end

Start(false)
