# Get the Corners of a BasePart

## Table of Contents

* [Get the Corners of a normal Part](#get-the-corners-of-a-normal-part)

## Get the Corners of a normal Part
In this tutorial I will deal with getting the corners of a part. These can be used for many other things, for example to control a part into a certain region without using the function game.Workspace:FindPartInRegion3(). Let's start now. To get the parts to a non-rotating part you need a formula. For this it is better to paint a skize. Here is what I painted (I'm not an artist so please no criticism):

In this skize you can see how you can get all the corners of a normal part. The technique is to use vectors, just being able to read a bit, turn everything into vectors and there you have it!

The result is this:

![UnRotatedPart](imgs/GetCornersOfPart/UnRotatedPart.gif)

```Lua
local Parent = script.Parent
local Position = Parent.CFrame
local Size = Parent.Size

local PartA = Instance.new("Part", workspace)
local PartB = Instance.new("Part", workspace)
local PartC = Instance.new("Part", workspace)
local PartD = Instance.new("Part", workspace)
local PartE = Instance.new("Part", workspace)
local PartF = Instance.new("Part", workspace)
local PartG = Instance.new("Part", workspace)
local PartH = Instance.new("Part", workspace)


PartA.Name = "A"
PartB.Name = "B"
PartC.Name = "C"
PartD.Name = "D"
PartE.Name = "E"
PartF.Name = "F"
PartG.Name = "G"
PartH.Name = "H"


PartA.CanCollide = false
PartB.CanCollide = false
PartC.CanCollide = false
PartD.CanCollide = false
PartE.CanCollide = false
PartF.CanCollide = false
PartG.CanCollide = false
PartH.CanCollide = false


PartA.Anchored = true
PartB.Anchored = true
PartC.Anchored = true
PartD.Anchored = true
PartE.Anchored = true
PartF.Anchored = true
PartG.Anchored = true
PartH.Anchored = true


PartA.Size = Vector3.new(1,1,1)
PartB.Size = Vector3.new(1,1,1)
PartC.Size = Vector3.new(1,1,1)
PartD.Size = Vector3.new(1,1,1)
PartE.Size = Vector3.new(1,1,1)
PartF.Size = Vector3.new(1,1,1)
PartG.Size = Vector3.new(1,1,1)
PartH.Size = Vector3.new(1,1,1)


PartA.CFrame = CFrame.new(Position.Position + Vector3.new(-Size.X/2, Size.Y/2, -Size.Z/2))
PartB.CFrame = CFrame.new(Position.Position + Vector3.new(-Size.X/2, Size.Y/2, Size.Z/2))
PartC.CFrame = CFrame.new(Position.Position - Size/2)
PartD.CFrame = CFrame.new(Position.Position + Vector3.new(Size.X/2 , -Size.Y/2 , Size.Z/2))
PartE.CFrame = CFrame.new(Position.Position + Vector3.new(Size.X/2 , -Size.Y/2 , -Size.Z/2))
PartF.CFrame = CFrame.new(Position.Position + Vector3.new(Size.X/2 , Size.Y/2 , -Size.Z/2))
PartG.CFrame = CFrame.new(Position.Position + Size/2)
PartH.CFrame = CFrame.new(Position.Position + Vector3.new(-Size.X/2 , -Size.Y/2 , Size.Z/2))
```

Yes, it works, but it still remains a problem:



As you can see, if our part turns, our corners don't position themselves where they should and this can lead to unwanted results. But you have to use CFrames to transform the corners in the object space, as it says in the [wiki](https://developer.roblox.com/en-us/api-reference/datatype/CFrame) we just have to multiply the two CFrames and the final result:
