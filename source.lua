local it = 'https://raw.githubusercontent.com/loglizzy/apoc-rising/main/items.lua'
local ir,er = loadstring(game:HttpGet(it))(),{}
for i,v in pairs(ir) do
    er[(v[3] and v[2]) or i] = {v[1],v[2],v[3]}
end

it = 'https://raw.githubusercontent.com/loglizzy/apoc-rising/main/gui.lua'
local gui = loadstring(game:HttpGet(it))()

local function sp(e)
    local e = game.Lighting.LootDrops[e]:Clone()
    e.Parent = workspace
    
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    e:MoveTo((pos*CFrame.new(0,-3,-5)).p)
end

local u2 = { "A", "C", "d", "g", "L", "p", "s", "T", "Z" }
function fd(p1)
	local v1 = #u2;
	local v2 = 1 - 1;
	while true do
		if u2[v2] == p1 then
			return v2;
		end;
		if 0 <= 1 then
			if v2 < v1 then

			else
				break;
			end;
		elseif v1 < v2 then

		else
			break;
		end;
		v2 = v2 + 1;	
	end;
	return "0";
end

local function deb(p2)
	local v3 = nil;
	v3 = "";
	for v4 = 1, 10 do
		v3 = v3 .. fd(string.sub(p2, v4, v4))
	end;
	return tonumber(v3);
end

local cf,ef,ie = {},{},{}
local as = { 156643366, 158285293, 158285396, 157578373, 89755980, 89755989, 89755995, 89756010, 89756019, 89756026, 89756029, 89756037, 89756042, 89756049, 89756059, 89756079, 89756089, 89756104, 89756107, 89756112, 89756119, 89756123, 89950950, 89950711, 89950578, 89950582, 89950584, 89950590, 89209652, 89209638, 89415891, 89353479, 86935800, 87358284, 87346960, 87346966, 87346984, 84892194, 84995870, 84892188, 85415670, 48848471, 22459476, 84197294, 85786504, 84205240, 85786501, 85786493, 85786480, 85786491, 84389877, 84389869, 84231985, 84297527, 84302051, 84335653, 84337739, 84654060, 84654065, 84654067, 84654069, 84756836, 84994421, 84963036, 84963026, 84963028, 84963030, 84963033, 84963051, 85786483, 85786487, 85786495, 85786499, 85335408, 85346905, 85348353, 100688482, 100688486, 100688490, 100688492, 100688495, 100688500, 100735742, 108239595, 108239574, 108239571, 108239581, 108239587, 108239568, 108239555, 108239564, 108239559, 108265412, 108265424, 108265428, 108265417, 108235767, 108235763, 108235758, 108235734, 108235730, 106721721, 108235723, 108235721, 108235741, 108235739, 108235747, 108235715, 108235745, 108256224, 108375342, 108375339, 108235182, 108235165, 108375353, 108235184, 108375358, 108235186, 108235168, 108235167, 108400580, 112746572, 112746597, 112746367, 112746403, 112746557, 112746391, 112746552, 112746418, 112746565, 112746373, 112746408, 112746379, 112746604, 112746587, 583466684, 112746591, 112746387, 112746412, 112746370, 112746580, 112746547, 112746395, 112731896, 112731891, 112731919, 112731921, 112731905, 112731926, 112731912, 112731932, 112731938, 112731946, 114480659, 114480661, 114480649, 114480654, 114480677, 114480682, 114480664, 114480673, 114480718, 114480714, 114480710, 114480706, 114480704, 114480692, 114480696, 114480689, 116675795, 116675800, 116675808, 116675802, 116675805, 116675816, 116675759, 116675810, 116675779, 116675783, 116675773, 116675790, 116675787, 116682808, 116682811, 116682128, 116682136, 116674256, 116674259, 116674269, 116674263, 116674265, 116674277, 116674227, 116674273, 116674241, 116674244, 116674235, 116674252, 116674248, 116704751, 116704747, 116704745, 116704753, 116704767, 116704765, 116704758, 116704770, 116674232, 116675763, 117003267, 117003034 }
local cs = game:GetService("ContentProvider")
for i,v in next,ir do if not as[v[1]] then table.insert(ie,v[1]) end end;pcall(function()
    cs:PreloadAsync(as)
    cs:PreloadAsync(ie)
end)

for i,v in pairs(game.Lighting.LootDrops:GetChildren()) do
    if cf[v.Name] then continue end
    local n,vl = v.Name,v:FindFirstChild('ObjectID') and v.ObjectID.Value
    local img = er[n] or (vl and (as[deb(vl)] or er[deb(vl)]))
    img = (type(img)== 'table' and img[1]) or img
    img = (type(img)== 'number' and 'rbxassetid://'..img) or img
    
    v = gui.new(v.Name,img or '')
    v.MouseButton1Click:Connect(function()
        sp(n)
    end)
    gui.list.CanvasSize = UDim2.new(0,0,0,39*i)
    cf[n] = v
end

gui.list.grid.Padding = UDim.new(0,2)
gui.box:GetPropertyChangedSignal('Text'):Connect(function()
    local id = 0
    for i,v in pairs(cf) do
        v.Visible = i:lower():find(gui.box.Text:lower())
        gui.list.CanvasSize = UDim2.new(0,0,0,gui.list.grid.AbsoluteContentSize.Y)
    end
end)
