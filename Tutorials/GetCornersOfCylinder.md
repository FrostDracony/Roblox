Hi, willkommen in dieses neunem Tutorialteil! In diesen Teil werden wir über Scheitelpunkte eines Zylinder reden, wie man sie bekommen kann und viel mehr. 

Den System ist praktisch den selben wie bei einem Ball (sieh anderen Tutorial), man geht auf Blender (oder anderen Third Party Modelling Program), nimmt nur den positives Quadrant (also Scheitelpunkte) und um die andere zu bekommen spiegle ich die die ich schon habe. so leicht ist es.

Man nimmt zu erst ein 1x1x1 Zylinder (1x1x1 ist auch die Maße mit dem ich die Scheitelpunkte darstelle):

Bild

Dann wird es in Blender exportiert (Position natürlich 0x0x0), das ermöglicht uns die Positionen der Scheitelpunkte zu erhalten:

Bild

Wie Schon gesagt, ich nehme mir ein Quadrant, dann spiegle ich das ganzen um alle meine Scheitelpunkte zu bekommen (ein Robloxzylinder hat 114 Scheitelpunkte). Dies ist dann was ich jetzt bekam (als Tabelle):

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

Resultat:

Bild

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
Jetzt überspringe ich den ganzem Teil mit der Spieglung, zeige euch trotzdem den Code:
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

Das ist jetzt die ganze Tabelle:
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

Trotzdem müssen wir die Position mit der Größe adaptieren, wir müssen uns erinnern dass die Position nur für ein 1x1x1 Zylinder funktioniert, das ist ja aber nicht immer den Fall:
```lua
```

Doch dann entsteht ein anderes Problem:

BIld

Es sieht komisch aus, aus den ganz einfachen Grund dass Roblox für den Radius unserem Zylinder immer die kleinste **Zahl** zwischen die "Size.Z und Size.Y" verwendet. Das zwingt uns zu einem neuen System zu verwenden (aber falls Roblox es nicht gemacht hätte würde unserem Code doch funktionieren). Jetzt aber, müsste ich die ganze Methoden erklären würde dies zu lange dauern, deswegen habe ich einfach meinem Code kommentiert damit ihr es besser versteht, viel Spass beim lesen :-)
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