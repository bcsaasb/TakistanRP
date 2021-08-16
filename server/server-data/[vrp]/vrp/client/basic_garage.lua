function tvRP.getNearestVehicles(radius)
	local r = {}
	local px,py,pz = tvRP.getPosition()

	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)

	for _,veh in pairs(vehs) do
		local x,y,z = table.unpack(GetEntityCoords(veh,true))
		local distance = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
		if distance <= radius then
			r[veh] = distance
		end
	end
	return r
end

function tvRP.getNearestVehicle(radius)
	local veh
	local vehs = tvRP.getNearestVehicles(radius)
	local min = radius+0.0001
	for _veh,dist in pairs(vehs) do
		if dist < min then
			min = dist
			veh = _veh
		end
	end
	return veh 
end

function tvRP.ejectVehicle()
	local ped = PlayerPedId()
	if IsPedSittingInAnyVehicle(ped) then
		local veh = GetVehiclePedIsIn(ped,false)
		TaskLeaveVehicle(ped,veh,4160)
	end
end

function tvRP.isInVehicle()
	return IsPedSittingInAnyVehicle(PlayerPedId())
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- MODELHASH
-----------------------------------------------------------------------------------------------------------------------------------------
local vehList = {
	-- PC
	{ hash = -1480984315, name = "anpc_l200", price = 0, banido = true },
	{ hash = -1034834222, name = "corollapc", price = 0, banido = true },
	{ hash = 1016204281, name = "dusterpc", price = 0, banido = true },
	{ hash = -342744473, name = "voyagepc", price = 0, banido = true },
	{ hash = -113754634, name = "helipc", price = 0, banido = true },
	{ hash = 2037834373, name = "flatbed3", price = 0, banido = true },

	-- PF
	{ hash = -100743216, name = "hiluxpf", price = 0, banido = false },
	{ hash = 564060192, name = "trailpf", price = 0, banido = false },

	-- PRF
	{ hash = -2144575993, name = "trailprf", price = 0, banido = true },
	{ hash = 739775687, name = "as350prf", price = 0, banido = true },
	{ hash = -1906931132, name = "xreprf", price = 0, banido = true },
	{ hash = -1427768803, name = "corolaprf", price = 0, banido = true },

	-- Bope
	{ hash = -1723962664, name = "s10bope", price = 0, banido = true },
	{ hash = -1205689942, name = "riot", price = 0, banido = true },
	{ hash = 956179621, name = "hiluxsrvbope", price = 0, banido = false },
	{ hash = 1341474454, name = "2015polstang", price = 0, banido = false },
	{ hash = -1259873726, name = "trailblazerbope", price = 0, banido = false },
	{ hash = -1007054727, name = "blazerbope", price = 0, banido = true },

	-- PMERJ
	{ hash = 707765804, name = "versapmerj", price = 0, banido = true },
	{ hash = -1292605815, name = "frontierrecom", price = 0, banido = true },
	{ hash = -1426790206, name = "frontierrecom2", price = 0, banido = true },
	{ hash = -504846706, name = "loganpmerj", price = 0, banido = true },
	{ hash = 592469868, name = "s10pmerj", price = 0, banido = true },
	{ hash = 1437596599, name = "voyagepmerj", price = 0, banido = true },
	{ hash = -861147662, name = "xrepmerj", price = 0, banido = true },
	{ hash = 1176479017, name = "corolapmerj", price = 0, banido = true },

	-- SAMU
	{ hash = -792745162, name = "paramedicoambu", price = 0, banido = false },
	{ hash = -236904349, name = "motosamu", price = 0, banido = true },
	{ hash = 353883353, name = "polmav", price = 0, banido = true },
	{ hash = 1084099044, name = "samumav", price = 0, banido = true },
	{ hash = 1171614426, name = "ambulance", price = 0, banido = true },
	{ hash = 108063727, name = "paramedicocharger2014", price = 0, banido = false },

	-- Choque
	{ hash = -712061459, name = "sw4bpchq", price = 0, banido = true },
	{ hash = -419707808, name = "s10bpchq", price = 0, banido = true },

	-- Outros
	{ hash = -1173768715, name = "ferrariitalia", price = 1400000, banido = false },
	{ hash = -1683569033, name = "paganihuayra", price = 7400000, banido = false },
	{ hash = -1573350092, name = "fordmustang", price = 354000, banido = false },
	{ hash = 1106910537, name = "fordmustanggt", price = 400000, banido = false },
	{ hash = -60313827, name = "nissangtr", price = 900000, banido = false },
	{ hash = 351980252, name = "teslaprior", price = 700000, banido = false },
	{ hash = -4816535, name = "nissanskyliner34", price = 780000, banido = false },
	{ hash = 1676738519, name = "audirs6", price = 800000, banido = false },
	{ hash = -157095615, name = "bmwm3f80", price = 320000, banido = false },
	{ hash = 1114244595, name = "lamborghinihuracan", price = 2800000, banido = false },
	{ hash = 1601422646, name = "dodgechargersrt", price = 1600000, banido = false },
	{ hash = 219613597, name = "speedo4", price = 240000, banido = false },
	{ hash = 1591739866, name = "deveste", price = 800000, banido = false },
	{ hash = -2096690334, name = "impaler", price = 300000, banido = false },
	{ hash = -1168952148, name = "toros", price = 310000, banido = false },
	{ hash = -49115651, name = "vamos", price = 320000, banido = false },
	{ hash = 2034235290, name = "mazdarx7", price = 250000, banido = false },
	{ hash = 670022011, name = "nissangtrnismo", price = 1000000, banido = false },
	{ hash = -13524981, name = "bmwm4gts", price = 530000, banido = false },
	{ hash = 1978088379, name = "lancerevolutionx", price = 240000, banido = false },
	{ hash = 132097997, name = "mercedesamgc63", price = 560000, banido = false },
	{ hash = 723779872, name = "toyotasupra", price = 450000, banido = false },
	{ hash = -2015218779, name = "nissan370z", price = 190000, banido = false },
	{ hash = -947724703, name = "ds4", price = 77120, banido = false },
	{ hash = -361155694, name = "punto", price = 36000, banido = false },
	{ hash = -1304790695, name = "f150", price = 196000, banido = false },
	{ hash = -16826107, name = "fusion", price = 182000, banido = false },
	{ hash = 638550562, name = "fordka", price = 51000, banido = false },
	{ hash = 1473628167, name = "vwgolf", price = 180000, banido = false },
	{ hash = -493679946, name = "civic", price = 103000, banido = false },
	{ hash = -960970737, name = "eletran17", price = 110000, banido = false },
	{ hash = 1271905709, name = "sonata18", price = 66500, banido = false },
	{ hash = 18776694905, name = "veloster", price = 75700, banido = false },
	{ hash = -1707353429, name = "monza", price = 13500, banido = false },
	{ hash = -1178428863, name = "p207", price = 22900, banido = false },
	{ hash = -162568007, name = "vwpolo", price = 61000, banido = false },
	{ hash = -863689840, name = "evoq", price = 310500, banido = false },
	{ hash = -404110988, name = "santafe", price = 290000, banido = false },
	{ hash = 1995020435, name = "celta", price = 22900, banido = false },
	{ hash = 493030188, name = "amarok", price = 234000, banido = false },
	{ hash = -286676389, name = "civic2016", price = 619000, banido = false },
	{ hash = 212700233, name = "fiat", price = 15000, banido = false },
	{ hash = -440972578, name = "jetta2017", price = 70800, banido = false },
	{ hash = 1847017357, name = "l200civil", price = 232900, banido = false },
	{ hash = 1451518270, name = "saveiro", price = 84500, banido = false },
	{ hash = -448481004, name = "upzinho", price = 49590, banido = false },
	{ hash = 134028651, name = "voyage", price = 62400, banido = false },
	{ hash = 1698933548, name = "golg7", price = 46300, banido = false },
	{ hash = -182003596, name = "fiattoro", price = 96000, banido = false },
	{ hash = -1621506835, name = "palio", price = 45200, banido = false },
	{ hash = -1763924497, name = "fiatuno", price = 25000, banido = false },
	{ hash = -773949452, name = "fiatstilo", price = 32000, banido = false },
	{ hash = 2015170161, name = "biz25", price = 10000, banido = false },
	{ hash = -1987109409, name = "150", price = 12000, banido = false },
	{ hash = 1124490263, name = "bros60", price = 12800, banido = false },
	{ hash = 1826651832, name = "xt66", price = 32000, banido = false },
	{ hash = -1639924411, name = "450crf", price = 50100, banido = false },
	{ hash = -14519558, name = "xj", price = 33900, banido = false },
	{ hash = -1761239425, name = "hornet", price = 33900, banido = false },
	{ hash = -486920242, name = "dm1200", price = 74000, banido = false },
	{ hash = 1744543800, name = "z1000", price = 55990, banido = false },
	{ hash = 991407206, name = "r1250", price = 165800, banido = false },
	{ hash = -2137348917, name = "phantom", price = 0, banido = false },
	{ hash = 569305213, name = "packer", price = 0, banido = false },
	{ hash = -1973928832, name = "124spider", price = 700000, banido = true },
	{ hash = 1097072074, name = "acuransx", price = 850000, banido = true }
}

function tvRP.ModelName(radius)
	local veh = tvRP.getNearestVehicle(radius)
	if IsEntityAVehicle(veh) then
		local lock = GetVehicleDoorLockStatus(veh) >= 2
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		for k,v in pairs(vehList) do
			if v.hash == GetEntityModel(veh) then
				if v.name then
					return GetVehicleNumberPlateText(veh),v.name,VehToNet(veh),parseInt(v.price),v.banido,lock,GetDisplayNameFromVehicleModel(v.name),GetStreetNameFromHashKey(GetStreetNameAtCoord(x,y,z))
				end
			end
		end
	end
end

function tvRP.ModelName2()
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		for k,v in pairs(vehList) do
			if v.hash == GetEntityModel(veh) then
				if v.name then
					return GetVehicleNumberPlateText(veh),v.name,parseInt(v.price),v.banido,VehToNet(veh),veh
				end
			end
		end
	end
end