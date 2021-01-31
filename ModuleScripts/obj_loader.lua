---------------------------------------------------------------------------
local Loader = {}

local VertexClass = require(script.Parent.VertexClass) --Getting the Vertex Class
local FaceClass = require(script.Parent.FaceClass) --Getting the Face Class
type Vertex = VertexClass.Vertex --Creating the Vertex type
type Face = FaceClass.Face --Creating the Vertex type


--[[
	A function to create a table to 
	store the value of the whole OBJ 
	model
]]--
local function CreateModel()
	local ModelTable = {} --The Model, it is represented as a table
	
	ModelTable.Vertices = {} --In this table, all vertices will be stored
	ModelTable.Faces = {} --In this table, all faces will be stored
	ModelTable.LastParent = nil --This stores the last parent that the vertices parts was parented to, see the function "HideVertices"
	
	ModelTable.FillFaces = function(self, Parent:Instance) --With this function, set the faces parts to the parent passed in the parameters
		for _,facedata:Face in ipairs(self.Faces) do --for each face
			
			for _,wedgepart:WedgePart in ipairs(facedata.FaceInstance) do--for each wedgepart ("for each facepart")...
				wedgepart.Parent = Parent --...set its parent to the parent passed in the parameter
			end

		end
	end
	
	ModelTable.HideFaces = function(self) --With this function, hide the faces parts
		for _,facedata:Face in ipairs(self.Faces) do --for each face
			
			for _,wedgepart:WedgePart in ipairs(facedata.FaceInstance) do--for each wedgepart ("for each facepart")...
				wedgepart.Parent = nil --...set its parent to the nil (Hide it)
			end
			
		end
	end
	
	ModelTable.ShowVertices = function(self, Parent:Instance) --With this function, set the vertices parts to the parent passed in the parameters
		for _,vertexdata:Vertex in ipairs(self.Vertices) do --for each face
			local Part = Instance.new("Part")
			Part.Anchored = true
			Part.CanCollide = false
			Part.BrickColor = BrickColor.Black()
			Part.Size = Vector3.new(0.05,0.05,0.05)
			Part.Position = vertexdata:GetPosition()
			Part.Parent = Parent
			Part.Shape = Enum.PartType.Ball
			Part.Name = "Vertex"
		end
	end
	
	ModelTable.HideVertices = function(self, TargetParent:Instance)--With this function, hide the vertices parts
		for _,Part:BasePart in ipairs(TargetParent:GetDescendants()) do --for each part
			if Part.Name == "Vertex" then
				Part:Destroy()
			end
		end
	end

	return ModelTable
end

--[[	A function to concate the content of a table	]]--
local function ConctateStrings(Table):string
	local FinalString:string = "" --The returned and final string
	
	for _,tk:string in ipairs(Table) do --for each token member...
		--for s in string.gmatch(tk, "%d+") do end
		FinalString ..= string.match(tk, "%d+").." " --... add its value to the final and returned string (this only works if the table contains numbers or strings, else this will error)
	end
	
	return FinalString --after the for loop ends, return the whole string
end


local function CreateFace(model, token):Face
	
	local Vertices = model.Vertices --all the vertices
	local FaceData:string = ConctateStrings(token) --Get the Facedata like you see on a regular OBJ model
	
	local StorageTable = {} --wrap everthing to a table
	local index = 0 --index in the StorageTable
	
	for str in string.gmatch(FaceData, "%d+") do --for each number
		index += 1 --increment the index
		StorageTable[index] = tonumber(str) --add the number to the storage table, this number is used to 
	end

	return FaceClass.new(Vertices[StorageTable[1]], Vertices[StorageTable[2]], Vertices[StorageTable[3]], Vertices[StorageTable[4]])
	
end


function Loader.loadObj(Settings)
	Settings = Settings or {
		scale = 1;
	};
	
	local active_material = "";
	
	local obj_Operations = {
		--[[
			# is a comment, skip these
		--]]
		['#'] = function(model, token) end,
		
		--[[
			mtllib denotes a required mtl file
		--]]
		['mtllib'] = function(model, token)
			
		end,
		
		--[[
			usemtl tells what material to use for the faces
		--]]
		['usemtl'] = function(model, token)

		end,
		
		--[[
			v denotes vertex
		--]]
		['v'] = function(model, token, Settings)
			local v:Vertex = VertexClass.new(token[1] * Settings.scale, token[2] * Settings.scale, token[3] * Settings.scale, token[4]);
			model.Vertices[#model.Vertices+1] = v
		end,
		
		--[[
			vt denotes texture coordinates(UV)
		--]]
		['vt'] = function(model, token, Settings)

		end,
		
		--[[
			vn denotes normal
		--]]
		['vn'] = function(model, token, Settings)

		end,
		
		--[[
			vp denotes free form geometry
		--]]
		['vp'] = function(model, token, Settings)

		end,
		
		--[[
			f denotes faces
		--]]
		['f'] = function(model, token, Settings)
			local Face:Face = CreateFace(model, token)
			model.Faces[#model.Faces+1] = Face
		end,
		
		--[[
			o denotes object
		--]]
		['o'] = function(model, token, Settings)

		end,
		
		--[[
			g denotes group
		--]]
		['g'] = function(model, token)

		end,
	};
	---------------------------------------------------------------------------
	local data = require(script.OBJModel) --The source-code, in other words the OBJ Model
	local StartTime:number = tick() --Start time
	local model = CreateModel(); --The model that will be returned: Here, all vertices and faces will be stored
	local Table = string.split(data, "\n") --A Table containing all lines of the source-code
	
	for _, line in ipairs(Table) do --for each line
		
		wait() --I added this wait() to avoid too much lag and error because it run to fast
		
		local token = {}; --All tokens will be saved here
		
		for tk in string.gmatch(line, "%S+") do --For each element in the line (example: "Hello this is a test", the tokens would be {"Hello", "this", "is", "a", "test"})...
			token[#token+1] = tk; --...save it in the token table
		end
		
		local identifier = token[1] --The identifier (see how OBJ Files works), it is like "v", or "f"

		if (obj_Operations[identifier]) then --If the matching function is founded then
			table.remove(token, 1); --Remove the identifier from the token table
			obj_Operations[identifier](model, token, Settings); --And run the matching function
		end
		
	end
	
	print("Model returned, full time: ".. (tick() - StartTime)%60)
	
	return model;
end

return Loader