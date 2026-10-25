--/ Yen key system. Run(Config) returns true once a valid key is accepted, Notice(Params) shows a themed popup

local Import = ...

if not Import then
	local Root = getgenv().YenLocalRoot
	local Source = Root and readfile(Root .. "Import.lua") or game:HttpGet("https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/" .. "Import.lua")

	Import = loadstring(Source)()
end

local HttpService = game:GetService("HttpService")

local Theme = Import.Load("Theme.lua")

local SavedKeyPath = "YenHub/key.txt"

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

local function LoadSavedKey()
	if isfile(SavedKeyPath) then
		local Key = readfile(SavedKeyPath)

		if Key ~= "" then
			return Key
		end
	end
end

function Module.Run(Config)
	local Validate = BuildValidate(Config)

	if Config.Remember then
		local Saved = LoadSavedKey()

		if Saved then
			local Ok, Result = pcall(Validate, Saved)

			if Ok and Result then
				return true
			end
		end
	end

	local Library = Open()

	local Result = Library:KeySystem({
		Name = Config.Name,
		Placeholder = Config.Placeholder,
		GetKeyLink = Config.GetKeyLink,
		DiscordLink = Config.DiscordLink,
		TutorialLink = Config.TutorialLink,
		Validate = function(Key)
			local Ok = Validate(Key)

			if Ok and Config.Remember then
				writefile(SavedKeyPath, Key)
			end

			return Ok
		end,
	})

	Library:Exit()

	return Result.Unlocked == true
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
