--/ Yen hub. One feature set, drawn by Obsidian or Farcal. Switch in Settings > Interface

local Import = ...

if not Import then
	local Root = getgenv().YenLocalRoot
	local Source = Root and readfile(Root .. "Import.lua") or game:HttpGet("https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/" .. "Import.lua")

	Import = loadstring(Source)()
end

local HubName = "Yen"
local HubVersion = "v0.1.0"
local HubFolder = "YenHub"
local DefaultInterface = "Obsidian"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")

local LocalPlayer = Players.LocalPlayer

if getgenv().YenHub then
	pcall(getgenv().YenHub.Unload)
end

local Theme = Import.Load("Theme.lua")

local InterfaceFile = HubFolder .. "/interface.txt"
local Interfaces = { "Obsidian", "Farcal" }

local State = { ShowName = false }
local Active = nil
local Switching = false
local Renderers = {}

local LogoOk, Logo = pcall(Import.Asset, "Assets/logo.png", HubFolder .. "/Assets/logo.png", "\137PNG")

if not LogoOk then
	Logo = nil
end

local function LoadInterface()
	if isfile(InterfaceFile) then
		local Saved = readfile(InterfaceFile)

		if table.find(Interfaces, Saved) then
			return Saved
		end
	end

	return DefaultInterface
end

local function SaveInterface(Name)
	writefile(InterfaceFile, Name)
end

local function Double(Callback)
	local Last = 0

	return function()
		if os.clock() - Last < 2 then
			Last = 0
			return Callback()
		end

		Last = os.clock()
	end
end

