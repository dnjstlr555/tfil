local acl = AddCSLuaFile
local inc = include
local sp = SortedPairs
local ff = file.Find
local string = string

function IncludeDirectory(dir, cl, sv )
	cl, sv = cl or "cl", sv or "sv"	local state
	local files, folders = ff(dir .. "/*", "LUA")

	for _, file in sp(files) do
		if string.StartWith( file, cl ) then
			acl( dir .. "/" .. file )
			if CLIENT then
				inc( dir .. "/" .. file )
			end
		elseif string.StartWith( file, sv ) then
			inc( dir .. "/" .. file )
		else
			acl( dir .. "/" .. file )
			inc( dir .. "/" .. file )
		end
	end

	for _, folder in sp(folders) do
		IncludeDirectory(dir .. "/" .. folder )
	end
end

IncludeDirectory("tfil/gamemode/libraries")
IncludeDirectory("tfil/gamemode/core")
IncludeDirectory("tfil/gamemode/modules")