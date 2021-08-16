local cfg = {}

cfg.garage_types = {
	["Garagem"] = {
		_config = { gtype={"personal"} }
	},
	["Carros"] = {
		_config = { gtype={"store"} },
		["speedo4"] = { "speedo4",240000,100,3 },
		["stafford"] = { "stafford",400000,40,3 },
		["swinger"] = { "swinger",250000,20,3 },
		["brutus"] = { "brutus",350000,100,3 },
		["clique"] = { "clique",360000,40,3 },
		["deveste"] = { "deveste",800000,20,3 },
		["deviant"] = { "deviant",300000,50,3 },
		["impaler"] = { "impaler",300000,60,3 },
		["imperator"] = { "imperator",400000,50,3 },
		["italigto"] = { "italigto",700000,30,3 },
		["schlagen"] = { "schlagen",600000,30,3 },
		["toros"] = { "toros",400000,50,3 },
		["tulip"] = { "tulip",300000,60,3 },
		["ds4"] = { "DS4",73000,50,3 },
		["punto"] = { "punto",70000,50,3 },
		["f150"] = { "f150",175000,85,3 },
		["fusion"] = { "fusion",100000,50,3 },
		["fordka"] = { "fordka",45000,50,3 },
		["vwgolf"] = { "vwgolf",60000,50,3 },
		["civic"] = { "civic",55000,50,3 },
		["eletran17"] = { "eletran17",110000,50,3 },
		["sonata18"] = { "sonata18",120000,50,3 },
		["veloster"] = { "veloster",85000,50,3 },
		["monza"] = { "monza",13000,40,3 },
		["p207"] = { "p207",23000,40,3 },
		["vwpolo"] = { "vwpolo",90000,50,3 },
		["evoq"] = { "evoq",220000,50,3 },
		["santafe"] = { "santafe",140000,50,3 },
		["celta"] = { "celta",17000,40,3 },
		["amarok"] = { "amarok",185000,80,3 },
		["civic2016"] = { "civic2016",120000,50,3 },
		["fiat"] = { "fiat",10000,40,3 },
		["jetta2017"] = { "jetta2017",200000,50,3 },
		["l200civil"] = { "l200civil",180000,80,3 },
		["saveiro"] = { "saveiro",70000,60,3 },
		["upzinho"] = { "upzinho",20000,30,3 },
		["voyage"] = { "voyage",40000,50,3 },
		["golg7"] = { "golg7",85000,50,3 },
		["fiattoro"] = { "fiattoro",80000,70,3 },
		["palio"] = { "palio",20000,40,3 },
		["fiatuno"] = { "fiatuno",15000,40,3 },
		["fiatstilo"] = { "fiatstilo",80000,50,3 },
		["vamos"] = { "vamos",320000,60,3 },
		["ferrariitalia"] = { "ferrari italia",2000000,40,3 },
		["acuransx"] = { "ferrari italia",700000,40,3 },
		["124spider"] = { "ferrari italia",850000,40,3 },
		["paganihuayra"] = { "pagani huayra",1500000,40,3 },
		["fordmustang"] = { "ford mustang",1000000,40,3 },
		["fordmustanggt"] = { "ford mustang gt",1000000,40,3 },
		["nissangtr"] = { "nissan gtr",1150000,40,3 },
		["nissangtrnismo"] = { "nissan gtr nismo",1200000,40,3 },
		["teslaprior"] = { "tesla prior",2000000,50,5 },
		["nissanskyliner34"] = { "skyline r34",1100000,60,3 },
	  ["audirs6"] = { "audi rs6",2000000,40,3 },
		["bmwm3f80"] = { "bmw m3 f80",900000,50,3 },
		["bmwm4gts"] = { "bmw m4 gts",950000,50,3 },
		["lancerevolutionx"] = { "lancer evolution x",850000,50,5 },
		["mercedesamgc63"] = { "mercedes amg c63",850000,50,5 },
		["toyotasupra"] = { "toyota supra",1050000,35,3 },
		["nissan370z"] = { "nissan 370z",550000,30,5 },
		["lamborghinihuracan"] = { "lamborghini huracan",2000000,40,3 },
		["dodgechargersrt"] = { "dodge charger srt",1400000,60,3 },
		["cayenneturbo"] = { "porche cayenne",10000000,60,3 },
		["mazdarx7"] = { "mazda rx7",1000000,40,3 }
	},
	["Motos"] = {
		_config = { gtype={"store"} },
		["akuma"] = { "akuma",420000,15,5 },
		["avarus"] = { "avarus",350000,15,3 },
		["bagger"] = { "bagger",240000,40,3 },
		["bati"] = { "bati",300000,15,15 },
		["bf400"] = { "bf400",260000,15,15 },
		["carbonrs"] = { "carbonrs",300000,15,3 },
		["chimera"] = { "chimera",280000,15,3 },
		["cliffhanger"] = { "cliffhanger",250000,15,3 },
		["defiler"] = { "defiler",380000,15,3 },
		["enduro"] = { "enduro",160000,15,3 },
		["esskey"] = { "esskey",260000,15,3 },
		["fcr"] = { "fcr",320000,15,3 },
		["fcr2"] = { "fcr2",320000,15,3 },
		["gargoyle"] = { "gargoyle",280000,15,3 },
		["hakuchou"] = { "hakuchou",310000,15,3 },
		["hakuchou2"] = { "hakuchou2",450000,15,3 },
		["innovation"] = { "innovation",210000,15,3 },
		["lectro"] = { "lectro",310000,15,3 },
		["nemesis"] = { "nemesis",280000,15,3 },
		["pcj"] = { "pcj",180000,15,3 },
		["ruffian"] = { "ruffian",280000,15,3 },
		["sanctus"] = { "sanctus",350000,15,3 },
		["sovereign"] = { "sovereign",240000,50,3 },
		["thrust"] = { "thrust",300000,15,3 },
		["vader"] = { "vader",280000,15,3 },
		["vindicator"] = { "vindicator",250000,15,3 },
		["vortex"] = { "vortex",300000,15,3 },
		["wolfsbane"] = { "wolfsbane",230000,15,3 },
		["blazer"] = { "blazer",200000,15,3 },
		["blazer4"] = { "blazer4",300000,15,3 },
		["deathbike"] = { "deathbike",350000,15,3 },
		["biz25"] = { "biz25",10000,15,3 },
		["150"] = { "150",13000,15,3 },
		["bros60"] = { "bros60",25000,15,3 },
		["xt66"] = { "xt66",40000,15,3 },
		["450crf"] = { "450crf",100000,15,3 },
		["xj"] = { "xj",240000,15,3 },
		["hornet"] = { "hornet",260000,15,3 },
		["dm1200"] = { "dm1200",300000,15,3 },
		["z1000"] = { "z1000",290000,15,3 },
		["r1250"] = { "r1250",320000,15,3 },

		["shotaro"] = { "shotaro",1000000,15,2 }
	},
	--["Importados"] = {
	--	_config = { gtype={"store"},permissions={"carrosvip.permissao"} },
		
	--},
	["Motorista"] = {
		_config = { gtype={"rent"} },
		["coach"] = { "coach",0,0,-1 },
		["bus"] = { "bus",0,0,-1 }
	},
	["Weazel"] = {
		_config = { gtype={"rent"},permissions={"weazel.permissao"} },
		["rumpo"] = { "Van",0,0,-1 }
	},
	["WeazelH"] = {
		_config = { gtype={"rent"},permissions={"weazel.permissao"} },
		["frogger"] = { "Heli",0,0,-1 }
	},
	["AluguelPrancha"] = {
		_config = { gtype={"rent"} },
		["surfboard"] = { "Prancha",0,0,-1 }
	},
	["PoliciaH"] = {
		_config = { gtype={"rent"},permissions={"policiaheli.permissao"} },
		["polmav"] = { "Helicóptero",0,0,-1 }
	},
	["PoliciaH2"] = {
		_config = { gtype={"rent"},permissions={"policiaheli.permissao"} },
		["maverick"] = { "Helicóptero",0,0,-1 }
	},
	["ADM"] = {
		_config = { gtype={"rent"},permissions={"admin.permissao"} },
		["ferrariitalia"] = { "ferrariitalia",0,0,-1 }
	},
	["Paramedico"] = {
		_config = { gtype={"rent"},permissions={"paramedico.permissao"} },
		["ambulance"] = { "Ambulância",0,0,-1 },
		["motosamu"] = { "Moto",0,0,-1 }
	},
	["ParamedicoH"] = {
		_config = { gtype={"rent"},permissions={"paramedico.permissao"} },
		["samumav"] = { "Helicóptero",0,0,-1 }
	},
	["Mecanico"] = {
		_config = { gtype={"rent"},permissions={"mecanico.permissao"} },
		["flatbed3"] = { "Reboque 1",0,0,-1 },
		["flatbed"] = { "Reboque 2",0,0,-1 }
	},
	["Taxista"] = {
		_config = { gtype={"rent"},permissions={"taxista.permissao"} },
		["taxi"] = { "Taxi",0,0,-1 }
	},
	["Carteiro"] = {
		_config = { gtype={"rent"} },
		["boxville2"] = { "Caminhão",0,0,-1 },
		["tribike3"] = { "Bicicleta",0,0,-1 }
	},
	["PMERJ"] = {
		_config = { gtype={"rent"},permissions={"pmerj.permissao"} },
		["voyagepmerj"]		= { "Voyage",0,0,-1 },
		["s10pmerj"]			= { "S10",0,0,-1 },
		["loganpmerj"]		= { "Logan",0,0,-1 },
	  ["corollapmerj"]	= { "Corolla",0,0,-1 },
	  ["versapmerj"]		= { "Versa",0,0,-1 },
	  ["xrepmerj"]			= { "XRE 300",0,0,-1 },
	},
	["PCRJ"] = {
		_config = { gtype={"rent"},permissions={"pcivil.permissao"} },
		["voyagepc"]	= { "Voyage",0,0,-1 },
		["corollapc"] = { "Corolla",0,0,-1 },
		["dusterpc"]	= { "Duster",0,0,-1 },
	},
	["PCRJH"] = {
		_config = { gtype={"rent"},permissions={"pcivil.permissao"} },
		["helipc"] = { "Helicóptero",0,0,-1 },
	},
	["PRF"] = {
		_config = { gtype={"rent"},permissions={"prf.permissao"} },
		["trailprf"]		= { "Trail",0,0,-1 },
		["corollaprf"]	= { "Corolla",0,0,-1 },
		["xreprf"]			= { "XRE",0,0,-1 },
		["anpc_l200"]		= { "L200",0,0,-1 },
	  ["as350prf"]		= { "Helicóptero",0,0,-1 },
	},
	["BOPE"] = {
		_config = { gtype={"rent"},permissions={"bope.permissao"} },
		["trailblazerbope"] = { "Trail Blazer",0,0,-1 },
		["hiluxsrvbope"] = { "Hillux SRV",0,0,-1 },
		["s10bope"] = { "S10",0,0,-1 },
		["riot"] = { "Blindado",0,0,-1 },
	},
	["RECOM"] = {
		_config = { gtype={"rent"},permissions={"recom.permissao"} },
		["frontierrecom"]		= { "Frontier",0,0,-1 },
		["frontierrecom2"]	= { "Frontier 2",0,0,-1 },
	},
	["BPCHQ"] = {
		_config = { gtype={"rent"},permissions={"bpchq.permissao"} },
		["sw4bpchq"] = { "SW4",0,0,-1 },
		["s10bpchq"] = { "S10",0,0,-1 },
		["xrebpchq"] = { "XRE 300",0,0,-1 },
	},
	["PF"] = {
		_config = { gtype={"rent"},permissions={"pfederal.permissao"} },
		["hiluxpf"]				= { "Hilux",0,0,-1 },
		["trailpf"]				= { "Trail",0,0,-1 },
		["2015polstang"]	= { "Mustang",0,0,-1 },
	},
	["Lixeiro"] = {
		_config = { gtype={"rent"} },
		["trash"]		= { "Caminhão 01",0,0,-1 },
		["trash2"]	= { "Caminhão 02",0,0,-1 }
	},
	["Bicicletario"] = {
		_config = { gtype={"rent"} },
		["scorcher"]	= { "Scorcher",0,0,-1 },
		["tribike"]		= { "Tribike Verde",0,0,-1 },
		["tribike2"]	= { "Tribike Vermelha",0,0,-1 },
		["fixter"]		= { "Fixter",0,0,-1 },
		["cruiser"]		= { "Cruiser",0,0,-1 },
		["bmx"]				= { "Bmx",0,0,-1 }
	},
	["Embarcacoes"] = {
		_config = { gtype={"rent"} },
		["dinghy"]		= { "dinghy",0,0,-1 },
		["jetmax"]		= { "jetmax",0,0,-1 },
		["marquis"]		= { "marquis",0,0,-1 },
		["seashark3"] = { "seashark3",0,0,-1 },
		["speeder"]		= { "speeder",0,0,-1 },
		["speeder2"]	= { "speeder2",0,0,-1 },
		["squalo"]		= { "squalo",0,0,-1 },
		["suntrap"]		= { "suntrap",0,0,-1 },
		["toro"]			= { "toro",0,0,-1 },
		["toro2"]			= { "toro2",0,0,-1 },
		["tropic"]		= { "tropic",0,0,-1 },
		["tropic2"]		= { "tropic2",0,0,-1 }
	},
	["Caminhao"] = {
		_config = { gtype={"rent"} },
		["phantom"] = { "caminhão 01",0,0,-1 },
		["packer"] = { "caminhão 02",0,0,-1 }
	},
	["VipH"] = {
		_config = { gtype={"rent"},permissions={"platina.permissao"} },
		["volatus"] = { "Helicóptero",0,0,-1 }
	},
	["VipB"] = {
		_config = { gtype={"rent"},permissions={"platina.permissao"} },
		["seashark"] = { "Seashark",0,0,-1 }
	},
	["COMANDANTE"] = {
		_config = { gtype={"rent"},permissions={"cmdgeral.permissao"} },
		["voyagepmerj"] = { "Voyage",0,0,-1 },
		["s10pmerj"] = { "S10",0,0,-1 },
		["loganpmerj"] = { "Logan",0,0,-1 },
	  ["corollapmerj"] = { "Corolla",0,0,-1 },
	  ["versapmerj"] = { "Versa",0,0,-1 },
	  ["xrepmerj"] = { "XRE 300",0,0,-1 },
	  ["frontierrecom"] = { "Frontier",0,0,-1 },
		["frontierrecom2"] = { "Frontier 2",0,0,-1 },
		["sw4bpchq"] = { "SW4",0,0,-1 },
		["s10bpchq"] = { "S10",0,0,-1 },
		["xrebpchq"] = { "XRE 300",0,0,-1 },
	},
	["COMANDANTE2"] = {
		_config = { gtype={"rent"},permissions={"cmdgeral.permissao"} },
		["voyagepc"] = { "Voyage",0,0,-1 },
		["corollapc"] = { "Corolla",0,0,-1 },
		["dusterpc"] = { "Duster",0,0,-1 },
	},
	["COMANDANTE3"] = {
		_config = { gtype={"rent"},permissions={"cmdgeral.permissao"} },
		["hiluxpf"] = { "Hilux",0,0,-1 },
		["trailpf"] = { "Trail",0,0,-1 },
		["2015polstang"] = { "Mustang",0,0,-1 },
	},
	["COMANDANTE4"] = {
		_config = { gtype={"rent"},permissions={"cmdgeral.permissao"} },
		["trailprf"] = { "Trail",0,0,-1 },
		["corollaprf"] = { "Corolla",0,0,-1 },
		["xreprf"] = { "XRE",0,0,-1 },
		["anpc_l200"] = { "L200",0,0,-1 },
	  ["as350prf"] = { "Helicóptero",0,0,-1 },
	},
	["COMANDANTE5"] = {
		_config = { gtype={"rent"},permissions={"cmdgeral.permissao"} },
		["trailblazerbope"] = { "Trail Blazer",0,0,-1 },
		["hiluxsrvbope"] = { "Hillux SRV",0,0,-1 },
		["s10bope"] = { "S10",0,0,-1 },
		["riot"] = { "Blindado",0,0,-1 },
	},
	["Bennys"] = {
		_config = { gtype={"shop"},permissions={"mecanico.permissao"} },
		_shop = {
			[0] = { "Aerofolio",200,"" },
      [1] = { "Saia Frontal",200,"" },
      [2] = { "Saia Traseira",200,"" },
      [3] = { "Saia",200,"" },
      [4] = { "Escapamento",200,"" },
      [5] = { "Interior",200,"" },
      [6] = { "Grades",200,"" },
      [7] = { "Capo",200,"" },
      [8] = { "Parachoque Direito",200,"" },
      [9] = { "Parachoque Esquerdo",200,"" },
      [10] = { "Tetos",200,"" },
      [11] = { "Motor",200,"" },
      [12] = { "Freios",200,"" },
      [13] = { "Transmissao",200,"" },
      [14] = { "Buzina",200,"" },
      [15] = { "Suspensao",200,"" },
      [18] = { "Turbo",200,"" },
      [20] = { "Fumaca",200,"" },
      [22] = { "Farois",200,"" },
      [23] = { "Rodas",200,"" },
      [24] = { "Rodas Traseiras",200,"" },
      [25] = { "Suporte de Placa",200,"" },
      [27] = { "Trims",200,"" },
      [28] = { "Enfeites",200,"" },
      [29] = { "Painel",200,"" },
      [30] = { "Lanterna",200,"" },
      [31] = { "Macaneta",200,"" },
      [32] = { "Bancos",200,"" },
      [33] = { "Volante",200,"" },
      [34] = { "H Shift",200,"" },
      [35] = { "Placas",200,"" },
      [36] = { "Caixa de Som",200,"" },
      [37] = { "Porta-Malas",200,"" },
      [38] = { "Hidraulica",200,"" },
      [39] = { "Placa de Motor",200,"" },
      [40] = { "Filtro de Ar",200,"" },
      [41] = { "Struts",200,"" },
      [42] = { "Capas",200,"" },
      [43] = { "Antenas",200,"" },
      [44] = { "Extra Trims",200,"" },
      [45] = { "Tanque",200,"" },
      [46] = { "Vidros",200,"" },
      [48] = { "Livery",200,"" },
      [49] = { "Tiras",0,"" }
		}
	}
}