--/ Obsidian
Renderers.Obsidian = function()
	local Library = Import.Load("Libraries/Obsidian/Library.lua")
	local SaveManager = Import.Load("Libraries/Obsidian/SaveManager.lua")

	local Options = Library.Options

	for Name, Color in Theme.Obsidian do
		Library.Scheme[Name] = Color
	end

	Library.ForceCheckbox = false
	Library.ShowToggleFrameInKeybinds = true

	local Window = Library:CreateWindow({
		Title = HubName,
		Footer = "version: " .. HubVersion,
		Icon = Logo,
		NotifySide = "Right",
		ShowCustomCursor = false,
		Center = true,
		AutoShow = true,
	})

	local Ui = {}

	function Ui.AddTab(Name, Icon)
		return Window:AddTab(Name, Icon)
	end

	function Ui.AddGroup(Tab, Name, Icon, Side)
		return Tab:AddGroupbox({ Side = Side, Name = Name, IconName = Icon })
	end

	function Ui.Label(Group, Text)
		return Group:AddLabel(Text, true)
	end

	function Ui.Divider(Group)
		Group:AddDivider()
	end

	function Ui.Button(Group, Text, Callback, Extra)
		Extra = Extra or {}

		Group:AddButton({
			Text = Text,
			Func = Callback,
			DoubleClick = Extra.Double,
			Risky = Extra.Risky,
			Tooltip = Extra.Tooltip,
		})
	end

	function Ui.ButtonRow(Group, Buttons)
		local Row = Group:AddButton({ Text = Buttons[1].Text, Func = Buttons[1].Func })

		for Index = 2, #Buttons do
			Row = Row:AddButton({ Text = Buttons[Index].Text, Func = Buttons[Index].Func })
		end
	end

	function Ui.Toggle(Group, Id, Text, Default, Callback, Tooltip)
		Group:AddToggle(Id, { Text = Text, Default = Default, Callback = Callback, Tooltip = Tooltip })
	end

	function Ui.Dropdown(Group, Id, Text, Values, Default, Callback, Tooltip)
		Group:AddDropdown(Id, { Text = Text, Values = Values, Default = Default, Callback = Callback, Tooltip = Tooltip })
	end

	function Ui.BuildConfig()
		local Tab = Window:AddTab("Config", "save")
		local Notes = Tab:AddGroupbox({ Side = "Left", Name = "Configs", IconName = "folder" })

		Notes:AddLabel("Manage configs on the right. Set one as autoload to apply it on start.", true)

		SaveManager:SetLibrary(Library)
		SaveManager:SetIgnoreIndexes({ "MenuKeybind", "Interface" })
		SaveManager:SetFolder(HubFolder .. "/configs")
		SaveManager:BuildConfigSection(Tab)
	end

	function Ui.BuildMenu(Group)
		Group:AddToggle("KeybindMenuOpen", {
			Default = Library.KeybindFrame.Visible,
			Text = "Open Keybind Menu",
			Callback = function(Value)
				Library.KeybindFrame.Visible = Value
			end,
		})

		Group:AddToggle("ShowCustomCursor", {
			Default = Library.ShowCustomCursor,
			Text = "Custom Cursor",
			Callback = function(Value)
				Library.ShowCustomCursor = Value
			end,
		})

		Group:AddToggle("AlwaysOnTop", {
			Default = Window.AlwaysOnTop,
			Text = "Always On Top",
			Callback = function(Value)
				Window:SetAlwaysOnTop(Value)
			end,
		})

		Group:AddDropdown("NotificationSide", {
			Values = { "Left", "Right" },
			Default = "Right",
			Text = "Notification Side",
			Callback = function(Value)
				Library:SetNotifySide(Value)
			end,
		})

		Group:AddDropdown("DpiScale", {
			Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
			Default = "100%",
			Text = "DPI Scale",
			Callback = function(Value)
				Library:SetDPIScale(tonumber((Value:gsub("%%", ""))))
			end,
		})

		Group:AddSlider("CornerRadius", {
			Text = "Corner Radius",
			Default = Library.CornerRadius,
			Min = 0,
			Max = 20,
			Rounding = 0,
			Callback = function(Value)
				Window:SetCornerRadius(Value)
			end,
		})
	end

	function Ui.MenuBind(Group)
		Group:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

		Library.ToggleKeybind = Options.MenuKeybind
	end

	function Ui.Finish()
		SaveManager:LoadAutoloadConfig()
	end

	function Ui.SetTitle(Text)
		Window:ChangeTitle(Text)
	end

	function Ui.Toast(Text)
		Library:Notify({ Title = HubName, Description = Text, Time = 3 })
	end

	function Ui.OnUnload(Callback)
		Library:OnUnload(Callback)
	end

	function Ui.Unload()
		if Library.Unloaded then
			return
		end

		--/ Obsidian leaves the global input connection of every key picker alive
		for _, Option in Library.Options do
			if Option.Type == "KeyPicker" and Option.Destroy then
				pcall(Option.Destroy, Option)
			end
		end

		Library:Unload()
	end

	return Ui
end

