-- Madonox
-- 2022

local InstanceReference = {}
InstanceReference.ref = {}

function InstanceReference.register(ins:Instance,class)
	if not InstanceReference.ref[ins] then
		InstanceReference.ref[ins] = class
		ins.Destroying:Connect(function()
			if class.Destroy then
				class:Destroy()
			end
		end)
	else
		warn("Cannot overwrite instance class.")
	end
end
function InstanceReference.get(ins:Instance)
	if InstanceReference.ref[ins] then
		return InstanceReference.ref[ins]
	end
end

return InstanceReference
