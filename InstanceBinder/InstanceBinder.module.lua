-- Madonox
-- 2022

local InstanceBinder = {}
local isLoaded = false
local libraries = {}

function InstanceBinder.init()
	if isLoaded == false then
		isLoaded = true
		for _,v in ipairs(script.Parent.Libraries:GetChildren()) do
			local ref = require(v)
			if typeof(ref) == "table" then
				if ref.init then
					ref.init()
				end
			end
			libraries[v.Name] = ref
		end
		
		local UpdateData = require(9040261328)
		if UpdateData.getData("InstanceBinder",script.Parent.Resources.CurrentBuild.Value) == false then
			warn("InstanceBinder is outdated!  Please check the devforum to get the latest version!")
		end
	end
end
function InstanceBinder.readProperty(ins,propertyName)
	local class = libraries.InstanceReference.get(ins)
	if class then
		local ref = class[propertyName]
		if typeof(ref) ~= "function" then
			return class[propertyName]
		else
			warn("Cannot read property ["..propertyName.."], type is function.")
		end
	else
		warn("Cannot get instance data.")
	end
end
function InstanceBinder.callFunction(ins,functionName,...)
	local class = libraries.InstanceReference.get(ins)
	if class then
		local ref = class[functionName]
		if typeof(ref) == "function" then
			return class[functionName](...)
		else
			warn("Cannot read property ["..functionName.."], type is not function.")
		end
	else
		warn("Cannot get instance data.")
	end
end
function InstanceBinder.get(ins)
	return libraries.InstanceReference.get(ins)
end

function InstanceBinder.createClass(name,class)
	libraries.ClassReference.createClass(name,class)
end

function InstanceBinder.extends(ins,className)
	local _class = libraries.ClassReference.getClass(className)
	
	if _class then
		local class = _class.new(ins)
		libraries.InstanceReference.register(ins,class)
		return class
	end
end

return InstanceBinder