--/ Farcal
Renderers.Farcal = function()
	local Library = Import.Load("Libraries/Farcal.lua")

	for Name, Color in Theme.Farcal do
		Library.Theme[Name] = Color
	end

	Library.MenuKeybind = tostring(Enum.KeyCode.RightShift)

	local Window = Library:Window({ Name = HubName, Version = HubVersion })

	if Logo then
		local Title = Window.Items["Title"].Instance

		Library:Create("UIPadding", {
			Name = "\0",
			Parent = Title,
			PaddingLeft = UDim.new(0, 22),
		})

		Library:Create("ImageLabel", {
			Name = "\0",
			Parent = Title,
			Position = UDim2.fromOffset(-22, -1),
			Size = UDim2.fromOffset(16, 16),
			BackgroundTransparency = 1,
			Image = Logo,
		})
	end

	local Ui = {}

	function Ui.AddTab(Name)
		return Window:Page({ Name = Name })
	end

	function Ui.AddGroup(Tab, Name)
		return Tab:Section({ Name = Name, Side = 1 })
	end

	function Ui.Label(Group, Text)
		return Group:Label({ Name = Text })
	end

	function Ui.Divider(Group)
		Group:Divider()
	end

	function Ui.Button(Group, Text, Callback, Extra)
		Extra = Extra or {}

		Group:Button({
			Name = Text,
			Callback = Extra.Double and Double(Callback) or Callback,
		})
	end

	function Ui.ButtonRow(Group, Buttons)
		for _, Button in Buttons do
			Group:Button({ Name = Button.Text, Callback = Button.Func })
		end
	end

	function Ui.Toggle(Group, Id, Text, Default, Callback, Tooltip)
		Group:Toggle({ Name = Text, Description = Tooltip or "", Flag = Id, Default = Default, Callback = Callback })
	end

	function Ui.Dropdown(Group, Id, Text, Values, Default, Callback, Tooltip)
		Group:Dropdown({
			Name = Text,
			Description = Tooltip or "",
			Flag = Id,
			Items = Values,
			Default = Default,
			Callback = function(Value)
				if type(Value) == "table" then
					Value = Value[1]
				end

				Callback(Value)
			end,
		})
	end

	function Ui.BuildConfig()
		Window:CreateConfigsPage()
	end

	function Ui.BuildMenu() end

	function Ui.MenuBind(Group)
		Group:Label({ Name = "Menu bind", Description = "toggle the main window" }):Keybind({
			Name = "Menu Keybind",
			Flag = "Settings_MenuKeybind",
			Default = Enum.KeyCode.RightShift,
			Mode = "Toggle",
			Callback = function()
				local Data = Library.Flags["Settings_MenuKeybind"]

				if type(Data) == "table" and Data.Key and Data.Key ~= "" and Data.Key ~= "None" then
					Library.MenuKeybind = tostring(Data.Key)
				end
			end,
		})
	end

	function Ui.Finish() end

	function Ui.SetTitle(Text)
		Window.Items["Title"].Instance.Text = Text .. " " .. HubVersion
	end

	function Ui.Toast() end

	function Ui.OnUnload() end

	function Ui.Unload()
		Library:Exit()
	end

	return Ui
end

local function Unload()
	if not Active then
		return
	end

	local Current = Active

	Active = nil
	Current.Session.Alive = false

	for _, Connection in Current.Session.Connections do
		Connection:Disconnect()
	end

	pcall(Current.Ui.Unload)
end

local Build

local function SwitchTo(Name)
	if Switching or not table.find(Interfaces, Name) or (Active and Active.Name == Name) then
		return
	end

	Switching = true
	SaveInterface(Name)

	task.defer(function()
		Unload()

		local Ok, Err = pcall(Build, Name)

		Switching = false

		if not Ok then
			warn("[Yen] " .. tostring(Err))
		end
	end)
end

