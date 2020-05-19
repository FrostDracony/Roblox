```lua
local CompareModule = {}

function CompareGreaterThan(Input1: number, Input2: number)
	return Input1 >= Input2 and true or false
end

function CompareLessThan(Input1: number, Input2: number)
	return Input1 <= Input2 and true or false
end

function CompareModule.CheckValues(Part, Region) => boolean
	local PartCFrame = Part.CFrame
	local Size = Part.Size
	
	local Position1 = Region.CFrame
	local Size1 = Region.Size
	
	local TopUnderRightCorner = PartCFrame*CFrame.new(-Size.X/2, Size.Y/2, -Size.Z/2)
	local TopUpperRightCorner = PartCFrame*CFrame.new(-Size.X/2, Size.Y/2, Size.Z/2)
	local BottomUpperRightCorner = PartCFrame*CFrame.new(-Size/2)
	local BottomUnderLeftCorner = PartCFrame*CFrame.new(Size.X/2 , -Size.Y/2 , Size.Z/2)
	local BottomUpperLeftCorner = PartCFrame*CFrame.new(Size.X/2 , -Size.Y/2 , -Size.Z/2)
	local TopUnderLeftCorner = PartCFrame*CFrame.new(Size.X/2 , Size.Y/2 , -Size.Z/2)
	local TopUpperLeftCorner = PartCFrame*CFrame.new(Size/2)
	local BottomUnderRightCorner = PartCFrame*CFrame.new(-Size.X/2 , -Size.Y/2 , Size.Z/2)
	
	local TopUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, -Size1.Z/2)
	local TopUpperRightCorner1 = Position1*CFrame.new(-Size1.X/2, Size1.Y/2, Size1.Z/2)
	local BottomUpperRightCorner1 = Position1*CFrame.new(-Size1/2)
	local BottomUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , Size1.Z/2)
	local BottomUpperLeftCorner1 = Position1*CFrame.new(Size1.X/2 , -Size1.Y/2 , -Size1.Z/2)
	local TopUnderLeftCorner1 = Position1*CFrame.new(Size1.X/2 , Size1.Y/2 , -Size1.Z/2)
	local TopUpperLeftCorner1 = Position1*CFrame.new(Size1/2)
	local BottomUnderRightCorner1 = Position1*CFrame.new(-Size1.X/2 , -Size1.Y/2 , Size1.Z/2)

	
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
return CompareModule
```