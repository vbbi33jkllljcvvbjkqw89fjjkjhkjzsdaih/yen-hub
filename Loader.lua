--/ Main entry. Checks the game, asks for a key, then loads the script for that game

local Import = ...

if not Import then
	local Ok, Result = pcall(function()
		local Root = getgenv().YenLocalRoot
		local Source = Root and readfile(Root .. "Import.lua") or game:HttpGet("https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/" .. "Import.lua")

		return loadstring(Source)()
	end)

	if not Ok or type(Result) ~= "table" then
		pcall(function()
			game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Yen", Text = "Could not load Yen. Check your connection and try again.", Duration = 6 })
		end)

		return
	end

	Import = Result
end

if getgenv().YenLoading then
	return Import.Notify("Yen is already loading.")
end

getgenv().YenLoading = true

local function Find(Games)
	for _, Entry in Games do
		if table.find(Entry.PlaceIds or {}, game.PlaceId) or table.find(Entry.GameIds or {}, game.GameId) then
			return Entry
		end
	end
end

local function Main()
	local KeySystem = Import.Load("KeySystem.lua")
	local Entry = Find(Import.Load("Games.lua"))

	if not Entry then
		return KeySystem.Notice({
			Title = "Game not supported",
			Description = "This game is not on our supported list yet. Check back after a future update.",
			Buttons = { { Name = "Okay!" } },
		})
	end

	if not KeySystem.Run(Import.Load("KeyConfig.lua")) then
		return
	end

	getgenv().YenGame = Entry

	Import.Load(Entry.Script)
end

local Ok, Err = pcall(Main)

getgenv().YenLoading = false

if not Ok then
	Import.Report("Loader", Err)
	Import.Notify("Yen could not load. Check your connection and try again.")
end