Build = function(InterfaceName)
	local Ok, Ui = pcall(Renderers[InterfaceName])

	if not Ok then
		warn("[Yen] " .. InterfaceName .. " failed to load: " .. tostring(Ui))

		InterfaceName = "Obsidian"
		Ui = Renderers.Obsidian()
	end

	local Session = { Alive = true, Connections = {} }

	Active = { Ui = Ui, Session = Session, Name = InterfaceName }

	Ui.OnUnload(function()
		if Active and Active.Session == Session then
			Unload()
		end
	end)

	local GameName = "Unknown"

	pcall(function()
		GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
	end)

	local ExecutorName = "Unknown"

	pcall(function()
		ExecutorName = identifyexecutor()
	end)

	local function UserText()
		if State.ShowName then
			return "User: " .. LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")"
		end

		return "User: Hidden"
	end

	local function Copy(Value, Name)
		if not setclipboard then
			return Ui.Toast("Clipboard not supported by your executor.")
		end

		setclipboard(tostring(Value))
		Ui.Toast(Name .. " copied.")
	end

	local InfoTab = Ui.AddTab("Info", "info")

	local About = Ui.AddGroup(InfoTab, "About", "badge-info", "Left")

	Ui.Label(About, HubName .. " " .. HubVersion)
	Ui.Divider(About)

	local UserLabel = Ui.Label(About, UserText())

	Ui.Label(About, "Executor: " .. ExecutorName)

	local Server = Ui.AddGroup(InfoTab, "Server", "server", "Left")

	Ui.Label(Server, "Game: " .. GameName)
	Ui.Label(Server, "Place ID: " .. game.PlaceId)
	Ui.Label(Server, "Players: " .. #Players:GetPlayers() .. " / " .. Players.MaxPlayers)
	Ui.Divider(Server)

	Ui.ButtonRow(Server, {
		{
			Text = "Copy Place ID",
			Func = function()
				Copy(game.PlaceId, "Place ID")
			end,
		},
		{
			Text = "Copy Job ID",
			Func = function()
				Copy(game.JobId, "Job ID")
			end,
		},
	})

	Ui.Button(Server, "Rejoin Server", function()
		if #Players:GetPlayers() <= 1 then
			LocalPlayer:Kick("\nRejoining...")
			task.wait()
			TeleportService:Teleport(game.PlaceId, LocalPlayer)
		else
			TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
		end
	end, { Double = true, Tooltip = "Double click to rejoin this server" })

	local Stats = Ui.AddGroup(InfoTab, "Live Stats", "activity", "Right")

	local FpsLabel = Ui.Label(Stats, "FPS: --")
	local PingLabel = Ui.Label(Stats, "Ping: --")
	local SessionLabel = Ui.Label(Stats, "Session: 00:00:00")

	local Changelog = Ui.AddGroup(InfoTab, "Changelog", "scroll-text", "Right")

	Ui.Label(Changelog, " ")

	Ui.BuildConfig()

	local SettingsTab = Ui.AddTab("Settings", "settings")
	local Menu = Ui.AddGroup(SettingsTab, "Menu", "wrench", "Left")

	Ui.Dropdown(Menu, "Interface", "Interface", Interfaces, InterfaceName, function(Value)
		SwitchTo(Value)
	end, "Switch the look of the hub")

	Ui.Toggle(Menu, "ShowName", "Show Name", State.ShowName, function(Value)
		State.ShowName = Value
		UserLabel:SetText(UserText())
	end, "Show your name in the UI")

	Ui.BuildMenu(Menu)

	Ui.Divider(Menu)
	Ui.MenuBind(Menu)

	Ui.Button(Menu, "Unload", Unload, { Risky = true })

	Ui.Finish()

	local StartTime = os.clock()
	local Frames = 0
	local LastTick = StartTime

	table.insert(Session.Connections, RunService.RenderStepped:Connect(function()
		Frames += 1

		local Now = os.clock()

		if Now - LastTick < 0.5 then
			return
		end

		local Fps = math.floor(Frames / (Now - LastTick) + 0.5)
		local Ping = 0

		pcall(function()
			Ping = math.floor(LocalPlayer:GetNetworkPing() * 1000 + 0.5)
		end)

		local Elapsed = math.floor(Now - StartTime)

		Frames = 0
		LastTick = Now

		FpsLabel:SetText("FPS: " .. Fps)
		PingLabel:SetText("Ping: " .. Ping .. " ms")
		SessionLabel:SetText(string.format("Session: %02d:%02d:%02d", Elapsed // 3600, Elapsed % 3600 // 60, Elapsed % 60))
	end))

	local GlitchFrames = { "¥en", "Yen", "¥en", "Y3n", "¥€n", "¥en", "Y#n", "¥en" }

	task.spawn(function()
		while Session.Alive do
			task.wait(math.random(15, 40) / 10)

			for _, Frame in GlitchFrames do
				if not Session.Alive then
					return
				end

				pcall(Ui.SetTitle, Frame)
				task.wait(math.random(3, 9) / 100)
			end

			if Session.Alive then
				pcall(Ui.SetTitle, HubName)
			end
		end
	end)

	Ui.Toast("Loaded " .. HubVersion)
end

getgenv().YenHub = { Unload = Unload, SwitchTo = SwitchTo }

Build(LoadInterface())

task.delay(2, function()
	for _, Path in { "Libraries/Farcal.lua", "Libraries/Obsidian/Library.lua" } do
		pcall(Import.Source, Path)
	end
end)
