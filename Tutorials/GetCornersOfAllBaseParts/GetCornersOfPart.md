# Get the Corners of a BasePart

## Table of Contents

* [Get the Corners of a normal Part](#get-the-corners-of-a-normal-part)
    * [Edit 1 We make our script shorter and more readable](#edit-1-we-make-our-script-shorter-and-more-readable)
    * [Edit 2 We use tables and the tipps of the replys](#edit-2-we-use-tables-and-the-tipps-of-the-replys)
	* [Edit3](#edit-3)

## Get the Corners of a normal Part
In this tutorial I will deal with getting the corners of a part. These can be used for many other things, for example to control a part into a certain region without using the function game.Workspace:FindPartInRegion3(). Let's start now. In this tutorial each corner is represented by a part which is 1x1x1. So you can see if the corner is really there where it should be. To get the corners of a non-rotating part you need a formula. For this it is better to paint a sketch. Here is what I painted (I'm not an artist so please no criticism):

![Sketch](imgs/GetCornersOfPart/Sketch.png)

In this sketch you can see how you can get all the corners of a normal part. The technique is to use vectors, just being able to read a bit, turn everything into vectors and there you have it!

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

![RotatedWithoutCFramePart](imgs/GetCornersOfPart/RotatedWithoutCFramePart.gif)

As you can see, if our part turns, our corners don't position themselves where they should and this can lead to unwanted results. This part was the hardest, but could be solved with the help of [Elcore](https://devforum.roblox.com/u/elocore/summary) (I asked [here](https://devforum.roblox.com/t/cframe-toobjectspace-does-not-really-work/443293) for help). To solve this problem you need to use CFrames to transform the CFrame of the corners of the part in the object space, as it says in the [wiki](https://developer.roblox.com/en-us/api-reference/datatype/CFrame) we just have to multiply the two CFrames and the final result:

![RotatedWithCFrame_Trim](imgs/GetCornersOfPart/RotatedWithCFrame_Trim.gif)
```Lua
--The two scripts must be in the part from which you want to get the corners.
--First Script
local Position = script.Parent.CFrame
local Size = script.Parent.Size
local RunService = game:GetService("RunService")
local Event = script.Parent.Event

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

RunService.Heartbeat:Connect(function()
	Event:Fire(PartA,PartB,PartC,PartD,PartE,PartF,PartG,PartH,script.Parent.CFrame,script.Parent.Size)
end)

--Second Script
local Event = script.Parent.Event

Event.Event:Connect(function(PartA,PartB,PartC,PartD,PartE,PartF,PartG,PartH,Position,Size)
	PartA.CFrame = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
	PartB.CFrame = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
	PartC.CFrame = Position*CFrame.new(-Size/2)
	PartD.CFrame = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
	PartE.CFrame = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
	PartF.CFrame = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
	PartG.CFrame = Position*CFrame.new(Size/2)
	PartH.CFrame = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)	
end)
```

### Edit 1 We make our script shorter and more readable
This script can of course be written shorter:
```Lua
--The two scripts must be in the part from which you want to get the corners.
--First Script
local Position = script.Parent.CFrame
local Size = script.Parent.Size
local RunService = game:GetService("RunService")
local Event = script.Parent.Event

local Corners = {
	local PartA = Instance.new("Part", workspace)
	local PartB = Instance.new("Part", workspace)
	local PartC = Instance.new("Part", workspace)
	local PartD = Instance.new("Part", workspace)
	local PartE = Instance.new("Part", workspace)
	local PartF = Instance.new("Part", workspace)
	local PartG = Instance.new("Part", workspace)
	local PartH = Instance.new("Part", workspace)
}

Corners.PartA.Name = "A"
Corners.PartB.Name = "B"
Corners.PartC.Name = "C"
Corners.PartD.Name = "D"
Corners.PartE.Name = "E"
Corners.PartF.Name = "F"
Corners.PartG.Name = "G"
Corners.PartH.Name = "H"

for i,v in pairs(Corners) do
	v.CanCollide = false

	v.Anchored = true

	v.Size = Vector3.new(1,1,1)
end

RunService.Heartbeat:Connect(function()
	local Parent = script.Parent
	local Position = Parent.CFrame
	local Size = Parent.Size
	Event:Fire(Corners.PartA, Corners.PartB, Corners.PartC, Corners.PartD, Corners.PartE, Corners.PartF, Corners.PartG, Corners.PartH, Position, Size)
end)

--Second Script
local Event = script.Parent.Event

Event.Event:Connect(function(PartA,PartB,PartC,PartD,PartE,PartF,PartG,PartH,Position,Size)
	PartA.CFrame = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
	PartB.CFrame = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
	PartC.CFrame = Position*CFrame.new(-Size/2)
	PartD.CFrame = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
	PartE.CFrame = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
	PartF.CFrame = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
	PartG.CFrame = Position*CFrame.new(Size/2)
	PartH.CFrame = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)	
end)
```
So we have a shorter script and it is more readable.
### Edit 2 We use tables and the tipps of the replys

As recommended by @starmaq  and @Cinema_Sin , I will optimize the script thanks to loops and other little things:

```Lua
--This is only one script, not two.

--Variables
local Position = script.Parent.CFrame
local Size = script.Parent.Size
local RunService = game:GetService("RunService")

--This is a table with all the corners inside
local Vertex = {
local PartA = Instance.new("Part")
local PartB = Instance.new("Part")
local PartC = Instance.new("Part")
local PartD = Instance.new("Part")
local PartE = Instance.new("Part")
local PartF = Instance.new("Part")
local PartG = Instance.new("Part")
local PartH = Instance.new("Part")
}

--Give a name to all corner
Vertex.PartA.Name = "A"
Vertex.PartB.Name = "B"
Vertex.PartC.Name = "C"
Vertex.PartD.Name = "D"
Vertex.PartE.Name = "E"
Vertex.PartF.Name = "F"
Vertex.PartG.Name = "G"
Vertex.PartH.Name = "H"

for _,vertex in pairs(Vertex) do --Go trough the table and set this properties
    vertex.CanCollide = false
    vertex.Anchored = true
    vertex.Size = Vector3.new(1,1,1)
end

RunService.Heartbeat:Connect(function()
        --Update us variables
        Position = script.Parent.CFrame
        Size = script.Parent.Size
        --Then change the Position of the Corner (here represented by a Part)
	Vertex.PartA.CFrame = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
	Vertex.PartB.CFrame = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
	Vertex.PartC.CFrame = Position*CFrame.new(-Size/2)
	Vertex.PartD.CFrame = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
	Vertex.PartE.CFrame = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
	Vertex.PartF.CFrame = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
	Vertex.PartG.CFrame = Position*CFrame.new(Size/2)
	Vertex.PartH.CFrame = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)	
end)
```

## Edit 3
Ok, the definitive edit, the last about this section here!
```lua
local CornerModuleScript = require(workspace.CornerModuleScript)
local Reference = workspace.TestRegion

local PartCFrame = script.Parent.CFrame
local Size = script.Parent.Size

local Table = {
	"TopUnderRightCorner",
	"TopUpperRightCorner",
	"BottomUpperRightCorner",
	"BottomUnderLeftCorner",
	"BottomUpperLeftCorner",
	"TopUnderLeftCorner",
	"TopUpperLeftCorner",
	"BottomUnderRightCorner"
}

for _,vertex in ipairs(Table) do
	local Vert = Instance.new("Part")
	Vert.Parent = workspace.PartVertices
	Vert.Name = vertex
	Vert.CanCollide = false
	Vert.Anchored = true
	Vert.Size = Vector3.new(.1,.1,.1)
	Vert.BrickColor = BrickColor.Red()
end



local function onCFrameOrSizeUpdate()
	PartCFrame = script.Parent.CFrame
	Size = script.Parent.Size
	
	local TopUnderRightCorner = workspace.PartVertices.TopUnderRightCorner
	local TopUpperRightCorner = workspace.PartVertices.TopUpperRightCorner
	local BottomUpperRightCorner = workspace.PartVertices.BottomUpperRightCorner
	local BottomUnderLeftCorner = workspace.PartVertices.BottomUnderLeftCorner
	local BottomUpperLeftCorner = workspace.PartVertices.BottomUpperLeftCorner
	local TopUnderLeftCorner = workspace.PartVertices.TopUnderLeftCorner
	local TopUpperLeftCorner = workspace.PartVertices.TopUpperLeftCorner
	local BottomUnderRightCorner = workspace.PartVertices.BottomUnderRightCorner	
	
	TopUnderRightCorner.CFrame = PartCFrame*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
	TopUpperRightCorner.CFrame = PartCFrame*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
	BottomUpperRightCorner.CFrame = PartCFrame*CFrame.new(-Size/2)
	BottomUnderLeftCorner.CFrame = PartCFrame*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
	BottomUpperLeftCorner.CFrame = PartCFrame*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
	TopUnderLeftCorner.CFrame = PartCFrame*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
	TopUpperLeftCorner.CFrame = PartCFrame*CFrame.new(Size/2)
	BottomUnderRightCorner.CFrame = PartCFrame*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
end

onCFrameOrSizeUpdate()
script.Parent:GetPropertyChangedSignal("CFrame"):Connect(onCFrameOrSizeUpdate)
script.Parent:GetPropertyChangedSignal("Size"):Connect(onCFrameOrSizeUpdate)
```