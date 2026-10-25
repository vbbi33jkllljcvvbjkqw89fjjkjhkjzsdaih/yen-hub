--/ Yen key system. Run returns true and the expiry time once a key is accepted, Terms asks for the Terms of Service, Notice shows a themed popup

local Import = ...

if not Import then
	local Ok, Result = pcall(function()
		local Root = getgenv().YenLocalRoot
		local Source = Root and readfile(Root .. "Import.lua") or game:HttpGet("https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/" .. "Import.lua")

		return loadstring(Source)()
	end)

	if not Ok or type(Result) ~= "table" then
		return
	end

	Import = Result
end

local HttpService = game:GetService("HttpService")

local ThemeOk, Theme = pcall(Import.Load, "Theme.lua")

if not ThemeOk then
	Import.Report("KeySystem", Theme)

	return
end

local SavedKeyPath = "YenHub/key.txt"
local TermsPath = "YenHub/tos.txt"

local Module = {}

local function Open()
	local Library = Import.Load("Libraries/Farcal.lua")

	for Name, Color in Theme.Farcal do
		Library.Theme[Name] = Color
	end

	return Library
end

local function GetHwid()
	local Ok, Id = pcall(function()
		return game:GetService("RbxAnalyticsService"):GetClientId()
	end)

	return Ok and Id or ""
end

local function GetDuration(Config)
	return Config.Duration or 3600
end

local function BuildValidate(Config)
	if Config.Provider == "Http" then
		return function(Key)
			local Encoded = HttpService:UrlEncode(Key)
			local Hwid = HttpService:UrlEncode(GetHwid())

			local Url = Config.Http.Url
			Url = string.gsub(Url, "{Key}", function() return Encoded end)
			Url = string.gsub(Url, "{Hwid}", function() return Hwid end)

			local Body = string.lower(game:HttpGet(Url))

			return string.match(Body, "^%s*true%s*$") ~= nil or string.find(Body, '"valid"%s*:%s*true') ~= nil
		end
	end

	local Valid = {}

	for _, Key in Config.Keys or {} do
		Valid[string.lower(Key)] = true
	end

	return function(Key)
		return Valid[string.lower(Key)] == true
	end
end

--/ The saved key file holds the key and the time it was entered, it only counts inside the duration
local function ReadSavedKey(Config)
	if not isfile(SavedKeyPath) then
		return
	end

	local Key, Stamp = string.match(readfile(SavedKeyPath), "^(.-)\n(%d+)$")

	Stamp = tonumber(Stamp)

	if Key and Key ~= "" and Stamp and os.time() - Stamp < GetDuration(Config) then
		return Key, Stamp
	end
end

function Module.Forget()
	pcall(function()
		if isfile(SavedKeyPath) then
			delfile(SavedKeyPath)
		end
	end)
end

function Module.Run(Config, Options)
	Options = Options or {}

	local Validate = BuildValidate(Config)

	if Config.Remember and not Options.Fresh then
		local Saved, SavedStamp = ReadSavedKey(Config)

		if Saved then
			local Ok, Result = pcall(Validate, Saved)

			if Ok and Result then
				return true, SavedStamp + GetDuration(Config)
			end
		end
	end

	local Library = Open()
	local Stamp = nil

	local Result = Library:KeySystem({
		Name = Config.Name,
		Placeholder = Config.Placeholder,
		GetKeyLink = Config.GetKeyLink,
		DiscordLink = Config.DiscordLink,
		TutorialLink = Config.TutorialLink,
		Validate = function(Key)
			local Ok = Validate(Key)

			if Ok then
				Stamp = os.time()

				if Config.Remember then
					writefile(SavedKeyPath, Key .. "\n" .. Stamp)
				end
			end

			return Ok
		end,
	})

	Library:Exit()

	if Result.Unlocked == true then
		return true, (Stamp or os.time()) + GetDuration(Config)
	end

	return false
end

--/ Returns true when the terms are accepted. Once accepted it stays accepted until Version changes
function Module.Terms(Terms)
	if isfile(TermsPath) and readfile(TermsPath) == tostring(Terms.Version) then
		return true
	end

	local Library = Open()
	local Answer = Instance.new("BindableEvent")

	Library:Notify({
		Title = Terms.Title,
		Description = Terms.Text,
		Width = 540,
		MaxHeight = 720,
		Buttons = {
			{
				Name = "Accept",
				Callback = function()
					Answer:Fire(true)
				end,
			},
			{
				Name = "Decline",
				TextColor = Color3.fromRGB(216, 19, 29),
				Callback = function()
					Answer:Fire(false)
				end,
			},
		},
	})

	local Accepted = Answer.Event:Wait()

	Answer:Destroy()

	task.delay(1, Import.Safe("Terms", function()
		Library:Exit()
	end))

	if Accepted then
		writefile(TermsPath, tostring(Terms.Version))
	end

	return Accepted
end

function Module.Notice(Params)
	local Library = Open()
	local Buttons = {}

	for _, Button in Params.Buttons or { { Name = "Okay!" } } do
		table.insert(Buttons, {
			Name = Button.Name,
			TextColor = Button.TextColor,
			Callback = function()
				if Button.Callback then
					Button.Callback()
				end

				task.delay(1, function()
					Library:Exit()
				end)
			end,
		})
	end

	Library:Notify({
		Title = Params.Title,
		Description = Params.Description,
		Buttons = Buttons,
	})
end

return Module
