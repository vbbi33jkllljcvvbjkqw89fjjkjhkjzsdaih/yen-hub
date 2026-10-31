-- Yen hub without the key system, loads the main UI with the Obsidian and Farcal switch

local Url = "https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/Hub.lua"

local Ok, Err = pcall(function()
	loadstring(game:HttpGet(Url), "=Hub.lua")()
end)

if not Ok then
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Yen", Text = "Could not load Yen hub: " .. tostring(Err), Duration = 6 })
	end)
end
