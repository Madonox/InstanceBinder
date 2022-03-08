-- Madonox
-- 2022

local ClassReference = {}
ClassReference.classes = {}

function ClassReference.createClass(name,class)
	if typeof(class) == "table" then
		if class.new then
			if not ClassReference.classes[name] then
				ClassReference.classes[name] = class
			else
				warn("Cannot overwrite a pre-existing class.")
			end
		else
			warn("Class must contain a new function.")
		end
	else
		warn("Class must be a table.")
	end
end
function ClassReference.getClass(name)
	return ClassReference.classes[name]
end

return ClassReference
