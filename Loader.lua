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

	local KeyConfig = Import.Load("KeyConfig.lua")
	local Terms = Import.Load("Terms.lua")
	local Token = {}

	getgenv().YenWatch = Token

	local Start

	--/ When the key runs out the script is unloaded and the key is asked for again
	local function Watch(ExpiresAt)
		task.delay(math.max(ExpiresAt - os.time(), 0), Import.Safe("Relock", function()
			if getgenv().YenWatch ~= Token then
				return
			end

			if getgenv().YenHub then
				pcall(getgenv().YenHub.Unload)
			end

			KeySystem.Forget()

			getgenv().YenKeyExpires = nil
			getgenv().YenLoading = true

			Import.Notify("Your key expired. Enter it again to keep using Yen.")

			local Ok, Err = pcall(Start, true)

			getgenv().YenLoading = false

			if not Ok then
				Import.Report("Relock", Err)
			end
		end))
	end

	Start = function(Fresh)
		local Unlocked, ExpiresAt = KeySystem.Run(KeyConfig, { Fresh = Fresh })

		if not Unlocked then
			return
		end

		if not KeySystem.Terms(Terms) then
			return Import.Notify("You must accept the Terms of Service to use Yen.")
		end

		getgenv().YenGame = Entry
		getgenv().YenKeyExpires = ExpiresAt

		Import.Load(Entry.Script)
		Watch(ExpiresAt)
	end

	Start(false)
end

local Ok, Err = pcall(Main)

getgenv().YenLoading = false

if not Ok then
	Import.Report("Loader", Err)
	Import.Notify("Yen could not load. Check your connection and try again.")
end
