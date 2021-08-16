local cfg = {}

cfg.vehicle_chest_weights = {
		["ferrariitalia"] = 40,
		["paganihuayra"] = 40,
		["fordmustang"] = 40,
		["fordmustanggt"] = 40,
		["nissangtr"] = 40,
		["nissangtrnismo"] = 40,
		["teslaprior"] = 70,
		["nissanskyliner34"] = 60,
		["audirs6"] = 70,
		["bmwm3f80"] = 50,
		["bmwm4gts"] = 50,
		["lancerevolutionx"] = 50,
		["mercedesamgc63"] = 50,
		["toyotasupra"] = 35,
		["nissan370z"] = 30,
		["lamborghinihuracan"] = 70,
		["toros"] = 50,
		["mazdarx7"] = 40,
		["acuransx"] = 40,
		["ds4"] = 50,
		["punto"] = 50,
		["f150"] = 85,
		["fusion"] = 50,
		["fordka"] = 50,
		["vwgolf"] = 50,
		["civic"] = 50,
		["eletran17"] = 50,
		["sonata18"] = 50,
		["veloster"] = 50,
		["monza"] = 40,
		["p207"] = 40,
		["vwpolo"] = 50,
		["evoq"] = 50,
		["santafe"] = 50,
		["celta"] = 40,
		["amarok"] = 80,
		["civic2016"] = 50,
		["fiat"] = 40,
		["jetta2017"] = 50,
		["l200civil"] = 80,
		["saveiro"] = 60,
		["upzinho"] = 30,
		["voyage"] = 50,
		["golg7"] = 50,
		["fiattoro"] = 70,
		["palio"] = 50,
		["fiatuno"] = 40,
		["fiatstilo"] = 50,
		["biz25"] = 15,
		["150"] = 15,
		["bros60"] = 15,
		["xt66"] = 15,
		["450crf"] = 15,
		["xj"] = 15,
		["hornet"] = 15,
		["dm1200"] = 15,
		["z1000"] = 15,
		["r1250"] = 15,
		["124spider"] = 40
}

cfg.static_chest_types = {
	["policia"] = {
		weight = 5000,
		permissions = { "policia.permissao" }
	},
	["motoclub"] = {
		weight = 5000,
		permissions = { "motoclub.permissao" }
	},
	["trafico"] = {
		weight = 5000,
		permissions = { "trafico.permissao" }
	},
	["cv"] = {
		weight = 5000,
		permissions = { "cv.permissao" }
	},
	["tcp"] = {
		weight = 5000,
		permissions = { "tcp.permissao" }
	},
	["ada"] = {
		weight = 5000,
		permissions = { "ada.permissao" }
	},
	["mafia"] = { 
		weight = 5000,
		permissions = { "mafia.permissao" }
	},
	["yakuza"] = {
		weight = 5000,
		permissions = { "yakuza.permissao" }
	},
	["hospital"] = {
		weight = 5000,
		permissions = { "paramedico.permissao" }
	},
	["bunker"] = {
		weight = 5000,
		permissions = { "mafia.permissao" }
	},
}

cfg.static_chests = {
	{ "policia",461.58,-981.16,30.68 },
	{ "policia",-2044.5174560547,-457.06552124023,16.424423217773 },
	{ "policia",828.53796386719,162.86877441406,86.386734008789 },
	{ "bunker",903.62664794922,-3199.4765625,-97.187950134277 },
	{ "policia",459.57,-990.62,24.91 },
--	{ "motoclub",977.10,-104.13,74.84 }, MC do GAME
	{ "motoclub",904.01873779297,-2105.5119628906,30.762208938599 }, -- mc do LAFA
	{ "hospital",310.30255126953,-599.46258544922,43.291793823242 },
	{ "trafico",1272.19,-1712.52,54.77 },
	{ "cv",1663.0850830078,-49.509803771973,168.31231689453 },
	{ "tcp",704.92437744141,-303.61239624023,59.241886138916 },
	{ "ada",393.26049804688,-1813.7811279297,28.993871688843 },
	{ "mafia",-2674.6604003906,1328.1508789063,140.8815612793 },
	{ "yakuza",-867.47369384766,-1458.3139648438,7.5268001556396 },
}

return cfg