cfg.garages = {
	{ "Bennys",-222.17573547363,-1324.7077636719,31.00,false,0 },
	{ "Bennys",-222.17573547363,-1329.6424636719,31.00,false,0 },
	{ "Paramedico",295.12,-600.61,43.30,false,2 },
	{ "Mecanico",-178.0387878418,-1327.5278320313,31.29832649231,false,3 },
	{ "Taxista",894.08203125,-167.96217346191,81.595069885254,false,4 },
	{ "Carteiro",68.95,126.94,79.20,false,5 },
	{ "Lixeiro",-341.58,-1567.46,25.22,false,6 },
	{ "Motorista",453.89,-600.57,28.58,false,7 },
	{ "Embarcacoes",-1605.19,-1164.37,1.28,false,8 },
	{ "Embarcacoes",-1522.68,1494.92,111.58,false,9 },
	{ "Embarcacoes",1337.36,4269.71,31.50,false,10 },
	{ "Embarcacoes",-192.32,791.54,198.10,false,11 },
	{ "Caminhao",1196.80,-3253.68,7.09,false,12 },
	{ "PoliciaH",-2059.591796875,-446.03790283203,22.616851806641,false,13 },
	{ "ParamedicoH",338.37,-586.76,74.16,false,14 },

	{ "Bicicletario",-1032.1600341797,-2729.8488769531,13.756636619568,false,16 },
	{ "PoliciaH2",-2059.591796875,-446.03790283203,22.616851806641,false,19 },

	{ "PCRJ",458.33,-1008.09,28.27,false,26 },
	{ "PCRJH",463.24,-982.53,43.69,false,28 },

	{ "PMERJ",-2047.1481933594,-461.15744018555,12.240759849548,false,18 },
	{ "RECOM",-2047.1481933594,-461.15744018555,12.240759849548,false,1 },
	{ "BPCHQ",-2047.1481933594,-461.15744018555,12.240759849548,false,27 },

	{ "COMANDANTE",-2047.1481933594,-461.15744018555,12.240759849548,false,29 },
	{ "COMANDANTE2", 458.33,-1008.09,28.27,false,30 },
	{ "COMANDANTE3",484.80126953125,-1094.2241210938,29.396663665771,false,31 },
	{ "COMANDANTE4",-2513.8081054688,3579.8112792969,16.49803352356,false,32 },
	{ "COMANDANTE5",833.75177001953,147.97370910645,82.810539245605,false,33 },

	{ "PF",484.80126953125,-1094.2241210938,29.396663665771,false,20 },
	{ "BOPE",833.75177001953,147.97370910645,82.810539245605,false,17 },
	{ "PRF",-2513.8081054688,3579.8112792969,16.49803352356,false,21 },
	{ "ADM",156.13735961914,-987.23797607422,30.091920852661,false,22 },
	{ "Weazel",-537.10369873047,-886.54431152344,25.208868026733,false,23 },
	{ "WeazelH",-569.55407714844,-925.95837402344,36.833312988281,false,24 },
	{ "AluguelPrancha",-1605.9028320313,-1160.7105712891,1.3351956605911,false,25 },
	--{ "Garagem",-161.09436035156,928.28198242188,235.65574645996,false,71 },
	--{ "Vans",152.89646911621,-3209.0246582031,5.9022736549377,true,78 },
	--{ "VipB",-1268.9415283203,-1836.4005126953,0.76460218429565,false,72 }
}

return cfg