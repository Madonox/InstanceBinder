
# InstanceBinder

## What is it?

InstanceBinder is an open-source module for Roblox made by Madonox.  The module allows you to attach metatables to instances.

## Installation
In order to install InstanceBinder, simply insert the [model](https://www.roblox.com/library/9048155124/InstanceBinder) into your game and require the main module by doing:
```lua
local InstanceBinder = require(path.to.folder.InstanceBinder.InstanceBinder)
```

## Documentation

InstanceBinder is a complex module, so a documentation would be needed.  Below is a documentation of all the functions, and their arguments.

| Function | Argument(s) | Purpose |
|--|--| -- |
| init | [none] | Initializes the module, loads libraries, checks for updates, etc.
| get | instance:Instance | Fetch the metatable for said instance.
| callFunction | instance:Instance, functionName:String, ... | Call a function from said instance (from metatable).
| getProperty | instance:Instance, propertyName:String | Returns the property from supplied instance (from metatable).
| createClass | className:String, class:Table(metatable) | Register a class.
| extends | instance:Instance, className:String | Construct an instance with a specified class (class must be constructed using createClass).

### Usage tutorial:

The code below will be a sort of demo for using the module.

In order to begin using the module, we must first require and initialize it.
```lua
local InstanceBinder = require(game.ReplicatedStorage.InstanceBinder.InstanceBinder)

InstanceBinder.init() -- Initialize the module.
```

Now that the module is required and initialized, we can now begin interacting with it.
```lua
InstanceBinder.createClass("Test",require(script.Test)) -- the script.Test refers to a modulescript containing an OOP table (metatable).
```

Now that we have registered out class, we can begin constructing instances with it!

```lua
local Class = InstanceBinder.get(workspace.Part) -- Get the class.

  

print(InstanceBinder.readProperty(workspace.Part,"part").Name) -- Use the built-in methods.

  

InstanceBinder.callFunction(workspace.Part,"Fire") -- Use the built-in methods.

  

Class:Fire() -- Use the Class methods.
```

And that's it for our demo!  If you have any questions, do not hesitate to message me on the devforum!
