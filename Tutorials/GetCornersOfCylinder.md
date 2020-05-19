Hi, welcome to this new tutorial section! In this part we will talk about vertices of a cylinder, how to get them and much more. 

The system is practically the same as for a ball (see other tutorial. Edit: No, it's a little different), you go to Blender (or other third party modeling program), take only the positive quadrant (vertices) and to get the other one I mirror the one I already have.

First you take a 1x1x1 cylinder (1x1x1 is also the size I use to represent the vertices):

Picture

Then it is exported to Blender (position of course 0x0x0), which allows us to get the positions of the vertices:

Picture

As I said before, I take a quadrant, then I mirror the whole thing to get all my vertices (a Roblox cylinder has 114 vertices). This is what I got now (as a table. Edit: Pls see the final table, i made some misstakes here!):

```lua
local Vertices = {
	Vector3.new(0.5, 0, 0),
	Vector3.new(0.5, 0.5, 0),
	Vector3.new(0.5, 0.474342, 0.158114),
	Vector3.new(0.5, 0.416025, 0.27735),
	Vector3.new(0.5, 0.353553, 0.353553),
	Vector3.new(0.5, 0.27735, 0.416025),
	Vector3.new(0.5, 0.158114, 0.474342),
	Vector3.new(0.5, 0, 0.5),
}
```

Result:

Picture

Code:
```lua
--Table from above
local Parent = script.Parent
local Position = Parent.CFrame
local Size = Parent.Size

for index, vert in pairs(Vertices) do
	local Vertex = Instance.new("Part", workspace.Vertex)
	Vertex.BrickColor = BrickColor.Red()
	Vertex.Size = Vector3.new(0.01, 0.01, 0.01)
	Vertex.CanCollide = false
	Vertex.Anchored = true
	Vertex.Name = "Vertex"..index
	Vertex.Position = Position * (vert * Size)
end
```
Now I'll skip the whole part with the mirroring, show you the code anyway:
```lua
for _,vert in pairs(Vertices) do
    local Mirrored = -vert
    local MirroredX = Vector3.new(-vert.X, vert.Y, vert.Z)
    local MirroredY = Vector3.new(vert.X, -vert.Y, vert.Z)
    local MirroredZ = Vector3.new(vert.X, vert.Y, -vert.Z)
    if not table.find(Vertices, Mirrored) then --If it not find the already mirrored vertex, then insert it in the table
        table.insert(Vertices, #Vertices + 1, Mirrored)
		print(MirroredX)
    elseif not table.find(Vertices, MirroredX) then
        table.insert(Vertices, #Vertices + 1, MirroredX)

    elseif not table.find(Vertices, MirroredY) then
        table.insert(Vertices, #Vertices + 1, MirroredY)

    elseif not table.find(Vertices, MirroredZ) then
        table.insert(Vertices, #Vertices + 1, MirroredZ)
    end
end
```

This is now the whole table:
```lua
local Vertices = {
    Vector3.new(1, 1, 0),
    Vector3.new(1, 0, 0),
    Vector3.new(1, 0, 1),
    Vector3.new(1, 0.94868302345276, 0.3162280023098),
    Vector3.new(1, 0.8320500254631, 0.5547000169754),
    Vector3.new(1, 0.70710700750351, 0.70710700750351),
    Vector3.new(1, 0.5547000169754, 0.8320500254631),
    Vector3.new(1, 0.3162280023098, 0.94868302345276),
    Vector3.new(-1, -1, -0),
    Vector3.new(-1, -0, -0),
    Vector3.new(-1, -0.94868302345276, -0.3162280023098),
    Vector3.new(-1, -0.8320500254631, -0.5547000169754),
    Vector3.new(-1, -0.70710700750351, -0.70710700750351),
    Vector3.new(-1, -0.5547000169754, -0.8320500254631),
    Vector3.new(-1, -0.3162280023098, -0.94868302345276),
    Vector3.new(1, -1, -0),
    Vector3.new(1, -0.94868302345276, -0.3162280023098),
    Vector3.new(1, -0.8320500254631, -0.5547000169754),
    Vector3.new(1, -0.70710700750351, -0.70710700750351),
    Vector3.new(1, -0.5547000169754, -0.8320500254631),
    Vector3.new(1, -0.3162280023098, -0.94868302345276),
    Vector3.new(-1, 1, 0),
    Vector3.new(-1, 0.94868302345276, 0.3162280023098),
    Vector3.new(-1, 0.8320500254631, 0.5547000169754),
    Vector3.new(-1, 0.70710700750351, 0.70710700750351),
    Vector3.new(-1, 0.5547000169754, 0.8320500254631),
    Vector3.new(-1, 0.3162280023098, 0.94868302345276),
    Vector3.new(-1, -0.94868302345276, 0.3162280023098),
    Vector3.new(-1, -0.8320500254631, 0.5547000169754),
    Vector3.new(-1, -0.70710700750351, 0.70710700750351),
    Vector3.new(-1, -0.5547000169754, 0.8320500254631),
    Vector3.new(-1, -0.3162280023098, 0.94868302345276),
    Vector3.new(1, 0.94868302345276, -0.3162280023098),
    Vector3.new(1, 0.8320500254631, -0.5547000169754),
    Vector3.new(1, 0.70710700750351, -0.70710700750351),
    Vector3.new(1, 0.5547000169754, -0.8320500254631),
    Vector3.new(1, 0.3162280023098, -0.94868302345276),
    Vector3.new(-1, 0.94868302345276, -0.3162280023098),
    Vector3.new(-1, 0.8320500254631, -0.5547000169754),
    Vector3.new(-1, 0.70710700750351, -0.70710700750351),
    Vector3.new(-1, 0.5547000169754, -0.8320500254631),
    Vector3.new(-1, 0.3162280023098, -0.94868302345276),
    Vector3.new(1, -0.94868302345276, 0.3162280023098),
    Vector3.new(1, -0.8320500254631, 0.5547000169754),
    Vector3.new(1, -0.70710700750351, 0.70710700750351),
    Vector3.new(1, -0.5547000169754, 0.8320500254631),
    Vector3.new(1, -0.3162280023098, 0.94868302345276),
    Vector3.new(-1, -0, -1),
    Vector3.new(1, -0, -1),
    Vector3.new(-1, 0, 1)
}
```

Nevertheless we have to adapt the position with the size, we have to remember that the position only works for a 1x1x1 cylinder, but this is not always the case:
```lua
```

But then another problem arises:

Picture

It looks strange, for the simple reason that Roblox always uses the smallest **number** between the "Size.Z and Size.Y" for the radius of our cylinder. This forces us to use a new system (but if Roblox didn't do it our code would work after all). But now, if I had to explain all the methods it would take too long, so I just commented my code so you can understand it better, have fun reading it :-)
```lua
local Parent = script.Parent
local Position = Parent.Position
local Size = Parent.Size

local Vertices = {
    Vector3.new(1, 1, 0),
    Vector3.new(1, 0, 0),
    Vector3.new(1, 0, 1),
    Vector3.new(1, 0.94868302345276, 0.3162280023098),
    Vector3.new(1, 0.8320500254631, 0.5547000169754),
    Vector3.new(1, 0.70710700750351, 0.70710700750351),
    Vector3.new(1, 0.5547000169754, 0.8320500254631),
    Vector3.new(1, 0.3162280023098, 0.94868302345276),
    Vector3.new(-1, -1, -0),
    Vector3.new(-1, -0, -0),
    Vector3.new(-1, -0.94868302345276, -0.3162280023098),
    Vector3.new(-1, -0.8320500254631, -0.5547000169754),
    Vector3.new(-1, -0.70710700750351, -0.70710700750351),
    Vector3.new(-1, -0.5547000169754, -0.8320500254631),
    Vector3.new(-1, -0.3162280023098, -0.94868302345276),
    Vector3.new(1, -1, -0),
    Vector3.new(1, -0.94868302345276, -0.3162280023098),
    Vector3.new(1, -0.8320500254631, -0.5547000169754),
    Vector3.new(1, -0.70710700750351, -0.70710700750351),
    Vector3.new(1, -0.5547000169754, -0.8320500254631),
    Vector3.new(1, -0.3162280023098, -0.94868302345276),
    Vector3.new(-1, 1, 0),
    Vector3.new(-1, 0.94868302345276, 0.3162280023098),
    Vector3.new(-1, 0.8320500254631, 0.5547000169754),
    Vector3.new(-1, 0.70710700750351, 0.70710700750351),
    Vector3.new(-1, 0.5547000169754, 0.8320500254631),
    Vector3.new(-1, 0.3162280023098, 0.94868302345276),
    Vector3.new(-1, -0.94868302345276, 0.3162280023098),
    Vector3.new(-1, -0.8320500254631, 0.5547000169754),
    Vector3.new(-1, -0.70710700750351, 0.70710700750351),
    Vector3.new(-1, -0.5547000169754, 0.8320500254631),
    Vector3.new(-1, -0.3162280023098, 0.94868302345276),
    Vector3.new(1, 0.94868302345276, -0.3162280023098),
    Vector3.new(1, 0.8320500254631, -0.5547000169754),
    Vector3.new(1, 0.70710700750351, -0.70710700750351),
    Vector3.new(1, 0.5547000169754, -0.8320500254631),
    Vector3.new(1, 0.3162280023098, -0.94868302345276),
    Vector3.new(-1, 0.94868302345276, -0.3162280023098),
    Vector3.new(-1, 0.8320500254631, -0.5547000169754),
    Vector3.new(-1, 0.70710700750351, -0.70710700750351),
    Vector3.new(-1, 0.5547000169754, -0.8320500254631),
    Vector3.new(-1, 0.3162280023098, -0.94868302345276),
    Vector3.new(1, -0.94868302345276, 0.3162280023098),
    Vector3.new(1, -0.8320500254631, 0.5547000169754),
    Vector3.new(1, -0.70710700750351, 0.70710700750351),
    Vector3.new(1, -0.5547000169754, 0.8320500254631),
    Vector3.new(1, -0.3162280023098, 0.94868302345276),
    Vector3.new(-1, -0, -1),
    Vector3.new(1, -0, -1),
    Vector3.new(-1, 0, 1)
}

local function getYZScalar()
	local radius = math.min(Size.Y, Size.Z)/2 --We are getting the smalltest number (as Roblox uses the smalltest number for calculate the radius of us cylinder) then divide the diameter (number = diameter) to get the radius
	return radius
end

local function getXScalar(vert)
	return Size.X*math.sign(vert.X)/2 --To position the vertices on the X axis, it's just the X size of the cylinder. Then use math.sign if the vertex was positive or negative (see on the devhub for more info) and divide it by 2
end

for index, vert in pairs(Vertices) do
	--Creating the parts to visualize us vertices
	local Vertex = Instance.new("Part", workspace.Vertex)
	Vertex.BrickColor = BrickColor.Red()
	Vertex.Size = Vector3.new(0.01, 0.01, 0.01)
	Vertex.CanCollide = false
	Vertex.Anchored = true
	Vertex.Name = "Vertex"..index
	--Getting the scalar for the positioning the vertices along the Y, Z and X axis
	local Scalar = getYZScalar()
	--Calculate the single parts of the final Position
	local X = getXScalar(vert)
	local Y = vert.Y*Scalar
	local Z = vert.Z*Scalar
	--And just normal position it (bad englisch, srry ik)
	Vertex.Position = (Position + Vector3.new(X,Y,Z))
end
```
