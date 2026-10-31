-- Repo file access. Remote by default, executor workspace when YenLocalRoot is set (dev mode)

local Import = {
	Base = "https://raw.githubusercontent.com/vbbi33jkllljcvvbjkqw89fjjkjhkjzsdaih/yen-hub/main/",
	LocalRoot = getgenv().YenLocalRoot,
	Sources = {},
	Chunks = {},
}

local function Fetch(Path)
	local Last

	for Attempt = 1, 2 do
		local Ok, Result = pcall(function()
			if Import.LocalRoot then
				return readfile(Import.LocalRoot .. Path)
			end

			return game:HttpGet(Import.Base .. Path)
		end)

		if Ok and type(Result) == "string" and Result ~= "" then
			return Result
		end

		Last = Result
		task.wait(0.4 * Attempt)
	end

	error("[Yen] could not load " .. Path .. ": " .. tostring(Last), 0)
end

function Import.Source(Path)
	local Source = Import.Sources[Path]

	if not Source then
		Source = Fetch(Path)
		Import.Sources[Path] = Source
	end

	return Source
end

function Import.Binary(Path)
	return Fetch(Path)
end

-- Compiles once per path, then every call runs a fresh copy of the chunk
function Import.Load(Path, ...)
	local Chunk = Import.Chunks[Path]

	if not Chunk then
		local Compiled, Err = loadstring(Import.Source(Path), "=" .. Path)

		if not Compiled then
			Import.Sources[Path] = nil
			error("[Yen] " .. Path .. ": " .. tostring(Err), 0)
		end

		Chunk = Compiled
		Import.Chunks[Path] = Chunk
	end

	return Chunk(Import, ...)
end

-- Downloads a binary once into the workspace, re-downloads if the header does not match
function Import.Asset(Path, Target, Magic)
	local Cached = isfile(Target) and readfile(Target) or ""

	if string.sub(Cached, 1, #Magic) ~= Magic then
		writefile(Target, Import.Binary(Path))
	end

	if string.sub(readfile(Target), 1, #Magic) ~= Magic then
		error("[Yen] " .. Path .. " is not a valid file", 0)
	end

	return getcustomasset(Target)
end

-- Nothing in Yen writes to the console. Problems go here and are shown in the UI

Import.Errors = {}

function Import.Report(Context, Message)
	local Errors = Import.Errors

	if #Errors >= 100 then
		table.remove(Errors, 1)
	end

	table.insert(Errors, string.format("[%s] %s", tostring(Context), tostring(Message)))
end

function Import.Notify(Text)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Yen", Text = Text, Duration = 6 })
	end)
end

function Import.Safe(Context, Callback)
	return function(...)
		local Ok, Err = pcall(Callback, ...)

		if not Ok then
			Import.Report(Context, Err)
		end
	end
end

pcall(function()
	for _, Folder in { "YenHub", "YenHub/Assets" } do
		if not isfolder(Folder) then
			makefolder(Folder)
		end
	end
end)

return Import
