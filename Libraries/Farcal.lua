--[[
    Made by samet
    Example is at the bottom.

    Date:
    9/10/2026 9:59 PM

    If you find any bugs or anything that needs to be changed, please let me know in the ticket or dms
    ^^^ if you find anything that I forgot to do aswell.
]]

if getgenv().FarcalLibrary and getgenv().FarcalLibrary.Exit then
    getgenv().FarcalLibrary:Exit()
end

cloneref = cloneref or function(Object) return Object end 

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local CoreGui = cloneref(game:GetService("CoreGui"))

gethui = gethui or function() return CoreGui end

local GuiInset = GuiService:GetGuiInset().Y

local Library = { 
    Flags = { },

    MenuKeybind = tostring(Enum.KeyCode.X),

    Directory = "YenHub/Farcal",
    Folders = {
        Assets = "/Assets",
        Configs = "/Configs"
    },

    FontSize = 14,

    Animation = {
        Time = 0.35,
        Style = "Quart",
        Direction = "Out",

        Springs = { -- modify these if u know what ur doing
            ContextMenu = {
                OpenStiffness = 24,
                CloseStiffness = 28,
                CloseKick = 4.5,
                Hover = 17,
                Select = 13,
                Reveal = 24,
                Slide = 10,
                Nudge = 3,
                Drop = 8,
                HolderPop = 0.12,
                OptionPop = 0.35,
                Stagger = 0.35,
            },
            KeybindMenu = {
                OpenStiffness = 18,
                CloseStiffness = 22,
                CloseKick = 3.2,
                Hover = 14,
                Select = 11,
                Reveal = 18,
                Slide = 12,
                Nudge = 3,
                Drop = 8,
                HolderPop = 0.14,
                OptionPop = 0.4,
                Stagger = 0.42,
            },
            Colorpicker = {
                Open = 22,
                Close = 27,
                Drag = 26,
                HolderPop = 0.10,
                Slide = 14,
            },
            Keybind = {
                ButtonActive = 18,
                Pick = 24,
                TextFade = 36,
                TextOffset = 22,
                Width = 24,
                ActiveKick = 3.2,
                PickKick = 4.0,
            },
            Viewport = {
                Rotate = 26,
                Zoom = 20,
                ZoomKick = 2.4,
                Drag = 0.012,
                ZoomStep = 0.16,
                ZoomMin = 0.42,
                ZoomMax = 2.4,
            },
            Watermark = {
                Width = 24,
                Fade = 30,
                Offset = 22,
                Shine = 18,
                Panel = 20,
                Row = 26,
                RowHover = 22,
            },
            KeySystem = {
                Shake = 55,
            },
            Page = {
                Open = 16,
                Close = 18,
                CloseKick = 2.4,
                Slide = 22,
            },
            Checkbox = {
                Check = 28,
                Hover = 22,
                Pop = 42,
                PopKick = 10,
            },
            Toggle = {
                Slide = 26,
                Color = 22,
                Text = 34,
                Hover = 20,
                Size = 28,
                SizeKick = 9,
            },
            Dropdown = {
                OpenStiffness = 24,
                CloseStiffness = 28,
                CloseKick = 4.5,
                ButtonScale = 28,
                ButtonActive = 18,
                Hover = 17,
                Select = 13,
                Reveal = 24,
                Slide = 10,
                Nudge = 3,
                Extra = 30,
                Drop = 8,
                HolderPop = 0.12,
                OptionPop = 0.35,
                Stagger = 0.35,
            },
        },
    },

    ZIndexOrder = {
        ["OptionHolder"] = 5,
        ["KeybindWindow"] = 5,
        ["ColorpickerWindow"] = 6,
        ["ContextMenu"] = 8
    },

    ForceMobile = false,

    -- Ignore below
    Pages = { },
    Sections = { },

    Threads = { },
    Connections = { },
    SetFlags = { },

    UnnamedFlags = 0,

    ThemingStuff = { },
    ThemeMap = { },

    OpenFrames = { },
    OpenFrameTriggers = { },
    OpenFrameInteracting = false,

    Searchables = { },
    MainWindow = nil,
    WatermarkInstance = nil,
    KeySystemInstance = nil,
    OuterWindows = { },
    NotificationQueue = { },
    NotificationActive = nil,
    NotificationDim = nil,
    NotificationDepth = 0,
    NotificationReopenMenu = false,

    Holder = nil,
    UnusedHolder = nil,

    Theme = nil,

    Font = nil,
} do 
    Library.__index = Library
    Library.Pages.__index = Library.Pages
    Library.Sections.__index = Library.Sections

    local Flags = Library.Flags 
    local SetFlags = Library.SetFlags

    local Keys = {
        ["Unknown"]           = "Unknown",
        ["Backspace"]         = "Back",
        ["Tab"]               = "Tab",
        ["Clear"]             = "Clear",
        ["Return"]            = "Return",
        ["Pause"]             = "Pause",
        ["Escape"]            = "Escape",
        ["Space"]             = "Space",
        ["QuotedDouble"]      = '"',
        ["Hash"]              = "#",
        ["Dollar"]            = "$",
        ["Percent"]           = "%",
        ["Ampersand"]         = "&",
        ["Quote"]             = "'",
        ["LeftParenthesis"]   = "(",
        ["RightParenthesis"]  = " )",
        ["Asterisk"]          = "*",
        ["Plus"]              = "+",
        ["Comma"]             = ",",
        ["Minus"]             = "-",
        ["Period"]            = ".",
        ["Slash"]             = "/",
        ["Zero"]              = "0",
        ["One"]               = "1",
        ["Two"]               = "2",
        ["Three"]             = "3",
        ["Four"]              = "4",
        ["Five"]              = "5",
        ["Six"]               = "6",
        ["Seven"]             = "7",
        ["Eight"]             = "8",
        ["Nine"]              = "9",
        ["Colon"]             = ":",
        ["Semicolon"]         = ";",
        ["LessThan"]          = "<",
        ["GreaterThan"]       = ">",
        ["Question"]          = "?",
        ["Equals"]            = "=",
        ["At"]                = "@",
        ["LeftBracket"]       = "LeftBracket",
        ["RightBracket"]      = "RightBracket",
        ["BackSlash"]         = "BackSlash",
        ["Caret"]             = "^",
        ["Underscore"]        = "_",
        ["Backquote"]         = "`",
        ["LeftCurly"]         = "{",
        ["Pipe"]              = "|",
        ["RightCurly"]        = "}",
        ["Tilde"]             = "~",
        ["Delete"]            = "Delete",
        ["End"]               = "End",
        ["KeypadZero"]        = "Keypad0",
        ["KeypadOne"]         = "Keypad1",
        ["KeypadTwo"]         = "Keypad2",
        ["KeypadThree"]       = "Keypad3",
        ["KeypadFour"]        = "Keypad4",
        ["KeypadFive"]        = "Keypad5",
        ["KeypadSix"]         = "Keypad6",
        ["KeypadSeven"]       = "Keypad7",
        ["KeypadEight"]       = "Keypad8",
        ["KeypadNine"]        = "Keypad9",
        ["KeypadPeriod"]      = "KeypadP",
        ["KeypadDivide"]      = "KeypadD",
        ["KeypadMultiply"]    = "KeypadM",
        ["KeypadMinus"]       = "KeypadM",
        ["KeypadPlus"]        = "KeypadP",
        ["KeypadEnter"]       = "KeypadE",
        ["KeypadEquals"]      = "KeypadE",
        ["Insert"]            = "Insert",
        ["Home"]              = "Home",
        ["PageUp"]            = "PageUp",
        ["PageDown"]          = "PageDown",
        ["RightShift"]        = "RightShift",
        ["LeftShift"]         = "LeftShift",
        ["RightControl"]      = "RightControl",
        ["LeftControl"]       = "LeftControl",
        ["LeftAlt"]           = "LeftAlt",
        ["RightAlt"]          = "RightAlt"
    }

    -- Folders
    if not isfolder(Library.Directory) then 
        makefolder(Library.Directory)
    end

    for _, Folder in Library.Folders do 
        if not isfolder(Library.Directory .. Folder) then 
            makefolder(Library.Directory .. Folder)
        end
    end

    local Themes = {
        ["Preset"] = {
            ["Background"] = Color3.fromRGB(43, 45, 48),
            ["Inline"] = Color3.fromRGB(52, 54, 59),
            ["Outline"] = Color3.fromRGB(34, 34, 34),
            ["Content"] = Color3.fromRGB(29, 30, 33),
            ["Element"] = Color3.fromRGB(43, 45, 48),
            ["Hovered Element"] = Color3.fromRGB(52, 54, 59),
            ["Accent"] = Color3.fromRGB(49, 108, 224),
            ["Tab"] = Color3.fromRGB(43, 45, 48),
            ["Toggle"] = Color3.fromRGB(30, 30, 33),
            ["Liner"] = Color3.fromRGB(53, 55, 60),
            ["Dark Liner"] = Color3.fromRGB(47, 49, 52),
            ["Text"] = Color3.fromRGB(210, 212, 216),
            ["Inactive Text"] = Color3.fromRGB(109, 113, 120),
            ["Dark Text"] = Color3.fromRGB(109, 113, 120),
            ["Dark Icon"] = Color3.fromRGB(109, 113, 120),
        }
    }

    Library.Theme = table.clone(Themes["Preset"])
    Library.Themes = Themes

    Library.GetAnim = function(Self, Category)
        local Springs = Self.Animation and Self.Animation.Springs
        return (Springs and Springs[Category]) or { }
    end

    local Import = ...

    local CustomFont = { } do
        function CustomFont:New(Name, Weight, Style, Data)
            local Cached = isfile(Data.Id) and readfile(Data.Id) or ""

            if string.sub(Cached, 1, 4) ~= "OTTO" then
                writefile(Data.Id, Import.Binary("Assets/Inter-Medium.otf"))
            end

            local FontData = {
                name = Name,
                faces = {
                    {
                        name = Name,
                        weight = Weight,
                        style = Style,
                        assetId = getcustomasset(Data.Id)
                    }
                }
            }

            local FontPath = `{Library.Directory .. Library.Folders.Assets}/{Name}.font`

            writefile(FontPath, HttpService:JSONEncode(FontData))
            return Font.new(getcustomasset(FontPath))
        end

        local FontOk, FontFace = pcall(function()
            return CustomFont:New("InterMedium", 400, "Regular", {
                Id = `{Library.Directory .. Library.Folders.Assets}/Inter-Medium.otf`,
            })
        end)

        Library.Font = FontOk and FontFace or Font.fromEnum(Enum.Font.GothamMedium)
    end

    local Spring = loadstring(Import.Source("Libraries/Spring.lua"))()

    local Instances = { }

    Instances.__index = function(Self, Key)
        if Key == "Instance" or Key == "Class" or Key == "Properties" then
            return rawget(Self, Key)
        end

        local Method = rawget(Instances, Key)

        if Method ~= nil then
            return Method
        end

        local Object = rawget(Self, "Instance")

        if Object ~= nil then
            return Object[Key]
        end
    end

    Instances.__newindex = function(Self, Key, Value)
        if Key == "Instance" or Key == "Class" or Key == "Properties" then
            rawset(Self, Key, Value)
            return
        end

        local Object = rawget(Self, "Instance")

        if Object then
            Object[Key] = Value
            return
        end

        rawset(Self, Key, Value)
    end

    Library.GetIsMobile = function(Self)
        return Self.ForceMobile or (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled)
    end

    Library.Exit = function(Self)
        for _, Connection in Library.Connections do
            if Connection then
                pcall(function()
                    Connection:Disconnect()
                end)
            end
        end

        for _, Thread in Library.Threads do
            if Thread then
                pcall(task.cancel, Thread)
            end
        end

        Library.Connections = { }
        Library.Threads = { }

        if Self.Holder then
            Self.Holder.Instance:Destroy()
        end

        if Self.UnusedHolder then
            Self.UnusedHolder.Instance:Destroy()
        end

        Library = nil
        getgenv().FarcalLibrary = nil
    end

    Instances.Create = function(Self, Class, Properties)
        local Data = {
            Class = Class,
            Properties = Properties,
            Instance = Instance.new(Class)
        }

        for Property, Value in Properties do
            if Property == "FontFace" then
                Data.Instance.FontFace = Library.Font
                continue
            end

            if Property == "TextSize" then
                Data.Instance.TextSize = Library.FontSize
                continue
            end

            if Property == "Name" then
                Data.Instance.Name = "\0"
                continue
            end

            if Class == "TextButton" then
                if Property == "AutoButtonColor" then
                    Data.Instance.AutoButtonColor = false
                    continue
                end

                if Property == "Text" then
                    Data.Instance.Text = ""
                    continue
                end
            end

            Data.Instance[Property] = Value
        end

        return setmetatable(Data, Instances)
    end

    Library.Create = Instances.Create

    Library.Thread = function(Self, Function)
        local Thread

        Thread = task.spawn(function()
            Function()

            local Index = table.find(Library.Threads, Thread)

            if Index then
                table.remove(Library.Threads, Index)
            end
        end)

        table.insert(Library.Threads, Thread)
        return Thread
    end

    Library.Connect = function(Self, Signal, Callback)
        local Connection

        if type(Signal) == "string" and Self.Instance then
            if Signal == "MouseButton1Down" then
                Connection = Self.Instance.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Callback(Input)
                    end
                end)
            elseif Self.Instance[Signal] then
                Connection = Self.Instance[Signal]:Connect(Callback)
            end
        else
            Connection = Signal:Connect(Callback)
        end

        if Connection then
            table.insert(Library.Connections, Connection)
        end

        return Connection
    end

    Instances.Connect = Library.Connect

    Instances.Tween = function(Self, Properties, Info, IsRawItem)
        local Object = Self.Instance or IsRawItem

        if not Info then
            local Style = Enum.EasingStyle[Library.Animation.Style] or Enum.EasingStyle.Quart
            local Direction = Enum.EasingDirection[Library.Animation.Direction] or Enum.EasingDirection.Out
            Info = TweenInfo.new(Library.Animation.Time or 0.35, Style, Direction)
        end

        if not Object then
            return
        end

        local NewTween = TweenService:Create(Object, Info, Properties)
        NewTween:Play()

        return NewTween
    end

    Library.Tween = Instances.Tween

    Instances.GetTweenProperty = function(Self, IsRawItem)
        local Object = Self.Instance or IsRawItem

        if not Object then
            return
        end

        if Object:IsA("Frame") or Object:IsA("CanvasGroup") then
            return { "BackgroundTransparency" }
        elseif Object:IsA("TextLabel") or Object:IsA("TextButton") then
            return { "TextTransparency", "BackgroundTransparency" }
        elseif Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
            return { "BackgroundTransparency", "ImageTransparency" }
        elseif Object:IsA("ViewportFrame") then
            return { "BackgroundTransparency", "ImageTransparency" }
        elseif Object:IsA("VideoFrame") then
            return { "BackgroundTransparency" }
        elseif Object:IsA("ScrollingFrame") then
            return { "BackgroundTransparency", "ScrollBarImageTransparency" }
        elseif Object:IsA("TextBox") then
            return { "TextTransparency", "BackgroundTransparency" }
        elseif Object:IsA("UIStroke") then
            return { "Transparency" }
        end
    end

    Library.GetTweenProperty = Instances.GetTweenProperty

    Instances.Fade = function(Self, Property, Visibility, IsRawItem, Info)
        local Object = Self.Instance or IsRawItem

        if not Object then
            return
        end

        local OldTransparency = Object[Property]
        Object[Property] = Visibility and 1 or OldTransparency

        local NewTween = Instances.Tween(Self, {
            [Property] = Visibility and OldTransparency or 1
        }, Info, Object)

        if not NewTween then
            return
        end

        Library:Connect(NewTween.Completed, function()
            if not Visibility then
                task.wait()
                Object[Property] = OldTransparency
            end
        end)

        return NewTween
    end

    Library.Fade = Instances.Fade

    Instances.FadeDescendants = function(Self, Visibility, Callback, Info)
        if not Self.Instance then
            if Callback and type(Callback) == "function" then
                Callback()
            end

            return
        end

        if Visibility then
            Self.Instance.Visible = true
        end

        local LastTween
        local Children = Self.Instance:GetDescendants()
        table.insert(Children, Self.Instance)

        for _, Child in Children do
            local TransparencyProperty = Instances:GetTweenProperty(Child)

            if not TransparencyProperty then
                continue
            end

            if type(TransparencyProperty) == "table" then
                for _, Property in TransparencyProperty do
                    local NewTween = Instances:Fade(Property, Visibility, Child, Info)

                    if NewTween then
                        LastTween = NewTween
                    end
                end
            else
                local NewTween = Instances:Fade(TransparencyProperty, Visibility, Child, Info)

                if NewTween then
                    LastTween = NewTween
                end
            end
        end

        local Finish = function()
            if Callback and type(Callback) == "function" then
                Callback()
            end

            Self.Instance.Visible = Visibility
        end

        if LastTween then
            Library:Connect(LastTween.Completed, Finish)
        else
            Finish()
        end
    end

    Library.FadeDescendants = Instances.FadeDescendants

    Instances.MakeDraggable = function(Self)
        if not Self.Instance then
            return
        end

        local Gui = Self.Instance
        local Dragging = false
        local DragStart
        local StartPosition

        local Set = function(Input)
            local DragDelta = Input.Position - DragStart
            local NewX = StartPosition.X.Offset + DragDelta.X
            local NewY = StartPosition.Y.Offset + DragDelta.Y

            local ScreenSize = Gui.Parent.AbsoluteSize
            local GuiSize = Gui.AbsoluteSize
            local Scale = Library:GetScreenScale()

            NewX = math.clamp(NewX, 0, (ScreenSize.X / Scale) - (GuiSize.X / Scale))
            NewY = math.clamp(NewY, 0, (ScreenSize.Y / Scale) - (GuiSize.Y / Scale))

            Self:Tween({Position = UDim2.new(0, NewX, 0, NewY)})
        end

        local InputChanged

        Self:Connect("InputBegan", function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = Input.Position
                StartPosition = Gui.Position

                if InputChanged then
                    return
                end

                InputChanged = Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                        InputChanged:Disconnect()
                        InputChanged = nil
                    end
                end)
            end
        end)

        Library:Connect(UserInputService.InputChanged, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                if Dragging then
                    Set(Input)
                end
            end
        end)

        return Dragging
    end

    Library.MakeDraggable = Instances.MakeDraggable

    Instances.MakeResizeable = function(Self, Minimum)
        if not Self.Instance then
            return
        end

        local Gui = Self.Instance

        local Resizing = false
        local CurrentSide = nil

        local StartMouse = nil
        local StartPosition = nil
        local StartSize = nil

        local ResizeConnection
        local EdgeThickness = Library:GetIsMobile() and 12 or 2

        local MakeEdge = function(Name, Position, Size)
            local Button = Library:Create("TextButton", {
                Name = "\0",
                Size = Size,
                Position = Position,
                BackgroundColor3 = Color3.fromRGB(166, 147, 243),
                BackgroundTransparency = 1,
                Text = "",
                BorderSizePixel = 0,
                AutoButtonColor = false,
                Parent = Gui,
                ZIndex = 99999,
            })  Button:AddToTheme({BackgroundColor3 = "Accent"})

            return Button
        end

        local Edges = {
            {Button = MakeEdge("Left", UDim2.new(0, 0, 0, 0), UDim2.new(0, EdgeThickness, 1, 0)), Side = "L"},
            {Button = MakeEdge("Right", UDim2.new(1, -EdgeThickness, 0, 0), UDim2.new(0, EdgeThickness, 1, 0)), Side = "R"},
            {Button = MakeEdge("Top", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, EdgeThickness)), Side = "T"},
            {Button = MakeEdge("Bottom", UDim2.new(0, 0, 1, -EdgeThickness), UDim2.new(1, 0, 0, EdgeThickness)), Side = "B"},
            {Button = MakeEdge("TopLeft", UDim2.new(0, 0, 0, 0), UDim2.new(0, EdgeThickness, 0, EdgeThickness)), Side = "TL"},
            {Button = MakeEdge("TopRight", UDim2.new(1, -EdgeThickness, 0, 0), UDim2.new(0, EdgeThickness, 0, EdgeThickness)), Side = "TR"},
            {Button = MakeEdge("BottomLeft", UDim2.new(0, 0, 1, -EdgeThickness), UDim2.new(0, EdgeThickness, 0, EdgeThickness)), Side = "BL"},
            {Button = MakeEdge("BottomRight", UDim2.new(1, -EdgeThickness, 1, -EdgeThickness), UDim2.new(0, EdgeThickness, 0, EdgeThickness)), Side = "BR"},
        }

        local ApplyResize = function()
            if not Resizing or not CurrentSide then
                return
            end

            local MouseLocation = UserInputService:GetMouseLocation()
            local dx = MouseLocation.X - StartMouse.X
            local dy = MouseLocation.Y - StartMouse.Y

            local x, y = StartPosition.X, StartPosition.Y
            local w, h = StartSize.X, StartSize.Y

            if CurrentSide == "L" or CurrentSide == "TL" or CurrentSide == "BL" then
                x = StartPosition.X + dx
                w = StartSize.X - dx
            end

            if CurrentSide == "R" or CurrentSide == "TR" or CurrentSide == "BR" then
                w = StartSize.X + dx
            end

            if CurrentSide == "T" or CurrentSide == "TL" or CurrentSide == "TR" then
                y = StartPosition.Y + dy
                h = StartSize.Y - dy
            end

            if CurrentSide == "B" or CurrentSide == "BL" or CurrentSide == "BR" then
                h = StartSize.Y + dy
            end

            if w < Minimum.X then
                if CurrentSide == "L" or CurrentSide == "TL" or CurrentSide == "BL" then
                    x = x - (Minimum.X - w)
                end
                w = Minimum.X
            end

            if h < Minimum.Y then
                if CurrentSide == "T" or CurrentSide == "TL" or CurrentSide == "TR" then
                    y = y - (Minimum.Y - h)
                end
                h = Minimum.Y
            end

            Self:Tween({Position = UDim2.fromOffset(x, y)})
            Self:Tween({Size = UDim2.fromOffset(w, h)})
        end

        local BeginResizing = function(Side)
            Resizing = true
            CurrentSide = Side

            StartMouse = UserInputService:GetMouseLocation()

            StartPosition = Vector2.new(Gui.Position.X.Offset, Gui.Position.Y.Offset)
            StartSize = Vector2.new(Gui.Size.X.Offset, Gui.Size.Y.Offset)

            for _, Value in Edges do
                Value.Button.Instance.BackgroundTransparency = (Value.Side == Side) and 0 or 1
            end

            if ResizeConnection then
                return
            end

            ResizeConnection = RunService.RenderStepped:Connect(ApplyResize)
            table.insert(Library.Connections, ResizeConnection)
        end

        local EndResizing = function()
            Resizing = false
            CurrentSide = nil

            for _, Value in Edges do
                Value.Button.Instance.BackgroundTransparency = 1
            end

            if ResizeConnection then
                ResizeConnection:Disconnect()

                local Index = table.find(Library.Connections, ResizeConnection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                ResizeConnection = nil
            end
        end

        for _, Value in Edges do
            Value.Button:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    BeginResizing(Value.Side)
                end
            end)
        end

        Library:Connect(UserInputService.InputEnded, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                if Resizing then
                    EndResizing()
                end
            end
        end)
    end

    Library.MakeResizeable = Instances.MakeResizeable

    Instances.IsMouseOverFrame = function(Self)
        if not Self.Instance then
            return false
        end

        local Object = Self.Instance
        local MouseLocation = UserInputService:GetMouseLocation()
        local Position = Object.AbsolutePosition
        local Size = Object.AbsoluteSize

        return MouseLocation.X >= Position.X and MouseLocation.X <= Position.X + Size.X
            and MouseLocation.Y >= Position.Y and MouseLocation.Y <= Position.Y + Size.Y
    end

    Library.IsMouseOverFrame = Instances.IsMouseOverFrame

    Library.SafeCall = function(Self, Function, ...)
        local Arguements = { ... }
        local Success, Result = pcall(Function, table.unpack(Arguements))

        if not Success then
            warn(Result)
            return false, Result
        end

        return Success, Result
    end

    Library.Round = function(Self, Number, Float)
        local Multiplier = 1 / (Float or 1)
        return math.floor(Number * Multiplier) / Multiplier
    end

    Library.ResolveFlag = function(Self, Flag, Name)
        local Resolved = Flag or Name

        if not Resolved or Resolved == "" then
            Self.UnnamedFlags += 1
            return "UnnamedFlag" .. Self.UnnamedFlags
        end

        if Self.SetFlags[Resolved] then
            Self.UnnamedFlags += 1
            return Resolved .. "_" .. Self.UnnamedFlags
        end

        return Resolved
    end

    Library.GetConfigPath = function(Self, Name)
        return Self.Directory .. Self.Folders.Configs .. "/" .. Name .. ".json"
    end

    Library.GetConfig = function(Self)
        local Config = { }

        local Success, Result = Library:SafeCall(function()
            for Index, Value in Library.Flags do
                if type(Value) == "table" and Value.Key then
                    Config[Index] = {Key = tostring(Value.Key), Mode = Value.Mode}
                elseif type(Value) == "table" and Value.Color then
                    local Hex = Value.HexValue or ""

                    if string.sub(Hex, 1, 1) ~= "#" then
                        Hex = "#" .. Hex
                    end

                    Config[Index] = {Color = Hex, Alpha = Value.Alpha}
                else
                    Config[Index] = Value
                end
            end
        end)

        if not Success then
            warn("Failed to get config:\n"..tostring(Result))
            return
        end

        return HttpService:JSONEncode(Config)
    end

    Library.LoadConfig = function(Self, Config)
        local DecodeSuccess, Decoded = Library:SafeCall(function()
            return HttpService:JSONDecode(Config)
        end)

        if not DecodeSuccess or type(Decoded) ~= "table" then
            warn("Failed to decode config:\n"..tostring(Decoded))
            return false, Decoded
        end

        local Success, Result = Library:SafeCall(function()
            for Index, Value in Decoded do
                local SetFunction = Library.SetFlags[Index]

                if not SetFunction then
                    continue
                end

                if type(Value) == "table" and Value.Key then
                    SetFunction(Value)
                elseif type(Value) == "table" and Value.Color then
                    SetFunction(Value.Color, Value.Alpha)
                else
                    SetFunction(Value)
                end
            end
        end)

        return Success, Result
    end

    Library.SaveConfig = function(Self, Name)
        if not Name or Name == "" then
            return false, "missing name"
        end

        local Encoded = Self:GetConfig()

        if not Encoded then
            return false, "encode failed"
        end

        writefile(Self:GetConfigPath(Name), Encoded)
        return true
    end

    Library.LoadConfigFromFile = function(Self, Name)
        if not Name or Name == "" then
            return false, "missing name"
        end

        local Path = Self:GetConfigPath(Name)

        if not isfile(Path) then
            return false, "missing file"
        end

        return Self:LoadConfig(readfile(Path))
    end

    Library.DeleteConfig = function(Self, Name)
        if not Name or Name == "" then
            return false, "missing name"
        end

        local Path = Self:GetConfigPath(Name)

        if not isfile(Path) then
            return false, "missing file"
        end

        delfile(Path)
        return true
    end

    Library.GetConfigsList = function(Self, Element)
        local List = { }
        local ReturnList = { }

        List = listfiles(Library.Directory .. Library.Folders.Configs)

        for Index = 1, #List do
            local File = List[Index]

            if File:sub(-5) == ".json" then
                local Position = File:find(".json", 1, true)
                local StartPosition = Position

                local Character = File:sub(Position, Position)
                while Character ~= "/" and Character ~= "\\" and Character ~= "" do
                    Position = Position - 1
                    Character = File:sub(Position, Position)
                end

                if Character == "/" or Character == "\\" then
                    table.insert(ReturnList, File:sub(Position + 1, StartPosition - 1))
                end
            end
        end

        if Element and Element.Refresh then
            Element:Refresh(ReturnList)
        end

        return ReturnList
    end

    Instances.ApplyThemeProperties = function(Self, Object, Properties)
        for Property, Value in Properties do
            if type(Value) == "string" then
                if Library.Theme[Value] ~= nil then
                    Object[Property] = Library.Theme[Value]
                end
            else
                Object[Property] = Value()
            end
        end
    end

    Instances.AddToTheme = function(Self, Properties)
        local Object = Self.Instance

        if not Object then
            return Self
        end

        local ThemeData = {
            Item = Object,
            Properties = Properties,
        }

        Instances:ApplyThemeProperties(Object, Properties)

        table.insert(Library.ThemingStuff, ThemeData)
        Library.ThemeMap[Object] = ThemeData
        return Self
    end

    Library.AddToTheme = Instances.AddToTheme

    Instances.ChangeItemTheme = function(Self, Properties)
        local Object = Self.Instance

        if not Object or not Library.ThemeMap[Object] then
            return
        end

        Library.ThemeMap[Object].Properties = Properties
        Instances:ApplyThemeProperties(Object, Properties)
        return Self
    end

    Library.ChangeItemTheme = Instances.ChangeItemTheme

    Library.ChangeTheme = function(Self, Theme, Color)
        Library.Theme[Theme] = Color

        for _, Item in Library.ThemingStuff do
            for Property, Value in Item.Properties do
                if type(Value) == "string" and Value == Theme then
                    Item.Item[Property] = Color
                elseif type(Value) == "function" then
                    Item.Item[Property] = Value()
                end
            end
        end
    end

    Instances.OnHover = function(Self, OnHoverEnter, OnHoverLeave)
        local Object = Self.Instance

        if not Object then
            return
        end

        Library:Connect(Object.MouseEnter, OnHoverEnter)
        Library:Connect(Object.MouseLeave, OnHoverLeave)
    end

    Library.OnHover = Instances.OnHover

    Instances.VisibleCheck = function(Self, ActiveParent)
        local Object = Self.Instance

        if not Object then
            return Self
        end

        ActiveParent = ActiveParent or Library.Holder.Instance

        Library:Connect(Object:GetPropertyChangedSignal("Visible"), function()
            Object.Parent = Object.Visible and ActiveParent or Library.UnusedHolder.Instance
        end)

        return Self
    end

    Library.VisibleCheck = Instances.VisibleCheck

    Library.IsMouseOverItems = function(Self, Items)
        for _, Item in Items do
            if Item and Item:IsMouseOverFrame() then
                return true
            end
        end

        return false
    end

    Library.RegisterOpenFrameTrigger = function(Self, Trigger)
        Library.OpenFrameTriggers[Trigger] = true
    end

    Library.IsMouseOverAnyOpenFrameTrigger = function(Self)
        for Trigger in Library.OpenFrameTriggers do
            if Trigger:IsMouseOverFrame() then
                return true
            end
        end

        return false
    end

    Library.IsMouseOverOpenFrameData = function(Self, Data)
        if Self:IsMouseOverItems(Data.HoverItems) then
            return true
        end

        if Data.GetHoverItems then
            return Self:IsMouseOverItems(Data.GetHoverItems())
        end

        return false
    end

    Library.ShouldKeepOpenFrame = function(Self, Frame)
        local Data = Library.OpenFrames[Frame]

        if not Data then
            return false
        end

        if Self:IsMouseOverOpenFrameData(Data) then
            return true
        end

        for ChildFrame, ChildData in Library.OpenFrames do
            if ChildData.Owner == Frame and ChildFrame.IsOpen and Self:ShouldKeepOpenFrame(ChildFrame) then
                return true
            end
        end

        return false
    end

    Library.RegisterOpenFrame = function(Self, Frame, Data)
        local Owner = Data.Owner

        if Owner == nil and Data.AnchorInstance then
            Owner = Self:FindOpenFrameOwner(Data.AnchorInstance)
        end

        Data.Owner = Owner
        Data.OpenedTick = os.clock()

        if Owner then
            Self:CloseOpenFramesExcept(Frame, Owner)
        else
            Self:CloseOpenFramesExcept(Frame)
        end

        Library.OpenFrames[Frame] = Data
        Library:EnsureOpenFramesConnection()
    end

    Library.UnregisterOpenFrame = function(Self, Frame)
        Library.OpenFrames[Frame] = nil
    end

    Library.FindOpenFrameOwner = function(Self, Instance)
        if not Instance then
            return nil
        end

        for Frame, Data in Library.OpenFrames do
            if Frame.IsOpen and Data.PopupInstance then
                if Instance:IsDescendantOf(Data.PopupInstance) or Instance == Data.PopupInstance then
                    return Frame
                end
            end
        end

        return nil
    end

    Library.CloseOpenFramesExcept = function(Self, KeepFrame, KeepOwner)
        for Frame, Data in Library.OpenFrames do
            if Frame == KeepFrame or Frame == KeepOwner then
                continue
            end

            if Frame.IsOpen then
                Frame:SetOpen(false)
            end
        end
    end

    Library.CloseOpenFrameChildren = function(Self, Parent)
        for Frame, Data in Library.OpenFrames do
            if Data.Owner == Parent and Frame.IsOpen then
                Frame:SetOpen(false)
            end
        end
    end

    Library.SetOpenFrameInteracting = function(Self, Bool)
        Library.OpenFrameInteracting = Bool
    end

    Library.ProcessOpenFrames = function(Self)
        if Library.OpenFrameInteracting then
            return
        end

        if Self:IsMouseOverAnyOpenFrameTrigger() then
            return
        end

        local ToClose = { }

        for Frame, Data in Library.OpenFrames do
            if Frame.IsOpen and not Frame.Picking and not Self:ShouldKeepOpenFrame(Frame) then
                if Data.OpenedTick and os.clock() - Data.OpenedTick < 0.2 then
                    continue
                end

                table.insert(ToClose, Frame)
            end
        end

        for _, Frame in ToClose do
            Frame:SetOpen(false)
        end
    end

    Library.EnsureOpenFramesConnection = function(Self)
        if Library.OpenFramesInputConnection then
            return
        end

        Library.OpenFramesInputConnection = Library:Connect(UserInputService.InputBegan, function(Input)
            if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            Library:Thread(function()
                Library:ProcessOpenFrames()
            end)
        end)
    end

    Library.GetScreenScale = function(Self)
        local Scale = 1

        if not Library.Holder or not Library.Holder.Instance then
            return Scale
        end
    
        for _, Obj in Library.Holder.Instance:GetDescendants() do
            if Obj:IsA("UIScale") then
                Scale *= Obj.Scale
            end
        end
    
        return Scale
    end
    
    Library.PopupPosition = function(Self, Anchor, Popup, ExtraY)
        local Scale = Library:GetScreenScale()
        ExtraY = ExtraY or 0
    
        local X = Anchor.AbsolutePosition.X / Scale
        local Y = (Anchor.AbsolutePosition.Y + Anchor.AbsoluteSize.Y + GuiInset + ExtraY) / Scale
    
        return UDim2.fromOffset(X, Y)
    end
    
    Library.Holder = Library:Create("ScreenGui", {
        Parent = gethui(),
        IgnoreGuiInset = true,
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false
    })

    Library.UnusedHolder = Library:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        Enabled = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        ResetOnSpawn = false
    })

    do
        local ElementParent = function(Self, Params)
            if Params and Params.Parent then
                return Params.Parent
            end

            if Self.Items and Self.Items["Content"] then
                return Self.Items["Content"]
            end

            return nil
        end

        Library.RegisterSearchable = function(Self, Data)
            if not Data or not Data.Name then
                return
            end

            Data.Kind = Data.Kind or "Element"
            table.insert(Self.Searchables, Data)
            return Data
        end

        Library.ClearSearchHighlight = function(Self)
            if Self.ActiveSearchHighlight then
                pcall(function()
                    Self.ActiveSearchHighlight:Destroy()
                end)

                Self.ActiveSearchHighlight = nil
            end
        end

        Library.HighlightInstance = function(Self, Inst)
            if not Inst or not Inst:IsA("GuiObject") then
                return
            end

            Self:ClearSearchHighlight()

            local Accent = Library.Theme["Accent"]
            local Overlay = Instance.new("Frame")
            Overlay.Name = "\0"
            Overlay.BackgroundColor3 = Accent
            Overlay.BackgroundTransparency = 0.88
            Overlay.BorderSizePixel = 0
            Overlay.Size = UDim2.fromScale(1, 1)
            Overlay.Position = UDim2.fromScale(0, 0)
            Overlay.ZIndex = math.max(Inst.ZIndex + 8, 12)
            Overlay.Active = false
            Overlay.Parent = Inst

            local Corner = Instance.new("UICorner")
            local SourceCorner = Inst:FindFirstChildOfClass("UICorner")

            if SourceCorner then
                pcall(function()
                    Corner.TopLeftRadius = SourceCorner.TopLeftRadius
                    Corner.TopRightRadius = SourceCorner.TopRightRadius
                    Corner.BottomLeftRadius = SourceCorner.BottomLeftRadius
                    Corner.BottomRightRadius = SourceCorner.BottomRightRadius
                end)
                pcall(function()
                    Corner.CornerRadius = SourceCorner.CornerRadius
                end)
            else
                Corner.CornerRadius = UDim.new(0, 6)
            end

            Corner.Parent = Overlay

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Accent
            Stroke.Thickness = 1.5
            Stroke.Transparency = 0.35
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = Overlay

            Self.ActiveSearchHighlight = Overlay

            Library:Thread(function()
                local Pulse = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local Rest = TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

                for _ = 1, 3 do
                    if not Overlay.Parent then
                        return
                    end

                    Library:Tween({ BackgroundTransparency = 0.55 }, Pulse, Overlay)
                    Library:Tween({ Transparency = 0 }, Pulse, Stroke)
                    task.wait(0.22)

                    if not Overlay.Parent then
                        return
                    end

                    Library:Tween({ BackgroundTransparency = 0.86 }, Rest, Overlay)
                    Library:Tween({ Transparency = 0.4 }, Rest, Stroke)
                    task.wait(0.28)
                end

                if not Overlay.Parent then
                    return
                end

                local Fade = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local FadeTween = Library:Tween({ BackgroundTransparency = 1 }, Fade, Overlay)
                Library:Tween({ Transparency = 1 }, Fade, Stroke)
                FadeTween.Completed:Wait()

                if Overlay.Parent then
                    Overlay:Destroy()
                end

                if Self.ActiveSearchHighlight == Overlay then
                    Self.ActiveSearchHighlight = nil
                end
            end)
        end

        Library.FocusSearchable = function(Self, Entry)
            if not Entry then
                return
            end

            Library:Thread(function()
                local Page = Entry.Page

                if Page and Page.Turn and Page.Window and Page.Window.Current ~= Page then
                    Page:Turn()

                    local Deadline = os.clock() + 1.25

                    while os.clock() < Deadline do
                        local PageInst = Page.Items and Page.Items["Page"] and Page.Items["Page"].Instance
                        local Content = Page.Window.Items and Page.Window.Items["Content"] and Page.Window.Items["Content"].Instance

                        if Page.Active and PageInst and Content and PageInst.Parent == Content then
                            break
                        end

                        task.wait()
                    end

                    task.wait(0.12)
                else
                    task.wait(0.05)
                end

                local Inst = Entry.Instance

                if type(Entry.GetInstance) == "function" then
                    local Ok, Result = pcall(Entry.GetInstance)
                    if Ok then
                        Inst = Result
                    end
                end

                if not Inst or not Inst.Parent then
                    return
                end

                RunService.RenderStepped:Wait()
                task.wait(0.03)

                local Scroll

                do
                    local Current = Inst.Parent

                    while Current do
                        if Current:IsA("ScrollingFrame") then
                            Scroll = Current
                            break
                        end

                        Current = Current.Parent
                    end
                end

                if Scroll then
                    local Scale = Library:GetScreenScale()
                    local Target = (Inst.AbsolutePosition.Y - Scroll.AbsolutePosition.Y) + Scroll.CanvasPosition.Y
                    local Center = Target - (Scroll.AbsoluteSize.Y * 0.32) / Scale

                    Library:Tween({
                        CanvasPosition = Vector2.new(0, math.max(0, Center))
                    }, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), Scroll)

                    task.wait(0.12)
                end

                Library:HighlightInstance(Inst)

                if Entry.Flash and type(Entry.Flash) == "function" then
                    pcall(Entry.Flash)
                end
            end)
        end

        local EscapeRichText = function(Text)
            Text = tostring(Text or "")
            Text = string.gsub(Text, "&", "&amp;")
            Text = string.gsub(Text, "<", "&lt;")
            Text = string.gsub(Text, ">", "&gt;")
            return Text
        end

        local AccentToHex = function()
            local Color = Library.Theme["Accent"]
            return string.format(
                "#%02X%02X%02X",
                math.floor(Color.R * 255 + 0.5),
                math.floor(Color.G * 255 + 0.5),
                math.floor(Color.B * 255 + 0.5)
            )
        end

        Library.HighlightQueryText = function(Self, Text, Query)
            Text = tostring(Text or "")
            Query = tostring(Query or "")

            if Query == "" then
                return EscapeRichText(Text)
            end

            local LowerText = string.lower(Text)
            local LowerQuery = string.lower(Query)
            local Start = string.find(LowerText, LowerQuery, 1, true)

            if not Start then
                return EscapeRichText(Text)
            end

            local Finish = Start + #Query - 1
            local Before = EscapeRichText(string.sub(Text, 1, Start - 1))
            local Match = EscapeRichText(string.sub(Text, Start, Finish))
            local After = EscapeRichText(string.sub(Text, Finish + 1))

            return Before .. '<font color="' .. AccentToHex() .. '">' .. Match .. "</font>" .. After
        end

        local InsetScale = function(Value, ParentSize, DraggerSize, Pad)
            Value = math.clamp(Value, 0, 1)
            Pad = Pad or 0

            if ParentSize <= 0 then
                return Value
            end

            local Half = (DraggerSize * 0.5) + Pad
            local Min = Half / ParentSize
            local Max = 1 - Min

            if Max <= Min then
                return 0.5
            end

            return Min + Value * (Max - Min)
        end

        Library.CreateContextMenu = function(Self, Data)
            Data = Data or { }

            local Menu = {
                Options = { },
                OptionCount = 0,
                IsOpen = false,
                Picking = false,
                Width = Data.Width or 130,
                Anchor = Data.Anchor,
                Parent = Data.Parent,
                Items = { },
            }

            local Items = { }

            Items["OptionHolder"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Library.UnusedHolder.Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                Visible = false,
                AutoButtonColor = false,
                AnchorPoint = Vector2.new(1, 0),
                Size = UDim2.new(0, Menu.Width, 0, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                BackgroundTransparency = 1,
                BackgroundColor3 = Library.Theme["Tab"]
            }):AddToTheme({BackgroundColor3 = 'Tab'})

            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["OptionHolder"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })

            Items["OptionOutline"] = Library:Create("UIStroke", {
                Name = "\0",
                Parent = Items["OptionHolder"].Instance,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                BorderOffset = UDim.new(0, 1),
                Transparency = 1,
                Color = Library.Theme["Outline"]
            }):AddToTheme({Color = 'Outline'})

            Items["OptionInline"] = Library:Create("UIStroke", {
                Name = "\0",
                Parent = Items["OptionHolder"].Instance,
                Color = Library.Theme["Hovered Element"],
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Transparency = 1,
            }):AddToTheme({Color = 'Hovered Element'})

            Items["OptionPadding"] = Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["OptionHolder"].Instance,
                PaddingTop = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
                PaddingLeft = UDim.new(0, 6)
            })

            Items["OptionList"] = Library:Create("UIListLayout", {
                Name = "\0",
                Parent = Items["OptionHolder"].Instance,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            Menu.Items = Items

            local Animation = Data.Animation or Library:GetAnim("ContextMenu")

            local OptionHolder = Items["OptionHolder"].Instance
            local OptionList = Items["OptionList"].Instance
            local OptionPadding = Items["OptionPadding"].Instance

            local Motion = {
                Opened = false,
                Connection = nil,
                CloseLayout = nil,
                Reveal = Spring.new(0, Animation.OpenStiffness),
                Fade = Spring.new(0, Animation.CloseStiffness),
            }

            local GetContentHeight = function()
                local Count = 0
                local Height = 0

                for _, OptionData in Menu.Options do
                    Height += OptionData.Button.Instance.Size.Y.Offset
                    Count += 1
                end

                if Count == 0 then
                    return 0
                end

                Height += (Count - 1) * OptionList.Padding.Offset
                Height += OptionPadding.PaddingTop.Offset + OptionPadding.PaddingBottom.Offset

                return Height
            end

            local GetStableAnchor = function()
                local Scale = Library:GetScreenScale()
                local Anchor = Menu.Anchor.Instance
                local Pos = Anchor.AbsolutePosition
                local Size = Anchor.AbsoluteSize
                local Drop = Animation.Drop or 8

                return {
                    Scale = Scale,
                    AnchorX = (Pos.X + Size.X) / Scale,
                    TopY = (Pos.Y + Size.Y + GuiInset + Drop) / Scale,
                }
            end

            local SetOptionZIndex = function(Bool)
                local Descendants = OptionHolder:GetDescendants()
                table.insert(Descendants, OptionHolder)

                for _, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    Value.ZIndex = Bool and Library.ZIndexOrder.ContextMenu or 1
                end
            end

            local AnyAnimating = function()
                if Motion.Opened and (Motion.Reveal.Value < 0.998 or not Motion.Reveal:Settled()) then
                    return true
                end

                if Motion.CloseLayout and (Motion.Fade.Value < 0.998 or not Motion.Fade:Settled()) then
                    return true
                end

                for _, OptionData in Menu.Options do
                    if not OptionData.Hover:Settled() or not OptionData.Select:Settled() then
                        return true
                    end

                    if Motion.Opened and not OptionData.Reveal:Settled() then
                        return true
                    end
                end

                return false
            end

            local StopMotion, StartMotion

            local StepMotion = function(Delta)
                local Anchor = GetStableAnchor()

                if Motion.Opened then
                    Motion.Fade:Set(0, 0)
                    Motion.Reveal:SetTarget(1)
                    Motion.Reveal:Step(Delta, Animation.OpenStiffness)

                    local Reveal = math.clamp(Motion.Reveal.Value, 0, 1)
                    local Height = GetContentHeight() * Reveal
                    local SizeScale = (1 - Animation.HolderPop) + Animation.HolderPop * Reveal

                    OptionHolder.Size = UDim2.fromOffset(Menu.Width * SizeScale, Height * SizeScale)
                    OptionHolder.Position = UDim2.fromOffset(Anchor.AnchorX, Anchor.TopY + Animation.Slide * (1 - Reveal))
                    OptionHolder.BackgroundTransparency = 1 - Reveal

                    Items["OptionOutline"].Instance.Transparency = 1 - Reveal
                    Items["OptionInline"].Instance.Transparency = 1 - Reveal

                    local Count = Menu.OptionCount
                    local Span = (Count > 1) and (Animation.Stagger / (Count - 1)) or 0

                    for _, OptionData in Menu.Options do
                        local Begin = (OptionData.Order - 1) * Span
                        local RevealTarget = math.clamp((Motion.Reveal.Value - Begin) / math.max(1 - Animation.Stagger, 0.01), 0, 1)

                        OptionData:Step(Delta, RevealTarget)
                    end
                elseif Motion.CloseLayout then
                    Motion.Fade:SetTarget(1)
                    Motion.Fade:Step(Delta, Animation.CloseStiffness)

                    local Alpha = 1 - math.clamp(Motion.Fade.Value, 0, 1)
                    local Layout = Motion.CloseLayout

                    OptionHolder.Size = UDim2.fromOffset(Menu.Width, Layout.ContentHeight)
                    OptionHolder.Position = UDim2.fromOffset(Layout.AnchorX, Layout.TopY)
                    OptionHolder.BackgroundTransparency = 1 - Alpha

                    Items["OptionOutline"].Instance.Transparency = 1 - Alpha
                    Items["OptionInline"].Instance.Transparency = 1 - Alpha

                    for _, OptionData in Menu.Options do
                        OptionData:Step(Delta, nil, Alpha)
                    end

                    if Motion.Fade:Settled() and Motion.Fade.Value >= 0.998 then
                        Motion.Fade:Set(0, 0)
                        Motion.Reveal:Set(0, 0)
                        Motion.CloseLayout = nil

                        OptionHolder.Size = UDim2.fromOffset(Menu.Width, 0)
                        OptionHolder.Visible = false

                        SetOptionZIndex(false)
                    end
                end

                if not AnyAnimating() then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            function Menu:AddOption(Name, Callback)
                Menu.OptionCount += 1

                local OptionButton = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = OptionHolder,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 25),
                    BorderSizePixel = 0,
                    LayoutOrder = Menu.OptionCount,
                })

                local OptionInner = Library:Create("Frame", {
                    Name = "\0",
                    Parent = OptionButton.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                })

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = OptionInner.Instance,
                    TopLeftRadius = UDim.new(0, 5),
                    TopRightRadius = UDim.new(0, 5),
                    BottomRightRadius = UDim.new(0, 5),
                    BottomLeftRadius = UDim.new(0, 5)
                })

                local OptionText = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = OptionInner.Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Name,
                    AnchorPoint = Vector2.new(0, 0.5),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Position = UDim2.new(0, 8, 0.5, 0),
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})

                local OptionData = {
                    Button = OptionButton,
                    Inner = OptionInner,
                    Text = OptionText,
                    Name = Name,
                    Order = Menu.OptionCount,
                    Callback = Callback,
                    IsSelected = false,

                    Hovered = false,
                    Hover = Spring.new(0, Animation.Hover),
                    Select = Spring.new(0, Animation.Select),
                    Reveal = Spring.new(0, Animation.Reveal),
                }

                OptionButton:OnHover(function()
                    OptionData.Hovered = true
                    StartMotion()
                end, function()
                    OptionData.Hovered = false
                    StartMotion()
                end)

                function OptionData:Step(Delta, RevealTarget, CloseAlpha)
                    local HoverTarget = (OptionData.Hovered and Motion.Opened) and 1 or 0

                    OptionData.Hover:SetTarget(HoverTarget)
                    OptionData.Select:SetTarget(OptionData.IsSelected and 1 or 0)

                    local Hover = OptionData.Hover:Step(Delta)
                    local Select = OptionData.Select:Step(Delta)
                    local Emphasis = math.max(Hover, Select)
                    local Fill = math.max(Hover * 0.9, Select)
                    local Inner = OptionData.Inner.Instance
                    local Text = OptionData.Text.Instance

                    if CloseAlpha ~= nil then
                        Inner.Size = UDim2.new(1, 0, 1, 0)
                        Inner.BackgroundColor3 = Library.Theme["Hovered Element"]:Lerp(Library.Theme["Accent"], Select)
                        Inner.BackgroundTransparency = 1 - (Fill * CloseAlpha)

                        Text.TextColor3 = Library.Theme["Text"]:Lerp(Color3.fromRGB(255, 255, 255), Select * 0.65)
                        Text.TextTransparency = 1 - (CloseAlpha * (0.8 + 0.2 * Emphasis))
                        Text.Position = UDim2.new(0, 8 + Animation.Nudge * Emphasis, 0.5, 0)
                        return
                    end

                    OptionData.Reveal:SetTarget(RevealTarget)

                    local Reveal = OptionData.Reveal:Step(Delta)
                    local RowScale = (1 - Animation.OptionPop) + Animation.OptionPop * Reveal

                    Inner.Size = UDim2.new(RowScale, 0, RowScale, 0)
                    Inner.BackgroundColor3 = Library.Theme["Hovered Element"]:Lerp(Library.Theme["Accent"], Select)
                    Inner.BackgroundTransparency = 1 - (Fill * Reveal)

                    Text.TextColor3 = Library.Theme["Text"]:Lerp(Color3.fromRGB(255, 255, 255), Select * 0.65)
                    Text.TextTransparency = 1 - (Reveal * (0.8 + 0.2 * Emphasis))
                    Text.Position = UDim2.new(0, 8 + Animation.Nudge * Emphasis + (1 - Reveal) * 6, 0.5, 0)
                end

                OptionButton:Connect("MouseButton1Down", function()
                    Library:SetOpenFrameInteracting(true)

                    Library:SafeCall(Callback)
                    Menu:SetOpen(false)

                    task.delay(0.08, function()
                        Library:SetOpenFrameInteracting(false)
                    end)
                end)

                table.insert(Menu.Options, OptionData)
                return OptionData
            end

            function Menu:SetSelected(Name)
                for _, OptionData in Menu.Options do
                    OptionData.IsSelected = OptionData.Name == Name

                    if OptionData.IsSelected then
                        OptionData.Select:SetTarget(1)
                    else
                        OptionData.Select:SetTarget(0)
                    end
                end

                StartMotion()
            end

            function Menu:SetOpen(Bool)
                if Menu.IsOpen == Bool then
                    return
                end

                Menu.IsOpen = Bool
                Motion.Opened = Bool

                if Bool then
                    Motion.CloseLayout = nil
                    Motion.Fade:Set(0, 0)

                    if Motion.Reveal.Value <= 0.002 then
                        for _, OptionData in Menu.Options do
                            OptionData.Hovered = false
                            OptionData.Hover:Set(0, 0)
                            OptionData.Select:Set(OptionData.IsSelected and 1 or 0, 0)
                            OptionData.Reveal:Set(0, 0)
                        end
                    end

                    SetOptionZIndex(true)

                    OptionHolder.Parent = Library.Holder.Instance
                    OptionHolder.Visible = true

                    Motion.Reveal:SetTarget(1)
                    StartMotion()
                    StepMotion(0)

                    Library:RegisterOpenFrame(Menu, {
                        HoverItems = { Items["OptionHolder"] },
                        AnchorInstance = Menu.Anchor.Instance,
                        PopupInstance = OptionHolder,
                    })
                else
                    for _, OptionData in Menu.Options do
                        OptionData.Hovered = false
                        OptionData.Hover:SetTarget(0)
                    end

                    local Anchor = GetStableAnchor()

                    Motion.CloseLayout = {
                        AnchorX = Anchor.AnchorX,
                        TopY = Anchor.TopY,
                        ContentHeight = GetContentHeight(),
                    }

                    Motion.Reveal:Set(1, 0)
                    Motion.Fade:Set(0, 0)
                    Motion.Fade.Velocity = math.max(Motion.Fade.Velocity, Animation.CloseKick)
                    Motion.Fade:SetTarget(1)

                    Library:CloseOpenFrameChildren(Menu)
                    Library:UnregisterOpenFrame(Menu)
                    StartMotion()
                end
            end

            Items["OptionHolder"]:VisibleCheck()

            return Menu, Items
        end

        Library.CreateColorpicker = function(Self, Data)
            local Colorpicker = {
                Hue = 0,
                Saturation = 0,
                Value = 0,

                Alpha = 0,

                Color = Color3.fromRGB(255, 255, 255),
                HexValue = "#FFFFFF",

                Flag = Library:ResolveFlag(Data.Flag),
                IsOpen = false,

                Items = { }
            }

            local Items = { } do 
                Items["ColorpickerButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Data.Parent.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 21, 0, 21),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ColorpickerButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Items["Inline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ColorpickerButton"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["RealButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Inline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ColorpickerButton"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                                
                Items["ColorpickerWindow"] = Library:Create("CanvasGroup", {
                    Name = "\0",
                    Parent = Library.UnusedHolder.Instance,
                    Position = UDim2.new(0, 1117, 0, 92),
                    Size = UDim2.new(0, 200, 0, 186),
                    BorderSizePixel = 0,
                    GroupTransparency = 1,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["WindowOutline"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Transparency = 1,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["WindowInline"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Transparency = 1,
                }):AddToTheme({Color = 'Hovered Element'})
                
                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 8)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10)
                })
                
                Items["Palette"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ColorpickerWindow"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 71, 197)
                })
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIFlexItem", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    FlexMode = Enum.UIFlexMode.Fill
                })
                
                Items["Saturation"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Saturation"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Saturation"].Instance,
                    Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(1, 1)
                }
                })
                
                Items["Value"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Value"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Value"].Instance,
                    Rotation = -90,
                    Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(1, 1)
                }
                })
                
                Items["PaletteDragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.new(0, 15, 0, 15),
                    BorderSizePixel = 0
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["PaletteDragger"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["PaletteDragger"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Items["Hue"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ColorpickerWindow"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 0, 14),
                    BorderSizePixel = 0
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
                }
                })
                
                Items["HueDragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    Size = UDim2.new(0, 2, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                })
                
                Items["Alpha"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ColorpickerWindow"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 71, 197)
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["AlphaDragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    Size = UDim2.new(0, 2, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 3
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Items["Checkers"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.new(0, 6, 0, 6),
                    Image = "http://www.roblox.com/asset/?id=18274452449",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    ZIndex = 2,
                    Active = false,
                    BorderSizePixel = 0
                })
                
                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Checkers"].Instance,
                    Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.37, 0.5),
                    NumberSequenceKeypoint.new(1, 0)
                }
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Checkers"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })                

                Colorpicker.Items = Items
            end

            function Colorpicker:SetVisibility(Bool)
                Items["ColorpickerButton"].Instance.Visible = Bool
            end

            function Colorpicker:Update(IsFromAlpha)
                local Hue, Saturation, Value = Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value
                Colorpicker.Color = Color3.fromHSV(Hue, Saturation, Value)
                Colorpicker.HexValue = "#" .. Colorpicker.Color:ToHex()
        
                Items["RealButton"]:Tween({BackgroundColor3 = Colorpicker.Color})
                Items["Palette"]:Tween({BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)})

                Flags[Colorpicker.Flag] = {
                    Alpha = Colorpicker.Alpha,
                    Color = Colorpicker.Color,
                    HexValue = Colorpicker.HexValue,
                    Transparency = 1 - Colorpicker.Alpha
                }
    
                if not IsFromAlpha then 
                    Items["Alpha"]:Tween({BackgroundColor3 = Colorpicker.Color})
                end
    
                if Data.Callback then 
                    Library:SafeCall(Data.Callback, Colorpicker.Color, Colorpicker.Alpha)
                end
            end

            local ColorpickerWindow = Items["ColorpickerWindow"].Instance
            local ColorpickerButton = Items["ColorpickerButton"].Instance

            local IsSettings = Data.Section and Data.Section.IsSettings

            local CAnim = Library:GetAnim("Colorpicker")

            local WindowBaseSize = Vector2.new(
                ColorpickerWindow.Size.X.Offset,
                ColorpickerWindow.Size.Y.Offset
            )

            local Motion = {
                Opened = false,
                Connection = nil,
                BaseX = 0,
                BaseY = 0,
                Reveal = Spring.new(0, CAnim.Open),
                PaletteX = Spring.new(0.5, CAnim.Drag),
                PaletteY = Spring.new(0.5, CAnim.Drag),
                HueX = Spring.new(0, CAnim.Drag),
                AlphaX = Spring.new(0, CAnim.Drag),
            }

            local SetWindowZIndex = function(Bool)
                local Descendants = ColorpickerWindow:GetDescendants()
                table.insert(Descendants, ColorpickerWindow)

                for _, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    if IsSettings then
                        Value.ZIndex = Bool and Library.ZIndexOrder.ColorpickerWindow + 4 or 1
                    else
                        Value.ZIndex = Bool and Library.ZIndexOrder.ColorpickerWindow or 1
                    end
                end
            end

            local ApplyStrokeFade = function(Reveal)
                local Transparency = 1 - Reveal

                Items["WindowOutline"].Instance.Transparency = Transparency
                Items["WindowInline"].Instance.Transparency = Transparency

                for _, Desc in ColorpickerWindow:GetDescendants() do
                    if Desc:IsA("UIStroke") and Desc ~= Items["WindowOutline"].Instance and Desc ~= Items["WindowInline"].Instance then
                        Desc.Transparency = Transparency
                    end
                end
            end

            local StopMotion, StartMotion

            local StepMotion = function(Delta)
                local PaletteX = Motion.PaletteX:Step(Delta)
                local PaletteY = Motion.PaletteY:Step(Delta)
                local HueX = Motion.HueX:Step(Delta)
                local AlphaX = Motion.AlphaX:Step(Delta)

                local Palette = Items["Palette"].Instance
                local PaletteDrag = Items["PaletteDragger"].Instance
                local Hue = Items["Hue"].Instance
                local HueDrag = Items["HueDragger"].Instance
                local Alpha = Items["Alpha"].Instance
                local AlphaDrag = Items["AlphaDragger"].Instance

                PaletteDrag.Position = UDim2.new(
                    InsetScale(PaletteX, Palette.AbsoluteSize.X, PaletteDrag.AbsoluteSize.X, 1),
                    0,
                    InsetScale(PaletteY, Palette.AbsoluteSize.Y, PaletteDrag.AbsoluteSize.Y, 1),
                    0
                )

                HueDrag.Position = UDim2.new(
                    InsetScale(HueX, Hue.AbsoluteSize.X, HueDrag.AbsoluteSize.X, 0),
                    0,
                    0.5,
                    0
                )

                AlphaDrag.Position = UDim2.new(
                    InsetScale(AlphaX, Alpha.AbsoluteSize.X, AlphaDrag.AbsoluteSize.X, 0),
                    0,
                    0.5,
                    0
                )

                Motion.Reveal:SetTarget(Motion.Opened and 1 or 0)

                local Reveal = math.clamp(Motion.Reveal:Step(Delta, Motion.Opened and CAnim.Open or CAnim.Close), 0, 1)
                local SizeScale = (1 - CAnim.HolderPop) + CAnim.HolderPop * Reveal

                ColorpickerWindow.Size = UDim2.fromOffset(WindowBaseSize.X * SizeScale, WindowBaseSize.Y * SizeScale)
                ColorpickerWindow.Position = UDim2.fromOffset(Motion.BaseX, Motion.BaseY + CAnim.Slide * (1 - Reveal))
                ColorpickerWindow.GroupTransparency = 1 - Reveal
                ApplyStrokeFade(Reveal)

                if not Motion.Opened and Motion.Reveal:Settled() and Motion.Reveal.Value <= 0.002 then
                    Motion.Reveal:Set(0, 0)
                    ColorpickerWindow.GroupTransparency = 1
                    ApplyStrokeFade(0)
                    ColorpickerWindow.Visible = false
                    SetWindowZIndex(false)
                end

                local Animating = Motion.Opened
                    or not Motion.Reveal:Settled()
                    or not Motion.PaletteX:Settled()
                    or not Motion.PaletteY:Settled()
                    or not Motion.HueX:Settled()
                    or not Motion.AlphaX:Settled()

                if not Animating then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            function Colorpicker:SetOpen(Bool)
                if Colorpicker.IsOpen == Bool then
                    return
                end

                Colorpicker.IsOpen = Bool
                Motion.Opened = Bool

                if Colorpicker.IsOpen then
                    local Pos = Library:PopupPosition(ColorpickerButton, ColorpickerWindow, 8)
                    Motion.BaseX = Pos.X.Offset
                    Motion.BaseY = Pos.Y.Offset

                    SetWindowZIndex(true)

                    ColorpickerWindow.Parent = Library.Holder.Instance
                    ColorpickerWindow.Visible = true

                    Motion.Reveal:SetTarget(1)
                    StartMotion()
                    StepMotion(0)

                    Library:RegisterOpenFrame(Colorpicker, {
                        HoverItems = { Items["ColorpickerWindow"], Items["ColorpickerButton"], Items["Inline"], Items["RealButton"] },
                        AnchorInstance = ColorpickerButton,
                        PopupInstance = ColorpickerWindow,
                    })
                else
                    Motion.Reveal:SetTarget(0)
                    StartMotion()

                    Library:CloseOpenFrameChildren(Colorpicker)
                    Library:UnregisterOpenFrame(Colorpicker)
                end
            end

            Items["ColorpickerWindow"]:VisibleCheck()

            local SlidingPalette = false
            local SlidingHue = false
            local SlidingAlpha = false
            local DragEnded

            local EndDrag = function()
                SlidingPalette = false
                SlidingHue = false
                SlidingAlpha = false
                Library:SetOpenFrameInteracting(false)

                if DragEnded then
                    DragEnded:Disconnect()

                    local Index = table.find(Library.Connections, DragEnded)

                    if Index then
                        table.remove(Library.Connections, Index)
                    end

                    DragEnded = nil
                end
            end

            local BeginDrag = function()
                Library:SetOpenFrameInteracting(true)

                if DragEnded then
                    return
                end

                DragEnded = Library:Connect(UserInputService.InputEnded, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        EndDrag()
                    end
                end)
            end

            function Colorpicker:SlidePalette(Input)
                if not Input or not SlidingPalette then
                    return
                end

                local Palette = Items["Palette"].Instance
                local Size = Palette.AbsoluteSize
                local Pos = Palette.AbsolutePosition

                if Size.X <= 0 or Size.Y <= 0 then
                    return
                end

                local SlideX = math.clamp((Input.Position.X - Pos.X) / Size.X, 0, 1)
                local SlideY = math.clamp((Input.Position.Y - Pos.Y) / Size.Y, 0, 1)

                Colorpicker.Saturation = SlideX
                Colorpicker.Value = 1 - SlideY

                Motion.PaletteX:SetTarget(SlideX)
                Motion.PaletteY:SetTarget(SlideY)
                StartMotion()
                Colorpicker:Update()
            end

            function Colorpicker:SlideHue(Input)
                if not Input or not SlidingHue then
                    return
                end

                local Hue = Items["Hue"].Instance
                local Size = Hue.AbsoluteSize
                local Pos = Hue.AbsolutePosition

                if Size.X <= 0 then
                    return
                end

                local SlideX = math.clamp((Input.Position.X - Pos.X) / Size.X, 0, 1)

                Colorpicker.Hue = SlideX
                Motion.HueX:SetTarget(SlideX)
                StartMotion()
                Colorpicker:Update()
            end

            function Colorpicker:SlideAlpha(Input)
                if not Input or not SlidingAlpha then
                    return
                end

                local Alpha = Items["Alpha"].Instance
                local Size = Alpha.AbsoluteSize
                local Pos = Alpha.AbsolutePosition

                if Size.X <= 0 then
                    return
                end

                local SlideX = math.clamp((Input.Position.X - Pos.X) / Size.X, 0, 1)

                Colorpicker.Alpha = SlideX
                Motion.AlphaX:SetTarget(SlideX)
                StartMotion()
                Colorpicker:Update(true)
            end

            function Colorpicker:Set(Color, Alpha)
                if type(Color) == "table" then
                    Color = Color3.fromRGB(Color[1], Color[2], Color[3])
                elseif type(Color) == "string" then
                    Color = Color3.fromHex(Color)
                else
                    Color = Color
                end

                Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value = Color:ToHSV()
                Colorpicker.Alpha = Alpha or 0

                local PaletteValueX = math.clamp(1 - Colorpicker.Saturation, 0, 1)
                local PaletteValueY = math.clamp(1 - Colorpicker.Value, 0, 1)
                local HuePositionX = math.clamp(Colorpicker.Hue, 0, 1)
                local AlphaPositionX = math.clamp(Colorpicker.Alpha, 0, 1)

                Motion.PaletteX:SetTarget(PaletteValueX)
                Motion.PaletteY:SetTarget(PaletteValueY)
                Motion.HueX:SetTarget(HuePositionX)
                Motion.AlphaX:SetTarget(AlphaPositionX)
                StartMotion()
                Colorpicker:Update()
            end

            local ToggleColorpicker = function()
                Library:SetOpenFrameInteracting(true)
                Colorpicker:SetOpen(not Colorpicker.IsOpen)

                task.delay(0.05, function()
                    Library:SetOpenFrameInteracting(false)
                end)
            end

            Items["ColorpickerButton"]:Connect("MouseButton1Down", ToggleColorpicker)
            Items["Inline"]:Connect("MouseButton1Down", ToggleColorpicker)
            Items["RealButton"]:Connect("MouseButton1Down", ToggleColorpicker)

            Library:RegisterOpenFrameTrigger(Items["ColorpickerButton"])
            Library:RegisterOpenFrameTrigger(Items["Inline"])
            Library:RegisterOpenFrameTrigger(Items["RealButton"])

            Items["Palette"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingPalette = true
                    BeginDrag()
                    Colorpicker:SlidePalette(Input)
                end
            end)

            Items["Hue"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingHue = true
                    BeginDrag()
                    Colorpicker:SlideHue(Input)
                end
            end)

            Items["Alpha"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingAlpha = true
                    BeginDrag()
                    Colorpicker:SlideAlpha(Input)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then
                    return
                end

                if SlidingPalette then
                    Colorpicker:SlidePalette(Input)
                end

                if SlidingHue then
                    Colorpicker:SlideHue(Input)
                end

                if SlidingAlpha then
                    Colorpicker:SlideAlpha(Input)
                end
            end)

            local DefaultColor = Colorpicker.Color
            local DefaultAlpha = Colorpicker.Alpha

            if Data.Default then
                Colorpicker:Set(Data.Default, Data.Alpha)

                DefaultColor = Colorpicker.Color
                DefaultAlpha = Colorpicker.Alpha
            end

            local ContextMenu = Library:CreateContextMenu({
                Anchor = Items["ColorpickerButton"],
                Parent = Data.Parent,
                Width = 130,
            })

            ContextMenu:AddOption("Copy", function()
                Library.ColorClipboard = {
                    Color = Colorpicker.Color,
                    Alpha = Colorpicker.Alpha,
                }

                pcall(function()
                    if setclipboard then
                        setclipboard(Colorpicker.HexValue)
                    end
                end)
            end)

            ContextMenu:AddOption("Paste", function()
                local Clip = Library.ColorClipboard

                if Clip and Clip.Color then
                    Colorpicker:Set(Clip.Color, Clip.Alpha or 0)
                end
            end)

            ContextMenu:AddOption("Reset", function()
                Colorpicker:Set(DefaultColor, DefaultAlpha)
            end)

            local OpenContext = function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                    ContextMenu:SetOpen(not ContextMenu.IsOpen)
                end
            end

            Items["ColorpickerButton"]:Connect("InputBegan", OpenContext)
            Items["Inline"]:Connect("InputBegan", OpenContext)
            Items["RealButton"]:Connect("InputBegan", OpenContext)

            SetFlags[Colorpicker.Flag] = function(Value, Alpha)
                Colorpicker:Set(Value, Alpha)
            end

            function Colorpicker:Get()
                return Colorpicker.Color, Colorpicker.Alpha
            end

            return Colorpicker, Items 
        end

        Library.CreateKeybind = function(Self, Data)
            local Keybind = {
                Flag = Library:ResolveFlag(Data.Flag, Data.Name),
                IsOpen = false,

                Key = "",
                Mode = Data.Mode or "Toggle",
                Value = "None",

                Toggled = false,
                Picking = false,
                Hovered = false,

                Items = { },
            }

            local ModeLabels = {
                Toggle = "On Toggle",
                Hold = "On Hold",
                Always = "Always",
                Press = "On Press",
            }

            local ModeFromLabel = {
                ["On Toggle"] = "Toggle",
                ["On Hold"] = "Hold",
                ["Always"] = "Always",
                ["On Press"] = "Press",
            }

            local Items = { } do
                Items["KeyButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Data.Parent.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 36, 0, 21),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["KeyButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["KeyButton"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Inline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["KeyButton"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["RealButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Inline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["RealButton"].Instance,
                    PaddingRight = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6)
                })

                Items["KeyText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize - 2,
                    Parent = Items["RealButton"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "None",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                }):AddToTheme({TextColor3 = 'Text'})

                Items["KeyText"].Instance.TextSize = Library.FontSize - 2

                Keybind.Items = Items
            end

            local Animation = Library:GetAnim("Keybind")

            local WidthPad = 12
            local MinWidth = 36
            local ButtonHeight = 21

            local MeasureLabel = Library:Create("TextLabel", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize - 2,
                Parent = Library.UnusedHolder.Instance,
                Text = "None",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                Visible = false,
            })

            local MeasureTextWidth = function(Text)
                MeasureLabel.Instance.Text = Text

                local Bounds = MeasureLabel.Instance.TextBounds.X

                if Bounds <= 0 then
                    return (#Text) * (Library.FontSize - 2) * 0.56
                end

                return Bounds
            end

            local GetTargetWidth = function(Text)
                return math.max(MinWidth, math.ceil(MeasureTextWidth(Text) + WidthPad))
            end

            local InitialWidth = GetTargetWidth("None")

            Items["KeyButton"].Instance.Size = UDim2.fromOffset(InitialWidth, ButtonHeight)

            local Motion = {
                Connection = nil,
                ButtonActive = Spring.new(0, Animation.ButtonActive),
                Pick = Spring.new(0, Animation.Pick),
                TextFade = Spring.new(1, Animation.TextFade),
                TextOffset = Spring.new(0, Animation.TextOffset),
                Width = Spring.new(InitialWidth, Animation.Width),
                TextPending = nil,
                TextToken = 0,
            }

            local StopMotion, StartMotion

            local ApplyButtonVisuals = function(Active)
                local Outline = Library.Theme["Outline"]:Lerp(Library.Theme["Dark Liner"], Active)
                local Background = Library.Theme["Tab"]:Lerp(Library.Theme["Hovered Element"], Active)
                local Text = Library.Theme["Text"]:Lerp(Color3.fromRGB(255, 255, 255), Active * 0.45)

                Items["KeyButton"].Instance.BackgroundColor3 = Outline
                Items["RealButton"].Instance.BackgroundColor3 = Background
                Items["KeyText"].Instance.TextColor3 = Text
            end

            local ApplyTextVisuals = function()
                local Fade = math.clamp(Motion.TextFade.Value, 0, 1)
                local Offset = Motion.TextOffset.Value

                Items["KeyText"].Instance.TextTransparency = 1 - Fade
                Items["KeyText"].Instance.Position = UDim2.new(0.5, 0, 0.5, Offset)
            end

            local ApplyWidth = function()
                Items["KeyButton"].Instance.Size = UDim2.fromOffset(math.max(MinWidth, Motion.Width.Value), ButtonHeight)
            end

            local AnyAnimating = function()
                if Motion.TextPending then
                    return true
                end

                return not Motion.ButtonActive:Settled()
                    or not Motion.Pick:Settled()
                    or not Motion.TextFade:Settled()
                    or not Motion.TextOffset:Settled()
                    or not Motion.Width:Settled(0.35)
            end

            local StepMotion = function(Delta)
                local ActiveTarget = (Keybind.Hovered or Keybind.Picking or Keybind.IsOpen) and 1 or 0

                Motion.ButtonActive:SetTarget(ActiveTarget)
                Motion.Pick:SetTarget(Keybind.Picking and 1 or 0)

                local Active = Motion.ButtonActive:Step(Delta)
                local Pick = Motion.Pick:Step(Delta)

                ApplyButtonVisuals(math.clamp(math.max(Active, Pick), 0, 1))

                if Motion.TextPending and Motion.TextFade.Value <= 0.04 and math.abs(Motion.TextFade.Velocity) <= 0.05 then
                    local Pending = Motion.TextPending

                    if Pending.Token == Motion.TextToken then
                        Items["KeyText"].Instance.Text = Pending.Text
                        Motion.TextPending = nil
                        Motion.TextOffset:Set(-3, 0)
                        Motion.Width:SetTarget(Pending.Width)
                        Motion.TextFade:SetTarget(1)
                        Motion.TextOffset:SetTarget(0)
                    end
                end

                Motion.TextFade:Step(Delta)
                Motion.TextOffset:Step(Delta)
                Motion.Width:Step(Delta)
                ApplyTextVisuals()
                ApplyWidth()

                if not AnyAnimating() then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            local SetKeyText = function(Text, Instant)
                Text = tostring(Text)

                if Items["KeyText"].Instance.Text == Text and not Motion.TextPending then
                    return
                end

                local TargetWidth = GetTargetWidth(Text)

                if Instant then
                    Motion.TextToken += 1
                    Motion.TextPending = nil
                    Items["KeyText"].Instance.Text = Text
                    Motion.TextFade:Set(1, 0)
                    Motion.TextOffset:Set(0, 0)
                    Motion.Width:Set(TargetWidth, 0)
                    ApplyTextVisuals()
                    ApplyWidth()
                    return
                end

                Motion.TextToken += 1
                Motion.TextPending = {
                    Text = Text,
                    Token = Motion.TextToken,
                    Width = TargetWidth,
                }

                Motion.TextFade:SetTarget(0)
                Motion.TextOffset:SetTarget(3)
                Motion.TextFade.Velocity = math.min(Motion.TextFade.Velocity, -Animation.PickKick)
                StartMotion()
            end

            local ApplyButtonColors = function(Kick)
                local Target = (Keybind.Hovered or Keybind.Picking or Keybind.IsOpen) and 1 or 0

                Motion.ButtonActive:SetTarget(Target)

                if Kick and Target > Motion.ButtonActive.Value then
                    Motion.ButtonActive.Velocity = math.max(Motion.ButtonActive.Velocity, Animation.ActiveKick)
                end

                StartMotion()
            end

            Items["RealButton"].Instance.AnchorPoint = Vector2.new(0, 0)
            Items["RealButton"].Instance.Position = UDim2.new(0, 0, 0, 0)
            Items["RealButton"].Instance.Size = UDim2.new(1, 0, 1, 0)

            local FormatKey = function(Key)
                local Raw = tostring(Key)
                local Name = string.gsub(string.gsub(Raw, "^Enum%.KeyCode%.", ""), "^Enum%.UserInputType%.", "")
                local Mapped = Keys[Name] or Keys[Raw] or Name

                if Mapped == "" or Mapped == "Unknown" then
                    return "None"
                end

                return Mapped
            end

            local SyncFlags = function()
                Flags[Keybind.Flag] = {
                    Mode = Keybind.Mode,
                    Key = Keybind.Key,
                    Toggled = Keybind.Toggled
                }
            end

            function Keybind:SetMode(Mode)
                if Mode then
                    Keybind.Mode = Mode
                end

                if Keybind.Mode == "Always" then
                    Keybind.Toggled = true
                end

                SyncFlags()

                if ModeMenu then
                    ModeMenu:SetSelected(ModeLabels[Keybind.Mode] or "On Toggle")
                end

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                end

                ApplyButtonColors(true)
            end

            function Keybind:Press(Bool)
                if Keybind.Mode == "Toggle" then
                    Keybind.Toggled = not Keybind.Toggled
                elseif Keybind.Mode == "Hold" then
                    Keybind.Toggled = Bool and true or false
                elseif Keybind.Mode == "Always" then
                    Keybind.Toggled = true
                elseif Keybind.Mode == "Press" then
                    Keybind.Toggled = true
                end

                SyncFlags()

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                end

                if Keybind.Mode == "Press" then
                    Library:Thread(function()
                        Keybind.Toggled = false
                        SyncFlags()
                    end)
                end
            end

            function Keybind:Set(Key)
                if type(Key) == "table" then
                    local RealKey = Key.Key
                    local Mode = Key.Mode or Keybind.Mode or "Toggle"

                    if typeof(RealKey) == "EnumItem" then
                        Keybind.Key = tostring(RealKey)
                    else
                        Keybind.Key = tostring(RealKey or "None")
                    end

                    if tostring(RealKey) == "Enum.KeyCode.Backspace" or RealKey == "Backspace" or RealKey == "None" then
                        Keybind.Key = "None"
                        Keybind.Value = "None"
                        SetKeyText("None")
                    else
                        Keybind.Value = FormatKey(Keybind.Key)
                        SetKeyText(Keybind.Value)
                    end

                    Keybind:SetMode(Mode)
                elseif typeof(Key) == "EnumItem" then
                    if Key.EnumType == Enum.KeyCode and Key == Enum.KeyCode.Backspace then
                        Keybind.Key = "None"
                        Keybind.Value = "None"
                        SetKeyText("None")
                    else
                        Keybind.Key = tostring(Key)
                        Keybind.Value = FormatKey(Key)
                        SetKeyText(Keybind.Value)
                    end

                    SyncFlags()

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end
                elseif table.find({"Toggle", "Hold", "Always", "Press"}, Key) then
                    Keybind:SetMode(Key)
                elseif type(Key) == "string" then
                    if string.find(Key, "Enum") then
                        Keybind.Key = Key
                        Keybind.Value = FormatKey(Key)
                        SetKeyText(Keybind.Value)
                        SyncFlags()
                    elseif table.find({"Toggle", "Hold", "Always", "Press"}, Key) then
                        Keybind:SetMode(Key)
                    end
                end

                Keybind.Picking = false
                Motion.Pick:SetTarget(0)
                ApplyButtonColors()
            end

            local ModeMenu
            ModeMenu = Library:CreateContextMenu({
                Anchor = Items["KeyButton"],
                Parent = Data.Parent,
                Width = 140,
                Animation = Library:GetAnim("KeybindMenu"),
            })

            for _, Label in { "On Toggle", "On Hold", "Always", "On Press" } do
                ModeMenu:AddOption(Label, function()
                    Keybind:SetMode(ModeFromLabel[Label])
                end)
            end

            local OriginalMenuSetOpen = ModeMenu.SetOpen

            function ModeMenu.SetOpen(Self, Bool)
                OriginalMenuSetOpen(Self, Bool)
                Keybind.IsOpen = Self.IsOpen
                ApplyButtonColors(Bool)
            end

            function Keybind:SetOpen(Bool)
                if ModeMenu.IsOpen == Bool then
                    Keybind.IsOpen = Bool
                    ApplyButtonColors()
                    return
                end

                if Bool then
                    ModeMenu:SetSelected(ModeLabels[Keybind.Mode] or "On Toggle")
                end

                ModeMenu:SetOpen(Bool)
            end

            local PickConnection
            local PickIgnoreUntil = 0

            local BeginPick = function()
                if Keybind.Picking then
                    return
                end

                Library:SetOpenFrameInteracting(true)
                Keybind.Picking = true
                PickIgnoreUntil = os.clock() + 0.15
                Motion.Pick:SetTarget(1)
                Motion.Pick.Velocity = math.max(Motion.Pick.Velocity, Animation.PickKick)
                ApplyButtonColors(true)
                SetKeyText(". . .")

                if PickConnection then
                    PickConnection:Disconnect()

                    local Index = table.find(Library.Connections, PickConnection)

                    if Index then
                        table.remove(Library.Connections, Index)
                    end

                    PickConnection = nil
                end

                task.delay(0.08, function()
                    Library:SetOpenFrameInteracting(false)
                end)

                PickConnection = Library:Connect(UserInputService.InputBegan, function(Input)
                    if os.clock() < PickIgnoreUntil then
                        return
                    end

                    if Input.UserInputType == Enum.UserInputType.Keyboard then
                        if Input.KeyCode == Enum.KeyCode.Escape then
                            Keybind.Picking = false
                            Motion.Pick:SetTarget(0)
                            SetKeyText(Keybind.Value ~= "" and Keybind.Value or "None")
                            ApplyButtonColors()
                        else
                            Keybind:Set(Input.KeyCode)
                        end
                    elseif Input.UserInputType == Enum.UserInputType.MouseButton1
                        or Input.UserInputType == Enum.UserInputType.MouseButton2
                        or Input.UserInputType == Enum.UserInputType.MouseButton3 then
                        Keybind:Set(Input.UserInputType)
                    else
                        return
                    end

                    if PickConnection then
                        PickConnection:Disconnect()

                        local Index = table.find(Library.Connections, PickConnection)

                        if Index then
                            table.remove(Library.Connections, Index)
                        end

                        PickConnection = nil
                    end
                end)
            end

            local OpenModeMenu = function()
                Library:SetOpenFrameInteracting(true)
                Keybind:SetOpen(not ModeMenu.IsOpen)

                task.delay(0.05, function()
                    Library:SetOpenFrameInteracting(false)
                end)
            end

            Items["KeyButton"]:OnHover(function()
                Keybind.Hovered = true
                ApplyButtonColors(true)
            end, function()
                Keybind.Hovered = false
                ApplyButtonColors()
            end)

            Items["Inline"]:OnHover(function()
                Keybind.Hovered = true
                ApplyButtonColors(true)
            end, function()
                Keybind.Hovered = false
                ApplyButtonColors()
            end)

            Items["RealButton"]:OnHover(function()
                Keybind.Hovered = true
                ApplyButtonColors(true)
            end, function()
                Keybind.Hovered = false
                ApplyButtonColors()
            end)

            Items["KeyButton"]:Connect("MouseButton1Down", BeginPick)
            Items["Inline"]:Connect("MouseButton1Down", BeginPick)
            Items["RealButton"]:Connect("MouseButton1Down", BeginPick)

            Items["KeyButton"]:Connect("MouseButton2Down", OpenModeMenu)
            Items["Inline"]:Connect("MouseButton2Down", OpenModeMenu)
            Items["RealButton"]:Connect("MouseButton2Down", OpenModeMenu)

            Library:RegisterOpenFrameTrigger(Items["KeyButton"])
            Library:RegisterOpenFrameTrigger(Items["Inline"])
            Library:RegisterOpenFrameTrigger(Items["RealButton"])

            Library:Connect(UserInputService.InputBegan, function(Input, GPE)
                if Keybind.Picking or Keybind.Value == "None" or Keybind.Key == "" or Keybind.Key == "None" then
                    return
                end

                if GPE then
                    return
                end

                local Matched = tostring(Input.KeyCode) == Keybind.Key or tostring(Input.UserInputType) == Keybind.Key

                if not Matched then
                    return
                end

                if Keybind.Mode == "Toggle" then
                    Keybind:Press()
                elseif Keybind.Mode == "Hold" then
                    Keybind:Press(true)
                elseif Keybind.Mode == "Always" then
                    Keybind:Press(true)
                elseif Keybind.Mode == "Press" then
                    Keybind:Press(true)
                end
            end)

            Library:Connect(UserInputService.InputEnded, function(Input, GPE)
                if GPE or Keybind.Picking or Keybind.Value == "None" or Keybind.Key == "" or Keybind.Key == "None" then
                    return
                end

                local Matched = tostring(Input.KeyCode) == Keybind.Key or tostring(Input.UserInputType) == Keybind.Key

                if not Matched then
                    return
                end

                if Keybind.Mode == "Hold" then
                    Keybind:Press(false)
                elseif Keybind.Mode == "Always" then
                    Keybind:Press(true)
                end
            end)

            if Data.Default then
                Keybind:Set({
                    Mode = Data.Mode or "Toggle",
                    Key = Data.Default,
                })
                SetKeyText(Keybind.Value, true)
            else
                Keybind:SetMode(Data.Mode or "Toggle")
                SetKeyText("None", true)
            end

            SetFlags[Keybind.Flag] = function(Value)
                Keybind:Set(Value)
            end

            function Keybind:Get()
                return Keybind.Toggled, Keybind.Key, Keybind.Mode
            end

            function Keybind:SetVisibility(Bool)
                Items["KeyButton"].Instance.Visible = Bool
            end

            return Keybind, Items
        end

        local BindOuterWindowOpen = function(Object, Root, Title, DefaultSize)
            Object.RestSize = DefaultSize
            Object.Animating = Object.Animating or false
            Object.Root = Root

            table.insert(Library.OuterWindows, Object)

            local Debounce = false

            function Object:GetTopLeft()
                local Gui = Root.Instance
                local Scale = Library:GetScreenScale()
                local Pos = Gui.AbsolutePosition
                local Size = Gui.AbsoluteSize

                return Vector2.new(Pos.X / Scale, (Pos.Y + GuiInset) / Scale), Vector2.new(Size.X / Scale, Size.Y / Scale)
            end

            function Object:SetAnchor(Anchor)
                local Gui = Root.Instance

                if Gui.AnchorPoint == Anchor then
                    return
                end

                local TopLeft, Size = Object:GetTopLeft()

                Gui.AnchorPoint = Anchor
                Gui.Position = UDim2.fromOffset(
                    TopLeft.X + Size.X * Anchor.X,
                    TopLeft.Y + Size.Y * Anchor.Y
                )
            end

            function Object:SetOpen(Bool)
                if Debounce or Object.Animating then
                    return
                end

                if Object.IsOpen == Bool then
                    return
                end

                Debounce = true
                Object.IsOpen = Bool

                -- note: every animation code is very customizeable like this. general tweening would be customized in the library table.
                local OpenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                local CloseInfo = TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
                local FadeInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

                Object:SetAnchor(Vector2.new(0.5, 0.5))

                if Bool then
                    local Target = Object.OpenSize or Object.RestSize or DefaultSize

                    Root:Tween({
                        Size = UDim2.fromOffset(Target.X, Target.Y)
                    }, OpenInfo)

                    if Title then
                        Title.Instance.Position = UDim2.new(0, 0, 0, -18)
                        Title:Tween({Position = UDim2.new(0, 0, 0, -8)}, OpenInfo)
                    end
                else
                    Object.OpenSize = Vector2.new(Root.Instance.Size.X.Offset, Root.Instance.Size.Y.Offset)

                    Root:Tween({
                        Size = UDim2.fromOffset(Object.OpenSize.X * 0.94, Object.OpenSize.Y * 0.94)
                    }, CloseInfo)

                    if Title then
                        Title:Tween({Position = UDim2.new(0, 0, 0, -18)}, CloseInfo)
                    end
                end

                Root:FadeDescendants(Bool, function()
                    Debounce = false

                    if Title then
                        Title.Instance.Position = UDim2.new(0, 0, 0, -8)
                    end

                    if Bool then
                        local Target = Object.OpenSize or Object.RestSize or DefaultSize
                        Root.Instance.Size = UDim2.fromOffset(Target.X, Target.Y)
                        Object:SetAnchor(Vector2.new(0, 0))
                    end

                    if Object.OnOpenChanged then
                        Object:OnOpenChanged(Bool)
                    end
                end, FadeInfo)
            end
        end

        Library.Image = function(Self, Params)
            Params = Params or { }

            local Image = {
                Name = Params.Name or Params.name or "Image",
                Icon = Params.Icon or Params.icon or "",

                IsOpen = false,
                Items = { }
            }

            local Items = { } do
                Items["Image"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    Visible = false,
                    Position = UDim2.fromOffset(80, 280),
                    Size = UDim2.new(0, 160, 0, 160),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})

                Items["Image"]:MakeDraggable()
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Image"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Image"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Image"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Image"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Image.Name,
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, -8),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Title"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["ImageBackground"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Image"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })
                
                Items["Icon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["ImageBackground"].Instance,
                    Image = Image.Icon,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Icon"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ImageBackground"].Instance,
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })                

                Image.Items = Items
            end

            function Image:SetText(Text)
                Items["Title"].Instance.Text = Text
            end

            BindOuterWindowOpen(Image, Items["Image"], Items["Title"], Vector2.new(160, 160))

            return Image
        end

        Library.Video = function(Self, Params)
            Params = Params or { }

            local Video = {
                Name = Params.Name or Params.name or "Video",
                Asset = Params.Asset or Params.asset or "",

                IsOpen = false,
                Items = { }
            }

            local Items = { } do
                Items["Video"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    Visible = false,
                    Position = UDim2.fromOffset(80, 80),
                    Size = UDim2.new(0, 160, 0, 160),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})

                Items["Video"]:MakeDraggable()
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Video"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Video"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Video"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Video"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Video.Name,
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, -8),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Title"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["VideoBackground"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Video"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["VideoBackground"].Instance,
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })
                
                Items["VideoFrame"] = Library:Create("VideoFrame", {
                    Name = "\0",
                    Parent = Items["VideoBackground"].Instance,
                    Video = Video.Asset,
                    Looped = true,
                    Playing = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["VideoFrame"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })                

                Video.Items = Items
            end

            function Video:SetText(Text)
                Items["Title"].Instance.Text = Text
            end

            BindOuterWindowOpen(Video, Items["Video"], Items["Title"], Vector2.new(160, 160))

            function Video:OnOpenChanged(Bool)
                Items["VideoFrame"].Instance.Playing = Bool and true or false
            end

            return Video
        end

        Library.Viewport = function(Self, Params)
            Params = Params or { }

            local Viewport = {
                Name = Params.Name or Params.name or "Viewport",
                Part = Params.Part or Params.part or nil,
                Display = nil,

                IsOpen = false,
                Items = { }
            }

            local Items = { } do
                Items["Viewport"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    Visible = false,
                    Position = UDim2.fromOffset(80, 480),
                    Size = UDim2.new(0, 160, 0, 160),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Viewport"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Viewport"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Viewport"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Viewport"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Viewport.Name,
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, -8),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Title"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["ViewportBackground"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Viewport"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Active = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })
                
                Items["ViewportFrame"] = Library:Create("ViewportFrame", {
                    Name = "\0",
                    Parent = Items["ViewportBackground"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    Ambient = Color3.fromRGB(200, 200, 200),
                    LightColor = Color3.fromRGB(140, 140, 140),
                    LightDirection = Vector3.new(-1, -1, -1),
                    Active = false
                })

                Items["WorldModel"] = Library:Create("WorldModel", {
                    Name = "\0",
                    Parent = Items["ViewportFrame"].Instance
                })

                Items["Camera"] = Library:Create("Camera", {
                    Name = "\0",
                    Parent = Items["ViewportFrame"].Instance
                })

                Items["ViewportFrame"].Instance.CurrentCamera = Items["Camera"].Instance

                pcall(function()
                    Items["ViewportFrame"].Instance.Interactable = false
                end)

                Items["DragCatcher"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ViewportBackground"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Active = true,
                    ZIndex = 10,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })

                Viewport.Items = Items
            end

            local Animation = Library:GetAnim("Viewport")

            local Motion = {
                Connection = nil,
                RotX = Spring.new(0, Animation.Rotate),
                RotY = Spring.new(0, Animation.Rotate),
                RotZ = Spring.new(0, Animation.Rotate),
                Zoom = Spring.new(1, Animation.Zoom),
                Target = Vector3.new(),
                ZoomTarget = 1,
            }

            Viewport.Hovered = false
            Viewport.Dragging = false
            Viewport.DragAxis = nil
            Viewport.BaseDistance = 6
            Viewport.LastMouse = nil

            local StopMotion, StartMotion

            local MeasureObject = function(Object)
                if Object:IsA("Model") then
                    local _, Size = Object:GetBoundingBox()
                    return Size
                end

                if Object:IsA("BasePart") then
                    return Object.Size
                end

                local Min, Max

                for _, Child in Object:GetDescendants() do
                    if Child:IsA("BasePart") then
                        local Half = Child.Size * 0.5
                        local Corners = {
                            Child.CFrame * Vector3.new(-Half.X, -Half.Y, -Half.Z),
                            Child.CFrame * Vector3.new(-Half.X, -Half.Y, Half.Z),
                            Child.CFrame * Vector3.new(-Half.X, Half.Y, -Half.Z),
                            Child.CFrame * Vector3.new(-Half.X, Half.Y, Half.Z),
                            Child.CFrame * Vector3.new(Half.X, -Half.Y, -Half.Z),
                            Child.CFrame * Vector3.new(Half.X, -Half.Y, Half.Z),
                            Child.CFrame * Vector3.new(Half.X, Half.Y, -Half.Z),
                            Child.CFrame * Vector3.new(Half.X, Half.Y, Half.Z),
                        }

                        for _, Corner in Corners do
                            Min = Min and Min:Min(Corner) or Corner
                            Max = Max and Max:Max(Corner) or Corner
                        end
                    end
                end

                if not Min then
                    return Vector3.new(1, 1, 1)
                end

                return Max - Min
            end

            local CenterDisplay = function(Object)
                if Object:IsA("Model") then
                    Object:PivotTo(CFrame.new())
                    return
                end

                if Object:IsA("BasePart") then
                    Object.CFrame = CFrame.new()
                    return
                end

                if Object:IsA("PVInstance") then
                    Object:PivotTo(CFrame.new())
                end
            end

            local PivotDisplay = function(World)
                local Display = Viewport.Display

                if not Display then
                    return
                end

                if Display:IsA("BasePart") then
                    Display.CFrame = World
                    return
                end

                if Display:IsA("Model") or Display:IsA("PVInstance") then
                    Display:PivotTo(World)
                end
            end

            local ApplyTransform = function()
                if not Viewport.Display then
                    return
                end

                PivotDisplay(CFrame.Angles(Motion.RotX.Value, Motion.RotY.Value, Motion.RotZ.Value))

                local Zoom = math.clamp(Motion.Zoom.Value, Animation.ZoomMin, Animation.ZoomMax)
                local Distance = Viewport.BaseDistance / Zoom

                Items["Camera"].Instance.CFrame = CFrame.lookAt(
                    Vector3.new(Distance * 0.55, Distance * 0.38, Distance),
                    Vector3.zero
                )
            end

            local ApplyDragDelta = function(Delta)
                if not Viewport.Dragging or (Delta.X == 0 and Delta.Y == 0) then
                    return
                end

                local Sensitivity = Animation.Drag

                if Viewport.DragAxis == "Z" then
                    Motion.Target = Vector3.new(
                        Motion.Target.X,
                        Motion.Target.Y,
                        Motion.Target.Z - Delta.X * Sensitivity
                    )
                else
                    Motion.Target = Vector3.new(
                        Motion.Target.X - Delta.Y * Sensitivity,
                        Motion.Target.Y - Delta.X * Sensitivity,
                        Motion.Target.Z
                    )
                end
            end

            local StepMotion = function(Delta)
                if Viewport.Dragging then
                    local Mouse = UserInputService:GetMouseLocation()

                    if Viewport.LastMouse then
                        ApplyDragDelta(Mouse - Viewport.LastMouse)
                    end

                    Viewport.LastMouse = Mouse
                end

                Motion.RotX:SetTarget(Motion.Target.X)
                Motion.RotY:SetTarget(Motion.Target.Y)
                Motion.RotZ:SetTarget(Motion.Target.Z)
                Motion.Zoom:SetTarget(Motion.ZoomTarget)

                Motion.RotX:Step(Delta)
                Motion.RotY:Step(Delta)
                Motion.RotZ:Step(Delta)
                Motion.Zoom:Step(Delta)

                ApplyTransform()

                if not Viewport.Dragging
                    and Motion.RotX:Settled()
                    and Motion.RotY:Settled()
                    and Motion.RotZ:Settled()
                    and Motion.Zoom:Settled()
                    and not Viewport.IsOpen
                then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            local SetZoom = function(Next)
                Motion.ZoomTarget = math.clamp(Next, Animation.ZoomMin, Animation.ZoomMax)
                StartMotion()
            end

            function Viewport:SetPart(Part)
                if Viewport.Display then
                    Viewport.Display:Destroy()
                    Viewport.Display = nil
                end

                Viewport.Part = Part

                if not Part then
                    return
                end

                local Display = Part:Clone()

                if Display:IsA("BasePart") then
                    Display.Anchored = true
                end

                for _, Child in Display:GetDescendants() do
                    if Child:IsA("BasePart") then
                        Child.Anchored = true
                    end
                end

                Display.Parent = Items["WorldModel"].Instance
                CenterDisplay(Display)
                Viewport.Display = Display

                local Size = MeasureObject(Display)
                local Extent = math.max(Size.X, Size.Y, Size.Z, 0.1)

                Viewport.BaseDistance = Extent * 1.85 + 2
                ApplyTransform()

                if Viewport.IsOpen then
                    StartMotion()
                end
            end

            function Viewport:SetText(Text)
                Items["Title"].Instance.Text = Text
            end

            local IsOverViewport = function()
                return Items["DragCatcher"]:IsMouseOverFrame()
                    or Items["ViewportBackground"]:IsMouseOverFrame()
                    or Items["Viewport"]:IsMouseOverFrame()
            end

            local BeginDrag = function(Axis)
                Viewport.Dragging = true
                Viewport.DragAxis = Axis
                Viewport.LastMouse = UserInputService:GetMouseLocation()
                StartMotion()
            end

            local EndDrag = function()
                Viewport.Dragging = false
                Viewport.DragAxis = nil
                Viewport.LastMouse = nil
            end

            Items["DragCatcher"]:OnHover(function()
                Viewport.Hovered = true
            end, function()
                Viewport.Hovered = false
            end)

            Items["DragCatcher"]:Connect("MouseButton1Down", function()
                BeginDrag("XY")
            end)

            Items["DragCatcher"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                    BeginDrag("Z")
                elseif Input.UserInputType == Enum.UserInputType.Touch then
                    BeginDrag("XY")
                end
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if not Viewport.IsOpen or not Viewport.Display then
                    return
                end

                if not IsOverViewport() then
                    return
                end

                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    BeginDrag("XY")
                elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
                    BeginDrag("Z")
                end
            end)

            Library:Connect(UserInputService.InputEnded, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1
                    or Input.UserInputType == Enum.UserInputType.MouseButton2
                    or Input.UserInputType == Enum.UserInputType.Touch
                then
                    EndDrag()
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if not Viewport.IsOpen then
                    return
                end

                if Input.UserInputType == Enum.UserInputType.MouseWheel and (Viewport.Hovered or IsOverViewport()) then
                    local Direction = math.sign(Input.Position.Z)

                    if Direction == 0 then
                        return
                    end

                    SetZoom(Motion.ZoomTarget + Direction * Animation.ZoomStep)
                    Motion.Zoom:Set(Motion.Zoom.Value, Direction * Animation.ZoomKick)
                end
            end)

            BindOuterWindowOpen(Viewport, Items["Viewport"], Items["Title"], Vector2.new(160, 160))

            function Viewport:OnOpenChanged(Bool)
                if Bool then
                    StartMotion()
                else
                    StopMotion()
                end
            end

            if Viewport.Part then
                Viewport:SetPart(Viewport.Part)
            end

            return Viewport
        end

        Library.Watermark = function(Self, Params)
            Params = Params or { }

            local Watermark = {
                Name = Params.Name or Params.name or "Farcal",
                Window = Params.Window or Params.window or Library.MainWindow,

                Mode = "Default", -- Default | Search | Status
                Searching = false,
                JoinNotifier = false,
                StatusToken = 0,
                Items = { },
            }

            Library.WatermarkInstance = Watermark

            local Animation = Library:GetAnim("Watermark")

            local Height = 32
            local PadLeft = 12
            local PadRight = 12
            local MinWidth = 72
            local SearchWidth = 220
            local TextInset = PadLeft

            local MeasureLabel = Library:Create("TextLabel", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Library.Holder.Instance,
                Text = "",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                Visible = false,
                ZIndex = 0,
            })

            local MeasureWidth = function(Text)
                Text = tostring(Text or "")

                local Ok, Size = pcall(function()
                    return TextService:GetTextSize(
                        Text,
                        Library.FontSize,
                        Enum.Font.GothamMedium,
                        Vector2.new(10000, Library.FontSize * 2)
                    ).X
                end)

                if Ok and Size and Size > 1 then
                    MeasureLabel.Instance.Text = Text
                    local Bounds = MeasureLabel.Instance.TextBounds.X

                    if Bounds > 1 then
                        return Bounds + 2
                    end

                    return Size + 4
                end

                MeasureLabel.Instance.Text = Text
                local Bounds = MeasureLabel.Instance.TextBounds.X

                if Bounds > 1 then
                    return Bounds + 2
                end

                return math.max(8, (#Text) * (Library.FontSize * 0.62))
            end

            local Items = { } do
                Items["Watermark"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 10),
                    Size = UDim2.new(0, MinWidth, 0, Height),
                    BorderSizePixel = 0,
                    ClipsDescendants = false,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = "Outline"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    ClipsDescendants = false,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = "Tab"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })

                Items["Clip"] = Library:Create("CanvasGroup", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    GroupTransparency = 0,
                    ZIndex = 1,
                })

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Clip"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Background"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Watermark.Name,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, TextInset, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    ZIndex = 2,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["SearchBox"] = Library:Create("TextBox", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Background"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    PlaceholderColor3 = Library.Theme["Dark Text"],
                    PlaceholderText = "Search...",
                    Text = "",
                    ClearTextOnFocus = false,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, TextInset, 0.5, 0),
                    Size = UDim2.new(1, -(TextInset + PadRight), 0, 18),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextTransparency = 1,
                    ZIndex = 5,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Visible = true,
                }):AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Dark Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchBox"].Instance,
                    Color = Library.Theme["Outline"],
                    Transparency = 1,
                }):AddToTheme({Color = "Outline"})

                Items["FpsText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Watermark"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "0 fps",
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(1, 10, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    AutomaticSize = Enum.AutomaticSize.XY,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["FpsText"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["TimeText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Watermark"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "00:00",
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(0, -10, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    AutomaticSize = Enum.AutomaticSize.XY,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["TimeText"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["Shine"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Clip"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0, -40, 0.5, 0),
                    Size = UDim2.new(0, 40, 1, 24),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.4,
                    Rotation = 16,
                    ZIndex = 2,
                })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Shine"].Instance,
                    Rotation = 0,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.45, 0.15),
                        NumberSequenceKeypoint.new(0.55, 0.15),
                        NumberSequenceKeypoint.new(1, 1),
                    })
                })

                Watermark.Items = Items
            end

            local Motion = {
                Connection = nil,
                Width = Spring.new(MinWidth, Animation.Width),
                TextFade = Spring.new(1, Animation.Fade),
                SearchFade = Spring.new(0, Animation.Fade),
                TextOffset = Spring.new(0, Animation.Offset),
                Shine = Spring.new(0, Animation.Shine),
                Panel = Spring.new(0, Animation.Panel),
                ShinePlaying = false,
                Flashing = false,
                FlashToken = 0,
                WidthTarget = MinWidth,
            }

            local Search = {
                Open = false,
                Query = "",
                Rows = { },
                Items = { },
            }

            local StopMotion, StartMotion, RefreshWidth
            local FlashInfo = TweenInfo.new(0.12, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            local GetContentWidth = function(OverrideText)
                if Watermark.Mode == "Search" then
                    return SearchWidth
                end

                local Text = OverrideText or Items["Text"].Instance.Text
                local TextW = MeasureWidth(Text)

                if Watermark.Mode == "Status" then
                    return math.max(MinWidth, PadLeft + TextW + PadRight)
                end

                return math.max(MinWidth, PadLeft + TextW + PadRight)
            end

            local PlayShine = function()
                Motion.Shine:Set(0, 0)
                Motion.Shine:SetTarget(1)
                Motion.ShinePlaying = true
                StartMotion()
            end

            local SetTextStrokeTransparency = function(Value)
                for _, Child in Items["Text"].Instance:GetChildren() do
                    if Child:IsA("UIStroke") then
                        Child.Transparency = Value
                    end
                end
            end

            local FlashText = function(NewText, After)
                Motion.FlashToken += 1
                local Token = Motion.FlashToken
                Motion.Flashing = true

                Library:Thread(function()
                    Items["Text"]:Tween({TextTransparency = 1}, FlashInfo)
                    SetTextStrokeTransparency(1)
                    task.wait(0.1)

                    if Motion.FlashToken ~= Token then
                        return
                    end

                    if NewText ~= nil then
                        Items["Text"].Instance.Text = tostring(NewText)
                        RefreshWidth(NewText)
                    end

                    Items["Text"].Instance.Visible = true
                    Items["Text"]:Tween({TextTransparency = 0}, FlashInfo)
                    SetTextStrokeTransparency(0)
                    task.wait(FlashInfo.Time)

                    if Motion.FlashToken ~= Token then
                        return
                    end

                    Motion.Flashing = false
                    Motion.TextFade:Set(1, 0)

                    if After then
                        After()
                    end
                end)
            end

            local ApplyChrome = function()
                local Width = math.max(MinWidth, Motion.Width.Value)
                Items["Watermark"].Instance.Size = UDim2.fromOffset(Width, Height)

                local TextFade = math.clamp(Motion.TextFade.Value, 0, 1)
                local SearchFade = math.clamp(Motion.SearchFade.Value, 0, 1)
                local Offset = Motion.TextOffset.Value

                local Centered = Watermark.Mode == "Status"

                if Centered then
                    Items["Text"].Instance.AnchorPoint = Vector2.new(0.5, 0.5)
                    Items["Text"].Instance.Position = UDim2.new(0.5, Offset, 0.5, 0)
                    Items["Text"].Instance.TextXAlignment = Enum.TextXAlignment.Center
                else
                    Items["Text"].Instance.AnchorPoint = Vector2.new(0, 0.5)
                    Items["Text"].Instance.Position = UDim2.new(0, TextInset + Offset, 0.5, 0)
                    Items["Text"].Instance.TextXAlignment = Enum.TextXAlignment.Left
                end

                if not Motion.Flashing then
                    Items["Text"].Instance.TextTransparency = 1 - TextFade
                    SetTextStrokeTransparency(1 - TextFade)
                end

                Items["Text"].Instance.Visible = (not Motion.Flashing and TextFade > 0.02) or Motion.Flashing

                Items["SearchBox"].Instance.TextTransparency = 1 - SearchFade
                Items["SearchBox"].Instance.Position = UDim2.new(0, TextInset - Offset * 0.35, 0.5, 0)
                Items["SearchBox"].Instance.Size = UDim2.new(1, -(TextInset + PadRight), 0, 18)
                Items["SearchBox"].Instance.Visible = SearchFade > 0.02

                for _, Child in Items["SearchBox"].Instance:GetChildren() do
                    if Child:IsA("UIStroke") then
                        Child.Transparency = 1 - SearchFade
                    end
                end

                if Motion.ShinePlaying then
                    local Shine = math.clamp(Motion.Shine.Value, 0, 1)
                    Items["Shine"].Instance.Visible = true
                    Items["Shine"].Instance.Position = UDim2.new(0, -40 + (Width + 80) * Shine, 0.5, 0)
                    Items["Shine"].Instance.BackgroundTransparency = 0.3 + (1 - math.sin(Shine * math.pi)) * 0.55

                    if Motion.Shine:Settled() and Shine >= 0.998 then
                        Motion.ShinePlaying = false
                        Items["Shine"].Instance.Visible = false
                    end
                else
                    Items["Shine"].Instance.Visible = false
                end
            end

            do
                Items["SearchDim"] = Library:Create("TextButton", {
                    Name = "\0",
                    Parent = Library.UnusedHolder.Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = false,
                    ZIndex = 18,
                })

                Items["SearchPanel"] = Library:Create("CanvasGroup", {
                    Name = "\0",
                    Parent = Library.UnusedHolder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 18),
                    Size = UDim2.new(0.72, 0, 0, 280),
                    BackgroundTransparency = 0,
                    GroupTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = false,
                    ZIndex = 20,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = "Tab"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["SearchPanel"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchPanel"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["SearchStrokeOutline"] = Items["SearchPanel"].Instance:FindFirstChildOfClass("UIStroke")

                Items["SearchStrokeHover"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchPanel"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Hovered Element"]
                }):AddToTheme({Color = "Hovered Element"})

                do
                    local Strokes = {}
                    for _, Child in Items["SearchPanel"].Instance:GetChildren() do
                        if Child:IsA("UIStroke") then
                            table.insert(Strokes, Child)
                        end
                    end
                    Items["SearchStrokes"] = Strokes
                end

                Items["SearchTitle"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["SearchPanel"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "Search",
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 14, 0, 14),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchTitle"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["SearchHint"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize - 2,
                    Parent = Items["SearchPanel"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = "Esc to close",
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.new(1, -14, 0, 16),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                }):AddToTheme({TextColor3 = "Dark Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchHint"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["SearchEmpty"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["SearchPanel"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = "Start typing to filter elements",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.55, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = false,
                    AutomaticSize = Enum.AutomaticSize.XY,
                }):AddToTheme({TextColor3 = "Dark Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchEmpty"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["SearchList"] = Library:Create("ScrollingFrame", {
                    Name = "\0",
                    Parent = Items["SearchPanel"].Instance,
                    Position = UDim2.new(0, 10, 0, 42),
                    Size = UDim2.new(1, -20, 1, -52),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = Library.Theme["Accent"],
                    MidImage = "rbxassetid://103256802537537",
                    TopImage = "rbxassetid://103256802537537",
                    BottomImage = "rbxassetid://103256802537537",
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ClipsDescendants = true,
                }):AddToTheme({ScrollBarImageColor3 = "Accent"})

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["SearchList"].Instance,
                    Padding = UDim.new(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["SearchList"].Instance,
                    PaddingTop = UDim.new(0, 2),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingLeft = UDim.new(0, 2),
                    PaddingRight = UDim.new(0, 10)
                })

                Search.Items = Items
            end

            local ClearRows = function()
                for _, Row in Search.Rows do
                    if Row.Button and Row.Button.Instance then
                        Row.Button.Instance:Destroy()
                    end
                end

                table.clear(Search.Rows)
            end

            local AttachPanel = function()
                local Window = Watermark.Window or Library.MainWindow

                if not Window or not Window.Items or not Window.Items["Content"] then
                    return false
                end

                local Content = Window.Items["Content"].Instance
                Items["SearchDim"].Instance.Parent = Content
                Items["SearchPanel"].Instance.Parent = Content
                return true
            end

            local ApplyPanel = function()
                local Reveal = math.clamp(Motion.Panel.Value, 0, 1)
                local Panel = Items["SearchPanel"].Instance
                local Dim = Items["SearchDim"].Instance
                local StrokeTransparency = 1 - Reveal

                Panel.GroupTransparency = 1 - Reveal
                Panel.Position = UDim2.new(0.5, 0, 0, 14 + (1 - Reveal) * 18)
                Panel.Visible = Reveal > 0.01 or Search.Open

                Dim.Visible = Panel.Visible
                Dim.BackgroundTransparency = 1 - (Reveal * 0.45)

                if Items["SearchStrokes"] then
                    for _, Stroke in Items["SearchStrokes"] do
                        if Stroke and Stroke.Parent then
                            Stroke.Transparency = StrokeTransparency
                        end
                    end
                end
            end

            local StepMotion = function(Delta)
                Motion.Width:SetTarget(Motion.WidthTarget)
                Motion.Width:Step(Delta)
                Motion.TextFade:Step(Delta)
                Motion.SearchFade:Step(Delta)
                Motion.TextOffset:Step(Delta)
                Motion.Shine:Step(Delta)
                Motion.Panel:Step(Delta)

                ApplyChrome()
                ApplyPanel()

                local RowsBusy = false

                for _, Row in Search.Rows do
                    Row.Hover:SetTarget(Row.Hovered and 1 or 0)
                    local Reveal = Row.Reveal:Step(Delta)
                    local Hover = Row.Hover:Step(Delta)
                    local Slide = (1 - Reveal) * 10

                    Row.Outline.Instance.BackgroundTransparency = 1 - Reveal
                    Row.Inline.Instance.BackgroundTransparency = 1 - Reveal
                    Row.Content.Instance.BackgroundTransparency = 1 - Reveal
                    Row.Content.Instance.BackgroundColor3 = Library.Theme["Tab"]:Lerp(Library.Theme["Hovered Element"], Hover)

                    Row.Name.Instance.TextTransparency = 1 - Reveal
                    Row.Kind.Instance.TextTransparency = 1 - Reveal
                    Row.Name.Instance.Position = UDim2.new(0, 10 + Slide, 0, 4)
                    Row.Kind.Instance.Position = UDim2.new(0, 10 + Slide, 0, 19)

                    if Row.Arrow then
                        Row.Arrow.Instance.TextTransparency = 1 - Reveal
                        Row.Arrow.Instance.TextColor3 = Library.Theme["Dark Text"]:Lerp(Library.Theme["Text"], Hover)
                    end

                    if not Row.Reveal:Settled() or not Row.Hover:Settled() then
                        RowsBusy = true
                    end
                end

                if not Motion.ShinePlaying
                    and not RowsBusy
                    and Motion.Width:Settled(0.35)
                    and Motion.TextFade:Settled()
                    and Motion.SearchFade:Settled()
                    and Motion.TextOffset:Settled()
                    and Motion.Panel:Settled()
                then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            RefreshWidth = function(OverrideText)
                Motion.WidthTarget = GetContentWidth(OverrideText)
                Motion.Width:SetTarget(Motion.WidthTarget)
                StartMotion()
            end

            local SetModeVisual = function(Mode, Instant)
                Watermark.Mode = Mode

                if Mode == "Search" then
                    Motion.TextFade:SetTarget(0)
                    Motion.SearchFade:SetTarget(1)
                    Motion.TextOffset:Set(-4, 0)
                    Motion.TextOffset:SetTarget(0)
                elseif Mode == "Status" then
                    Motion.TextFade:SetTarget(1)
                    Motion.SearchFade:SetTarget(0)
                    Motion.TextOffset:Set(0, 0)
                    Motion.TextOffset:SetTarget(0)
                else
                    Motion.TextFade:SetTarget(1)
                    Motion.SearchFade:SetTarget(0)
                    Motion.TextOffset:Set(-4, 0)
                    Motion.TextOffset:SetTarget(0)
                end

                if Instant then
                    Motion.TextFade:Set(Mode == "Search" and 0 or 1, 0)
                    Motion.SearchFade:Set(Mode == "Search" and 1 or 0, 0)
                    Motion.TextOffset:Set(0, 0)
                    Motion.Width:Set(GetContentWidth(), 0)
                    Motion.WidthTarget = Motion.Width.Value
                    ApplyChrome()
                else
                    RefreshWidth()
                end

                PlayShine()
            end

            local MakeRow = function(Entry, Order, Query)
                local PageName = Entry.Page and Entry.Page.Name or "Menu"
                local SubText = PageName .. "  ·  " .. tostring(Entry.Kind or "Element")
                Query = tostring(Query or "")

                local Outline = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["SearchList"].Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 0, 40),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    LayoutOrder = Order,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = "Outline"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Outline.Instance,
                    TopLeftRadius = UDim.new(0, 7),
                    TopRightRadius = UDim.new(0, 7),
                    BottomRightRadius = UDim.new(0, 7),
                    BottomLeftRadius = UDim.new(0, 7)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Outline.Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                local Inline = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Outline.Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Inline.Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Inline.Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                local Content = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Inline.Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = "Tab"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Content.Instance,
                    TopLeftRadius = UDim.new(0, 5),
                    TopRightRadius = UDim.new(0, 5),
                    BottomRightRadius = UDim.new(0, 5),
                    BottomLeftRadius = UDim.new(0, 5)
                })

                local NameLabel = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Content.Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Library:HighlightQueryText(Entry.Name, Query),
                    RichText = true,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 10, 0, 4),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextTransparency = 1,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = NameLabel.Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                local KindLabel = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize - 2,
                    Parent = Content.Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Library:HighlightQueryText(SubText, Query),
                    RichText = true,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 10, 0, 19),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextTransparency = 1,
                }):AddToTheme({TextColor3 = "Dark Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = KindLabel.Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                local Arrow = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Content.Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = "›",
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextTransparency = 1,
                }):AddToTheme({TextColor3 = "Dark Text"})

                local Row = {
                    Button = Outline,
                    Outline = Outline,
                    Inline = Inline,
                    Content = Content,
                    Name = NameLabel,
                    Kind = KindLabel,
                    Arrow = Arrow,
                    Entry = Entry,
                    Reveal = Spring.new(0, Animation.Row),
                    Hover = Spring.new(0, Animation.RowHover or 22),
                    Hovered = false,
                }

                local SetHovered = function(Bool)
                    Row.Hovered = Bool
                    StartMotion()
                end

                local Activate = function()
                    Watermark:SetSearch(false)
                    Library:FocusSearchable(Entry)
                end

                Outline:OnHover(function()
                    SetHovered(true)
                end, function()
                    SetHovered(false)
                end)

                Inline:OnHover(function()
                    SetHovered(true)
                end, function()
                    SetHovered(false)
                end)

                Content:OnHover(function()
                    SetHovered(true)
                end, function()
                    SetHovered(false)
                end)

                Outline:Connect("MouseButton1Down", Activate)
                Inline:Connect("MouseButton1Down", Activate)
                Content:Connect("MouseButton1Down", Activate)

                table.insert(Search.Rows, Row)
                return Row
            end

            local RebuildResults = function(Query)
                ClearRows()

                Query = string.lower(tostring(Query or ""))
                local Matches = { }

                for _, Entry in Library.Searchables do
                    local Name = string.lower(tostring(Entry.Name or ""))
                    local Kind = string.lower(tostring(Entry.Kind or ""))
                    local PageName = Entry.Page and string.lower(tostring(Entry.Page.Name or "")) or ""

                    if Query == "" or string.find(Name, Query, 1, true) or string.find(Kind, Query, 1, true) or string.find(PageName, Query, 1, true) then
                        table.insert(Matches, Entry)
                    end
                end

                table.sort(Matches, function(A, B)
                    local AName = tostring(A.Name)
                    local BName = tostring(B.Name)

                    if Query ~= "" then
                        local AExact = string.lower(AName) == Query
                        local BExact = string.lower(BName) == Query

                        if AExact ~= BExact then
                            return AExact
                        end

                        local AStarts = string.sub(string.lower(AName), 1, #Query) == Query
                        local BStarts = string.sub(string.lower(BName), 1, #Query) == Query

                        if AStarts ~= BStarts then
                            return AStarts
                        end
                    end

                    return AName < BName
                end)

                local Count = #Matches
                Items["SearchTitle"].Instance.Text = (Count == 0 and Query ~= "") and "No results" or ("Search · " .. Count)
                Items["SearchEmpty"].Instance.Visible = Count == 0
                Items["SearchEmpty"].Instance.Text = (Query == "") and "Start typing to filter elements" or "Nothing matched that search"
                Items["SearchList"].Instance.Visible = Count > 0

                for Index, Entry in Matches do
                    if Index > 48 then
                        break
                    end

                    local Row = MakeRow(Entry, Index, Query)
                    Row.Reveal:Set(0, 0)
                    Row.Reveal:SetTarget(1)
                end

                StartMotion()
            end

            function Watermark:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
                Watermark.Name = tostring(Text)

                if Watermark.Mode == "Default" then
                    RefreshWidth()
                end
            end

            function Watermark:Notify(Message, Duration)
                Message = tostring(Message or "")
                Duration = Duration or 1.35

                if Message == "" then
                    return
                end

                if Watermark.Searching then
                    Watermark:SetSearch(false)
                end

                Watermark.StatusToken += 1
                local Token = Watermark.StatusToken

                Watermark.Mode = "Status"
                Motion.SearchFade:SetTarget(0)
                Motion.TextFade:SetTarget(1)
                Motion.TextOffset:SetTarget(0)
                StartMotion()
                RefreshWidth(Message)
                PlayShine()
                FlashText(Message)

                Library:Thread(function()
                    task.wait(Duration)

                    if Watermark.StatusToken ~= Token or Watermark.Searching then
                        return
                    end

                    Watermark.Mode = "Default"
                    Motion.SearchFade:SetTarget(0)
                    Motion.TextFade:SetTarget(1)
                    StartMotion()
                    RefreshWidth(Watermark.Name)
                    PlayShine()
                    FlashText(Watermark.Name)
                end)
            end

            function Watermark:NotifyWindow(IsOpen)
                Watermark:Notify(IsOpen and "Window Opened" or "Window Closed")
            end

            function Watermark:SetJoinNotifier(Bool)
                Watermark.JoinNotifier = Bool and true or false
            end

            local IsMenuOpen = function()
                local Window = Watermark.Window or Library.MainWindow
                return Window and Window.IsOpen
            end

            function Watermark:SetSearch(Bool)
                Bool = Bool and true or false

                if Bool and not IsMenuOpen() then
                    return
                end

                if Watermark.Searching == Bool then
                    if Bool then
                        Items["SearchBox"].Instance:CaptureFocus()
                    end
                    return
                end

                Watermark.Searching = Bool
                Search.Open = Bool

                if Bool then
                    Watermark.StatusToken += 1
                    Watermark.Window = Watermark.Window or Library.MainWindow
                    AttachPanel()
                    Items["SearchBox"].Instance.Text = ""
                    Search.Query = ""
                    Items["Text"].Instance.Text = Watermark.Name
                    SetModeVisual("Search")
                    Motion.Panel:SetTarget(1)
                    RebuildResults("")
                    Items["SearchBox"].Instance:CaptureFocus()
                else
                    Items["SearchBox"].Instance:ReleaseFocus()
                    Items["SearchBox"].Instance.Text = ""
                    Search.Query = ""
                    Items["Text"].Instance.Text = Watermark.Name
                    SetModeVisual("Default")
                    Motion.Panel:SetTarget(0)
                    ClearRows()
                end

                StartMotion()
            end

            Items["SearchDim"]:Connect("MouseButton1Down", function()
                Watermark:SetSearch(false)
            end)

            Items["SearchBox"].Instance:GetPropertyChangedSignal("Text"):Connect(function()
                if not Watermark.Searching then
                    return
                end

                Search.Query = Items["SearchBox"].Instance.Text
                RebuildResults(Search.Query)
            end)

            Library:Connect(UserInputService.InputBegan, function(Input, GameProcessed)
                if Input.KeyCode == Enum.KeyCode.F and (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
                    if Watermark.Searching then
                        Watermark:SetSearch(false)
                    elseif IsMenuOpen() then
                        Watermark:SetSearch(true)
                    end
                    return
                end

                if Input.KeyCode == Enum.KeyCode.Escape and Watermark.Searching then
                    Watermark:SetSearch(false)
                end
            end)

            Library:Connect(Players.PlayerAdded, function(Player)
                if not Watermark.JoinNotifier then
                    return
                end

                local Label = Player.DisplayName
                if not Label or Label == "" then
                    Label = Player.Name
                end

                Watermark:Notify('"'..Label..'"' .. " joined")
            end)

            -- fps and time below lul
            local Frames = 0
            local LastFps = os.clock()

            Library:Connect(RunService.RenderStepped, function()
                Frames += 1
                local Now = os.clock()

                if Now - LastFps >= 0.5 then
                    local Fps = math.floor(Frames / (Now - LastFps) + 0.5)
                    Items["FpsText"].Instance.Text = tostring(Fps) .. " fps"
                    Frames = 0
                    LastFps = Now
                end
            end)

            Library:Connect(RunService.Heartbeat, function()
                local Stamp = os.date("*t")
                Items["TimeText"].Instance.Text = string.format("%02d:%02d", Stamp.hour, Stamp.min)
            end)

            Motion.WidthTarget = GetContentWidth()
            Motion.Width:Set(Motion.WidthTarget, 0)
            ApplyChrome()
            Items["Shine"].Instance.Visible = false

            return Watermark
        end

        Library.KeySystem = function(Self, Params)
            Params = Params or { }

            local ValidKeys = { }

            local function PushKey(Value)
                if type(Value) == "string" and Value ~= "" then
                    table.insert(ValidKeys, string.lower(Value))
                elseif type(Value) == "table" then
                    for _, Entry in Value do
                        PushKey(Entry)
                    end
                end
            end

            PushKey(Params.Key or Params.key or Params.ValidKey or Params.validkey)
            PushKey(Params.Keys or Params.keys)

            if #ValidKeys == 0 then
                PushKey("farcal")
            end

            local KeySystem = {
                Name = Params.Name or Params.name or "Key System",
                DiscordLink = Params.DiscordLink or Params.discordlink or Params.Discord or "",
                GetKeyLink = Params.GetKeyLink or Params.getkeylink or Params.GetKey or "",
                TutorialLink = Params.TutorialLink or Params.tutoriallink or Params.Tutorial or "",
                Placeholder = Params.Placeholder or Params.placeholder or "Key goes here",
                Callback = Params.Callback or Params.callback or Params.OnSuccess or Params.onsuccess or function() end,
                Validate = Params.Validate or Params.validate,
                Checking = false,
                Unlocked = false,
                Items = { },
            }

            Library.KeySystemInstance = KeySystem

            local Size = Vector2.new(250, 128)
            local Opened = Instance.new("BindableEvent")

            local CopyLink = function(Url)
                if type(Url) ~= "string" or Url == "" then
                    return false
                end

                local Ok = pcall(function()
                    if setclipboard then
                        setclipboard(Url)
                    elseif toclipboard then
                        toclipboard(Url)
                    else
                        error("no clipboard")
                    end
                end)

                return Ok
            end

            local Items = { } do
                Items["KeySystem"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.fromOffset(Size.X * 0.86, Size.Y * 0.86),
                    BorderSizePixel = 0,
                    ClipsDescendants = false,
                    Visible = false,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = "Outline"})

                Items["KeySystem"]:MakeDraggable()

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["KeySystem"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["KeySystem"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["KeySystem"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = "Tab"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["KeySystem"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = KeySystem.Name,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 0, -8),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    ZIndex = 5,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Title"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["Discord"] = Library:Create("ImageButton", {
                    Name = "\0",
                    Parent = Items["KeySystem"].Instance,
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 0, -8),
                    Size = UDim2.fromOffset(16, 16),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutoButtonColor = false,
                    Image = "rbxassetid://108393876083348",
                    ImageColor3 = Library.Theme["Accent"],
                    ZIndex = 5,
                }):AddToTheme({ImageColor3 = "Accent"})

                Items["Holder"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    FillDirection = Enum.FillDirection.Vertical,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["Textbox"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Size = UDim2.new(1, 0, 0, 32),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                })

                Items["BackgroundOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Textbox"].Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = "Outline"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["BackgroundOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["BackgroundOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["BackgroundInline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["BackgroundOutline"].Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["BackgroundInline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["BackgroundInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["InputBackground"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["BackgroundInline"].Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = "Tab"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["InputBackground"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Items["Icon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["InputBackground"].Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    Size = UDim2.fromOffset(18, 18),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = "rbxassetid://137620006901930",
                })

                Items["Input"] = Library:Create("TextBox", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["InputBackground"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    PlaceholderColor3 = Library.Theme["Dark Text"],
                    PlaceholderText = KeySystem.Placeholder,
                    Text = "",
                    ClearTextOnFocus = false,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 34, 0.5, 0),
                    Size = UDim2.new(1, -42, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                }):AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Dark Text"})

                local MakeActionButton = function(Parent, Label, Order)
                    local Outline = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Parent,
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        LayoutOrder = Order,
                        BackgroundColor3 = Library.Theme["Outline"]
                    }):AddToTheme({BackgroundColor3 = "Outline"})

                    Library:Create("UICorner", {
                        Name = "\0",
                        Parent = Outline.Instance,
                        TopLeftRadius = UDim.new(0, 6),
                        TopRightRadius = UDim.new(0, 6),
                        BottomRightRadius = UDim.new(0, 6),
                        BottomLeftRadius = UDim.new(0, 6)
                    })

                    Library:Create("UIPadding", {
                        Name = "\0",
                        Parent = Outline.Instance,
                        PaddingTop = UDim.new(0, 1),
                        PaddingBottom = UDim.new(0, 1),
                        PaddingRight = UDim.new(0, 1),
                        PaddingLeft = UDim.new(0, 1)
                    })

                    local Inline = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Outline.Instance,
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Hovered Element"]
                    }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                    Library:Create("UICorner", {
                        Name = "\0",
                        Parent = Inline.Instance,
                        TopLeftRadius = UDim.new(0, 6),
                        TopRightRadius = UDim.new(0, 6),
                        BottomRightRadius = UDim.new(0, 6),
                        BottomLeftRadius = UDim.new(0, 6)
                    })

                    Library:Create("UIPadding", {
                        Name = "\0",
                        Parent = Inline.Instance,
                        PaddingTop = UDim.new(0, 1),
                        PaddingBottom = UDim.new(0, 1),
                        PaddingRight = UDim.new(0, 1),
                        PaddingLeft = UDim.new(0, 1)
                    })

                    local Real = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Inline.Instance,
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Tab"]
                    }):AddToTheme({BackgroundColor3 = "Tab"})

                    Library:Create("UICorner", {
                        Name = "\0",
                        Parent = Real.Instance,
                        TopLeftRadius = UDim.new(0, 6),
                        TopRightRadius = UDim.new(0, 6),
                        BottomRightRadius = UDim.new(0, 6),
                        BottomLeftRadius = UDim.new(0, 6)
                    })

                    Library:Create("UIPadding", {
                        Name = "\0",
                        Parent = Real.Instance,
                        PaddingRight = UDim.new(0, 6),
                        PaddingLeft = UDim.new(0, 6)
                    })

                    local TextLabel = Library:Create("TextLabel", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Real.Instance,
                        TextColor3 = Library.Theme["Text"],
                        Text = Label,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.XY,
                    }):AddToTheme({TextColor3 = "Text"})

                    Library:Create("UIStroke", {
                        Name = "\0",
                        Parent = TextLabel.Instance,
                        Color = Library.Theme["Outline"]
                    }):AddToTheme({Color = "Outline"})

                    local Hovered = false

                    local SetHover = function(Bool)
                        Hovered = Bool
                        Real:Tween({
                            BackgroundColor3 = Bool and Library.Theme["Hovered Element"] or Library.Theme["Tab"]
                        }, TweenInfo.new(0.18, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                    end

                    Outline:OnHover(function()
                        SetHover(true)
                    end, function()
                        SetHover(false)
                    end)

                    Inline:OnHover(function()
                        SetHover(true)
                    end, function()
                        SetHover(false)
                    end)

                    Real:OnHover(function()
                        SetHover(true)
                    end, function()
                        SetHover(false)
                    end)

                    return {
                        Outline = Outline,
                        Inline = Inline,
                        Real = Real,
                        Text = TextLabel,
                        Connect = function(_, Callback)
                            Outline:Connect("MouseButton1Down", Callback)
                            Inline:Connect("MouseButton1Down", Callback)
                            Real:Connect("MouseButton1Down", Callback)
                        end,
                    }
                end

                Items["ButtonsTop"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Size = UDim2.new(1, 0, 0, 32),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["ButtonsTop"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["ButtonsBottom"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Size = UDim2.new(1, 0, 0, 32),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 3,
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["ButtonsBottom"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["Submit"] = MakeActionButton(Items["ButtonsTop"].Instance, "Submit Key", 1)
                Items["GetKey"] = MakeActionButton(Items["ButtonsTop"].Instance, "Get Key", 2)
                Items["Tutorial"] = MakeActionButton(Items["ButtonsBottom"].Instance, "Watch Tutorial", 1)

                KeySystem.Items = Items
            end

            local Animation = {
                Open = TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                Close = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                Fade = TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                Shake = Library:GetAnim("KeySystem").Shake or 55,
            }

            local Motion = {
                Connection = nil,
                Shake = Spring.new(0, Animation.Shake),
                Busy = false,
            }

            local TitleDefault = KeySystem.Name
            local StatusToken = 0
            local TitleFlashInfo = TweenInfo.new(0.14, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            local SetTitleStrokeTransparency = function(Value)
                for _, Child in Items["Title"].Instance:GetChildren() do
                    if Child:IsA("UIStroke") then
                        Child.Transparency = Value
                    end
                end
            end

            local ApplyTitleStyle = function(Accent)
                if Accent then
                    Items["Title"]:ChangeItemTheme({TextColor3 = "Accent"})
                    Items["Title"].Instance.TextColor3 = Library.Theme["Accent"]
                else
                    Items["Title"]:ChangeItemTheme({TextColor3 = "Text"})
                    Items["Title"].Instance.TextColor3 = Library.Theme["Text"]
                end
            end

            local FlashStatus = function(Text, Accent, Duration)
                StatusToken += 1
                local Token = StatusToken

                Library:Thread(function()
                    Items["Title"]:Tween({TextTransparency = 1}, TitleFlashInfo)
                    SetTitleStrokeTransparency(1)
                    task.wait(TitleFlashInfo.Time)

                    if StatusToken ~= Token then
                        return
                    end

                    Items["Title"].Instance.Text = tostring(Text)
                    ApplyTitleStyle(Accent)
                    Items["Title"]:Tween({TextTransparency = 0}, TitleFlashInfo)
                    SetTitleStrokeTransparency(0)
                    task.wait(Duration or 1.15)

                    if StatusToken ~= Token or KeySystem.Unlocked then
                        return
                    end

                    Items["Title"]:Tween({TextTransparency = 1}, TitleFlashInfo)
                    SetTitleStrokeTransparency(1)
                    task.wait(TitleFlashInfo.Time)

                    if StatusToken ~= Token or KeySystem.Unlocked then
                        return
                    end

                    Items["Title"].Instance.Text = TitleDefault
                    ApplyTitleStyle(false)
                    Items["Title"]:Tween({TextTransparency = 0}, TitleFlashInfo)
                    SetTitleStrokeTransparency(0)
                end)
            end

            local StartShake = function()
                Motion.Shake:Set(0, 0)
                Motion.Shake:SetTarget(1)

                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    local Value = math.clamp(Motion.Shake:Step(Delta), 0, 1)
                    local Offset = math.sin(Value * math.pi * 7) * (1 - Value) * 8
                    Items["KeySystem"].Instance.Position = UDim2.new(0.5, Offset, 0.5, 0)

                    if Motion.Shake:Settled() then
                        Items["KeySystem"].Instance.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Motion.Connection:Disconnect()

                        local Index = table.find(Library.Connections, Motion.Connection)
                        if Index then
                            table.remove(Library.Connections, Index)
                        end

                        Motion.Connection = nil
                    end
                end)
            end

            function KeySystem:Close(Success)
                if Motion.Busy then
                    return
                end

                Motion.Busy = true
                KeySystem.Unlocked = Success and true or false

                local Root = Items["KeySystem"]
                Root:Tween({
                    Size = UDim2.fromOffset(Size.X * 0.9, Size.Y * 0.9)
                }, Animation.Close)

                Root:FadeDescendants(false, function()
                    Root.Instance.Visible = false
                    Root.Instance:Destroy()

                    if Library.KeySystemInstance == KeySystem then
                        Library.KeySystemInstance = nil
                    end

                    if Success then
                        Library:SafeCall(KeySystem.Callback, true)
                        Opened:Fire(true)
                    else
                        Opened:Fire(false)
                    end
                end, Animation.Fade)
            end

            function KeySystem:Submit()
                if Motion.Busy or KeySystem.Unlocked or KeySystem.Checking then
                    return
                end

                local Raw = string.gsub(Items["Input"].Instance.Text or "", "^%s*(.-)%s*$", "%1")
                local Typed = string.lower(Raw)
                local Ok = false

                if KeySystem.Validate then
                    if Raw ~= "" then
                        KeySystem.Checking = true
                        FlashStatus("Checking...", false, 30)

                        local Success, Result = pcall(KeySystem.Validate, Raw)

                        KeySystem.Checking = false

                        if not Items["KeySystem"].Instance.Parent then
                            return false
                        end

                        Ok = Success and Result == true
                    end
                else
                    for _, Key in ValidKeys do
                        if Typed == Key then
                            Ok = true
                            break
                        end
                    end
                end

                if not Ok then
                    FlashStatus("Invalid Key", true, 1.1)
                    StartShake()

                    Items["InputBackground"]:Tween({
                        BackgroundColor3 = Library.Theme["Accent"]
                    }, TweenInfo.new(0.12, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))

                    Library:Thread(function()
                        task.wait(0.16)
                        Items["InputBackground"]:Tween({
                            BackgroundColor3 = Library.Theme["Tab"]
                        }, TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                    end)

                    return false
                end

                FlashStatus("Key Accepted", true, 0.7)

                Library:Thread(function()
                    task.wait(0.28)
                    KeySystem:Close(true)
                end)

                return true
            end

            Items["Submit"]:Connect(function()
                KeySystem:Submit()
            end)

            Items["GetKey"]:Connect(function()
                if CopyLink(KeySystem.GetKeyLink) then
                    FlashStatus("Key link copied", false, 1)
                else
                    FlashStatus(KeySystem.GetKeyLink == "" and "Link not set" or "Copy failed", true, 1)
                end
            end)

            Items["Tutorial"]:Connect(function()
                if CopyLink(KeySystem.TutorialLink) then
                    FlashStatus("Tutorial link copied", false, 1)
                else
                    FlashStatus(KeySystem.TutorialLink == "" and "Link not set" or "Copy failed", true, 1)
                end
            end)

            Items["Discord"]:Connect("MouseButton1Down", function()
                if CopyLink(KeySystem.DiscordLink) then
                    FlashStatus("Discord link copied", false, 1)
                else
                    FlashStatus(KeySystem.DiscordLink == "" and "Link not set" or "Copy failed", true, 1)
                end
            end)

            Items["Discord"]:OnHover(function()
                Items["Discord"]:Tween({ImageTransparency = 0.15}, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
            end, function()
                Items["Discord"]:Tween({ImageTransparency = 0}, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
            end)

            local FocusInput = function()
                Items["Input"].Instance:CaptureFocus()
            end

            Items["BackgroundOutline"]:Connect("MouseButton1Down", FocusInput)
            Items["BackgroundInline"]:Connect("MouseButton1Down", FocusInput)
            Items["InputBackground"]:Connect("MouseButton1Down", FocusInput)

            Items["Input"]:Connect("FocusLost", function(EnterPressed)
                if EnterPressed then
                    KeySystem:Submit()
                end
            end)

            do
                local Root = Items["KeySystem"]
                Root.Instance.Visible = true
                Root.Instance.Size = UDim2.fromOffset(Size.X * 0.82, Size.Y * 0.82)

                Root:FadeDescendants(true, nil, Animation.Fade)
                Root:Tween({
                    Size = UDim2.fromOffset(Size.X, Size.Y)
                }, Animation.Open)

                Library:Thread(function()
                    task.wait(0.2)
                    if not KeySystem.Unlocked and Items["Input"] and Items["Input"].Instance then
                        Items["Input"].Instance:CaptureFocus()
                    end
                end)
            end

            Opened.Event:Wait()
            Opened:Destroy()

            return KeySystem
        end

        local NotificationZ = {
            Dim = 40,
            Overlay = 70,
            Card = 90,
            Rest = 1,
        }

        local SetOverlayLayerZ = function(Bool)
            local Z = Bool and NotificationZ.Overlay or NotificationZ.Rest

            if Library.WatermarkInstance and Library.WatermarkInstance.Items and Library.WatermarkInstance.Items["Watermark"] then
                Library.WatermarkInstance.Items["Watermark"].Instance.ZIndex = Z
            end

            for _, Window in Library.OuterWindows do
                local Root = Window.Root or (Window.Items and (Window.Items["Image"] or Window.Items["Video"] or Window.Items["Viewport"]))

                if Root and Root.Instance then
                    Root.Instance.ZIndex = Z
                end
            end

            if Library.MainWindow and Library.MainWindow.Items and Library.MainWindow.Items["MainFrame"] then
                Library.MainWindow.Items["MainFrame"].Instance.ZIndex = NotificationZ.Rest
            end
        end

        local EnsureNotificationDim = function()
            if Library.NotificationDim and Library.NotificationDim.Instance and Library.NotificationDim.Instance.Parent then
                return Library.NotificationDim
            end

            local Dim = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Library.Holder.Instance,
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0, 0),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Visible = false,
                ZIndex = NotificationZ.Dim,
            })

            Library.NotificationDim = Dim
            return Dim
        end

        local SetNotificationDim = function(Bool)
            local Dim = EnsureNotificationDim()

            if Bool then
                Dim.Instance.Visible = true
                Dim.Instance.ZIndex = NotificationZ.Dim
                Dim:Tween({
                    BackgroundTransparency = 0.45
                }, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                SetOverlayLayerZ(true)
            else
                Dim:Tween({
                    BackgroundTransparency = 1
                }, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))

                Library:Thread(function()
                    task.wait(0.32)

                    if Library.NotificationDepth <= 0 and Dim.Instance and Dim.Instance.Parent then
                        Dim.Instance.Visible = false
                        SetOverlayLayerZ(false)
                    end
                end)
            end
        end

        local RestoreMenuAfterNotifications = function()
            if not Library.NotificationReopenMenu then
                return
            end

            if Library.NotificationDepth > 0 or Library.NotificationActive or #Library.NotificationQueue > 0 then
                return
            end

            Library.NotificationReopenMenu = false

            Library:Thread(function()
                task.wait(0.18)

                if Library.NotificationDepth > 0 or Library.NotificationActive then
                    Library.NotificationReopenMenu = true
                    return
                end

                if Library.MainWindow and Library.MainWindow.SetOpen and not Library.MainWindow.IsOpen then
                    Library.MainWindow:SetOpen(true)
                end
            end)
        end

        local ProcessNotificationQueue

        local CloseNotificationCard = function(Notification, Result)
            if not Notification or Notification.Closing then
                return
            end

            Notification.Closing = true

            local FinishClose = function()
                if Library.NotificationActive == Notification then
                    Library.NotificationActive = nil
                end

                Library.NotificationDepth = math.max(0, Library.NotificationDepth - 1)

                if Notification.OnClose then
                    Library:SafeCall(Notification.OnClose, Result)
                end

                ProcessNotificationQueue()

                if Library.NotificationDepth <= 0 and not Library.NotificationActive then
                    SetNotificationDim(false)
                    RestoreMenuAfterNotifications()
                end
            end

            local Root = Notification.Items and Notification.Items["Notification"]
            if not Root or not Root.Instance then
                FinishClose()
                return
            end

            Root:Tween({
                Size = UDim2.fromOffset(Notification.Width * 0.92, math.max(1, Root.Instance.AbsoluteSize.Y) * 0.92)
            }, TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.In))

            Root:FadeDescendants(false, function()
                if Root.Instance then
                    Root.Instance:Destroy()
                end

                FinishClose()
            end, TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.In))
        end

        local ShowNotificationCard = function(Params)
            Params = Params or { }

            local Notification = {
                Title = Params.Title or Params.title or Params.Name or Params.name or "Notification",
                Description = Params.Description or Params.description or Params.Content or Params.content or "",
                Buttons = Params.Buttons or Params.buttons or { },
                Width = Params.Width or Params.width or 355,
                Closing = false,
                Items = { },
            }

            if #Notification.Buttons == 0 then
                table.insert(Notification.Buttons, {
                    Name = "Okay!",
                    Callback = function() end,
                })
            end

            Library.NotificationActive = Notification
            Library.NotificationDepth += 1

            if Library.MainWindow and Library.MainWindow.IsOpen and Library.MainWindow.SetOpen then
                Library.NotificationReopenMenu = true
                Library.MainWindow:SetOpen(false)
            end

            for Frame in Library.OpenFrames do
                if Frame.IsOpen and Frame.SetOpen then
                    Frame:SetOpen(false)
                end
            end

            SetNotificationDim(true)

            local Items = { } do
                Items["Notification"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.fromOffset(Notification.Width * 0.9, 140),
                    BorderSizePixel = 0,
                    Visible = false,
                    ZIndex = NotificationZ.Card,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = "Outline"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = "Tab"})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })

                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Background"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Notification.Title,
                    Position = UDim2.new(0, 8, 0, 8),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    ZIndex = 2,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Title"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["Divider"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    Position = UDim2.new(0, 8, 0, 32),
                    Size = UDim2.new(1, -16, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Background"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Notification.Description,
                    Position = UDim2.new(0, 8, 0, 43),
                    Size = UDim2.new(1, -16, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    ZIndex = 2,
                }):AddToTheme({TextColor3 = "Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["Buttons"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 8, 1, -8),
                    Size = UDim2.new(1, -16, 0, 32),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Buttons"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                local MakeNotifyButton = function(Config, Order)
                    Config = Config or { }

                    local Label = Config.Name or Config.name or Config.Text or Config.text or "Button"
                    local TextColor = Config.TextColor or Config.TextColor3 or Config.textcolor or Config.Color or Config.color
                    local UseThemeText = typeof(TextColor) ~= "Color3"
                    local Callback = Config.Callback or Config.callback or function() end
                    local ShouldClose = Config.Close
                    if ShouldClose == nil then
                        ShouldClose = Config.close
                    end
                    if ShouldClose == nil then
                        ShouldClose = true
                    end

                    if UseThemeText then
                        TextColor = Library.Theme["Text"]
                    end

                    local Outline = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Items["Buttons"].Instance,
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        LayoutOrder = Order,
                        BackgroundColor3 = Library.Theme["Outline"]
                    }):AddToTheme({BackgroundColor3 = "Outline"})

                    Library:Create("UICorner", {
                        Name = "\0",
                        Parent = Outline.Instance,
                        TopLeftRadius = UDim.new(0, 6),
                        TopRightRadius = UDim.new(0, 6),
                        BottomRightRadius = UDim.new(0, 6),
                        BottomLeftRadius = UDim.new(0, 6)
                    })

                    Library:Create("UIPadding", {
                        Name = "\0",
                        Parent = Outline.Instance,
                        PaddingTop = UDim.new(0, 1),
                        PaddingBottom = UDim.new(0, 1),
                        PaddingRight = UDim.new(0, 1),
                        PaddingLeft = UDim.new(0, 1)
                    })

                    local Inline = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Outline.Instance,
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Hovered Element"]
                    }):AddToTheme({BackgroundColor3 = "Hovered Element"})

                    Library:Create("UICorner", {
                        Name = "\0",
                        Parent = Inline.Instance,
                        TopLeftRadius = UDim.new(0, 6),
                        TopRightRadius = UDim.new(0, 6),
                        BottomRightRadius = UDim.new(0, 6),
                        BottomLeftRadius = UDim.new(0, 6)
                    })

                    Library:Create("UIPadding", {
                        Name = "\0",
                        Parent = Inline.Instance,
                        PaddingTop = UDim.new(0, 1),
                        PaddingBottom = UDim.new(0, 1),
                        PaddingRight = UDim.new(0, 1),
                        PaddingLeft = UDim.new(0, 1)
                    })

                    local Real = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Inline.Instance,
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Tab"]
                    }):AddToTheme({BackgroundColor3 = "Tab"})

                    Library:Create("UICorner", {
                        Name = "\0",
                        Parent = Real.Instance,
                        TopLeftRadius = UDim.new(0, 6),
                        TopRightRadius = UDim.new(0, 6),
                        BottomRightRadius = UDim.new(0, 6),
                        BottomLeftRadius = UDim.new(0, 6)
                    })

                    local TextLabel = Library:Create("TextLabel", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Real.Instance,
                        TextColor3 = TextColor,
                        Text = Label,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.XY,
                    })

                    if UseThemeText then
                        TextLabel:AddToTheme({TextColor3 = "Text"})
                    end

                    Library:Create("UIStroke", {
                        Name = "\0",
                        Parent = TextLabel.Instance,
                        Color = Library.Theme["Outline"]
                    }):AddToTheme({Color = "Outline"})

                    local SetHover = function(Bool)
                        Real:Tween({
                            BackgroundColor3 = Bool and Library.Theme["Hovered Element"] or Library.Theme["Tab"]
                        }, TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                    end

                    Outline:OnHover(function()
                        SetHover(true)
                    end, function()
                        SetHover(false)
                    end)

                    Inline:OnHover(function()
                        SetHover(true)
                    end, function()
                        SetHover(false)
                    end)

                    Real:OnHover(function()
                        SetHover(true)
                    end, function()
                        SetHover(false)
                    end)

                    local Activate = function()
                        if Notification.Closing then
                            return
                        end

                        Library:SafeCall(Callback, Notification, Label)

                        if ShouldClose then
                            CloseNotificationCard(Notification, Label)
                        end
                    end

                    Outline:Connect("MouseButton1Down", Activate)
                    Inline:Connect("MouseButton1Down", Activate)
                    Real:Connect("MouseButton1Down", Activate)
                end

                for Index, ButtonConfig in Notification.Buttons do
                    MakeNotifyButton(ButtonConfig, Index)
                end

                Notification.Items = Items
            end

            local RefreshSize = function()
                local DescHeight = math.max(Items["Description"].Instance.TextBounds.Y, 18)
                local Height = math.clamp(8 + 18 + 6 + 1 + 10 + DescHeight + 16 + 32 + 8, 120, 320)
                return Height
            end

            Items["Notification"].Instance.Visible = true,
            RunService.RenderStepped:Wait()
            local TargetHeight = RefreshSize()
            Items["Notification"].Instance.Size = UDim2.fromOffset(Notification.Width * 0.9, TargetHeight * 0.9)

            Items["Notification"]:FadeDescendants(true, nil, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
            Items["Notification"]:Tween({
                Size = UDim2.fromOffset(Notification.Width, TargetHeight)
            }, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))

            function Notification:Close(Result)
                CloseNotificationCard(Notification, Result)
            end

            return Notification
        end

        ProcessNotificationQueue = function()
            if Library.NotificationActive then
                return
            end

            local Next = table.remove(Library.NotificationQueue, 1)
            if not Next then
                return
            end

            ShowNotificationCard(Next)
        end

        Library.Notify = function(Self, Params)
            Params = Params or { }

            table.insert(Library.NotificationQueue, Params)

            if not Library.NotificationActive then
                ProcessNotificationQueue()
            end

            return Params
        end

        Library.Notification = Library.Notify

        Library.Window = function(Self, Params)
            Params = Params or { }

            local Window = {
                Name = Params.Name or Params.name or "Window",
                Version = Params.Version or Params.version or "",

                IsOpen = true,
                Pages = { },
                Items = { }
            }

            Library.MainWindow = Window

            if Library.WatermarkInstance then
                Library.WatermarkInstance.Window = Window
            end

            local Items = { } do 
                if Library:GetIsMobile() then 
                    Library:Create("UIScale", {
                        Parent = Library.Holder.Instance,
                        Scale = 0.7
                    })
                end

                Items["MainFrame"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 800, 0, 650),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Items["MainFrame"]:MakeDraggable()
                Items["MainFrame"]:MakeResizeable(Vector2.new(Items["MainFrame"].Instance.AbsoluteSize.X, Items["MainFrame"].Instance.AbsoluteSize.Y))

                Window.RestSize = Vector2.new(800, 650)
                Items["MainFrame"].Instance.Visible = false
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Items["Pages"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 33),
                    BorderSizePixel = 0
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Pages"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 8)
                })
                
                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Pages"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
                
                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["MainFrame"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Window.Name .. " ".. Window.Version or "",
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, -8),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Title"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})             
                
                Items["ContentOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    Position = UDim2.new(0, -2, 0, 33),
                    Size = UDim2.new(1, 4, 1, -31),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["ContentInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ContentInline"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ContentInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ContentInline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })                

                Items["TabLinerOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0, 17, 0, 29),
                    Size = UDim2.new(0, 22, 0, 6),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["TabLinerOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 2),
                    TopRightRadius = UDim.new(0, 2),
                    BottomRightRadius = UDim.new(0, 2),
                    BottomLeftRadius = UDim.new(0, 2)
                })
                
                Items["TabInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["TabLinerOutline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({BackgroundColor3 = 'Accent'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["TabInline"].Instance,
                    TopLeftRadius = UDim.new(0, 2),
                    TopRightRadius = UDim.new(0, 2),
                    BottomRightRadius = UDim.new(0, 2),
                    BottomLeftRadius = UDim.new(0, 2)
                })                

                Window.Items = Items
            end

            function Window:UpdateTabLiner(Page)
                local Tab = Page and Page.Items and Page.Items["Inactive"]
                local Liner = Items["TabLinerOutline"]
                local Background = Items["Background"]

                if not Tab or not Tab.Instance or not Liner or not Background then
                    return
                end

                local Scale = Library:GetScreenScale()
                local TabInst = Tab.Instance
                local LinerInst = Liner.Instance
                local BackgroundInst = Background.Instance
                local CenterX = (TabInst.AbsolutePosition.X + TabInst.AbsoluteSize.X / 2 - BackgroundInst.AbsolutePosition.X) / Scale
                local CurrentX = LinerInst.Position.X.Offset
                local Distance = math.abs(CenterX - CurrentX)

                LinerInst.AnchorPoint = Vector2.new(0.5, 0)

                if Distance < 1 then
                    LinerInst.Position = UDim2.new(0, CenterX, 0, 29)
                    return
                end

                local Duration = math.clamp(0.14 + Distance / 480, 0.18, 0.7)
                local MoveInfo = TweenInfo.new(Duration, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

                Window.LinerMoveId = (Window.LinerMoveId or 0) + 1
                local MoveId = Window.LinerMoveId

                local RestWidth = 22
                local Stretch = math.clamp(Distance * 0.18, 0, 36)

                Liner:Tween({
                    Position = UDim2.new(0, CenterX, 0, 29),
                }, MoveInfo)

                if Stretch > 1 then
                    Liner:Tween({
                        Size = UDim2.new(0, RestWidth + Stretch, 0, 6)
                    }, TweenInfo.new(Duration * 0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))

                    task.delay(Duration * 0.32, function()
                        if Window.LinerMoveId ~= MoveId then
                            return
                        end

                        Liner:Tween({
                            Size = UDim2.new(0, RestWidth, 0, 6)
                        }, TweenInfo.new(Duration * 0.68, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
                    end)
                end
            end

            local Debounce = false

            function Window:GetTopLeft()
                local Gui = Items["MainFrame"].Instance
                local Scale = Library:GetScreenScale()
                local Pos = Gui.AbsolutePosition
                local Size = Gui.AbsoluteSize

                return Vector2.new(Pos.X / Scale, (Pos.Y + GuiInset) / Scale), Vector2.new(Size.X / Scale, Size.Y / Scale)
            end

            function Window:SetAnchor(Anchor)
                local Gui = Items["MainFrame"].Instance

                if Gui.AnchorPoint == Anchor then
                    return
                end

                local TopLeft, Size = Window:GetTopLeft()

                Gui.AnchorPoint = Anchor
                Gui.Position = UDim2.fromOffset(
                    TopLeft.X + Size.X * Anchor.X,
                    TopLeft.Y + Size.Y * Anchor.Y
                )
            end

            function Window:PlayOpenAnimation()
                if Window.Animating then
                    return
                end

                Window.Animating = true
                Window.IsOpen = true

                local Main = Items["MainFrame"]
                local Title = Items["Title"]
                local Rest = Window.RestSize or Vector2.new(800, 650)

                Main.Instance.AnchorPoint = Vector2.new(0.5, 0.5)
                Main.Instance.Position = UDim2.new(0.5, 0, 0.5, 0)
                Main.Instance.Size = UDim2.fromOffset(Rest.X * 0.78, Rest.Y * 0.78)

                if Title then
                    Title.Instance.Position = UDim2.new(0, 0, 0, -24)
                end

                local OpenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                local TitleInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                local FadeInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

                local SizeTween = Main:Tween({
                    Size = UDim2.fromOffset(Rest.X, Rest.Y)
                }, OpenInfo)

                Library:Connect(SizeTween.Completed, function()
                    Window:SetAnchor(Vector2.new(0, 0))
                    Window.Animating = false

                    if Window.Current then
                        Window:UpdateTabLiner(Window.Current)
                    end
                end)

                if Title then
                    Title:Tween({Position = UDim2.new(0, 0, 0, -8)}, TitleInfo)
                end

                Main:FadeDescendants(true, nil, FadeInfo)
            end

            function Window:SetOpen(Bool)
                if Debounce or Window.Animating then
                    return
                end

                Debounce = true
                Window.IsOpen = Bool

                if Library.WatermarkInstance and Library.WatermarkInstance.NotifyWindow then
                    Library.WatermarkInstance:NotifyWindow(Bool)
                end

                local Main = Items["MainFrame"]
                local Title = Items["Title"]
                local OpenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                local CloseInfo = TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
                local FadeInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

                Window:SetAnchor(Vector2.new(0.5, 0.5))

                if Bool then
                    local Target = Window.OpenSize or Window.RestSize or Vector2.new(800, 650)

                    Main:Tween({
                        Size = UDim2.fromOffset(Target.X, Target.Y)
                    }, OpenInfo)

                    if Title then
                        Title.Instance.Position = UDim2.new(0, 0, 0, -18)
                        Title:Tween({Position = UDim2.new(0, 0, 0, -8)}, OpenInfo)
                    end
                else
                    Window.OpenSize = Vector2.new(Main.Instance.Size.X.Offset, Main.Instance.Size.Y.Offset)

                    Main:Tween({
                        Size = UDim2.fromOffset(Window.OpenSize.X * 0.94, Window.OpenSize.Y * 0.94)
                    }, CloseInfo)

                    if Title then
                        Title:Tween({Position = UDim2.new(0, 0, 0, -18)}, CloseInfo)
                    end
                end

                Items["MainFrame"]:FadeDescendants(Bool, function()
                    Debounce = false

                    if Title then
                        Title.Instance.Position = UDim2.new(0, 0, 0, -8)
                    end

                    if Bool then
                        local Target = Window.OpenSize or Window.RestSize or Vector2.new(800, 650)
                        Main.Instance.Size = UDim2.fromOffset(Target.X, Target.Y)
                        Window:SetAnchor(Vector2.new(0, 0))
                    end
                end, FadeInfo)

                for Frame in Library.OpenFrames do
                    if Frame.IsOpen then
                        Frame:SetOpen(false)
                    end
                end
            end

            Library:Connect(UserInputService.InputBegan, function(Input)
                if tostring(Input.KeyCode) == Library.MenuKeybind or tostring(Input.UserInputType) == Library.MenuKeybind then
                    if UserInputService:GetFocusedTextBox() then
                        return
                    end

                    Window:SetOpen(not Window.IsOpen)
                end
            end)

            Library:Thread(function()
                Window:PlayOpenAnimation()
            end)

            return setmetatable(Window, Library)
        end

        Library.Page = function(Self, Params)
            Params = Params or { }

            local Page = {
                Name = Params.Name or Params.name or "Page",

                Window = Self,
                ColumnsData = { },
                Items = { },
                Active = false,
                Debounce = false
            }

            local Items = { } do
                local IsFirst = #Page.Window.Pages == 0

                Items["Inactive"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Page.Window.Items["Pages"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    LayoutOrder = #Page.Window.Pages + 1
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Inactive"].Instance,
                    TextColor3 = IsFirst and Library.Theme["Text"] or Library.Theme["Inactive Text"],
                    Text = Page.Name,
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0.5, 0),
                    Size = UDim2.new(0, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }):AddToTheme({TextColor3 = IsFirst and "Text" or "Inactive Text"})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = "Outline"})

                Items["Page"] = Library:Create("CanvasGroup", {
                    Name = "\0",
                    Parent = Library.UnusedHolder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BackgroundTransparency = 1,
                    GroupTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    PaddingTop = UDim.new(0, 15),
                    PaddingBottom = UDim.new(0, 15),
                    PaddingRight = UDim.new(0, 13),
                    PaddingLeft = UDim.new(0, 13)
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 13),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                local MakeColumn = function(Order)
                    local Column = Library:Create("ScrollingFrame", {
                        Name = "\0",
                        Parent = Items["Page"].Instance,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0.5, -6, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        CanvasSize = UDim2.new(0, 0, 0, 0),
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollBarThickness = 0,
                        ScrollingDirection = Enum.ScrollingDirection.Y,
                        ClipsDescendants = true,
                        LayoutOrder = Order
                    })

                    Library:Create("UIListLayout", {
                        Name = "\0",
                        Parent = Column.Instance,
                        FillDirection = Enum.FillDirection.Vertical,
                        Padding = UDim.new(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    return Column
                end

                Items["LeftColumn"] = MakeColumn(1)
                -- you can add more columns here

                Page.ColumnsData[1] = Items["LeftColumn"]

                Page.Items = Items
            end

            local PageAnim = Library:GetAnim("Page")

            local PageGui = Items["Page"].Instance

            PageGui.AnchorPoint = Vector2.new(0.5, 0.5)
            PageGui.Position = UDim2.new(0.5, 0, 0.5, 0)
            PageGui.Size = UDim2.new(1, 0, 1, 0)

            local Motion = {
                Connection = nil,
                Closing = false,
                Dir = 1,
                Reveal = Spring.new(0, PageAnim.Open),
            }

            local StopPageMotion, StartPageMotion

            local ApplyPageVisual = function(Reveal)
                local Slide = Motion.Closing
                    and (PageAnim.Slide * 0.45 * (1 - Reveal) * Motion.Dir)
                    or (PageAnim.Slide * (1 - Reveal) * Motion.Dir)

                PageGui.GroupTransparency = 1 - Reveal
                PageGui.Size = UDim2.new(1, 0, 1, 0)
                PageGui.Position = UDim2.new(0.5, Slide, 0.5, 0)
            end

            local StepPageMotion = function(Delta)
                local Stiffness = Motion.Closing and PageAnim.Close or PageAnim.Open

                Motion.Reveal:SetTarget(Motion.Closing and 0 or 1)

                local Reveal = math.clamp(Motion.Reveal:Step(Delta, Stiffness), 0, 1)

                ApplyPageVisual(Reveal)

                if Motion.Closing and Motion.Reveal:Settled() and Motion.Reveal.Value <= 0.002 then
                    Motion.Reveal:Set(0, 0)
                    ApplyPageVisual(0)

                    if not Page.Active then
                        PageGui.Parent = Library.UnusedHolder.Instance
                    end

                    StopPageMotion()
                elseif not Motion.Closing and Motion.Reveal:Settled() and Motion.Reveal.Value >= 0.998 then
                    Motion.Reveal:Set(1, 0)
                    ApplyPageVisual(1)
                    StopPageMotion()
                end
            end

            StartPageMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepPageMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopPageMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            function Page:AnimateIn(Dir, Instant)
                Motion.Closing = false
                Motion.Dir = Dir or 1

                PageGui.Parent = Page.Window.Items["Content"].Instance
                PageGui.Visible = true

                if Instant then
                    Motion.Reveal:Set(1, 0)
                    ApplyPageVisual(1)
                    StopPageMotion()
                    return
                end

                if Motion.Reveal.Value <= 0.002 then
                    Motion.Reveal:Set(0, 0)
                    ApplyPageVisual(0)
                end

                Motion.Reveal:SetTarget(1)
                StartPageMotion()
                StepPageMotion(0)
            end

            function Page:AnimateOut(Dir)
                Motion.Closing = true
                Motion.Dir = Dir or -1
                Motion.Reveal:SetTarget(0)
                Motion.Reveal.Velocity = math.min(Motion.Reveal.Velocity, -PageAnim.CloseKick)
                StartPageMotion()
            end

            Items["Inactive"]:OnHover(function()
                if Page.Active then return end 

                Items["Text"]:Tween({TextColor3 = Library.Theme.Text})
            end, function()
                if Page.Active then return end 

                Items["Text"]:Tween({TextColor3 = Library.Theme["Inactive Text"]})
            end)

            function Page:Turn()
                local Old = Page.Window.Current 

                if Old == Page then 
                    return 
                end

                local NewOrder = Items["Inactive"].Instance.LayoutOrder
                local OldOrder = Old and Old.Items["Inactive"].Instance.LayoutOrder or NewOrder
                local Dir = (NewOrder >= OldOrder) and 1 or -1
                local Instant = Old == nil

                if Old then 
                    Old.Items["Text"]:ChangeItemTheme({TextColor3 = "Inactive Text"})
                    Old.Items["Text"]:Tween({TextColor3 = Library.Theme["Inactive Text"]})
                    Old.Active = false
                    Old:AnimateOut(-Dir)
                end

                Items["Text"]:ChangeItemTheme({TextColor3 = "Text"})
                Items["Text"]:Tween({TextColor3 = Library.Theme.Text})

                Page.Window.Current = Page
                Page.Active = true
                Page:AnimateIn(Dir, Instant)

                Library:Thread(function()
                    Page.Window:UpdateTabLiner(Page)
                end)
            end

            Items["Inactive"]:Connect("MouseButton1Down", function()
                Page:Turn()
            end)

            if #Page.Window.Pages == 0 then 
                Page:Turn()
            end

            table.insert(Page.Window.Pages, Page)
            return setmetatable(Page, Library.Pages)
        end

        Library.Pages.Section = function(Self, Params)
            Params = Params or { } 

            local Section = {
                Name = Params.Name or Params.name or "Section",
                Side = Params.Side or Params.side or 1,
                IsSettings = Params.IsSettings or Params.issettings or false,

                Window = Self.Window,
                Page = Self,
                Items = { },
            }

            local Items = { } do 
                Items["Section"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Section.Page.ColumnsData[Section.Side].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 40),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y
                })
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Section"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Section.Name,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["InlineOutline1"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Section"].Instance,
                    Size = UDim2.new(1, 0, 0, 20),
                    Position = UDim2.new(0, 0, 0, 25),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["InlineOutline1"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Items["InlineOutline2"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["InlineOutline1"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Inline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["InlineOutline2"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["InlineOutline2"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["InlineOutline2"].Instance,
                    Size = UDim2.new(1, 0, 0, 20),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 10),
                    TopRightRadius = UDim.new(0, 10),
                    BottomRightRadius = UDim.new(0, 10),
                    BottomLeftRadius = UDim.new(0, 10)
                })
                
                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })
                
                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Section.Items = Items
            end 

            return setmetatable(Section, Library.Sections)
        end

        Library.Section = Library.Pages.Section

        Library.Sections.Module = function(Self, Params)
            Params = Params or { }

            local Module = {
                Name = Params.Name or Params.name or "Module",
                Description = Params.Description or Params.description or  "",
                Flag = Library:ResolveFlag(Params.Flag or Params.flag, Params.Name or Params.name),
                Default = Params.Default or Params.default or false,
                Callback = Params.Callback or Params.callback or function() end,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = false,
                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Holder"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
                
                Items["Module"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 30),
                    BorderSizePixel = 0
                })
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Module"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Module.Name,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Module"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Module.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["IndicatorOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Module"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 53, 0, 21),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["IndicatorOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Items["IndicatorInlineOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["IndicatorOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Indicator"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Items["Circle"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Indicator"].Instance,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 18, 0, 0),
                    Size = UDim2.new(0, 31, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Toggle"]
                }):AddToTheme({BackgroundColor3 = 'Toggle'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Circle"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Circle"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Circle"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Items["StatusText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize - 4,
                    Parent = Items["Circle"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "OFF",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})

                Items["StatusText"].Instance.TextSize = Library.FontSize - 4
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["StatusText"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["IndicatorOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["ContentOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Size = UDim2.new(1, 0, 0, 25),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["ContentInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    Size = UDim2.new(1, 0, 0, 25),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ContentInline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ContentInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ContentInline"].Instance,
                    Size = UDim2.new(1, 0, 0, 25),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    PaddingTop = UDim.new(0, 13),
                    PaddingBottom = UDim.new(0, 13),
                    PaddingRight = UDim.new(0, 13),
                    PaddingLeft = UDim.new(0, 13)
                })
                
                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    Padding = UDim.new(0, 13),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })                
            
                Module.Items = Items
            end

            local Animation = Library:GetAnim("Toggle")
            local CircleWidth = 31

            local Motion = {
                Connection = nil,
                Slide = Spring.new(0, Animation.Slide or 26),
                Color = Spring.new(0, Animation.Color or 22),
                Text = Spring.new(0, Animation.Text or 34),
                Size = Spring.new(1, Animation.Size or 28),
                Hover = Spring.new(0, Animation.Hover or 20),
                First = true,
                PendingText = nil,
                Hovered = false,
            }

            local StopMotion, StartMotion

            local ApplyVisuals = function()
                local Slide = math.clamp(Motion.Slide.Value, 0, 1)
                local SizeScale = math.clamp(Motion.Size.Value, 0.4, 1)
                local Width = CircleWidth * SizeScale
                local TrackWidth = Items["Indicator"].Instance.AbsoluteSize.X

                if TrackWidth < 1 then
                    TrackWidth = 49
                end

                local Travel = math.max(TrackWidth - Width, 0)
                local X = (1 - Slide) * Travel

                Items["Circle"].Instance.AnchorPoint = Vector2.new(0, 0)
                Items["Circle"].Instance.Position = UDim2.new(0, X, 0, 0)
                Items["Circle"].Instance.Size = UDim2.new(0, Width, 1, 0)
                Items["Circle"].Instance.BackgroundColor3 = Library.Theme["Toggle"]:Lerp(Library.Theme["Accent"], math.clamp(Motion.Color.Value, 0, 1))
                Items["StatusText"].Instance.TextTransparency = math.clamp(Motion.Text.Value, 0, 1)

                if not Module.Value then
                    Items["Indicator"].Instance.BackgroundColor3 = Library.Theme["Tab"]:Lerp(Library.Theme["Hovered Element"], math.clamp(Motion.Hover.Value, 0, 1))
                else
                    Items["Indicator"].Instance.BackgroundColor3 = Library.Theme["Tab"]
                end
            end

            local AnyAnimating = function()
                return not Motion.Slide:Settled()
                    or not Motion.Color:Settled()
                    or not Motion.Text:Settled()
                    or not Motion.Size:Settled(0.002)
                    or not Motion.Hover:Settled()
            end

            local StepMotion = function(Delta)
                Motion.Hover:SetTarget((Motion.Hovered and not Module.Value) and 1 or 0)

                if Motion.PendingText and Motion.Text.Value >= 0.92 then
                    Items["StatusText"].Instance.Text = Motion.PendingText
                    Motion.PendingText = nil
                    Motion.Text:SetTarget(0)
                end

                Motion.Slide:Step(Delta)
                Motion.Color:Step(Delta)
                Motion.Text:Step(Delta)
                Motion.Size:Step(Delta)
                Motion.Hover:Step(Delta)
                ApplyVisuals()

                if not AnyAnimating() and not Motion.PendingText then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            Items["Module"]:OnHover(function()
                Motion.Hovered = true
                StartMotion()
            end, function()
                Motion.Hovered = false
                StartMotion()
            end)

            function Module:Set(Bool)
                local Next = Bool and true or false
                local Changed = Module.Value ~= Next

                Module.Value = Next
                Items["Circle"]:ChangeItemTheme({BackgroundColor3 = Next and "Accent" or "Toggle"})

                if Motion.First then
                    Motion.First = false
                    Motion.Slide:Set(Next and 1 or 0, 0)
                    Motion.Color:Set(Next and 1 or 0, 0)
                    Motion.Size:Set(1, 0)
                    Motion.Text:Set(0, 0)
                    Motion.PendingText = nil
                    Items["StatusText"].Instance.Text = Next and "ON" or "OFF"
                    ApplyVisuals()
                else
                    Motion.Slide:SetTarget(Next and 1 or 0)
                    Motion.Color:SetTarget(Next and 1 or 0)

                    if Changed then
                        Motion.Size:Set(0.55, Animation.SizeKick or 9)
                        Motion.Size:SetTarget(1)
                        Motion.PendingText = Next and "ON" or "OFF"
                        Motion.Text:SetTarget(1)
                    end

                    StartMotion()
                end

                Flags[Module.Flag] = Next
                Library:SafeCall(Module.Callback, Next)
            end

            function Module:SetVisibility(Bool)
                Items["Holder"].Instance.Visible = Bool 
            end

            function Module:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Module:Get()
                return Module.Value
            end

            local ToggleModule = function()
                Module:Set(not Module.Value)
            end

            Items["Module"]:Connect("MouseButton1Down", ToggleModule)
            Items["IndicatorOutline"]:Connect("MouseButton1Down", ToggleModule)
            Items["IndicatorInlineOutline"]:Connect("MouseButton1Down", ToggleModule)
            Items["Indicator"]:Connect("MouseButton1Down", ToggleModule)

            Module:Set(Module.Default)

            SetFlags[Module.Flag] = function(Value)
                Module:Set(Value)
            end

            Library:RegisterSearchable({
                Name = Module.Name,
                Kind = "Module",
                Page = Module.Page,
                Window = Module.Window,
                GetInstance = function()
                    return Items["Holder"] and Items["Holder"].Instance
                end,
            })

            return setmetatable(Module, Library.Sections)
        end

        Library.Module = Library.Sections.Module

        Library.Sections.Toggle = function(Self, Params)
            Params = Params or { }

            local Toggle = {
                Name = Params.Name or Params.name or "Toggle",
                Description = Params.Description or Params.description or "",
                Flag = Library:ResolveFlag(Params.Flag or Params.flag, Params.Name or Params.name),
                Default = Params.Default or Params.default or false,
                Callback = Params.Callback or Params.callback or function() end,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = false,
                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Toggle"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 30),
                    BorderSizePixel = 0
                })
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Toggle"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Toggle.Name,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Toggle"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Toggle.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["IndicatorOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Toggle"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 53, 0, 21),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["IndicatorOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Items["IndicatorInlineOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["IndicatorOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Indicator"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Items["Circle"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Indicator"].Instance,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 18, 0, 0),
                    Size = UDim2.new(0, 31, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Toggle"]
                }):AddToTheme({BackgroundColor3 = 'Toggle'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Circle"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Circle"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Circle"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Items["StatusText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize - 4,
                    Parent = Items["Circle"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "OFF",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})

                Items["StatusText"].Instance.TextSize = Library.FontSize - 4
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["StatusText"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["IndicatorOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
            
                Toggle.Items = Items
            end

            local Animation = Library:GetAnim("Toggle")
            local CircleWidth = 31

            local Motion = {
                Connection = nil,
                Slide = Spring.new(0, Animation.Slide or 26),
                Color = Spring.new(0, Animation.Color or 22),
                Text = Spring.new(0, Animation.Text or 34),
                Size = Spring.new(1, Animation.Size or 28),
                Hover = Spring.new(0, Animation.Hover or 20),
                First = true,
                PendingText = nil,
                Hovered = false,
            }

            local StopMotion, StartMotion

            local ApplyVisuals = function()
                local Slide = math.clamp(Motion.Slide.Value, 0, 1)
                local SizeScale = math.clamp(Motion.Size.Value, 0.4, 1)
                local Width = CircleWidth * SizeScale
                local TrackWidth = Items["Indicator"].Instance.AbsoluteSize.X

                if TrackWidth < 1 then
                    TrackWidth = 49
                end

                local Travel = math.max(TrackWidth - Width, 0)
                local X = (1 - Slide) * Travel

                Items["Circle"].Instance.AnchorPoint = Vector2.new(0, 0)
                Items["Circle"].Instance.Position = UDim2.new(0, X, 0, 0)
                Items["Circle"].Instance.Size = UDim2.new(0, Width, 1, 0)
                Items["Circle"].Instance.BackgroundColor3 = Library.Theme["Toggle"]:Lerp(Library.Theme["Accent"], math.clamp(Motion.Color.Value, 0, 1))
                Items["StatusText"].Instance.TextTransparency = math.clamp(Motion.Text.Value, 0, 1)

                if not Toggle.Value then
                    Items["Indicator"].Instance.BackgroundColor3 = Library.Theme["Tab"]:Lerp(Library.Theme["Hovered Element"], math.clamp(Motion.Hover.Value, 0, 1))
                else
                    Items["Indicator"].Instance.BackgroundColor3 = Library.Theme["Tab"]
                end
            end

            local AnyAnimating = function()
                return not Motion.Slide:Settled()
                    or not Motion.Color:Settled()
                    or not Motion.Text:Settled()
                    or not Motion.Size:Settled(0.002)
                    or not Motion.Hover:Settled()
            end

            local StepMotion = function(Delta)
                Motion.Hover:SetTarget((Motion.Hovered and not Toggle.Value) and 1 or 0)

                if Motion.PendingText and Motion.Text.Value >= 0.92 then
                    Items["StatusText"].Instance.Text = Motion.PendingText
                    Motion.PendingText = nil
                    Motion.Text:SetTarget(0)
                end

                Motion.Slide:Step(Delta)
                Motion.Color:Step(Delta)
                Motion.Text:Step(Delta)
                Motion.Size:Step(Delta)
                Motion.Hover:Step(Delta)
                ApplyVisuals()

                if not AnyAnimating() and not Motion.PendingText then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            Items["Toggle"]:OnHover(function()
                Motion.Hovered = true
                StartMotion()
            end, function()
                Motion.Hovered = false
                StartMotion()
            end)

            function Toggle:Set(Bool)
                local Next = Bool and true or false
                local Changed = Toggle.Value ~= Next

                Toggle.Value = Next
                Items["Circle"]:ChangeItemTheme({BackgroundColor3 = Next and "Accent" or "Toggle"})

                if Motion.First then
                    Motion.First = false
                    Motion.Slide:Set(Next and 1 or 0, 0)
                    Motion.Color:Set(Next and 1 or 0, 0)
                    Motion.Size:Set(1, 0)
                    Motion.Text:Set(0, 0)
                    Motion.PendingText = nil
                    Items["StatusText"].Instance.Text = Next and "ON" or "OFF"
                    ApplyVisuals()
                else
                    Motion.Slide:SetTarget(Next and 1 or 0)
                    Motion.Color:SetTarget(Next and 1 or 0)

                    if Changed then
                        Motion.Size:Set(0.55, Animation.SizeKick or 9)
                        Motion.Size:SetTarget(1)
                        Motion.PendingText = Next and "ON" or "OFF"
                        Motion.Text:SetTarget(1)
                    end

                    StartMotion()
                end

                Flags[Toggle.Flag] = Next
                Library:SafeCall(Toggle.Callback, Next)
            end

            function Toggle:SetVisibility(Bool)
                Items["Toggle"].Instance.Visible = Bool 
            end

            function Toggle:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Toggle:Get()
                return Toggle.Value
            end

            local ToggleElement = function()
                Toggle:Set(not Toggle.Value)
            end

            Items["Toggle"]:Connect("MouseButton1Down", ToggleElement)
            Items["IndicatorOutline"]:Connect("MouseButton1Down", ToggleElement)
            Items["IndicatorInlineOutline"]:Connect("MouseButton1Down", ToggleElement)
            Items["Indicator"]:Connect("MouseButton1Down", ToggleElement)

            Toggle:Set(Toggle.Default)

            SetFlags[Toggle.Flag] = function(Value)
                Toggle:Set(Value)
            end

            Library:RegisterSearchable({
                Name = Toggle.Name,
                Kind = "Toggle",
                Page = Toggle.Page,
                Window = Toggle.Window,
                GetInstance = function()
                    return Items["Toggle"] and Items["Toggle"].Instance
                end,
            })

            return Toggle
        end

        Library.Toggle = Library.Sections.Toggle

        Library.Sections.Checkbox = function(Self, Params)
            Params = Params or { }

            local Checkbox = {
                Name = Params.Name or Params.name or "Checkbox",
                Description = Params.Description or Params.description or "",
                Flag = Library:ResolveFlag(Params.Flag or Params.flag, Params.Name or Params.name),
                Default = Params.Default or Params.default or false,
                Callback = Params.Callback or Params.callback or function() end,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self.Section or Self,

                Value = false,
                Hovered = false,
                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do
                Items["Checkbox"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Parent.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 30),
                    BorderSizePixel = 0
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Checkbox"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Checkbox.Name,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})

                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Checkbox"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Checkbox.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})

                Items["IndicatorOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Checkbox"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 21, 0, 21),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["IndicatorOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["IndicatorOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["IndicatorInlineOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["IndicatorOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["Indicator"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["IndicatorInlineOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})

                Items["Accent"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Indicator"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.99,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({BackgroundColor3 = 'Accent'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Accent"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Items["Check"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["Accent"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 14, 0, 14),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = "rbxassetid://120935020739965",
                    ImageTransparency = 1,
                    ImageColor3 = Color3.fromRGB(255, 255, 255)
                })

                Items["CheckScale"] = Library:Create("UIScale", {
                    Name = "\0",
                    Parent = Items["Check"].Instance,
                    Scale = 1
                })

                Checkbox.Items = Items
            end

            local Animation = Library:GetAnim("Checkbox")

            local Motion = {
                Connection = nil,
                Checked = Spring.new(0, Animation.Check),
                Hover = Spring.new(0, Animation.Hover),
                Pop = Spring.new(1, Animation.Pop),
                First = true,
            }

            local StopMotion, StartMotion

            local ApplyVisuals = function()
                local Checked = math.clamp(Motion.Checked.Value, 0, 1)
                local Hover = math.clamp(Motion.Hover.Value, 0, 1)
                local Pop = Motion.Pop.Value

                Items["Accent"].Instance.BackgroundTransparency = 0.99 * (1 - Checked)
                Items["Check"].Instance.ImageTransparency = 1 - Checked
                Items["CheckScale"].Instance.Scale = Pop

                if not Checkbox.Value then
                    Items["Indicator"].Instance.BackgroundColor3 = Library.Theme["Tab"]:Lerp(Library.Theme["Hovered Element"], Hover)
                else
                    Items["Indicator"].Instance.BackgroundColor3 = Library.Theme["Tab"]
                end
            end

            local AnyAnimating = function()
                return not Motion.Checked:Settled()
                    or not Motion.Hover:Settled()
                    or not Motion.Pop:Settled(0.002)
            end

            local StepMotion = function(Delta)
                local HoverTarget = (Checkbox.Hovered and not Checkbox.Value) and 1 or 0

                Motion.Hover:SetTarget(HoverTarget)
                Motion.Checked:Step(Delta)
                Motion.Hover:Step(Delta)
                Motion.Pop:Step(Delta)
                ApplyVisuals()

                if not AnyAnimating() then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            Items["Checkbox"]:OnHover(function()
                Checkbox.Hovered = true
                StartMotion()
            end, function()
                Checkbox.Hovered = false
                StartMotion()
            end)

            function Checkbox:Set(Bool)
                local Next = Bool and true or false
                local Changed = Checkbox.Value ~= Next

                Checkbox.Value = Next

                if Motion.First then
                    Motion.First = false
                    Motion.Checked:Set(Next and 1 or 0, 0)
                    Motion.Pop:Set(1, 0)
                    ApplyVisuals()
                else
                    Motion.Checked:SetTarget(Next and 1 or 0)

                    if Next and Changed then
                        Motion.Pop:Set(0.55, Animation.PopKick)
                        Motion.Pop:SetTarget(1)
                    else
                        Motion.Pop:SetTarget(1)
                    end

                    StartMotion()
                end

                Flags[Checkbox.Flag] = Next
                Library:SafeCall(Checkbox.Callback, Next)
            end

            function Checkbox:SetVisibility(Bool)
                Items["Checkbox"].Instance.Visible = Bool
            end

            function Checkbox:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Checkbox:Get()
                return Checkbox.Value
            end

            local ToggleCheckbox = function()
                Checkbox:Set(not Checkbox.Value)
            end

            Items["Checkbox"]:Connect("MouseButton1Down", ToggleCheckbox)
            Items["IndicatorOutline"]:Connect("MouseButton1Down", ToggleCheckbox)
            Items["IndicatorInlineOutline"]:Connect("MouseButton1Down", ToggleCheckbox)
            Items["Indicator"]:Connect("MouseButton1Down", ToggleCheckbox)

            Checkbox:Set(Checkbox.Default)

            SetFlags[Checkbox.Flag] = function(Value)
                Checkbox:Set(Value)
            end

            Library:RegisterSearchable({
                Name = Checkbox.Name,
                Kind = "Checkbox",
                Page = Checkbox.Page,
                Window = Checkbox.Window,
                GetInstance = function()
                    return Items["Checkbox"] and Items["Checkbox"].Instance
                end,
            })

            return Checkbox
        end

        Library.Checkbox = Library.Sections.Checkbox

        Library.Sections.Button = function(Self, Params)
            Params = Params or { }

            local Button = {
                Name = Params.Name or Params.name or "Button",
                Callback = Params.Callback or Params.callback or function() end,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,
                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Button"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Parent.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 0, 35),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Button"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["Inline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Button"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["RealButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Inline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"],
                    ClipsDescendants = true
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealButton"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Items["AccentFill"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["RealButton"].Instance,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    Size = UDim2.new(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 1,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({BackgroundColor3 = 'Accent'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["AccentFill"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["RealButton"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["RealButton"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Button.Name,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Button"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })                

                Button.Items = Items
            end

            local HoverInfo = TweenInfo.new(Library.Animation.Time * 0.85, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection.Out)
            local PressInInfo = TweenInfo.new(Library.Animation.Time / 3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            local PressOutInfo = TweenInfo.new(Library.Animation.Time * 0.95, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local FillInfo = TweenInfo.new(Library.Animation.Time * 0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

            Button.Hovered = false
            Button.Pressing = false

            local ApplyButtonColors = function(Hover)
                Items["Button"]:Tween({
                    BackgroundColor3 = Hover and Library.Theme["Dark Liner"] or Library.Theme["Outline"]
                }, HoverInfo)

                Items["Inline"]:Tween({
                    BackgroundColor3 = Hover and Library.Theme["Element"] or Library.Theme["Hovered Element"]
                }, HoverInfo)

                Items["RealButton"]:Tween({
                    BackgroundColor3 = Hover and Library.Theme["Hovered Element"] or Library.Theme["Tab"]
                }, HoverInfo)
            end

            local SetHoverState = function(Hover)
                Button.Hovered = Hover

                if Button.Pressing then
                    return
                end

                ApplyButtonColors(Hover)
            end

            Items["Button"]:OnHover(function()
                SetHoverState(true)
            end, function()
                SetHoverState(false)
            end)

            function Button:Press()
                if Button.Pressing then
                    return
                end

                Button.Pressing = true

                Items["RealButton"]:ChangeItemTheme({BackgroundColor3 = "Accent"})
                Items["RealButton"]:Tween({BackgroundColor3 = Library.Theme["Accent"]}, PressInInfo)
                Items["Inline"]:Tween({BackgroundColor3 = Library.Theme["Accent"]}, PressInInfo)
                Items["Button"]:Tween({BackgroundColor3 = Library.Theme["Accent"]}, PressInInfo)

                Items["AccentFill"].Instance.BackgroundTransparency = 0.25
                Items["AccentFill"].Instance.Size = UDim2.new(1, 0, 0, 0)
                Items["AccentFill"]:Tween({
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 0.08
                }, FillInfo)

                Items["Text"]:Tween({TextTransparency = 0.2}, PressInInfo)

                Library:Thread(function()
                    task.wait(FillInfo.Time)

                    Items["AccentFill"]:Tween({
                        Size = UDim2.new(1, 0, 0, 0),
                        BackgroundTransparency = 1
                    }, PressOutInfo)

                    Items["Text"]:Tween({TextTransparency = 0}, PressOutInfo)

                    Items["RealButton"]:ChangeItemTheme({
                        BackgroundColor3 = Button.Hovered and "Hovered Element" or "Tab"
                    })

                    ApplyButtonColors(Button.Hovered)

                    task.wait(PressOutInfo.Time)

                    Button.Pressing = false
                    Library:SafeCall(Button.Callback)
                end)
            end

            function Button:SetVisibility(Bool)
                Items["Button"].Instance.Visible = Bool
            end

            function Button:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            Items["Button"]:Connect("MouseButton1Down", function()
                Button:Press()
            end)

            Items["Inline"]:Connect("MouseButton1Down", function()
                Button:Press()
            end)

            Items["RealButton"]:Connect("MouseButton1Down", function()
                Button:Press()
            end)

            Library:RegisterSearchable({
                Name = Button.Name,
                Kind = "Button",
                Page = Button.Page,
                Window = Button.Window,
                GetInstance = function()
                    return Items["Button"] and Items["Button"].Instance
                end,
            })

            return Button
        end

        Library.Button = Library.Sections.Button

        Library.Sections.Slider = function(Self, Params)
            Params = Params or { }

            local Slider = {
                Name = Params.Name or Params.name or "Slider",
                Description = Params.Description or Params.description or "",
                Flag = Library:ResolveFlag(Params.Flag or Params.flag, Params.Name or Params.name),
                Default = Params.Default or Params.default or 0,
                Min = Params.Min or Params.min or 0,
                Max = Params.Max or Params.max or 100,
                Callback = Params.Callback or Params.callback or function() end,
                Decimals = Params.Decimals or Params.decimals or 0,
                Suffix = Params.Suffix or Params.suffix or "",

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = 0,
                Sliding = false,
                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Slider"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 30),
                    BorderSizePixel = 0
                })
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Slider"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Slider.Name,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Slider"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Slider.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["RealSliderOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Slider"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 360, 0, 11),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealSliderOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["RealSliderOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Inline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["RealSliderOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["RealSlider"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Inline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealSlider"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                Items["Accent"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["RealSlider"].Instance,
                    Size = UDim2.new(0.5, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({BackgroundColor3 = 'Accent'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Accent"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["Dragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["RealSlider"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 20, 0, 11),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Toggle"]
                }):AddToTheme({BackgroundColor3 = 'Toggle'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Dragger"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Dragger"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = 'Hovered Element'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Dragger"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })

                Items["ValueHolder"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["RealSliderOutline"].Instance,
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.new(0, 0, 0, -8),
                    Size = UDim2.new(0, 0, 0, 25),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Visible = false,
                    ZIndex = 8
                })

                Items["ValueOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ValueHolder"].Instance,
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ValueOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ValueOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["ValueInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ValueOutline"].Instance,
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ValueInline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ValueInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["ValueBackground"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ValueInline"].Instance,
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["ValueBackground"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["ValueBackground"].Instance,
                    PaddingTop = UDim.new(0, 0),
                    PaddingBottom = UDim.new(0, 0),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })

                Items["Value"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ValueBackground"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "0",
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                }):AddToTheme({TextColor3 = 'Text'})

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Value"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})

                Slider.Items = Items 
            end

            local SlideInfo = TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection[Library.Animation.Direction])
            local FadeInfo = TweenInfo.new(Library.Animation.Time * 0.75, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection[Library.Animation.Direction])
            local PopupInfo = TweenInfo.new(Library.Animation.Time * 0.65, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection.Out)

            Slider.Hovered = false
            Slider.ValueVisible = false
            Slider.ValueTargetPercent = 0
            Slider.ValueDisplayPercent = 0
            Slider.ValueTargetY = -8
            Slider.ValueDisplayY = -8
            Slider.ValueFollowConnection = nil

            function Slider:StartValueFollow()
                if Slider.ValueFollowConnection then
                    return
                end

                Slider.ValueFollowConnection = Library:Connect(RunService.RenderStepped, function(Delta)
                    if not Items["ValueHolder"] or not Items["ValueHolder"].Instance.Visible then
                        return
                    end

                    local Alpha = 1 - math.exp(-22 * Delta)

                    Slider.ValueDisplayPercent += (Slider.ValueTargetPercent - Slider.ValueDisplayPercent) * Alpha
                    Slider.ValueDisplayY += (Slider.ValueTargetY - Slider.ValueDisplayY) * Alpha

                    Items["ValueHolder"].Instance.Position = UDim2.new(
                        Slider.ValueDisplayPercent,
                        0,
                        0,
                        Slider.ValueDisplayY
                    )
                end)
            end

            function Slider:StopValueFollow()
                if Slider.ValueFollowConnection then
                    Slider.ValueFollowConnection:Disconnect()
                    Slider.ValueFollowConnection = nil
                end
            end

            local ApplyTrackColors = function(Hover)
                Items["RealSlider"]:Tween({
                    BackgroundColor3 = Hover and Library.Theme["Hovered Element"] or Library.Theme["Tab"]
                }, SlideInfo)

                Items["Inline"]:Tween({
                    BackgroundColor3 = Hover and Library.Theme["Element"] or Library.Theme["Hovered Element"]
                }, SlideInfo)
            end

            local SetHoverState = function(Hover)
                Slider.Hovered = Hover

                if Slider.Sliding then
                    return
                end

                ApplyTrackColors(Hover)
            end

            Items["Slider"]:OnHover(function()
                SetHoverState(true)
            end, function()
                SetHoverState(false)
            end)

            function Slider:GetPercent(Value)
                if Slider.Max == Slider.Min then
                    return 0
                end

                return math.clamp((Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1)
            end

            function Slider:UpdateValuePosition(Percent)
                Slider.ValueTargetPercent = Percent

                if not Slider.ValueVisible then
                    Slider.ValueDisplayPercent = Percent
                    Slider.ValueDisplayY = -12
                    Items["ValueHolder"].Instance.Position = UDim2.new(Percent, 0, 0, -12)
                end
            end

            function Slider:ShowValuePopup()
                if Slider.ValueVisible then
                    return
                end

                Slider.ValueVisible = true

                local Percent = Slider.ValueTargetPercent
                Slider.ValueDisplayPercent = Percent
                Slider.ValueTargetPercent = Percent
                Slider.ValueTargetY = -12
                Slider.ValueDisplayY = 12

                Items["ValueHolder"].Instance.Visible = true
                Items["ValueHolder"].Instance.Position = UDim2.new(Percent, 0, 0, Slider.ValueDisplayY)

                Slider:StartValueFollow()

                Items["ValueOutline"]:Tween({BackgroundTransparency = 0}, PopupInfo)
                Items["ValueInline"]:Tween({BackgroundTransparency = 0}, PopupInfo)
                Items["ValueBackground"]:Tween({BackgroundTransparency = 0}, PopupInfo)
                Items["Value"]:Tween({TextTransparency = 0}, PopupInfo)
            end

            function Slider:HideValuePopup()
                if not Slider.ValueVisible then
                    return
                end

                Slider.ValueVisible = false
                Slider.ValueTargetY = 10

                Items["ValueOutline"]:Tween({BackgroundTransparency = 1}, PopupInfo)
                Items["ValueInline"]:Tween({BackgroundTransparency = 1}, PopupInfo)
                Items["ValueBackground"]:Tween({BackgroundTransparency = 1}, PopupInfo)

                local TextTween = Items["Value"]:Tween({TextTransparency = 1}, PopupInfo)

                local FinishHide = function()
                    if Slider.ValueVisible then
                        return
                    end

                    Slider:StopValueFollow()
                    Items["ValueHolder"].Instance.Visible = false
                    Slider.ValueDisplayY = 12
                    Slider.ValueTargetY = -12
                end

                if TextTween then
                    TextTween.Completed:Connect(FinishHide)
                else
                    task.delay(PopupInfo.Time, FinishHide)
                end
            end

            function Slider:UpdateVisuals(RawValue)
                local Percent = Slider:GetPercent(RawValue)
                local BelowMin = RawValue < Slider.Min

                Items["Accent"]:Tween({
                    Size = UDim2.new(Percent, 0, 1, 0),
                    BackgroundTransparency = BelowMin and 1 or 0
                }, BelowMin and FadeInfo or Slider.Sliding and SlideInfo)

                Items["Dragger"]:Tween({
                    Position = UDim2.new(Percent, 0, 0.5, 0)
                }, Slider.Sliding and SlideInfo or nil)

                Slider:UpdateValuePosition(Percent)

                if Slider.ValueVisible then
                    Items["Value"]:Tween({
                        TextColor3 = BelowMin and Library.Theme["Dark Text"] or Library.Theme["Text"]
                    }, FadeInfo)
                end
            end

            function Slider:Set(Value)
                local RawValue = Value
                local PreviousValue = Slider.Value
                local ClampedValue = Library:Round(math.clamp(Value, Slider.Min, Slider.Max), Slider.Decimals)
                local NewText = string.format("%s%s", ClampedValue, Slider.Suffix)

                Slider.Value = ClampedValue
                Slider:UpdateVisuals(RawValue)

                if Slider.ValueVisible and Slider.Sliding and PreviousValue ~= ClampedValue then
                    local Direction = ClampedValue > PreviousValue and 1 or -1
                    local TextSlideInfo = TweenInfo.new(Library.Animation.Time / 3, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection.Out)

                    Items["Value"]:Tween({
                        Position = UDim2.new(0, -8 * Direction, 0.5, 0),
                        TextTransparency = 1
                    }, TextSlideInfo)

                    task.delay(TextSlideInfo.Time * 0.45, function()
                        if not Slider.ValueVisible then
                            return
                        end

                        Items["Value"].Instance.Text = NewText
                        Items["Value"].Instance.Position = UDim2.new(0, 8 * Direction, 0.5, 0)

                        Items["Value"]:Tween({
                            Position = UDim2.new(0, 0, 0.5, 0),
                            TextTransparency = 0
                        }, TextSlideInfo)
                    end)
                else
                    Items["Value"].Instance.Text = NewText
                end

                Flags[Slider.Flag] = Slider.Value
                Library:SafeCall(Slider.Callback, Slider.Value)
            end

            function Slider:SetVisibility(Bool)
                Items["Slider"].Instance.Visible = Bool
            end

            function Slider:GetSize(Input)
                local Scale = Library:GetScreenScale()
                local SliderInst = Items["RealSlider"].Instance
                local SizeX = (Input.Position.X / Scale - SliderInst.AbsolutePosition.X / Scale) / (SliderInst.AbsoluteSize.X / Scale)
                local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                return Value
            end

            function Slider:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Slider:Get()
                return Slider.Value
            end

            local InputChanged

            local BeginSlide = function(Input)
                if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then
                    return
                end

                Slider.Sliding = true
                ApplyTrackColors(true)
                Slider:Set(Slider:GetSize(Input))
                Slider:ShowValuePopup()

                if InputChanged then
                    return
                end

                InputChanged = Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Slider.Sliding = false
                        Slider:UpdateVisuals(Slider.Value)
                        Slider:HideValuePopup()

                        if not Slider.Hovered then
                            ApplyTrackColors(false)
                        end

                        InputChanged:Disconnect()
                        InputChanged = nil
                    end
                end)
            end

            Items["RealSliderOutline"]:Connect("InputBegan", BeginSlide)
            Items["Inline"]:Connect("InputBegan", BeginSlide)
            Items["RealSlider"]:Connect("InputBegan", BeginSlide)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Slider.Sliding then
                        Slider:Set(Slider:GetSize(Input))
                    end
                end
            end)

            Slider:Set(Slider.Default)

            SetFlags[Slider.Flag] = function(Value)
                Slider:Set(Value)
            end

            Library:RegisterSearchable({
                Name = Slider.Name,
                Kind = "Slider",
                Page = Slider.Page,
                Window = Slider.Window,
                GetInstance = function()
                    return Items["Slider"] and Items["Slider"].Instance
                end,
            })

            return Slider
        end

        Library.Slider = Library.Sections.Slider

        Library.Sections.Dropdown = function(Self, Params)
            Params = Params or { }

            local Dropdown = {
                Name = Params.Name or Params.name or "Dropdown",
                Description = Params.Description or Params.description or "",
                OptionItems = Params.Items or Params.items or { },
                Flag = Library:ResolveFlag(Params.Flag or Params.flag, Params.Name or Params.name),
                Default = Params.Default or Params.default or "",
                Callback = Params.Callback or Params.callback or function() end,
                Multi = Params.Multi or Params.multi or false,
                MaxSize = Params.MaxSize or Params.maxsize or 150,

                Window = Self.Window,
                Page = Self.Page,
                Section = (Self ~= Library) and Self or nil,

                Value = { },
                Options = { },
                OptionCount = 0,
                IsOpen = false,
                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Dropdown"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                    BorderSizePixel = 0
                })
                
                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Dropdown"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Dropdown.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Dropdown"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Dropdown.Name,
                    Position = UDim2.new(0, 0, 0, 2),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["RealDropdownOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Dropdown"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 114, 0, 32),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealDropdownOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["RealDropdownOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["RealDropdownInline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["RealDropdownOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealDropdownInline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["RealDropdownInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["RealDropdown"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["RealDropdownInline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["RealDropdown"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["Value"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["RealDropdown"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "Head",
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 10, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})

                Items["Value"].Instance.TextSize = Library.FontSize - 2

                Items["Icon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["RealDropdown"].Instance,
                    ImageColor3 = Library.Theme["Dark Text"],
                    AnchorPoint = Vector2.new(1, 0.5),
                    Image = "rbxassetid://136894777478770",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -8, 0.5, 0),
                    Size = UDim2.new(0, 14, 0, 14),
                    BorderSizePixel = 0
                }):AddToTheme({ImageColor3 = 'Dark Text'})
                
                Items["Liner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Icon"].Instance,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(0, -6, 0.5, 0),
                    Size = UDim2.new(0, 2, 0, 18),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Liner"]
                }):AddToTheme({BackgroundColor3 = 'Liner'})
                
                Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Liner"].Instance,
                    Size = UDim2.new(0, 1, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Dark Liner"]
                }):AddToTheme({BackgroundColor3 = 'Dark Liner'})    
                
                Items["OptionHolder"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Library.UnusedHolder.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    Visible = false,
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.new(0, 200, 0, 0),
                    Position = UDim2.new(0, 1093, 0, 73),
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["OptionOutline"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderOffset = UDim.new(0, 1),
                    Transparency = 1,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["OptionInline"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    Color = Library.Theme["Hovered Element"],
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Transparency = 1,
                }):AddToTheme({Color = 'Hovered Element'})
                
                Items["OptionPadding"] = Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    PaddingTop = UDim.new(0, 6),
                    PaddingBottom = UDim.new(0, 6),
                    PaddingRight = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6)
                })
                
                Items["OptionList"] = Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Dropdown.Items = Items 
            end

            local Animation = Library:GetAnim("Dropdown")

            local OutlineSize = Items["RealDropdownOutline"].Instance.Size
            local ButtonBaseSize = Vector2.new(OutlineSize.X.Offset, OutlineSize.Y.Offset)

            local ValueInfo = TweenInfo.new(Library.Animation.Time * 0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

            local OptionHolder = Items["OptionHolder"].Instance
            local RealDropdown = Items["RealDropdown"].Instance
            local OptionList = Items["OptionList"].Instance
            local OptionPadding = Items["OptionPadding"].Instance

            local Motion = {
                Opened = false,
                Connection = nil,
                CloseLayout = nil,

                Reveal = Spring.new(0, Animation.OpenStiffness),
                Fade = Spring.new(0, Animation.CloseStiffness),
                ButtonScale = Spring.new(1, Animation.ButtonScale),
                ButtonActive = Spring.new(0, Animation.ButtonActive),
            }

            local GetContentHeight = function()
                local Count = 0
                local Height = 0

                for Index, OptionData in Dropdown.Options do
                    Height += OptionData.Button.Instance.Size.Y.Offset
                    Count += 1
                end

                if Count == 0 then
                    return 0
                end

                Height += (Count - 1) * OptionList.Padding.Offset
                Height += OptionPadding.PaddingTop.Offset + OptionPadding.PaddingBottom.Offset

                return Height
            end

            local GetStableAnchor = function()
                local Scale = Library:GetScreenScale()
                local Outline = Items["RealDropdownOutline"].Instance
                local OutPos = Outline.AbsolutePosition
                local OutSize = Outline.AbsoluteSize

                local PivotX = OutPos.X + OutSize.X
                local PivotY = OutPos.Y + OutSize.Y * 0.5

                return {
                    Scale = Scale,
                    FullWidth = ButtonBaseSize.X / Scale + Animation.Extra,
                    AnchorX = PivotX / Scale,
                    TopY = (PivotY + ButtonBaseSize.Y * 0.5 + GuiInset + Animation.Drop) / Scale,
                }
            end

            local ApplyButtonSize = function(ButtonScale)
                Items["RealDropdownOutline"].Instance.Size = UDim2.fromOffset(
                    math.round(ButtonBaseSize.X * ButtonScale),
                    math.round(ButtonBaseSize.Y * ButtonScale)
                )
            end

            local SetOptionZIndex = function(Bool)
                local Descendants = OptionHolder:GetDescendants()
                table.insert(Descendants, OptionHolder)

                for Index, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    if not Params.Parent then
                        Value.ZIndex = Bool and Library.ZIndexOrder.OptionHolder or 1
                    else
                        Value.ZIndex = Bool and Library.ZIndexOrder.OptionHolder + 3 or 1
                    end
                end
            end

            local ApplyButtonVisuals = function(Active)
                local Outline = Library.Theme["Outline"]:Lerp(Library.Theme["Dark Liner"], Active)
                local Background = Library.Theme["Tab"]:Lerp(Library.Theme["Hovered Element"], Active)
                local Icon = Library.Theme["Dark Text"]:Lerp(Library.Theme["Text"], Active)
                local Liner = Library.Theme["Liner"]:Lerp(Library.Theme["Dark Liner"], Active)

                Items["RealDropdownOutline"].Instance.BackgroundColor3 = Outline
                Items["RealDropdown"].Instance.BackgroundColor3 = Background
                Items["Icon"].Instance.ImageColor3 = Icon
                Items["Liner"].Instance.BackgroundColor3 = Liner
            end

            local AnyAnimating = function()
                if Motion.Opened and (Motion.Reveal.Value < 0.998 or not Motion.Reveal:Settled()) then
                    return true
                end

                if Motion.CloseLayout and (Motion.Fade.Value < 0.998 or not Motion.Fade:Settled()) then
                    return true
                end

                if not Motion.ButtonScale:Settled() then
                    return true
                end

                if not Motion.ButtonActive:Settled() then
                    return true
                end

                for Index, OptionData in Dropdown.Options do
                    if not OptionData.Hover:Settled() or not OptionData.Select:Settled() then
                        return true
                    end

                    if Motion.Opened and not OptionData.Reveal:Settled() then
                        return true
                    end
                end

                return false
            end

            local StopMotion, StartMotion

            local StepMotion = function(Delta)
                local Anchor = GetStableAnchor()

                Motion.ButtonScale:Step(Delta)
                ApplyButtonSize(Motion.ButtonScale.Value)

                Motion.ButtonActive:SetTarget((Dropdown.IsOpen or Dropdown.Hovered) and 1 or 0)
                ApplyButtonVisuals(Motion.ButtonActive:Step(Delta))

                if Motion.Opened then
                    Motion.Fade:Set(0, 0)
                    Motion.Reveal:SetTarget(1)
                    Motion.Reveal:Step(Delta, Animation.OpenStiffness)

                    local Reveal = math.clamp(Motion.Reveal.Value, 0, 1)
                    local FullWidth = Anchor.FullWidth
                    local ContentHeight = GetContentHeight()
                    local Height = ContentHeight * Reveal
                    local SizeScale = (1 - Animation.HolderPop) + Animation.HolderPop * Reveal

                    OptionHolder.Size = UDim2.fromOffset(FullWidth * SizeScale, Height * SizeScale)
                    OptionHolder.Position = UDim2.fromOffset(Anchor.AnchorX, Anchor.TopY + Animation.Slide * (1 - Reveal))
                    OptionHolder.BackgroundTransparency = 1 - Reveal

                    Items["OptionOutline"].Instance.Transparency = 1 - Reveal
                    Items["OptionInline"].Instance.Transparency = 1 - Reveal

                    local Count = Dropdown.OptionCount
                    local Span = (Count > 1) and (Animation.Stagger / (Count - 1)) or 0

                    for Index, OptionData in Dropdown.Options do
                        local Begin = (OptionData.Order - 1) * Span
                        local RevealTarget = math.clamp((Motion.Reveal.Value - Begin) / math.max(1 - Animation.Stagger, 0.01), 0, 1)

                        OptionData:Step(Delta, RevealTarget)
                    end
                elseif Motion.CloseLayout then
                    Motion.Fade:SetTarget(1)
                    Motion.Fade:Step(Delta, Animation.CloseStiffness)

                    local Alpha = 1 - math.clamp(Motion.Fade.Value, 0, 1)
                    local Layout = Motion.CloseLayout

                    OptionHolder.Size = UDim2.fromOffset(Layout.FullWidth, Layout.ContentHeight)
                    OptionHolder.Position = UDim2.fromOffset(Layout.AnchorX, Layout.TopY)
                    OptionHolder.BackgroundTransparency = 1 - Alpha

                    Items["OptionOutline"].Instance.Transparency = 1 - Alpha
                    Items["OptionInline"].Instance.Transparency = 1 - Alpha

                    for Index, OptionData in Dropdown.Options do
                        OptionData:Step(Delta, nil, Alpha)
                    end

                    if Motion.Fade:Settled() and Motion.Fade.Value >= 0.998 then
                        Motion.Fade:Set(0, 0)
                        Motion.Reveal:Set(0, 0)
                        Motion.CloseLayout = nil

                        OptionHolder.Size = UDim2.fromOffset(Layout.FullWidth, 0)
                        OptionHolder.Visible = false

                        SetOptionZIndex(false)
                    end
                end

                if not AnyAnimating() then
                    StopMotion()
                end
            end

            StartMotion = function()
                if Motion.Connection then
                    return
                end

                Motion.Connection = Library:Connect(RunService.RenderStepped, function(Delta)
                    StepMotion(math.min(Delta, 1 / 20))
                end)
            end

            StopMotion = function()
                if not Motion.Connection then
                    return
                end

                Motion.Connection:Disconnect()

                local Index = table.find(Library.Connections, Motion.Connection)

                if Index then
                    table.remove(Library.Connections, Index)
                end

                Motion.Connection = nil
            end

            local ValueToken = 0

            local SetValueText = function(Text)
                Text = tostring(Text)

                if Items["Value"].Instance.Text == Text then
                    return
                end

                ValueToken += 1
                local Token = ValueToken

                Items["Value"]:Tween({TextTransparency = 1, Position = UDim2.new(0, 10, 0.5, 3)}, ValueInfo)

                Library:Thread(function()
                    task.wait(ValueInfo.Time)

                    if Token ~= ValueToken then
                        return
                    end

                    Items["Value"].Instance.Text = Text
                    Items["Value"].Instance.Position = UDim2.new(0, 10, 0.5, -3)
                    Items["Value"]:Tween({TextTransparency = 0, Position = UDim2.new(0, 10, 0.5, 0)}, ValueInfo)
                end)
            end

            local ApplyButtonColors = function()
                Motion.ButtonActive:SetTarget((Dropdown.IsOpen or Dropdown.Hovered) and 1 or 0)
                StartMotion()
            end

            local PulseButtonScale = function()
                Motion.ButtonScale:Set(0.93, 0)
                Motion.ButtonScale:SetTarget(1)
                StartMotion()
            end

            Dropdown.Hovered = false

            Items["RealDropdown"]:OnHover(function()
                Dropdown.Hovered = true
                ApplyButtonColors()
            end, function()
                Dropdown.Hovered = false
                ApplyButtonColors()
            end)

            function Dropdown:Set(Value)
                if Dropdown.Multi then 
                    if type(Value) ~= "table" then 
                        return
                    end

                    Dropdown.Value = Value

                    for Index, Value in Value do
                        local OptionData = Dropdown.Options[Value]
                         
                        if not OptionData then
                            continue
                        end

                        OptionData.IsSelected = true 
                        OptionData:ToggleState("Active")
                    end

                    Flags[Dropdown.Flag] = Value
                    SetValueText(#Value > 0 and table.concat(Value, ", ") or "...")
                else
                    if not Dropdown.Options[Value] then
                        return
                    end

                    local OptionData = Dropdown.Options[Value]

                    Dropdown.Value = Value

                    for Index, Value in Dropdown.Options do
                        if Value ~= OptionData then
                            Value.IsSelected = false 
                            Value:ToggleState("Inactive")
                        else
                            Value.IsSelected = true 
                            Value:ToggleState("Active")
                        end
                    end

                    Flags[Dropdown.Flag] = Value
                    SetValueText(Value)
                end

                Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                StartMotion()
            end

            function Dropdown:Add(Value)
                Dropdown.OptionCount += 1

                local OptionButton = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["OptionHolder"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 25),
                    BorderSizePixel = 0,
                    LayoutOrder = Dropdown.OptionCount,
                })

                local OptionInner = Library:Create("Frame", {
                    Name = "\0",
                    Parent = OptionButton.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                })

                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = OptionInner.Instance,
                    TopLeftRadius = UDim.new(0, 5),
                    TopRightRadius = UDim.new(0, 5),
                    BottomRightRadius = UDim.new(0, 5),
                    BottomLeftRadius = UDim.new(0, 5)
                })
                
                local OptionText = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = OptionInner.Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Value,
                    AnchorPoint = Vector2.new(0, 0.5),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Position = UDim2.new(0, 8, 0.5, 0),
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})

                local OptionData = {
                    Button = OptionButton,
                    Inner = OptionInner,
                    Text = OptionText,
                    Name = Value,
                    Order = Dropdown.OptionCount,
                    IsSelected = false,

                    Hovered = false,
                    Hover = Spring.new(0, Animation.Hover),
                    Select = Spring.new(0, Animation.Select),
                    Reveal = Spring.new(0, Animation.Reveal),
                }

                OptionButton:OnHover(function()
                    OptionData.Hovered = true
                    StartMotion()
                end, function()
                    OptionData.Hovered = false
                    StartMotion()
                end)

                function OptionData:Step(Delta, RevealTarget, CloseAlpha)
                    local HoverTarget = (OptionData.Hovered and Motion.Opened) and 1 or 0

                    OptionData.Hover:SetTarget(HoverTarget)
                    OptionData.Select:SetTarget(OptionData.IsSelected and 1 or 0)

                    local Hover = OptionData.Hover:Step(Delta)
                    local Select = OptionData.Select:Step(Delta)

                    local Emphasis = math.max(Hover, Select)
                    local Fill = math.max(Hover * 0.9, Select)
                    local Inner = OptionData.Inner.Instance
                    local Text = OptionData.Text.Instance

                    if CloseAlpha ~= nil then
                        Inner.Size = UDim2.new(1, 0, 1, 0)
                        Inner.BackgroundColor3 = Library.Theme["Hovered Element"]:Lerp(Library.Theme["Accent"], Select)
                        Inner.BackgroundTransparency = 1 - (Fill * CloseAlpha)

                        Text.TextColor3 = Library.Theme["Text"]:Lerp(Color3.fromRGB(255, 255, 255), Select * 0.65)
                        Text.TextTransparency = 1 - (CloseAlpha * (0.8 + 0.2 * Emphasis))
                        Text.Position = UDim2.new(0, 8 + Animation.Nudge * Emphasis, 0.5, 0)
                        return
                    end

                    OptionData.Reveal:SetTarget(RevealTarget)

                    local Reveal = OptionData.Reveal:Step(Delta)
                    local RowScale = (1 - Animation.OptionPop) + Animation.OptionPop * Reveal

                    Inner.Size = UDim2.new(RowScale, 0, RowScale, 0)
                    Inner.BackgroundColor3 = Library.Theme["Hovered Element"]:Lerp(Library.Theme["Accent"], Select)
                    Inner.BackgroundTransparency = 1 - (Fill * Reveal)

                    Text.TextColor3 = Library.Theme["Text"]:Lerp(Color3.fromRGB(255, 255, 255), Select * 0.65)
                    Text.TextTransparency = 1 - (Reveal * (0.8 + 0.2 * Emphasis))
                    Text.Position = UDim2.new(0, 8 + Animation.Nudge * Emphasis + (1 - Reveal) * 6, 0.5, 0)
                end

                function OptionData:ToggleState(State)
                    OptionData.IsSelected = State == "Active"
                end

                function OptionData:Set()
                    OptionData.IsSelected = not OptionData.IsSelected

                    if Dropdown.Multi then 
                        local Index = table.find(Dropdown.Value, OptionData.Name)

                        if Index then 
                            table.remove(Dropdown.Value, Index)
                        else
                            table.insert(Dropdown.Value, OptionData.Name)
                        end

                        OptionData:ToggleState(Index and "Inactive" or "Active")

                        Flags[Dropdown.Flag] = Dropdown.Value

                        SetValueText(#Dropdown.Value > 0 and table.concat(Dropdown.Value, ", ") or "...")
                    else
                        if OptionData.IsSelected then 
                            Dropdown.Value = OptionData.Name
                            Flags[Dropdown.Flag] = OptionData.Name

                            OptionData.IsSelected = true
                            OptionData:ToggleState("Active")

                            for Index, Value in Dropdown.Options do 
                                if Value ~= OptionData then
                                    Value.IsSelected = false 
                                    Value:ToggleState("Inactive")
                                end
                            end

                            SetValueText(OptionData.Name)
                        else
                            Dropdown.Value = nil
                            Flags[Dropdown.Flag] = nil

                            OptionData.IsSelected = false
                            OptionData:ToggleState("Inactive")

                            SetValueText("...")
                        end
                    end

                    Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                    StartMotion()
                end

                if OptionData.Button then
                    OptionData.Button:Connect("MouseButton1Down", function()
                        Library:SetOpenFrameInteracting(true)
                        OptionData:Set()

                        task.delay(0.08, function()
                            Library:SetOpenFrameInteracting(false)
                        end)
                    end)
                end

                Dropdown.Options[OptionData.Name] = OptionData
                return OptionData
            end

            function Dropdown:Remove(Option)
                if Dropdown.Options[Option] then
                    Dropdown.Options[Option].Button.Instance:Destroy()
                    Dropdown.Options[Option] = nil
                end
            end

            function Dropdown:Refresh(List)
                for Index, Value in Dropdown.Options do 
                    Dropdown:Remove(Value.Name)
                end

                for Index, Value in List do 
                    Dropdown:Add(Value)
                end
            end

            function Dropdown:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Dropdown:SetVisibility(Bool)
                Items["Dropdown"].Instance.Visible = Bool 
            end

            function Dropdown:Get()
                return Dropdown.Value
            end

            function Dropdown:SetOpen(Bool)
                if Dropdown.IsOpen == Bool then
                    return
                end

                Dropdown.IsOpen = Bool
                Motion.Opened = Bool

                PulseButtonScale()

                if Dropdown.IsOpen then
                    Motion.CloseLayout = nil
                    Motion.Fade:Set(0, 0)

                    if Motion.Reveal.Value <= 0.002 then
                        for Index, OptionData in Dropdown.Options do
                            OptionData.Hovered = false
                            OptionData.Hover:Set(0, 0)
                            OptionData.Select:Set(OptionData.IsSelected and 1 or 0, 0)
                            OptionData.Reveal:Set(0, 0)
                        end
                    end

                    SetOptionZIndex(true)

                    OptionHolder.Parent = Library.Holder.Instance
                    OptionHolder.Visible = true

                    Motion.Reveal:SetTarget(1)
                    StartMotion()
                    StepMotion(0)

                    Library:RegisterOpenFrame(Dropdown, {
                        HoverItems = { Items["OptionHolder"], Items["RealDropdown"], Items["RealDropdownInline"], Items["RealDropdownOutline"] },
                        AnchorInstance = RealDropdown,
                        PopupInstance = OptionHolder,
                    })
                else
                    for Index, OptionData in Dropdown.Options do
                        OptionData.Hovered = false
                        OptionData.Hover:SetTarget(0)
                    end

                    local Anchor = GetStableAnchor()

                    Motion.CloseLayout = {
                        FullWidth = Anchor.FullWidth,
                        ContentHeight = GetContentHeight(),
                        AnchorX = Anchor.AnchorX,
                        TopY = Anchor.TopY,
                    }

                    Motion.Reveal:Set(1, 0)
                    Motion.Fade:Set(0, 0)
                    Motion.Fade.Velocity = math.max(Motion.Fade.Velocity, Animation.CloseKick)
                    Motion.Fade:SetTarget(1)

                    Library:CloseOpenFrameChildren(Dropdown)
                    Library:UnregisterOpenFrame(Dropdown)
                    StartMotion()
                end

                ApplyButtonColors()
            end

            Items["OptionHolder"]:VisibleCheck()

            Library:RegisterOpenFrameTrigger(Items["RealDropdown"])

            local ToggleDropdown = function()
                Library:SetOpenFrameInteracting(true)
                Dropdown:SetOpen(not Dropdown.IsOpen)

                task.delay(0.05, function()
                    Library:SetOpenFrameInteracting(false)
                end)
            end

            Items["RealDropdown"]:Connect("MouseButton1Down", ToggleDropdown)
            Items["RealDropdownInline"]:Connect("MouseButton1Down", ToggleDropdown)
            Items["RealDropdownOutline"]:Connect("MouseButton1Down", ToggleDropdown)

            for Index, Value in Dropdown.OptionItems do 
                Dropdown:Add(Value)
            end

            Items["Value"].Instance.Text = "..."

            Dropdown:Set(Dropdown.Default)

            SetFlags[Dropdown.Flag] = function(Value)
                Dropdown:Set(Value)
            end

            Library:RegisterSearchable({
                Name = Dropdown.Name,
                Kind = "Dropdown",
                Page = Dropdown.Page,
                Window = Dropdown.Window,
                GetInstance = function()
                    return Items["Dropdown"] and Items["Dropdown"].Instance
                end,
            })

            return Dropdown
        end

        Library.Dropdown = Library.Sections.Dropdown

        Library.Sections.Label = function(Self, Params)
            Params = Params or { }

            local Label = {
                Name = Params.Name or Params.name or "Label",
                Description = Params.Description or Params.description or "",

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Items = { }
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Label"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 30),
                    BorderSizePixel = 0
                })
                
                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Label"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Label.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Label"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Label.Name,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["SubElements"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Label"].Instance,
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 0, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                })
                
                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["SubElements"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })                

                Label.Items = Items 
            end

            function Label:SetVisibility(Bool)
                Items["Label"].Instance.Visible = Bool 
            end

            function Label:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Label:Colorpicker(Data)
                Data = Data or { }

                local Colorpicker = {
                    Flag = Data.Flag or Data.flag or (Data.Name or Data.name or Label.Name),
                    Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                    Callback = Data.Callback or Data.callback or function() end,
                    Alpha = Data.Alpha or Data.alpha or 0,

                    Window = Label.Window,
                    Page = Label.Page,
                    Section = Label.Section,
                }

                local NewColorpicker, ColorpickerItems = Library:CreateColorpicker({
                    Parent = Items["SubElements"],
                    Page = Colorpicker.Page,
                    Section = Colorpicker.Section,
                    Flag = Colorpicker.Flag,
                    Default = Colorpicker.Default,
                    Callback = Colorpicker.Callback,
                    Alpha = Colorpicker.Alpha
                })

                return NewColorpicker
            end

            function Label:Keybind(Data)
                Data = Data or { }

                local Keybind = {
                    Name = Data.Name or Data.name or Label.Name,
                    Flag = Data.Flag or Data.flag or (Data.Name or Data.name or Label.Name),
                    Default = Data.Default or Data.default or Enum.KeyCode.E,
                    Callback = Data.Callback or Data.callback or function() end,
                    Mode = Data.Mode or Data.mode or "Toggle",

                    Window = Label.Window,
                    Page = Label.Page,
                    Section = Label.Section,
                }

                local NewKeybind, KeybindItems = Library:CreateKeybind({
                    Parent = Items["SubElements"],
                    Name = Keybind.Name,
                    Page = Keybind.Page,
                    Section = Keybind.Section,
                    Flag = Keybind.Flag,
                    Default = Keybind.Default,
                    Mode = Keybind.Mode,
                    Callback = Keybind.Callback
                })

                return NewKeybind
            end

            Label:SetText(Label.Name)

            Library:RegisterSearchable({
                Name = Label.Name,
                Kind = "Label",
                Page = Label.Page,
                Window = Label.Window,
                GetInstance = function()
                    return Items["Label"] and Items["Label"].Instance
                end,
            })

            return Label
        end

        Library.Label = Library.Sections.Label

        Library.Sections.Textbox = function(Self, Params)
            Params = Params or { }

            local Textbox = {
                Name = Params.Name or Params.name or "Textbox",
                Description = Params.Description or Params.description or "",
                Flag = Library:ResolveFlag(Params.Flag or Params.flag, Params.Name or Params.name),
                Default = Params.Default or Params.default or "",
                Callback = Params.Callback or Params.callback or function() end,
                Finished = Params.Finished or Params.finished or false,
                Placeholder = Params.Placeholder or Params.placeholder or "",
                Numeric = Params.Numeric or Params.numeric or false,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,
                Value = "",

                Items = { },
            }

            local Parent = ElementParent(Self, Params)

            local Items = { } do 
                Items["Textbox"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                    BorderSizePixel = 0
                })
                
                Items["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Textbox"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = Textbox.Description,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Textbox"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Textbox.Name,
                    Position = UDim2.new(0, 0, 0, 2),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                Items["BackgroundOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Textbox"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 114, 0, 32),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["BackgroundOutline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["BackgroundOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["BackgroundInline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["BackgroundOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["BackgroundInline"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["BackgroundInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                Items["Background"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["BackgroundInline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Size = UDim2.new(1, 0, 1, 0),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    ClipsDescendants = true,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    TopLeftRadius = UDim.new(0, 6),
                    TopRightRadius = UDim.new(0, 6),
                    BottomRightRadius = UDim.new(0, 6),
                    BottomLeftRadius = UDim.new(0, 6)
                })
                
                Items["Input"] = Library:Create("TextBox", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Background"].Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    PlaceholderColor3 = Library.Theme["Dark Text"],
                    PlaceholderText = Textbox.Placeholder,
                    Size = UDim2.new(1, -20, 0, 0),
                    TextColor3 = Library.Theme["Text"],
                    Text = "",
                    Position = UDim2.new(0, 10, 0.5, 0),
                    CursorPosition = -1,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    ClearTextOnFocus = false,
                    AutomaticSize = Enum.AutomaticSize.Y
                }):AddToTheme({TextColor3 = 'Text'})                

                Textbox.Items = Items
            end

            Items["Background"]:OnHover(function()
                Items["Background"]:Tween({BackgroundColor3 = Library.Theme["Hovered Element"]})
            end, function()
                Items["Background"]:Tween({BackgroundColor3 = Library.Theme.Element})
            end)

            function Textbox:SetVisibility(Bool)
                Items["Textbox"].Instance.Visible = Bool
            end

            function Textbox:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Textbox:Set(Value)
                if Textbox.Numeric then
                    if (not tonumber(Value)) and string.len(tostring(Value)) > 0 then
                        Value = Textbox.Value
                    end
                end

                Textbox.Value = Value
                Items["Input"].Instance.Text = Value
                Flags[Textbox.Flag] = Value

                Library:SafeCall(Textbox.Callback, Value)
            end

            if Textbox.Finished then 
                Items["Input"]:Connect("FocusLost", function(PressedEnterQuestionMark)
                    if PressedEnterQuestionMark then
                        Textbox:Set(Items["Input"].Instance.Text)
                    end
                end)
            else
                Library:Connect(Items["Input"].Instance:GetPropertyChangedSignal("Text"), function()
                    Textbox:Set(Items["Input"].Instance.Text)
                end)
            end

            Textbox:Set(Textbox.Default)

            SetFlags[Textbox.Flag] = function(Value)
                Textbox:Set(Value)
            end

            function Textbox:Get()
                return Textbox.Value
            end

            Library:RegisterSearchable({
                Name = Textbox.Name,
                Kind = "Textbox",
                Page = Textbox.Page,
                Window = Textbox.Window,
                GetInstance = function()
                    return Items["Textbox"] and Items["Textbox"].Instance
                end,
            })
            
            return Textbox
        end

        Library.Textbox = Library.Sections.Textbox

        Library.Sections.Divider = function(Self)
            local Items = { } do 
                Items["Divider"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Self.Items.Content.Instance,
                    Size = UDim2.new(1, 0, 0, 5),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Divider"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })
                
                Items["Divider2"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Divider"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = Items["Divider2"].Instance,
                    TopLeftRadius = UDim.new(1, 0),
                    TopRightRadius = UDim.new(1, 0),
                    BottomRightRadius = UDim.new(1, 0),
                    BottomLeftRadius = UDim.new(1, 0)
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Divider"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
            end
            
            return Items
        end

        Library.Divider = Library.Sections.Divider
    end

    Library.CreateConfigsPage = function(Self)
        local Window = Self.MainWindow

        if not Window then
            warn("[Farcal] Library.CreateConfigsPage requires a window")
            return
        end

        local Page = Window:Page({ Name = "Config" })
        local Configs = { }

        local Column = Page.ColumnsData[1]

        local Items = { } do
            Items["Top"] = Library:Create("Frame", {
                Name = "\0",
                Parent = Column.Instance,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 36),
                BorderSizePixel = 0
            })
            
            Items["Textbox"] = Library:Create("Frame", {
                Name = "\0",
                Parent = Items["Top"].Instance,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -250, 0, 36),
                BorderSizePixel = 0
            })
            
            Items["BackgroundOutline"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["Textbox"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Outline"]
            }):AddToTheme({BackgroundColor3 = 'Outline'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["BackgroundOutline"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["BackgroundOutline"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["BackgroundInline"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["BackgroundOutline"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Hovered Element"]
            }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["BackgroundInline"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["BackgroundInline"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["Background"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["BackgroundInline"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                AnchorPoint = Vector2.new(1, 0.5),
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(1, 0, 0.5, 0),
                ClipsDescendants = true,
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Tab"]
            }):AddToTheme({BackgroundColor3 = 'Tab'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["Background"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Items["Input"] = Library:Create("TextBox", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["Background"].Instance,
                AnchorPoint = Vector2.new(0, 0.5),
                PlaceholderColor3 = Library.Theme["Dark Text"],
                PlaceholderText = "Config name",
                Size = UDim2.new(1, -44, 0, 0),
                TextColor3 = Library.Theme["Text"],
                Text = "",
                Position = UDim2.new(0, 36, 0.5, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                ClearTextOnFocus = false,
                AutomaticSize = Enum.AutomaticSize.Y
            }):AddToTheme({TextColor3 = 'Text'})
            
            Items["Icon"] = Library:Create("ImageLabel", {
                Name = "\0",
                Parent = Items["Background"].Instance,
                AnchorPoint = Vector2.new(0, 0.5),
                Image = "rbxassetid://128929250291967",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 8, 0.5, 0),
                Size = UDim2.new(0, 18, 0, 18),
                BorderSizePixel = 0
            })
            
            Library:Create("UIListLayout", {
                Name = "\0",
                Parent = Items["Top"].Instance,
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            Items["CreateButtonOutline"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["Top"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.new(0, 198, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Outline"]
            }):AddToTheme({BackgroundColor3 = 'Outline'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["CreateButtonOutline"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Items["CreateButtonInline"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["CreateButtonOutline"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Hovered Element"]
            }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["CreateButtonInline"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["CreateButtonInline"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["CreateButton"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["CreateButtonInline"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Tab"]
            }):AddToTheme({BackgroundColor3 = 'Tab'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["CreateButton"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["CreateButton"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["Text"] = Library:Create("TextLabel", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["CreateButton"].Instance,
                TextColor3 = Library.Theme["Text"],
                Text = "Create",
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 34, 0.5, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY
            }):AddToTheme({TextColor3 = 'Text'})
            
            Library:Create("UIStroke", {
                Name = "\0",
                Parent = Items["Text"].Instance,
                Color = Library.Theme["Outline"]
            }):AddToTheme({Color = 'Outline'})
            
            Items["CreateIcon"] = Library:Create("ImageLabel", {
                Name = "\0",
                Parent = Items["CreateButton"].Instance,
                AnchorPoint = Vector2.new(0, 0.5),
                Image = "rbxassetid://114990803404821",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 8, 0.5, 0),
                Size = UDim2.new(0, 18, 0, 18),
                BorderSizePixel = 0
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["CreateButtonOutline"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["SortButtonOutline"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["Top"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.new(0, 36, 0, 36),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Outline"]
            }):AddToTheme({BackgroundColor3 = 'Outline'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["SortButtonOutline"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Items["SortButtonInline"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["SortButtonOutline"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Hovered Element"]
            }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["SortButtonInline"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["SortButtonInline"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["Sort"] = Library:Create("TextButton", {
                Name = "\0",
                FontFace = Library.Font,
                TextSize = Library.FontSize,
                Parent = Items["SortButtonInline"].Instance,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Theme["Tab"]
            }):AddToTheme({BackgroundColor3 = 'Tab'})
            
            Library:Create("UICorner", {
                Name = "\0",
                Parent = Items["Sort"].Instance,
                TopLeftRadius = UDim.new(0, 6),
                TopRightRadius = UDim.new(0, 6),
                BottomRightRadius = UDim.new(0, 6),
                BottomLeftRadius = UDim.new(0, 6)
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["Sort"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })
            
            Items["SortIcon"] = Library:Create("ImageLabel", {
                Name = "\0",
                Parent = Items["Sort"].Instance,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = "rbxassetid://137011891205820",
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(0, 18, 0, 18),
                BorderSizePixel = 0
            })
            
            Library:Create("UIPadding", {
                Name = "\0",
                Parent = Items["SortButtonOutline"].Instance,
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1)
            })

            Items["ConfigsHolder"] = Library:Create("ScrollingFrame", {
                Name = "\0",
                Parent = Column.Instance,
                ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                Active = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 0,
                Size = UDim2.new(1, 0, 1, -44),
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 44),
                BorderSizePixel = 0,
                CanvasSize = UDim2.new(0, 0, 0, 0)
            })
            
            Library:Create("UIListLayout", {
                Name = "\0",
                Parent = Items["ConfigsHolder"].Instance,
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        end

        local AddHover = function(Item, Orig, Color)
            local ThemeKey = Library.Theme[Orig]
            local HoverThemeKey = Library.Theme[Color]

            if not ThemeKey or not HoverThemeKey then
                return
            end

            Item:OnHover(function()
                Item:Tween({ BackgroundColor3 = HoverThemeKey })
            end, function()
                Item:Tween({ BackgroundColor3 = ThemeKey })
            end)
        end

        AddHover(Items["Background"], "Tab", "Hovered Element")
        AddHover(Items["CreateButton"], "Tab", "Hovered Element")
        AddHover(Items["Sort"], "Tab", "Hovered Element")

        local AutoloadPath = Library.Directory .. "/autoload.txt"
        local SortMode = "Earliest"
        local ActiveEdit = nil
        local LoadedConfig = nil

        local SortLabels = {
            AZ = "Sort by A-Z",
            Oldest = "Sort by Oldest",
            Earliest = "Sort by Earliest",
        }

        local LoadIcon = "rbxassetid://132186280705627"
        local LoadedIcon = "rbxassetid://76906989312177"

        local ClickInfo = TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local RowFadeInfo = TweenInfo.new(Library.Animation.Time * 0.55, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection.Out)
        local RowSizeInfo = TweenInfo.new(Library.Animation.Time * 0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        local RowDeleteInfo = TweenInfo.new(Library.Animation.Time * 0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local EditInfo = TweenInfo.new(Library.Animation.Time * 0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        local RowSize = UDim2.new(1, 0, 0, 50)
        local RowHiddenSize = UDim2.new(1, 0, 0, 0)

        local FormatTime = function(Stamp)
            return os.date("%I:%M:%S %d/%m/%Y", Stamp or os.time())
        end

        local ReadAutoload = function()
            if isfile(AutoloadPath) then
                return readfile(AutoloadPath) or ""
            end

            return ""
        end

        local WriteAutoload = function(Name)
            writefile(AutoloadPath, Name or "")
        end

        local ReadCreatedAt = function(Name)
            local Path = Library:GetConfigPath(Name)
            local CreatedAt = 0

            if not isfile(Path) then
                return CreatedAt
            end

            local Success, Decoded = pcall(function()
                return HttpService:JSONDecode(readfile(Path))
            end)

            if Success and type(Decoded) == "table" and type(Decoded.__CreatedAt) == "number" then
                CreatedAt = Decoded.__CreatedAt
            end

            return CreatedAt
        end

        local WriteConfigFile = function(Name, CreatedAt)
            local Encoded = Library:GetConfig()

            if not Encoded then
                return false, "encode failed"
            end

            local Success, Decoded = pcall(function()
                return HttpService:JSONDecode(Encoded)
            end)

            if not Success or type(Decoded) ~= "table" then
                return Library:SaveConfig(Name)
            end

            Decoded.__CreatedAt = CreatedAt or os.time()
            writefile(Library:GetConfigPath(Name), HttpService:JSONEncode(Decoded))
            return true
        end

        local RenameConfigFile = function(OldName, NewName)
            if not OldName or OldName == "" or not NewName or NewName == "" then
                return false, "missing name"
            end

            if OldName == NewName then
                return true
            end

            local OldPath = Library:GetConfigPath(OldName)
            local NewPath = Library:GetConfigPath(NewName)

            if not isfile(OldPath) then
                return false, "missing file"
            end

            if isfile(NewPath) then
                return false, "already exists"
            end

            local Success, Result = pcall(function()
                writefile(NewPath, readfile(OldPath))
                delfile(OldPath)
            end)

            if not Success then
                return false, Result
            end

            if ReadAutoload() == OldName then
                WriteAutoload(NewName)
            end

            return true
        end

        local FindConfig = function(Name)
            for Index, Entry in Configs do
                if Entry.Name == Name then
                    return Entry, Index
                end
            end
        end

        local RefreshIndices = function()
            for Index, Entry in Configs do
                Entry.Index = Index

                if Entry.Items and Entry.Items["IndexText"] then
                    Entry.Items["IndexText"].Instance.Text = tostring(Index)
                end

                if Entry.Items and Entry.Items["NewConfigOutline"] then
                    Entry.Items["NewConfigOutline"].Instance.LayoutOrder = Index
                end
            end
        end

        local ApplySort = function(Mode)
            SortMode = Mode or SortMode

            table.sort(Configs, function(A, B)
                if SortMode == "AZ" then
                    return string.lower(A.Name) < string.lower(B.Name)
                end

                if A.CreatedAt == B.CreatedAt then
                    return string.lower(A.Name) < string.lower(B.Name)
                end

                if SortMode == "Oldest" then
                    return A.CreatedAt < B.CreatedAt
                end

                return A.CreatedAt > B.CreatedAt
            end)

            RefreshIndices()
        end

        local AnimateConfigRow = function(Outline, Visible, Callback)
            if not Outline or not Outline.Instance then
                if Callback then
                    Callback()
                end
                return
            end

            local FadeInfo = Visible and RowFadeInfo or RowDeleteInfo
            local SizeInfo = Visible and RowSizeInfo or RowDeleteInfo

            if Visible then
                Outline.Instance.Size = RowHiddenSize
                Outline.Instance.Visible = true
            end

            Outline:Tween({
                Size = Visible and RowSize or RowHiddenSize
            }, SizeInfo)

            Outline:FadeDescendants(Visible, Callback, FadeInfo)
        end

        local WireClick = function(Targets, ScaleAmount, Callback)
            if typeof(Targets) ~= "table" or Targets.Instance then
                Targets = { Targets }
            end

            local Root = Targets[1]
            local Scale = Library:Create("UIScale", {
                Name = "\0",
                Parent = Root.Instance,
                Scale = 1,
            })

            local Pressing = false

            local Activate = function()
                if Pressing then
                    return
                end

                Pressing = true
                Scale.Instance.Scale = ScaleAmount or 0.9
                Scale:Tween({ Scale = 1 }, ClickInfo)
                Library:SafeCall(Callback)

                task.delay(ClickInfo.Time, function()
                    Pressing = false
                end)
            end

            for _, Target in Targets do
                Target:Connect("MouseButton1Down", Activate)
            end
        end

        local SetAccentButton = function(Button, Active, Instant)
            if not Button or not Button.Instance then
                return
            end

            local ThemeName = Active and "Accent" or "Content"
            local Color = Library.Theme[ThemeName]

            Button:ChangeItemTheme({ BackgroundColor3 = ThemeName })

            if Instant then
                Button.Instance.BackgroundColor3 = Color
            else
                Button:Tween({ BackgroundColor3 = Color }, EditInfo)
            end
        end

        local AddAccentHover = function(Button, IsActive)
            Button:OnHover(function()
                if IsActive() then
                    return
                end

                Button:Tween({ BackgroundColor3 = Library.Theme["Hovered Element"] })
            end, function()
                if IsActive() then
                    Button.Instance.BackgroundColor3 = Library.Theme["Accent"]
                    return
                end

                Button:Tween({ BackgroundColor3 = Library.Theme["Content"] })
            end)
        end

        local UpdateAutoloadVisuals = function()
            local Current = ReadAutoload()

            for _, Entry in Configs do
                local Button = Entry.Items and Entry.Items["AutoloadButton"]

                if Button then
                    SetAccentButton(Button, Entry.Name == Current, true)
                end
            end
        end

        local SetLoadVisual = function(Entry, Active, Instant)
            local Button = Entry.Items and Entry.Items["LoadButton"]
            local Icon = Entry.Items and Entry.Items["LoadButtonIcon"]

            if not Button or not Icon or not Icon.Instance then
                return
            end

            local TargetImage = Active and LoadedIcon or LoadIcon

            SetAccentButton(Button, Active, Instant)

            if Icon.Instance.Image == TargetImage then
                return
            end

            if Instant then
                Icon.Instance.Image = TargetImage
                Icon.Instance.ImageTransparency = 0
                return
            end

            Icon.Instance.ImageTransparency = 0
            Icon:Fade("ImageTransparency", false, nil, EditInfo)

            task.delay(EditInfo.Time, function()
                if not Icon.Instance then
                    return
                end

                Icon.Instance.Image = TargetImage
                Icon.Instance.ImageTransparency = 0
                Icon:Fade("ImageTransparency", true, nil, EditInfo)
            end)
        end

        local UpdateLoadedVisuals = function(Instant)
            for _, Entry in Configs do
                SetLoadVisual(Entry, Entry.Name == LoadedConfig, Instant)
            end
        end

        local EndEditName, BeginEditName

        EndEditName = function(Entry, Commit)
            if not Entry or not Entry.Editing then
                return
            end

            local NameLabel = Entry.Items["Text"]
            local NameInput = Entry.Items["NameInput"]
            local OldName = Entry.Name
            local NewName = string.gsub(NameInput.Instance.Text or "", "^%s*(.-)%s*$", "%1")

            Entry.Editing = false
            Entry.EditLock = os.clock() + 0.2

            if ActiveEdit == Entry then
                ActiveEdit = nil
            end

            local ShowLabel = function()
                NameInput.Instance:ReleaseFocus()
                NameInput:Fade("TextTransparency", false, nil, EditInfo)
                Entry.Items["NameInputStroke"]:Fade("Transparency", false, nil, EditInfo)

                NameLabel.Instance.Visible = true
                NameLabel.Instance.TextTransparency = 0
                Entry.Items["TextStroke"].Instance.Transparency = 0
                NameLabel:Fade("TextTransparency", true, nil, EditInfo)
                Entry.Items["TextStroke"]:Fade("Transparency", true, nil, EditInfo)

                task.delay(EditInfo.Time, function()
                    if Entry.Editing or not NameInput.Instance then
                        return
                    end

                    NameInput.Instance.Visible = false
                    NameInput.Instance.Text = Entry.Name
                    NameLabel.Instance.Text = Entry.Name
                end)
            end

            if Commit and NewName ~= "" and NewName ~= OldName then
                local Taken = FindConfig(NewName) or isfile(Library:GetConfigPath(NewName))

                if not Taken and RenameConfigFile(OldName, NewName) then
                    Entry.Name = NewName
                    NameLabel.Instance.Text = NewName
                    NameInput.Instance.Text = NewName

                    if LoadedConfig == OldName then
                        LoadedConfig = NewName
                    end

                    ApplySort(SortMode)
                    UpdateAutoloadVisuals()
                    UpdateLoadedVisuals(true)
                else
                    NameInput.Instance.Text = OldName
                end
            else
                NameInput.Instance.Text = OldName
            end

            ShowLabel()
        end

        BeginEditName = function(Entry)
            if not Entry or Entry.Editing or Entry.Removing then
                return
            end

            if ActiveEdit and ActiveEdit ~= Entry then
                EndEditName(ActiveEdit, true)
            end

            local NameLabel = Entry.Items["Text"]
            local NameInput = Entry.Items["NameInput"]
            local NameInputStroke = Entry.Items["NameInputStroke"]
            local TextStroke = Entry.Items["TextStroke"]

            Entry.Editing = true
            ActiveEdit = Entry

            NameInput.Instance.Text = Entry.Name
            NameInput.Instance.Visible = true
            NameInput.Instance.TextTransparency = 0
            NameInputStroke.Instance.Transparency = 0

            NameLabel:Fade("TextTransparency", false, nil, EditInfo)
            TextStroke:Fade("Transparency", false, nil, EditInfo)
            NameInput:Fade("TextTransparency", true, nil, EditInfo)
            NameInputStroke:Fade("Transparency", true, nil, EditInfo)

            task.delay(EditInfo.Time * 0.35, function()
                if not Entry.Editing or not NameInput.Instance then
                    return
                end

                NameLabel.Instance.Visible = false
                NameInput.Instance:CaptureFocus()
                NameInput.Instance.CursorPosition = #NameInput.Instance.Text + 1
                NameInput.Instance.SelectionStart = 1
            end)
        end

        function Page:CreateConfigInstance(Index, Name, Time, CreatedAt, Animate)
            if FindConfig(Name) then
                return
            end

            local Stamp = CreatedAt or os.time()
            local ShouldAnimate = Animate == true

            local NewCFG = {
                Index = Index or (#Configs + 1),
                Name = Name,
                Time = Time or FormatTime(Stamp),
                CreatedAt = Stamp,
                Editing = false,
                Removing = false,
                Items = { },
            }

            local NewItems = { } do 
                NewItems["NewConfigOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ConfigsHolder"].Instance,
                    Size = ShouldAnimate and RowHiddenSize or RowSize,
                    BorderSizePixel = 0,
                    LayoutOrder = NewCFG.Index,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({BackgroundColor3 = 'Outline'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["NewConfigOutline"].Instance
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = NewItems["NewConfigOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                NewItems["NewConfigInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = NewItems["NewConfigOutline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Hovered Element"]
                }):AddToTheme({BackgroundColor3 = 'Hovered Element'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["NewConfigInline"].Instance
                })
                
                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = NewItems["NewConfigInline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })
                
                NewItems["NewConfig"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = NewItems["NewConfigInline"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Tab"]
                }):AddToTheme({BackgroundColor3 = 'Tab'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["NewConfig"].Instance
                })
                
                NewItems["IndexBackground"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = NewItems["NewConfig"].Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    Size = UDim2.new(0, 30, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({BackgroundColor3 = 'Accent'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["IndexBackground"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                NewItems["IndexText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["IndexBackground"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = tostring(NewCFG.Index),
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextWrapped = true,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = NewItems["IndexText"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                NewItems["Description"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["NewConfig"].Instance,
                    TextColor3 = Library.Theme["Dark Text"],
                    Text = "Created at "..NewCFG.Time,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 50, 1, -8),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Dark Text'})
                
                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = NewItems["Description"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})
                
                NewItems["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["NewConfig"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = NewCFG.Name,
                    Position = UDim2.new(0, 50, 0, 8),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                }):AddToTheme({TextColor3 = 'Text'})
                
                NewItems["TextStroke"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = NewItems["Text"].Instance,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({Color = 'Outline'})

                NewItems["NameInput"] = Library:Create("TextBox", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["NewConfig"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    PlaceholderColor3 = Library.Theme["Dark Text"],
                    PlaceholderText = "Config name",
                    Text = NewCFG.Name,
                    Position = UDim2.new(0, 50, 0, 8),
                    Size = UDim2.new(1, -250, 0, 18),
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    ClearTextOnFocus = false,
                    Visible = false,
                    ZIndex = 2,
                }):AddToTheme({TextColor3 = 'Text'})

                NewItems["NameInputStroke"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = NewItems["NameInput"].Instance,
                    Color = Library.Theme["Outline"],
                    Transparency = 1,
                }):AddToTheme({Color = 'Outline'})
                
                NewItems["Buttons"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = NewItems["NewConfig"].Instance,
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -8, 0.5, 0),
                    Size = UDim2.new(0, 0, 0, 30),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                })
                
                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = NewItems["Buttons"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
                
                NewItems["DeleteButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["Buttons"].Instance,
                    LayoutOrder = 4,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 30, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["DeleteButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                NewItems["DeleteButtonIcon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = NewItems["DeleteButton"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "rbxassetid://117353153820340",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 18, 0, 18),
                    BorderSizePixel = 0
                }):AddToTheme({ImageColor3 = 'Text'})
                
                NewItems["LoadButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["Buttons"].Instance,
                    LayoutOrder = 5,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 30, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["LoadButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                NewItems["LoadButtonIcon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = NewItems["LoadButton"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "rbxassetid://132186280705627",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 18, 0, 18),
                    BorderSizePixel = 0
                }):AddToTheme({ImageColor3 = 'Text'})
                
                NewItems["EditButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["Buttons"].Instance,
                    LayoutOrder = 3,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 30, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["EditButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                NewItems["EditButtonIcon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = NewItems["EditButton"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "rbxassetid://118406197777298",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 18, 0, 18),
                    BorderSizePixel = 0
                }):AddToTheme({ImageColor3 = 'Text'})
                
                NewItems["OverwriteButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["Buttons"].Instance,
                    LayoutOrder = 2,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 30, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["OverwriteButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                NewItems["OverwriteButtonIcon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = NewItems["OverwriteButton"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "rbxassetid://126130413588492",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 18, 0, 18),
                    BorderSizePixel = 0
                }):AddToTheme({ImageColor3 = 'Text'})
                
                NewItems["AutoloadButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = NewItems["Buttons"].Instance,
                    LayoutOrder = 1,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 30, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Content"]
                }):AddToTheme({BackgroundColor3 = 'Content'})
                
                Library:Create("UICorner", {
                    Name = "\0",
                    Parent = NewItems["AutoloadButton"].Instance,
                    TopLeftRadius = UDim.new(0, 4),
                    TopRightRadius = UDim.new(0, 4),
                    BottomRightRadius = UDim.new(0, 4),
                    BottomLeftRadius = UDim.new(0, 4)
                })
                
                NewItems["AutoloadButtonIcon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = NewItems["AutoloadButton"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "rbxassetid://76995227510677",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 18, 0, 18),
                    BorderSizePixel = 0
                }):AddToTheme({ImageColor3 = 'Text'})                
            end

            NewCFG.Items = NewItems

            local IsBusy = function()
                return NewCFG.Removing
            end

            function NewCFG:Remove(Callback)
                if NewCFG.Removing then
                    return
                end

                NewCFG.Removing = true

                if NewCFG.Editing then
                    EndEditName(NewCFG, false)
                end

                AnimateConfigRow(NewItems["NewConfigOutline"], false, function()
                    if NewItems["NewConfigOutline"].Instance then
                        NewItems["NewConfigOutline"].Instance:Destroy()
                    end

                    if Callback then
                        Callback()
                    end
                end)
            end

            WireClick(NewItems["LoadButton"], 0.86, function()
                if IsBusy() then
                    return
                end

                if not Library:LoadConfigFromFile(NewCFG.Name) then
                    return
                end

                LoadedConfig = NewCFG.Name
                UpdateLoadedVisuals()
            end)

            WireClick(NewItems["OverwriteButton"], 0.86, function()
                if IsBusy() then
                    return
                end

                WriteConfigFile(NewCFG.Name, NewCFG.CreatedAt)
            end)

            WireClick(NewItems["DeleteButton"], 0.86, function()
                if IsBusy() then
                    return
                end

                if not Library:DeleteConfig(NewCFG.Name) then
                    return
                end

                if ReadAutoload() == NewCFG.Name then
                    WriteAutoload("")
                end

                if LoadedConfig == NewCFG.Name then
                    LoadedConfig = nil
                end

                local _, Position = FindConfig(NewCFG.Name)

                if Position then
                    table.remove(Configs, Position)
                end

                NewCFG:Remove(function()
                    RefreshIndices()
                    UpdateAutoloadVisuals()
                    UpdateLoadedVisuals(true)
                end)
            end)

            WireClick(NewItems["EditButton"], 0.86, function()
                if IsBusy() then
                    return
                end

                if NewCFG.Editing then
                    NewItems["NameInput"].Instance:ReleaseFocus()
                    return
                end

                if NewCFG.EditLock and os.clock() < NewCFG.EditLock then
                    return
                end

                BeginEditName(NewCFG)
            end)

            NewItems["NameInput"]:Connect("FocusLost", function()
                if NewCFG.Editing then
                    EndEditName(NewCFG, true)
                end
            end)

            WireClick(NewItems["AutoloadButton"], 0.86, function()
                if IsBusy() then
                    return
                end

                WriteAutoload(ReadAutoload() == NewCFG.Name and "" or NewCFG.Name)
                UpdateAutoloadVisuals()
            end)

            AddHover(NewItems["OverwriteButton"], "Content", "Hovered Element")
            AddHover(NewItems["DeleteButton"], "Content", "Hovered Element")
            AddHover(NewItems["EditButton"], "Content", "Hovered Element")
            AddAccentHover(NewItems["LoadButton"], function()
                return LoadedConfig == NewCFG.Name
            end)
            AddAccentHover(NewItems["AutoloadButton"], function()
                return ReadAutoload() == NewCFG.Name
            end)

            table.insert(Configs, NewCFG)

            if ShouldAnimate then
                task.defer(function()
                    AnimateConfigRow(NewItems["NewConfigOutline"], true)
                end)
            end

            return NewCFG
        end

        function Page:CreateConfig()
            local Name = string.gsub(Items["Input"].Instance.Text or "", "^%s*(.-)%s*$", "%1")

            if Name == "" then
                return
            end

            if FindConfig(Name) or isfile(Library:GetConfigPath(Name)) then
                return
            end

            local CreatedAt = os.time()

            if not WriteConfigFile(Name, CreatedAt) then
                return
            end

            Page:CreateConfigInstance(#Configs + 1, Name, FormatTime(CreatedAt), CreatedAt, true)
            ApplySort(SortMode)
            UpdateAutoloadVisuals()
            Items["Input"].Instance.Text = ""
        end

        function Page:RefreshConfigs()
            for Index = #Configs, 1, -1 do
                local Entry = Configs[Index]

                if Entry.Items and Entry.Items["NewConfigOutline"] then
                    Entry.Items["NewConfigOutline"].Instance:Destroy()
                end

                table.remove(Configs, Index)
            end

            for _, Name in Library:GetConfigsList() do
                local CreatedAt = ReadCreatedAt(Name)
                local TimeText = CreatedAt > 0 and FormatTime(CreatedAt) or "Unknown"
                Page:CreateConfigInstance(#Configs + 1, Name, TimeText, CreatedAt, false)
            end

            ApplySort(SortMode)
            UpdateAutoloadVisuals()
            UpdateLoadedVisuals(true)
        end

        local SortMenu = Library:CreateContextMenu({
            Anchor = Items["SortButtonOutline"],
            Width = 160,
        })

        SortMenu:AddOption(SortLabels.AZ, function()
            ApplySort("AZ")
            SortMenu:SetSelected(SortLabels.AZ)
        end)

        SortMenu:AddOption(SortLabels.Oldest, function()
            ApplySort("Oldest")
            SortMenu:SetSelected(SortLabels.Oldest)
        end)

        SortMenu:AddOption(SortLabels.Earliest, function()
            ApplySort("Earliest")
            SortMenu:SetSelected(SortLabels.Earliest)
        end)

        SortMenu:SetSelected(SortLabels.Earliest)

        WireClick({
            Items["CreateButtonOutline"],
            Items["CreateButtonInline"],
            Items["CreateButton"],
        }, 0.92, function()
            Page:CreateConfig()
        end)

        WireClick({
            Items["SortButtonOutline"],
            Items["SortButtonInline"],
            Items["Sort"],
        }, 0.92, function()
            SortMenu:SetOpen(not SortMenu.IsOpen)
        end)

        Items["Input"]:Connect("FocusLost", function(EnterPressed)
            if EnterPressed then
                Page:CreateConfig()
            end
        end)

        Page:RefreshConfigs()

        local AutoloadName = ReadAutoload()

        if AutoloadName ~= "" and isfile(Library:GetConfigPath(AutoloadName)) then
            if Library:LoadConfigFromFile(AutoloadName) then
                LoadedConfig = AutoloadName
                UpdateLoadedVisuals(true)
            end
        end

        Library.ConfigsPage = Page
        return Page
    end

    Library.Init = function(Self)
        local Window = Self.MainWindow

        if not Window then
            warn("[Farcal] Library.Init requires a window")
            return
        end

        if Self.SettingsPage then
            return Self.SettingsPage
        end

        Window:CreateConfigsPage()

        local Settings = Window:Page({ Name = "Settings" })
        Self.SettingsPage = Settings

        local ThemeSection = Settings:Section({ Name = "Theming", Side = 1, IsSettings = true })
        local MenuSection = Settings:Section({ Name = "Menu", Side = 1, IsSettings = true })

        do -- Theming
            ThemeSection:Label({
                Name = "Accent",
            }):Colorpicker({
                Name = "Accent",
                Flag = "Settings_Theme_Accent",
                Default = Self.Theme["Accent"],
                Callback = function(Color)
                    Self:ChangeTheme("Accent", Color)
                end,
            })
        end

        do -- Menu
            MenuSection:Label({
                Name = "Menu Keybind",
                Description = "toggle the main window",
            }):Keybind({
                Name = "Menu Keybind",
                Flag = "Settings_MenuKeybind",
                Default = Enum.KeyCode.X,
                Mode = "Toggle",
                Callback = function()
                    local Data = Self.Flags["Settings_MenuKeybind"]

                    if type(Data) == "table" and Data.Key and Data.Key ~= "" and Data.Key ~= "None" then
                        Self.MenuKeybind = tostring(Data.Key)
                    end
                end,
            })

            MenuSection:Toggle({
                Name = "Force Mobile",
                Description = "force mobile UI scaling",
                Default = Self.ForceMobile,
                Flag = "Settings_ForceMobile",
                Callback = function(Value)
                    Self.ForceMobile = Value and true or false
                end,
            })

            if Self.WatermarkInstance then
                MenuSection:Toggle({
                    Name = "Watermark",
                    Description = "show the watermark",
                    Default = true,
                    Flag = "Settings_Watermark",
                    Callback = function(Value)
                        local Root = Self.WatermarkInstance.Items and Self.WatermarkInstance.Items["Watermark"]
                        if Root and Root.Instance then
                            Root.Instance.Visible = Value and true or false
                        end
                    end,
                })

                MenuSection:Toggle({
                    Name = "Join Notifier",
                    Description = "show joins on the watermark",
                    Default = false,
                    Flag = "Settings_JoinNotifier",
                    Callback = function(Value)
                        if Self.WatermarkInstance.SetJoinNotifier then
                            Self.WatermarkInstance:SetJoinNotifier(Value)
                        end
                    end,
                })
            end
        end

        return Settings
    end
end

getgenv().FarcalLibrary = Library
return Library
