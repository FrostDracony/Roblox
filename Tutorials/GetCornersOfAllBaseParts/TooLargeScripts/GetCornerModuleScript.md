```lua
local CornerModule = {}

--The Variables
local Shape
local Position
local PartCFrame
local Size

local Position1
local Size1

local TopUnderRightCorner
local TopUpperRightCorner
local BottomUpperRightCorner
local BottomUnderLeftCorner
local BottomUpperLeftCorner
local TopUnderLeftCorner
local TopUpperLeftCorner
local BottomUnderRightCorner

local TopUnderRightCorner1
local TopUpperRightCorner1
local BottomUpperRightCorner1
local BottomUnderLeftCorner1
local BottomUpperLeftCorner1
local TopUnderLeftCorner1
local TopUpperLeftCorner1
local BottomUnderRightCorner1

function CornerModule:GetCorners(Part)
	--Check if the Parameter is a Instance (a Part or something else a Vector2, Vector3, ...)
	if typeof(Part) == "Instance" then
		--If the Parameter was a Instance, then controll his ClassName
		if Part.ClassName == "Part" then
			Shape = Part.Shape
			Position = Part.Position
			PartCFrame = Part.CFrame
			Size = Part.Size
			if Shape == Enum.PartType.Block then
				TopUnderRightCorner = PartCFrame*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
				TopUpperRightCorner = PartCFrame*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
				BottomUpperRightCorner = PartCFrame*CFrame.new(-Size/2)
				BottomUnderLeftCorner = PartCFrame*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
				BottomUpperLeftCorner = PartCFrame*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
				TopUnderLeftCorner = PartCFrame*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
				TopUpperLeftCorner = PartCFrame*CFrame.new(Size/2)
				BottomUnderRightCorner = PartCFrame*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
				return TopUnderRightCorner, TopUpperRightCorner, BottomUpperRightCorner, BottomUnderLeftCorner, BottomUpperLeftCorner, TopUnderLeftCorner, TopUpperLeftCorner, BottomUnderRightCorner
			end
		end
	end
end

function CornerModule:IsInRegion(RegionIncluded, CalculateRegion3ByBasePart, PartForRegion3, CalculateCornersByParameters, Region, Part, V1, V2, ParameterPosition, ParameterSize, ParameterShape)
	if typeof(Part) == "Instance" then
		Size = Part.Size
		Position = Part.CFrame
	end
	--Check if the Region parameter is a Region3
	if typeof(Region) == "Region3" and typeof(Part) == "Instance" and typeof(RegionIncluded) == "boolean" and RegionIncluded == true and typeof(CalculateRegion3ByBasePart) == "boolean" and CalculateRegion3ByBasePart == false and typeof(CalculateCornersByParameters) == "boolean" and CalculateCornersByParameters == false then
		--If true then get the corners of the Region
		Position1 = Region.CFrame
		Size1 = Region.Size
		--Rotate the corners to control if it was in the Objectspace
		TopUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, -Size1.Z/2)
		TopUpperRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, Size1.Z/2)
		BottomUpperRightCorner1 = Position1*CFrame.new(-Size1/2)
		BottomUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
		BottomUpperLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , -Size1.Z/2)
		TopUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , Size1.Y/2 , -Size1.Z/2)
		TopUpperLeftCorner1 = Position1*CFrame.new(Size1/2)
		BottomUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
		
		TopUnderRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
		TopUpperRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
		BottomUpperRightCorner = Position*CFrame.new(-Size/2)
		BottomUnderLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
		BottomUpperLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
		TopUnderLeftCorner = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
		TopUpperLeftCorner = Position*CFrame.new(Size/2)
		BottomUnderRightCorner = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
	
		--Control all the corners, ALL!
		if TopUnderRightCorner.X < TopUnderLeftCorner1.X and TopUnderRightCorner.X > TopUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderRightCorner1.Y and TopUnderRightCorner.Y > BottomUpperRightCorner1.Y and TopUnderRightCorner.Z < TopUpperRightCorner1.Z and TopUnderRightCorner.Z > TopUnderRightCorner1.Z 
		and TopUnderRightCorner.X < BottomUpperLeftCorner1.X and TopUnderRightCorner.X > BottomUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperRightCorner1.Y and TopUnderRightCorner.Y > BottomUnderRightCorner1.Y and TopUnderRightCorner.Z < BottomUnderRightCorner1.Z and TopUnderRightCorner.Z > BottomUpperRightCorner1.Z 
		and TopUnderRightCorner.X < TopUpperLeftCorner1.X and TopUnderRightCorner.X > TopUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperLeftCorner1.Y and TopUnderRightCorner.Y > BottomUnderLeftCorner1.Y and TopUnderRightCorner.Z < TopUpperLeftCorner1.Z and TopUnderRightCorner.Z > TopUnderLeftCorner1.Z 
		and TopUnderRightCorner.X < BottomUnderLeftCorner1.X and TopUnderRightCorner.X > BottomUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderLeftCorner1.Y and TopUnderRightCorner.Y > BottomUpperLeftCorner1.Y and TopUnderRightCorner.Z < BottomUnderLeftCorner1.Z and TopUnderRightCorner.Z > BottomUpperLeftCorner1.Z 
		and TopUpperRightCorner.X < TopUnderLeftCorner1.X and TopUpperRightCorner.X > TopUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderRightCorner1.Y and TopUpperRightCorner.Y > BottomUpperRightCorner1.Y and TopUpperRightCorner.Z < TopUpperRightCorner1.Z and TopUpperRightCorner.Z > TopUnderRightCorner1.Z 
		and TopUpperRightCorner.X < BottomUpperLeftCorner1.X and TopUpperRightCorner.X > BottomUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperRightCorner1.Y and TopUpperRightCorner.Y > BottomUnderRightCorner1.Y and TopUpperRightCorner.Z < BottomUnderRightCorner1.Z and TopUpperRightCorner.Z > BottomUpperRightCorner1.Z 
		and TopUpperRightCorner.X < TopUpperLeftCorner1.X and TopUpperRightCorner.X > TopUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperLeftCorner1.Y and TopUpperRightCorner.Y > BottomUnderLeftCorner1.Y and TopUpperRightCorner.Z < TopUpperLeftCorner1.Z and TopUpperRightCorner.Z > TopUnderLeftCorner1.Z 
		and TopUpperRightCorner.X < BottomUnderLeftCorner1.X and TopUpperRightCorner.X > BottomUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderLeftCorner1.Y and TopUpperRightCorner.Y > BottomUpperLeftCorner1.Y and TopUpperRightCorner.Z < BottomUnderLeftCorner1.Z and TopUpperRightCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUpperRightCorner.X < TopUnderLeftCorner1.X and BottomUpperRightCorner.X > TopUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderRightCorner1.Y and BottomUpperRightCorner.Y > BottomUpperRightCorner1.Y and BottomUpperRightCorner.Z < TopUpperRightCorner1.Z and BottomUpperRightCorner.Z > TopUnderRightCorner1.Z
		and BottomUpperRightCorner.X < BottomUpperLeftCorner1.X and BottomUpperRightCorner.X > BottomUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperRightCorner1.Y and BottomUpperRightCorner.Y > BottomUnderRightCorner1.Y and BottomUpperRightCorner.Z < BottomUnderRightCorner1.Z and BottomUpperRightCorner.Z > BottomUpperRightCorner1.Z
		and BottomUpperRightCorner.X < TopUpperLeftCorner1.X and BottomUpperRightCorner.X > TopUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperRightCorner.Z < TopUpperLeftCorner1.Z and BottomUpperRightCorner.Z > TopUnderLeftCorner1.Z
		and BottomUpperRightCorner.X < BottomUnderLeftCorner1.X and BottomUpperRightCorner.X > BottomUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperRightCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUnderRightCorner.X < TopUnderLeftCorner1.X and BottomUnderRightCorner.X > TopUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderRightCorner1.Y and BottomUnderRightCorner.Y > BottomUpperRightCorner1.Y and BottomUnderRightCorner.Z < TopUpperRightCorner1.Z and BottomUnderRightCorner.Z > TopUnderRightCorner1.Z
		and BottomUnderRightCorner.X < BottomUpperLeftCorner1.X and BottomUnderRightCorner.X > BottomUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperRightCorner1.Y and BottomUnderRightCorner.Y > BottomUnderRightCorner1.Y and BottomUnderRightCorner.Z < BottomUnderRightCorner1.Z and BottomUnderRightCorner.Z > BottomUpperRightCorner1.Z
		and BottomUnderRightCorner.X < TopUpperLeftCorner1.X and BottomUnderRightCorner.X > TopUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderRightCorner.Z < TopUpperLeftCorner1.Z and BottomUnderRightCorner.Z > TopUnderLeftCorner1.Z
		and BottomUnderRightCorner.X < BottomUnderLeftCorner1.X and BottomUnderRightCorner.X > BottomUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderRightCorner.Z > BottomUpperLeftCorner1.Z
		and TopUnderLeftCorner.X < TopUnderLeftCorner1.X and TopUnderLeftCorner.X > TopUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderRightCorner1.Y and TopUnderLeftCorner.Y > BottomUpperRightCorner1.Y and TopUnderLeftCorner.Z < TopUpperRightCorner1.Z and TopUnderLeftCorner.Z > TopUnderRightCorner1.Z
		and TopUnderLeftCorner.X < BottomUpperLeftCorner1.X and TopUnderLeftCorner.X > BottomUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperRightCorner1.Y and TopUnderLeftCorner.Y > BottomUnderRightCorner1.Y and TopUnderLeftCorner.Z < BottomUnderRightCorner1.Z and TopUnderLeftCorner.Z > BottomUpperRightCorner1.Z
		and TopUnderLeftCorner.X < TopUpperLeftCorner1.X and TopUnderLeftCorner.X > TopUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUnderLeftCorner.Z < TopUpperLeftCorner1.Z and TopUnderLeftCorner.Z > TopUnderLeftCorner1.Z
		and TopUnderLeftCorner.X < BottomUnderLeftCorner1.X and TopUnderLeftCorner.X > BottomUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
		and TopUpperLeftCorner.X < TopUnderLeftCorner1.X and TopUpperLeftCorner.X > TopUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderRightCorner1.Y and TopUpperLeftCorner.Y > BottomUpperRightCorner1.Y and TopUpperLeftCorner.Z < TopUpperRightCorner1.Z and TopUpperLeftCorner.Z > TopUnderRightCorner1.Z
		and TopUpperLeftCorner.X < BottomUpperLeftCorner1.X and TopUpperLeftCorner.X > BottomUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperRightCorner1.Y and TopUpperLeftCorner.Y > BottomUnderRightCorner1.Y and TopUpperLeftCorner.Z < BottomUnderRightCorner1.Z and TopUpperLeftCorner.Z > BottomUpperRightCorner1.Z
		and TopUpperLeftCorner.X < TopUpperLeftCorner1.X and TopUpperLeftCorner.X > TopUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUpperLeftCorner.Z < TopUpperLeftCorner1.Z and TopUpperLeftCorner.Z > TopUnderLeftCorner1.Z
		and TopUpperLeftCorner.X < BottomUnderLeftCorner1.X and TopUpperLeftCorner.X > BottomUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUpperLeftCorner.X < TopUnderLeftCorner1.X and BottomUpperLeftCorner.X > TopUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUpperLeftCorner.Z < TopUpperRightCorner1.Z and BottomUpperLeftCorner.Z > TopUnderRightCorner1.Z
		and BottomUpperLeftCorner.X < BottomUpperLeftCorner1.X and BottomUpperLeftCorner.X > BottomUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperRightCorner1.Z
		and BottomUpperLeftCorner.X < TopUpperLeftCorner1.X and BottomUpperLeftCorner.X > TopUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUpperLeftCorner.Z > TopUnderLeftCorner1.Z
		and BottomUpperLeftCorner.X < BottomUnderLeftCorner1.X and BottomUpperLeftCorner.X > BottomUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUnderLeftCorner.X < TopUnderLeftCorner1.X and BottomUnderLeftCorner.X > TopUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUnderLeftCorner.Z < TopUpperRightCorner1.Z and BottomUnderLeftCorner.Z > TopUnderRightCorner1.Z
		and BottomUnderLeftCorner.X < BottomUpperLeftCorner1.X and BottomUnderLeftCorner.X > BottomUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperRightCorner1.Z
		and BottomUnderLeftCorner.X < TopUpperLeftCorner1.X and BottomUnderLeftCorner.X > TopUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUnderLeftCorner.Z > TopUnderLeftCorner1.Z
		and BottomUnderLeftCorner.X < BottomUnderLeftCorner1.X and BottomUnderLeftCorner.X > BottomUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
		then
		--If all Corners are in the Region3 then return true
		return true
												
		else
			--Else return false
			return false
			
		end
		
	elseif typeof(V1) == "Vector3" and typeof(V2) == "Vector3" and typeof(CalculateRegion3ByBasePart) == "boolean" and CalculateRegion3ByBasePart == false and typeof(CalculateCornersByParameters) == "boolean" and CalculateCornersByParameters == false then
		--Else create a Region3 with the others parameters
		Region = Region3.new(V1, V2)
		Position1 = Region.CFrame
		Size1 = Region.Size
		
		--Rotate the corners to control if it was in the Objectspace
		TopUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, -Size1.Z/2)
		TopUpperRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, Size1.Z/2)
		BottomUpperRightCorner1 = Position1*CFrame.new(-Size1/2)
		BottomUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
		BottomUpperLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , -Size1.Z/2)
		TopUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , Size1.Y/2 , -Size1.Z/2)
		TopUpperLeftCorner1 = Position1*CFrame.new(Size1/2)
		BottomUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
		
		TopUnderRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
		TopUpperRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
		BottomUpperRightCorner = Position*CFrame.new(-Size/2)
		BottomUnderLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
		BottomUpperLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
		TopUnderLeftCorner = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
		TopUpperLeftCorner = Position*CFrame.new(Size/2)
		BottomUnderRightCorner = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
		
		--Control all the corners, ALL!
		if TopUnderRightCorner.X < TopUnderLeftCorner1.X and TopUnderRightCorner.X > TopUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderRightCorner1.Y and TopUnderRightCorner.Y > BottomUpperRightCorner1.Y and TopUnderRightCorner.Z < TopUpperRightCorner1.Z and TopUnderRightCorner.Z > TopUnderRightCorner1.Z 
		and TopUnderRightCorner.X < BottomUpperLeftCorner1.X and TopUnderRightCorner.X > BottomUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperRightCorner1.Y and TopUnderRightCorner.Y > BottomUnderRightCorner1.Y and TopUnderRightCorner.Z < BottomUnderRightCorner1.Z and TopUnderRightCorner.Z > BottomUpperRightCorner1.Z 
		and TopUnderRightCorner.X < TopUpperLeftCorner1.X and TopUnderRightCorner.X > TopUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperLeftCorner1.Y and TopUnderRightCorner.Y > BottomUnderLeftCorner1.Y and TopUnderRightCorner.Z < TopUpperLeftCorner1.Z and TopUnderRightCorner.Z > TopUnderLeftCorner1.Z 
		and TopUnderRightCorner.X < BottomUnderLeftCorner1.X and TopUnderRightCorner.X > BottomUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderLeftCorner1.Y and TopUnderRightCorner.Y > BottomUpperLeftCorner1.Y and TopUnderRightCorner.Z < BottomUnderLeftCorner1.Z and TopUnderRightCorner.Z > BottomUpperLeftCorner1.Z 
		and TopUpperRightCorner.X < TopUnderLeftCorner1.X and TopUpperRightCorner.X > TopUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderRightCorner1.Y and TopUpperRightCorner.Y > BottomUpperRightCorner1.Y and TopUpperRightCorner.Z < TopUpperRightCorner1.Z and TopUpperRightCorner.Z > TopUnderRightCorner1.Z 
		and TopUpperRightCorner.X < BottomUpperLeftCorner1.X and TopUpperRightCorner.X > BottomUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperRightCorner1.Y and TopUpperRightCorner.Y > BottomUnderRightCorner1.Y and TopUpperRightCorner.Z < BottomUnderRightCorner1.Z and TopUpperRightCorner.Z > BottomUpperRightCorner1.Z 
		and TopUpperRightCorner.X < TopUpperLeftCorner1.X and TopUpperRightCorner.X > TopUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperLeftCorner1.Y and TopUpperRightCorner.Y > BottomUnderLeftCorner1.Y and TopUpperRightCorner.Z < TopUpperLeftCorner1.Z and TopUpperRightCorner.Z > TopUnderLeftCorner1.Z 
		and TopUpperRightCorner.X < BottomUnderLeftCorner1.X and TopUpperRightCorner.X > BottomUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderLeftCorner1.Y and TopUpperRightCorner.Y > BottomUpperLeftCorner1.Y and TopUpperRightCorner.Z < BottomUnderLeftCorner1.Z and TopUpperRightCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUpperRightCorner.X < TopUnderLeftCorner1.X and BottomUpperRightCorner.X > TopUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderRightCorner1.Y and BottomUpperRightCorner.Y > BottomUpperRightCorner1.Y and BottomUpperRightCorner.Z < TopUpperRightCorner1.Z and BottomUpperRightCorner.Z > TopUnderRightCorner1.Z
		and BottomUpperRightCorner.X < BottomUpperLeftCorner1.X and BottomUpperRightCorner.X > BottomUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperRightCorner1.Y and BottomUpperRightCorner.Y > BottomUnderRightCorner1.Y and BottomUpperRightCorner.Z < BottomUnderRightCorner1.Z and BottomUpperRightCorner.Z > BottomUpperRightCorner1.Z
		and BottomUpperRightCorner.X < TopUpperLeftCorner1.X and BottomUpperRightCorner.X > TopUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperRightCorner.Z < TopUpperLeftCorner1.Z and BottomUpperRightCorner.Z > TopUnderLeftCorner1.Z
		and BottomUpperRightCorner.X < BottomUnderLeftCorner1.X and BottomUpperRightCorner.X > BottomUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperRightCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUnderRightCorner.X < TopUnderLeftCorner1.X and BottomUnderRightCorner.X > TopUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderRightCorner1.Y and BottomUnderRightCorner.Y > BottomUpperRightCorner1.Y and BottomUnderRightCorner.Z < TopUpperRightCorner1.Z and BottomUnderRightCorner.Z > TopUnderRightCorner1.Z
		and BottomUnderRightCorner.X < BottomUpperLeftCorner1.X and BottomUnderRightCorner.X > BottomUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperRightCorner1.Y and BottomUnderRightCorner.Y > BottomUnderRightCorner1.Y and BottomUnderRightCorner.Z < BottomUnderRightCorner1.Z and BottomUnderRightCorner.Z > BottomUpperRightCorner1.Z
		and BottomUnderRightCorner.X < TopUpperLeftCorner1.X and BottomUnderRightCorner.X > TopUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderRightCorner.Z < TopUpperLeftCorner1.Z and BottomUnderRightCorner.Z > TopUnderLeftCorner1.Z
		and BottomUnderRightCorner.X < BottomUnderLeftCorner1.X and BottomUnderRightCorner.X > BottomUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderRightCorner.Z > BottomUpperLeftCorner1.Z
		and TopUnderLeftCorner.X < TopUnderLeftCorner1.X and TopUnderLeftCorner.X > TopUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderRightCorner1.Y and TopUnderLeftCorner.Y > BottomUpperRightCorner1.Y and TopUnderLeftCorner.Z < TopUpperRightCorner1.Z and TopUnderLeftCorner.Z > TopUnderRightCorner1.Z
		and TopUnderLeftCorner.X < BottomUpperLeftCorner1.X and TopUnderLeftCorner.X > BottomUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperRightCorner1.Y and TopUnderLeftCorner.Y > BottomUnderRightCorner1.Y and TopUnderLeftCorner.Z < BottomUnderRightCorner1.Z and TopUnderLeftCorner.Z > BottomUpperRightCorner1.Z
		and TopUnderLeftCorner.X < TopUpperLeftCorner1.X and TopUnderLeftCorner.X > TopUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUnderLeftCorner.Z < TopUpperLeftCorner1.Z and TopUnderLeftCorner.Z > TopUnderLeftCorner1.Z
		and TopUnderLeftCorner.X < BottomUnderLeftCorner1.X and TopUnderLeftCorner.X > BottomUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
		and TopUpperLeftCorner.X < TopUnderLeftCorner1.X and TopUpperLeftCorner.X > TopUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderRightCorner1.Y and TopUpperLeftCorner.Y > BottomUpperRightCorner1.Y and TopUpperLeftCorner.Z < TopUpperRightCorner1.Z and TopUpperLeftCorner.Z > TopUnderRightCorner1.Z
		and TopUpperLeftCorner.X < BottomUpperLeftCorner1.X and TopUpperLeftCorner.X > BottomUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperRightCorner1.Y and TopUpperLeftCorner.Y > BottomUnderRightCorner1.Y and TopUpperLeftCorner.Z < BottomUnderRightCorner1.Z and TopUpperLeftCorner.Z > BottomUpperRightCorner1.Z
		and TopUpperLeftCorner.X < TopUpperLeftCorner1.X and TopUpperLeftCorner.X > TopUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUpperLeftCorner.Z < TopUpperLeftCorner1.Z and TopUpperLeftCorner.Z > TopUnderLeftCorner1.Z
		and TopUpperLeftCorner.X < BottomUnderLeftCorner1.X and TopUpperLeftCorner.X > BottomUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUpperLeftCorner.X < TopUnderLeftCorner1.X and BottomUpperLeftCorner.X > TopUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUpperLeftCorner.Z < TopUpperRightCorner1.Z and BottomUpperLeftCorner.Z > TopUnderRightCorner1.Z
		and BottomUpperLeftCorner.X < BottomUpperLeftCorner1.X and BottomUpperLeftCorner.X > BottomUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperRightCorner1.Z
		and BottomUpperLeftCorner.X < TopUpperLeftCorner1.X and BottomUpperLeftCorner.X > TopUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUpperLeftCorner.Z > TopUnderLeftCorner1.Z
		and BottomUpperLeftCorner.X < BottomUnderLeftCorner1.X and BottomUpperLeftCorner.X > BottomUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
		and BottomUnderLeftCorner.X < TopUnderLeftCorner1.X and BottomUnderLeftCorner.X > TopUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUnderLeftCorner.Z < TopUpperRightCorner1.Z and BottomUnderLeftCorner.Z > TopUnderRightCorner1.Z
		and BottomUnderLeftCorner.X < BottomUpperLeftCorner1.X and BottomUnderLeftCorner.X > BottomUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperRightCorner1.Z
		and BottomUnderLeftCorner.X < TopUpperLeftCorner1.X and BottomUnderLeftCorner.X > TopUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUnderLeftCorner.Z > TopUnderLeftCorner1.Z
		and BottomUnderLeftCorner.X < BottomUnderLeftCorner1.X and BottomUnderLeftCorner.X > BottomUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
		then
		--If all Corners are in the Region3 then return true
		return true

		else
			--Else return false
			return false
			
		end
	
	elseif typeof(PartForRegion3) == "Instance" and typeof(CalculateRegion3ByBasePart) == "boolean" and CalculateRegion3ByBasePart == true and typeof(CalculateCornersByParameters) == "boolean" and CalculateCornersByParameters == false then
		if PartForRegion3.Shape == Enum.PartType.Block then
			--Else create a Region3 with the PartForRegion3 parameter, our Part to make a Region3
			Region = Region3.new(PartForRegion3.Position - (PartForRegion3.Size/2), PartForRegion3.Position + (PartForRegion3.Size/2))
			Position1 = Region.CFrame
			Size1 = Region.Size
			
			--Rotate the corners to control if it was in the Objectspace
			TopUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, -Size1.Z/2)
			TopUpperRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, Size1.Z/2)
			BottomUpperRightCorner1 = Position1*CFrame.new(-Size1/2)
			BottomUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
			BottomUpperLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , -Size1.Z/2)
			TopUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , Size1.Y/2 , -Size1.Z/2)
			TopUpperLeftCorner1 = Position1*CFrame.new(Size1/2)
			BottomUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
			
			TopUnderRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
			TopUpperRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
			BottomUpperRightCorner = Position*CFrame.new(-Size/2)
			BottomUnderLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
			BottomUpperLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
			TopUnderLeftCorner = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
			TopUpperLeftCorner = Position*CFrame.new(Size/2)
			BottomUnderRightCorner = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
			
			--Control all the corners, ALL!
			if TopUnderRightCorner.X < TopUnderLeftCorner1.X and TopUnderRightCorner.X > TopUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderRightCorner1.Y and TopUnderRightCorner.Y > BottomUpperRightCorner1.Y and TopUnderRightCorner.Z < TopUpperRightCorner1.Z and TopUnderRightCorner.Z > TopUnderRightCorner1.Z 
			and TopUnderRightCorner.X < BottomUpperLeftCorner1.X and TopUnderRightCorner.X > BottomUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperRightCorner1.Y and TopUnderRightCorner.Y > BottomUnderRightCorner1.Y and TopUnderRightCorner.Z < BottomUnderRightCorner1.Z and TopUnderRightCorner.Z > BottomUpperRightCorner1.Z 
			and TopUnderRightCorner.X < TopUpperLeftCorner1.X and TopUnderRightCorner.X > TopUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperLeftCorner1.Y and TopUnderRightCorner.Y > BottomUnderLeftCorner1.Y and TopUnderRightCorner.Z < TopUpperLeftCorner1.Z and TopUnderRightCorner.Z > TopUnderLeftCorner1.Z 
			and TopUnderRightCorner.X < BottomUnderLeftCorner1.X and TopUnderRightCorner.X > BottomUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderLeftCorner1.Y and TopUnderRightCorner.Y > BottomUpperLeftCorner1.Y and TopUnderRightCorner.Z < BottomUnderLeftCorner1.Z and TopUnderRightCorner.Z > BottomUpperLeftCorner1.Z 
			and TopUpperRightCorner.X < TopUnderLeftCorner1.X and TopUpperRightCorner.X > TopUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderRightCorner1.Y and TopUpperRightCorner.Y > BottomUpperRightCorner1.Y and TopUpperRightCorner.Z < TopUpperRightCorner1.Z and TopUpperRightCorner.Z > TopUnderRightCorner1.Z 
			and TopUpperRightCorner.X < BottomUpperLeftCorner1.X and TopUpperRightCorner.X > BottomUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperRightCorner1.Y and TopUpperRightCorner.Y > BottomUnderRightCorner1.Y and TopUpperRightCorner.Z < BottomUnderRightCorner1.Z and TopUpperRightCorner.Z > BottomUpperRightCorner1.Z 
			and TopUpperRightCorner.X < TopUpperLeftCorner1.X and TopUpperRightCorner.X > TopUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperLeftCorner1.Y and TopUpperRightCorner.Y > BottomUnderLeftCorner1.Y and TopUpperRightCorner.Z < TopUpperLeftCorner1.Z and TopUpperRightCorner.Z > TopUnderLeftCorner1.Z 
			and TopUpperRightCorner.X < BottomUnderLeftCorner1.X and TopUpperRightCorner.X > BottomUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderLeftCorner1.Y and TopUpperRightCorner.Y > BottomUpperLeftCorner1.Y and TopUpperRightCorner.Z < BottomUnderLeftCorner1.Z and TopUpperRightCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUpperRightCorner.X < TopUnderLeftCorner1.X and BottomUpperRightCorner.X > TopUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderRightCorner1.Y and BottomUpperRightCorner.Y > BottomUpperRightCorner1.Y and BottomUpperRightCorner.Z < TopUpperRightCorner1.Z and BottomUpperRightCorner.Z > TopUnderRightCorner1.Z
			and BottomUpperRightCorner.X < BottomUpperLeftCorner1.X and BottomUpperRightCorner.X > BottomUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperRightCorner1.Y and BottomUpperRightCorner.Y > BottomUnderRightCorner1.Y and BottomUpperRightCorner.Z < BottomUnderRightCorner1.Z and BottomUpperRightCorner.Z > BottomUpperRightCorner1.Z
			and BottomUpperRightCorner.X < TopUpperLeftCorner1.X and BottomUpperRightCorner.X > TopUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperRightCorner.Z < TopUpperLeftCorner1.Z and BottomUpperRightCorner.Z > TopUnderLeftCorner1.Z
			and BottomUpperRightCorner.X < BottomUnderLeftCorner1.X and BottomUpperRightCorner.X > BottomUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperRightCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUnderRightCorner.X < TopUnderLeftCorner1.X and BottomUnderRightCorner.X > TopUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderRightCorner1.Y and BottomUnderRightCorner.Y > BottomUpperRightCorner1.Y and BottomUnderRightCorner.Z < TopUpperRightCorner1.Z and BottomUnderRightCorner.Z > TopUnderRightCorner1.Z
			and BottomUnderRightCorner.X < BottomUpperLeftCorner1.X and BottomUnderRightCorner.X > BottomUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperRightCorner1.Y and BottomUnderRightCorner.Y > BottomUnderRightCorner1.Y and BottomUnderRightCorner.Z < BottomUnderRightCorner1.Z and BottomUnderRightCorner.Z > BottomUpperRightCorner1.Z
			and BottomUnderRightCorner.X < TopUpperLeftCorner1.X and BottomUnderRightCorner.X > TopUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderRightCorner.Z < TopUpperLeftCorner1.Z and BottomUnderRightCorner.Z > TopUnderLeftCorner1.Z
			and BottomUnderRightCorner.X < BottomUnderLeftCorner1.X and BottomUnderRightCorner.X > BottomUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderRightCorner.Z > BottomUpperLeftCorner1.Z
			and TopUnderLeftCorner.X < TopUnderLeftCorner1.X and TopUnderLeftCorner.X > TopUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderRightCorner1.Y and TopUnderLeftCorner.Y > BottomUpperRightCorner1.Y and TopUnderLeftCorner.Z < TopUpperRightCorner1.Z and TopUnderLeftCorner.Z > TopUnderRightCorner1.Z
			and TopUnderLeftCorner.X < BottomUpperLeftCorner1.X and TopUnderLeftCorner.X > BottomUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperRightCorner1.Y and TopUnderLeftCorner.Y > BottomUnderRightCorner1.Y and TopUnderLeftCorner.Z < BottomUnderRightCorner1.Z and TopUnderLeftCorner.Z > BottomUpperRightCorner1.Z
			and TopUnderLeftCorner.X < TopUpperLeftCorner1.X and TopUnderLeftCorner.X > TopUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUnderLeftCorner.Z < TopUpperLeftCorner1.Z and TopUnderLeftCorner.Z > TopUnderLeftCorner1.Z
			and TopUnderLeftCorner.X < BottomUnderLeftCorner1.X and TopUnderLeftCorner.X > BottomUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
			and TopUpperLeftCorner.X < TopUnderLeftCorner1.X and TopUpperLeftCorner.X > TopUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderRightCorner1.Y and TopUpperLeftCorner.Y > BottomUpperRightCorner1.Y and TopUpperLeftCorner.Z < TopUpperRightCorner1.Z and TopUpperLeftCorner.Z > TopUnderRightCorner1.Z
			and TopUpperLeftCorner.X < BottomUpperLeftCorner1.X and TopUpperLeftCorner.X > BottomUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperRightCorner1.Y and TopUpperLeftCorner.Y > BottomUnderRightCorner1.Y and TopUpperLeftCorner.Z < BottomUnderRightCorner1.Z and TopUpperLeftCorner.Z > BottomUpperRightCorner1.Z
			and TopUpperLeftCorner.X < TopUpperLeftCorner1.X and TopUpperLeftCorner.X > TopUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUpperLeftCorner.Z < TopUpperLeftCorner1.Z and TopUpperLeftCorner.Z > TopUnderLeftCorner1.Z
			and TopUpperLeftCorner.X < BottomUnderLeftCorner1.X and TopUpperLeftCorner.X > BottomUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUpperLeftCorner.X < TopUnderLeftCorner1.X and BottomUpperLeftCorner.X > TopUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUpperLeftCorner.Z < TopUpperRightCorner1.Z and BottomUpperLeftCorner.Z > TopUnderRightCorner1.Z
			and BottomUpperLeftCorner.X < BottomUpperLeftCorner1.X and BottomUpperLeftCorner.X > BottomUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperRightCorner1.Z
			and BottomUpperLeftCorner.X < TopUpperLeftCorner1.X and BottomUpperLeftCorner.X > TopUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUpperLeftCorner.Z > TopUnderLeftCorner1.Z
			and BottomUpperLeftCorner.X < BottomUnderLeftCorner1.X and BottomUpperLeftCorner.X > BottomUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUnderLeftCorner.X < TopUnderLeftCorner1.X and BottomUnderLeftCorner.X > TopUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUnderLeftCorner.Z < TopUpperRightCorner1.Z and BottomUnderLeftCorner.Z > TopUnderRightCorner1.Z
			and BottomUnderLeftCorner.X < BottomUpperLeftCorner1.X and BottomUnderLeftCorner.X > BottomUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperRightCorner1.Z
			and BottomUnderLeftCorner.X < TopUpperLeftCorner1.X and BottomUnderLeftCorner.X > TopUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUnderLeftCorner.Z > TopUnderLeftCorner1.Z
			and BottomUnderLeftCorner.X < BottomUnderLeftCorner1.X and BottomUnderLeftCorner.X > BottomUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
			then
			--If all Corners are in the Region3 then return true
			return true
	
			else
				--Else return false
				return false
				
			end
		end
		
	elseif typeof(Region) == "Region3" and typeof(CalculateCornersByParameters) == "boolean" and CalculateCornersByParameters == true and typeof(ParameterPosition) == "CFrame" and typeof(ParameterSize) == "Vector3" and typeof(ParameterShape) == "EnumItem" then
		--Check if the "Part", that is be created with the both parameters, is in the Region3
		Part = {}
		Part.Position = ParameterPosition
		Part.Size = ParameterSize
		Part.Shape = ParameterShape
		Position = Part.Position
		Size = Part.Size
		Shape = Part.Shape
		--If the Shape of the Part is a Block, then calculate with the formula of the Block (the script block i write here under)
		if Shape == Enum.PartType.Block then
			--Else create a Region3 with the PartForRegion3 parameter, our Part to make a Region3
			Position1 = Region.CFrame
			Size1 = Region.Size
			
			--Rotate the corners to control if it was in the Objectspace
			TopUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, -Size1.Z/2)
			TopUpperRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, Size1.Z/2)
			BottomUpperRightCorner1 = Position1*CFrame.new(-Size1/2)
			BottomUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
			BottomUpperLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , -Size1.Z/2)
			TopUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , Size1.Y/2 , -Size1.Z/2)
			TopUpperLeftCorner1 = Position1*CFrame.new(Size1/2)
			BottomUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
			TopUnderRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
			TopUpperRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
			BottomUpperRightCorner = Position*CFrame.new(-Size/2)
			BottomUnderLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
			BottomUpperLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
			TopUnderLeftCorner = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
			TopUpperLeftCorner = Position*CFrame.new(Size/2)
			BottomUnderRightCorner = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
			
			--Control all the corners, ALL!
			if TopUnderRightCorner.X < TopUnderLeftCorner1.X and TopUnderRightCorner.X > TopUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderRightCorner1.Y and TopUnderRightCorner.Y > BottomUpperRightCorner1.Y and TopUnderRightCorner.Z < TopUpperRightCorner1.Z and TopUnderRightCorner.Z > TopUnderRightCorner1.Z 
			and TopUnderRightCorner.X < BottomUpperLeftCorner1.X and TopUnderRightCorner.X > BottomUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperRightCorner1.Y and TopUnderRightCorner.Y > BottomUnderRightCorner1.Y and TopUnderRightCorner.Z < BottomUnderRightCorner1.Z and TopUnderRightCorner.Z > BottomUpperRightCorner1.Z 
			and TopUnderRightCorner.X < TopUpperLeftCorner1.X and TopUnderRightCorner.X > TopUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperLeftCorner1.Y and TopUnderRightCorner.Y > BottomUnderLeftCorner1.Y and TopUnderRightCorner.Z < TopUpperLeftCorner1.Z and TopUnderRightCorner.Z > TopUnderLeftCorner1.Z 
			and TopUnderRightCorner.X < BottomUnderLeftCorner1.X and TopUnderRightCorner.X > BottomUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderLeftCorner1.Y and TopUnderRightCorner.Y > BottomUpperLeftCorner1.Y and TopUnderRightCorner.Z < BottomUnderLeftCorner1.Z and TopUnderRightCorner.Z > BottomUpperLeftCorner1.Z 
			and TopUpperRightCorner.X < TopUnderLeftCorner1.X and TopUpperRightCorner.X > TopUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderRightCorner1.Y and TopUpperRightCorner.Y > BottomUpperRightCorner1.Y and TopUpperRightCorner.Z < TopUpperRightCorner1.Z and TopUpperRightCorner.Z > TopUnderRightCorner1.Z 
			and TopUpperRightCorner.X < BottomUpperLeftCorner1.X and TopUpperRightCorner.X > BottomUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperRightCorner1.Y and TopUpperRightCorner.Y > BottomUnderRightCorner1.Y and TopUpperRightCorner.Z < BottomUnderRightCorner1.Z and TopUpperRightCorner.Z > BottomUpperRightCorner1.Z 
			and TopUpperRightCorner.X < TopUpperLeftCorner1.X and TopUpperRightCorner.X > TopUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperLeftCorner1.Y and TopUpperRightCorner.Y > BottomUnderLeftCorner1.Y and TopUpperRightCorner.Z < TopUpperLeftCorner1.Z and TopUpperRightCorner.Z > TopUnderLeftCorner1.Z 
			and TopUpperRightCorner.X < BottomUnderLeftCorner1.X and TopUpperRightCorner.X > BottomUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderLeftCorner1.Y and TopUpperRightCorner.Y > BottomUpperLeftCorner1.Y and TopUpperRightCorner.Z < BottomUnderLeftCorner1.Z and TopUpperRightCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUpperRightCorner.X < TopUnderLeftCorner1.X and BottomUpperRightCorner.X > TopUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderRightCorner1.Y and BottomUpperRightCorner.Y > BottomUpperRightCorner1.Y and BottomUpperRightCorner.Z < TopUpperRightCorner1.Z and BottomUpperRightCorner.Z > TopUnderRightCorner1.Z
			and BottomUpperRightCorner.X < BottomUpperLeftCorner1.X and BottomUpperRightCorner.X > BottomUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperRightCorner1.Y and BottomUpperRightCorner.Y > BottomUnderRightCorner1.Y and BottomUpperRightCorner.Z < BottomUnderRightCorner1.Z and BottomUpperRightCorner.Z > BottomUpperRightCorner1.Z
			and BottomUpperRightCorner.X < TopUpperLeftCorner1.X and BottomUpperRightCorner.X > TopUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperRightCorner.Z < TopUpperLeftCorner1.Z and BottomUpperRightCorner.Z > TopUnderLeftCorner1.Z
			and BottomUpperRightCorner.X < BottomUnderLeftCorner1.X and BottomUpperRightCorner.X > BottomUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperRightCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUnderRightCorner.X < TopUnderLeftCorner1.X and BottomUnderRightCorner.X > TopUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderRightCorner1.Y and BottomUnderRightCorner.Y > BottomUpperRightCorner1.Y and BottomUnderRightCorner.Z < TopUpperRightCorner1.Z and BottomUnderRightCorner.Z > TopUnderRightCorner1.Z
			and BottomUnderRightCorner.X < BottomUpperLeftCorner1.X and BottomUnderRightCorner.X > BottomUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperRightCorner1.Y and BottomUnderRightCorner.Y > BottomUnderRightCorner1.Y and BottomUnderRightCorner.Z < BottomUnderRightCorner1.Z and BottomUnderRightCorner.Z > BottomUpperRightCorner1.Z
			and BottomUnderRightCorner.X < TopUpperLeftCorner1.X and BottomUnderRightCorner.X > TopUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderRightCorner.Z < TopUpperLeftCorner1.Z and BottomUnderRightCorner.Z > TopUnderLeftCorner1.Z
			and BottomUnderRightCorner.X < BottomUnderLeftCorner1.X and BottomUnderRightCorner.X > BottomUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderRightCorner.Z > BottomUpperLeftCorner1.Z
			and TopUnderLeftCorner.X < TopUnderLeftCorner1.X and TopUnderLeftCorner.X > TopUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderRightCorner1.Y and TopUnderLeftCorner.Y > BottomUpperRightCorner1.Y and TopUnderLeftCorner.Z < TopUpperRightCorner1.Z and TopUnderLeftCorner.Z > TopUnderRightCorner1.Z
			and TopUnderLeftCorner.X < BottomUpperLeftCorner1.X and TopUnderLeftCorner.X > BottomUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperRightCorner1.Y and TopUnderLeftCorner.Y > BottomUnderRightCorner1.Y and TopUnderLeftCorner.Z < BottomUnderRightCorner1.Z and TopUnderLeftCorner.Z > BottomUpperRightCorner1.Z
			and TopUnderLeftCorner.X < TopUpperLeftCorner1.X and TopUnderLeftCorner.X > TopUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUnderLeftCorner.Z < TopUpperLeftCorner1.Z and TopUnderLeftCorner.Z > TopUnderLeftCorner1.Z
			and TopUnderLeftCorner.X < BottomUnderLeftCorner1.X and TopUnderLeftCorner.X > BottomUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
			and TopUpperLeftCorner.X < TopUnderLeftCorner1.X and TopUpperLeftCorner.X > TopUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderRightCorner1.Y and TopUpperLeftCorner.Y > BottomUpperRightCorner1.Y and TopUpperLeftCorner.Z < TopUpperRightCorner1.Z and TopUpperLeftCorner.Z > TopUnderRightCorner1.Z
			and TopUpperLeftCorner.X < BottomUpperLeftCorner1.X and TopUpperLeftCorner.X > BottomUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperRightCorner1.Y and TopUpperLeftCorner.Y > BottomUnderRightCorner1.Y and TopUpperLeftCorner.Z < BottomUnderRightCorner1.Z and TopUpperLeftCorner.Z > BottomUpperRightCorner1.Z
			and TopUpperLeftCorner.X < TopUpperLeftCorner1.X and TopUpperLeftCorner.X > TopUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUpperLeftCorner.Z < TopUpperLeftCorner1.Z and TopUpperLeftCorner.Z > TopUnderLeftCorner1.Z
			and TopUpperLeftCorner.X < BottomUnderLeftCorner1.X and TopUpperLeftCorner.X > BottomUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUpperLeftCorner.X < TopUnderLeftCorner1.X and BottomUpperLeftCorner.X > TopUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUpperLeftCorner.Z < TopUpperRightCorner1.Z and BottomUpperLeftCorner.Z > TopUnderRightCorner1.Z
			and BottomUpperLeftCorner.X < BottomUpperLeftCorner1.X and BottomUpperLeftCorner.X > BottomUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperRightCorner1.Z
			and BottomUpperLeftCorner.X < TopUpperLeftCorner1.X and BottomUpperLeftCorner.X > TopUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUpperLeftCorner.Z > TopUnderLeftCorner1.Z
			and BottomUpperLeftCorner.X < BottomUnderLeftCorner1.X and BottomUpperLeftCorner.X > BottomUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUnderLeftCorner.X < TopUnderLeftCorner1.X and BottomUnderLeftCorner.X > TopUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUnderLeftCorner.Z < TopUpperRightCorner1.Z and BottomUnderLeftCorner.Z > TopUnderRightCorner1.Z
			and BottomUnderLeftCorner.X < BottomUpperLeftCorner1.X and BottomUnderLeftCorner.X > BottomUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperRightCorner1.Z
			and BottomUnderLeftCorner.X < TopUpperLeftCorner1.X and BottomUnderLeftCorner.X > TopUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUnderLeftCorner.Z > TopUnderLeftCorner1.Z
			and BottomUnderLeftCorner.X < BottomUnderLeftCorner1.X and BottomUnderLeftCorner.X > BottomUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
			then
			--If all Corners are in the Region3 then return true
			return true
	
			else
				--Else return false
				return false
				
			end
		end
	elseif typeof(PartForRegion3) == "Instance" and typeof(CalculateRegion3ByBasePart) == "boolean" and CalculateRegion3ByBasePart == true and typeof(CalculateCornersByParameters) == "boolean" and CalculateCornersByParameters == true and typeof(ParameterPosition) == "CFrame" and typeof(ParameterSize) == "Vector3" and typeof(ParameterShape) == "EnumItem" then
		--Check if the "Part", that is be created with the both parameters, is in the Region3
		Part = {}
		Part.Position = ParameterPosition
		Part.Size = ParameterSize
		Part.Shape = ParameterShape
		Position = Part.Position
		Size = Part.Size
		Shape = Part.Shape
		--If the Shape of the Part is a Block, then calculate with the formula of the Block (the script block i write here under)
		if Shape == Enum.PartType.Block then
			--Else create a Region3 with the PartForRegion3 parameter, our Part to make a Region3
			Region = Region3.new(PartForRegion3.Position - (PartForRegion3.Size/2), PartForRegion3.Position + (PartForRegion3.Size/2))
			Position1 = Region.CFrame
			Size1 = Region.Size
			
			--Rotate the corners to control if it was in the Objectspace
			TopUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, -Size1.Z/2)
			TopUpperRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, Size1.Z/2)
			BottomUpperRightCorner1 = Position1*CFrame.new(-Size1/2)
			BottomUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
			BottomUpperLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , -Size1.Z/2)
			TopUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , Size1.Y/2 , -Size1.Z/2)
			TopUpperLeftCorner1 = Position1*CFrame.new(Size1/2)
			BottomUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
			TopUnderRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
			TopUpperRightCorner = Position*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
			BottomUpperRightCorner = Position*CFrame.new(-Size/2)
			BottomUnderLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
			BottomUpperLeftCorner = Position*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
			TopUnderLeftCorner = Position*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
			TopUpperLeftCorner = Position*CFrame.new(Size/2)
			BottomUnderRightCorner = Position*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
			
			--Control all the corners, ALL!
			if TopUnderRightCorner.X < TopUnderLeftCorner1.X and TopUnderRightCorner.X > TopUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderRightCorner1.Y and TopUnderRightCorner.Y > BottomUpperRightCorner1.Y and TopUnderRightCorner.Z < TopUpperRightCorner1.Z and TopUnderRightCorner.Z > TopUnderRightCorner1.Z 
			and TopUnderRightCorner.X < BottomUpperLeftCorner1.X and TopUnderRightCorner.X > BottomUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperRightCorner1.Y and TopUnderRightCorner.Y > BottomUnderRightCorner1.Y and TopUnderRightCorner.Z < BottomUnderRightCorner1.Z and TopUnderRightCorner.Z > BottomUpperRightCorner1.Z 
			and TopUnderRightCorner.X < TopUpperLeftCorner1.X and TopUnderRightCorner.X > TopUpperRightCorner1.X and TopUnderRightCorner.Y < TopUpperLeftCorner1.Y and TopUnderRightCorner.Y > BottomUnderLeftCorner1.Y and TopUnderRightCorner.Z < TopUpperLeftCorner1.Z and TopUnderRightCorner.Z > TopUnderLeftCorner1.Z 
			and TopUnderRightCorner.X < BottomUnderLeftCorner1.X and TopUnderRightCorner.X > BottomUnderRightCorner1.X and TopUnderRightCorner.Y < TopUnderLeftCorner1.Y and TopUnderRightCorner.Y > BottomUpperLeftCorner1.Y and TopUnderRightCorner.Z < BottomUnderLeftCorner1.Z and TopUnderRightCorner.Z > BottomUpperLeftCorner1.Z 
			and TopUpperRightCorner.X < TopUnderLeftCorner1.X and TopUpperRightCorner.X > TopUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderRightCorner1.Y and TopUpperRightCorner.Y > BottomUpperRightCorner1.Y and TopUpperRightCorner.Z < TopUpperRightCorner1.Z and TopUpperRightCorner.Z > TopUnderRightCorner1.Z 
			and TopUpperRightCorner.X < BottomUpperLeftCorner1.X and TopUpperRightCorner.X > BottomUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperRightCorner1.Y and TopUpperRightCorner.Y > BottomUnderRightCorner1.Y and TopUpperRightCorner.Z < BottomUnderRightCorner1.Z and TopUpperRightCorner.Z > BottomUpperRightCorner1.Z 
			and TopUpperRightCorner.X < TopUpperLeftCorner1.X and TopUpperRightCorner.X > TopUpperRightCorner1.X and TopUpperRightCorner.Y < TopUpperLeftCorner1.Y and TopUpperRightCorner.Y > BottomUnderLeftCorner1.Y and TopUpperRightCorner.Z < TopUpperLeftCorner1.Z and TopUpperRightCorner.Z > TopUnderLeftCorner1.Z 
			and TopUpperRightCorner.X < BottomUnderLeftCorner1.X and TopUpperRightCorner.X > BottomUnderRightCorner1.X and TopUpperRightCorner.Y < TopUnderLeftCorner1.Y and TopUpperRightCorner.Y > BottomUpperLeftCorner1.Y and TopUpperRightCorner.Z < BottomUnderLeftCorner1.Z and TopUpperRightCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUpperRightCorner.X < TopUnderLeftCorner1.X and BottomUpperRightCorner.X > TopUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderRightCorner1.Y and BottomUpperRightCorner.Y > BottomUpperRightCorner1.Y and BottomUpperRightCorner.Z < TopUpperRightCorner1.Z and BottomUpperRightCorner.Z > TopUnderRightCorner1.Z
			and BottomUpperRightCorner.X < BottomUpperLeftCorner1.X and BottomUpperRightCorner.X > BottomUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperRightCorner1.Y and BottomUpperRightCorner.Y > BottomUnderRightCorner1.Y and BottomUpperRightCorner.Z < BottomUnderRightCorner1.Z and BottomUpperRightCorner.Z > BottomUpperRightCorner1.Z
			and BottomUpperRightCorner.X < TopUpperLeftCorner1.X and BottomUpperRightCorner.X > TopUpperRightCorner1.X and BottomUpperRightCorner.Y < TopUpperLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperRightCorner.Z < TopUpperLeftCorner1.Z and BottomUpperRightCorner.Z > TopUnderLeftCorner1.Z
			and BottomUpperRightCorner.X < BottomUnderLeftCorner1.X and BottomUpperRightCorner.X > BottomUnderRightCorner1.X and BottomUpperRightCorner.Y < TopUnderLeftCorner1.Y and BottomUpperRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperRightCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUnderRightCorner.X < TopUnderLeftCorner1.X and BottomUnderRightCorner.X > TopUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderRightCorner1.Y and BottomUnderRightCorner.Y > BottomUpperRightCorner1.Y and BottomUnderRightCorner.Z < TopUpperRightCorner1.Z and BottomUnderRightCorner.Z > TopUnderRightCorner1.Z
			and BottomUnderRightCorner.X < BottomUpperLeftCorner1.X and BottomUnderRightCorner.X > BottomUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperRightCorner1.Y and BottomUnderRightCorner.Y > BottomUnderRightCorner1.Y and BottomUnderRightCorner.Z < BottomUnderRightCorner1.Z and BottomUnderRightCorner.Z > BottomUpperRightCorner1.Z
			and BottomUnderRightCorner.X < TopUpperLeftCorner1.X and BottomUnderRightCorner.X > TopUpperRightCorner1.X and BottomUnderRightCorner.Y < TopUpperLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderRightCorner.Z < TopUpperLeftCorner1.Z and BottomUnderRightCorner.Z > TopUnderLeftCorner1.Z
			and BottomUnderRightCorner.X < BottomUnderLeftCorner1.X and BottomUnderRightCorner.X > BottomUnderRightCorner1.X and BottomUnderRightCorner.Y < TopUnderLeftCorner1.Y and BottomUnderRightCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderRightCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderRightCorner.Z > BottomUpperLeftCorner1.Z
			and TopUnderLeftCorner.X < TopUnderLeftCorner1.X and TopUnderLeftCorner.X > TopUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderRightCorner1.Y and TopUnderLeftCorner.Y > BottomUpperRightCorner1.Y and TopUnderLeftCorner.Z < TopUpperRightCorner1.Z and TopUnderLeftCorner.Z > TopUnderRightCorner1.Z
			and TopUnderLeftCorner.X < BottomUpperLeftCorner1.X and TopUnderLeftCorner.X > BottomUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperRightCorner1.Y and TopUnderLeftCorner.Y > BottomUnderRightCorner1.Y and TopUnderLeftCorner.Z < BottomUnderRightCorner1.Z and TopUnderLeftCorner.Z > BottomUpperRightCorner1.Z
			and TopUnderLeftCorner.X < TopUpperLeftCorner1.X and TopUnderLeftCorner.X > TopUpperRightCorner1.X and TopUnderLeftCorner.Y < TopUpperLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUnderLeftCorner.Z < TopUpperLeftCorner1.Z and TopUnderLeftCorner.Z > TopUnderLeftCorner1.Z
			and TopUnderLeftCorner.X < BottomUnderLeftCorner1.X and TopUnderLeftCorner.X > BottomUnderRightCorner1.X and TopUnderLeftCorner.Y < TopUnderLeftCorner1.Y and TopUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
			and TopUpperLeftCorner.X < TopUnderLeftCorner1.X and TopUpperLeftCorner.X > TopUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderRightCorner1.Y and TopUpperLeftCorner.Y > BottomUpperRightCorner1.Y and TopUpperLeftCorner.Z < TopUpperRightCorner1.Z and TopUpperLeftCorner.Z > TopUnderRightCorner1.Z
			and TopUpperLeftCorner.X < BottomUpperLeftCorner1.X and TopUpperLeftCorner.X > BottomUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperRightCorner1.Y and TopUpperLeftCorner.Y > BottomUnderRightCorner1.Y and TopUpperLeftCorner.Z < BottomUnderRightCorner1.Z and TopUpperLeftCorner.Z > BottomUpperRightCorner1.Z
			and TopUpperLeftCorner.X < TopUpperLeftCorner1.X and TopUpperLeftCorner.X > TopUpperRightCorner1.X and TopUpperLeftCorner.Y < TopUpperLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and TopUpperLeftCorner.Z < TopUpperLeftCorner1.Z and TopUpperLeftCorner.Z > TopUnderLeftCorner1.Z
			and TopUpperLeftCorner.X < BottomUnderLeftCorner1.X and TopUpperLeftCorner.X > BottomUnderRightCorner1.X and TopUpperLeftCorner.Y < TopUnderLeftCorner1.Y and TopUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and TopUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and TopUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUpperLeftCorner.X < TopUnderLeftCorner1.X and BottomUpperLeftCorner.X > TopUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUpperLeftCorner.Z < TopUpperRightCorner1.Z and BottomUpperLeftCorner.Z > TopUnderRightCorner1.Z
			and BottomUpperLeftCorner.X < BottomUpperLeftCorner1.X and BottomUpperLeftCorner.X > BottomUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperRightCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperRightCorner1.Z
			and BottomUpperLeftCorner.X < TopUpperLeftCorner1.X and BottomUpperLeftCorner.X > TopUpperRightCorner1.X and BottomUpperLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUpperLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUpperLeftCorner.Z > TopUnderLeftCorner1.Z
			and BottomUpperLeftCorner.X < BottomUnderLeftCorner1.X and BottomUpperLeftCorner.X > BottomUnderRightCorner1.X and BottomUpperLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUpperLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUpperLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUpperLeftCorner.Z > BottomUpperLeftCorner1.Z
			and BottomUnderLeftCorner.X < TopUnderLeftCorner1.X and BottomUnderLeftCorner.X > TopUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperRightCorner1.Y and BottomUnderLeftCorner.Z < TopUpperRightCorner1.Z and BottomUnderLeftCorner.Z > TopUnderRightCorner1.Z
			and BottomUnderLeftCorner.X < BottomUpperLeftCorner1.X and BottomUnderLeftCorner.X > BottomUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperRightCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderRightCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderRightCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperRightCorner1.Z
			and BottomUnderLeftCorner.X < TopUpperLeftCorner1.X and BottomUnderLeftCorner.X > TopUpperRightCorner1.X and BottomUnderLeftCorner.Y < TopUpperLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUnderLeftCorner1.Y and BottomUnderLeftCorner.Z < TopUpperLeftCorner1.Z and BottomUnderLeftCorner.Z > TopUnderLeftCorner1.Z
			and BottomUnderLeftCorner.X < BottomUnderLeftCorner1.X and BottomUnderLeftCorner.X > BottomUnderRightCorner1.X and BottomUnderLeftCorner.Y < TopUnderLeftCorner1.Y and BottomUnderLeftCorner.Y > BottomUpperLeftCorner1.Y and BottomUnderLeftCorner.Z < BottomUnderLeftCorner1.Z and BottomUnderLeftCorner.Z > BottomUpperLeftCorner1.Z
			then
			--If all Corners are in the Region3 then return true
			return true
	
			else
				--Else return false
				return false
				
			end
		end
	else
		--If nothing work then the Parameters are incorrect and the Module will launch a error message
		error("CornerModule error message from function GetCorners() : Incorrect Parameters.")
	end
end

return CornerModule
```
