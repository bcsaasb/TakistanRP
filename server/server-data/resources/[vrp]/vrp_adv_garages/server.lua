local discord_webhook1 = "https://discordapp.com/api/webhooks/687862400497614852/cJBdOSctJmt46DxyXzvSWNuIhbsu8EF3YnIVRoAgN6XKmYquXA2pR8NvW4D_GTJCyS5Q"

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vRPgarage = Tunnel.getInterface("vrp_adv_garages")

vRP._prepare("vRP/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @tuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")
vRP._prepare("vRP/remove_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/get_vehicles","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/get_detido","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/get_maxcars","SELECT COUNT(vehicle) as quantidade FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/set_vehstatus","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/count_vehicle","SELECT COUNT(*) as qtd FROM vrp_user_vehicles WHERE vehicle = @vehicle")

local cfg = module("vrp_adv_garages","cfg/garages")
local cfg_inventory = module("vrp","cfg/inventory")

local garage_types = cfg.garage_types
local totalgaragem = 3

local veh_models_ids = Tools.newIDGenerator()
local veh_models = {}

for group,vehicles in pairs(garage_types) do
	for veh_model,_ in pairs(vehicles) do
		if not veh_models[veh_model] then
			veh_models[veh_model] = veh_models_ids:gen()
		end
	end
end

local carros = {
	["ferrariitalia"] = { price = 10000000 }, --VIP
	["cayenneturbo"] = { price = 10000000 }, --VIP
	["124spider"] = { price = 700000 },
	["acuransx"] = { price = 850000 },
	["paganihuayra"] = { price = 1500000 },
	["fordmustang"] = { price = 1000000 },
	["fordmustanggt"] = { price = 1000000 },
	["nissangtr"] = { price = 1150000 },
	["nissangtrnismo"] = { price = 1200000 },
	["teslaprior"] = { price = 700000 },
	["nissanskyliner34"] = { price = 10000000 }, --VIP
	["audirs6"] = { price = 10000000 }, --VIP
	["bmwm3f80"] = { price = 10000000 }, --VIP
	["bmwm4gts"] = { price = 10000000 }, --VIP
	["lancerevolutionx"] = { price = 10000000 }, --VIP
	["mercedesamgc63"] = { price = 10000000 }, --VIP
	["toyotasupra"] = { price = 10000000 }, --VIP
	["nissan370z"] = { price = 550000 },
	["lamborghinihuracan"] = { price = 10000000 }, --VIP
	["dodgechargersrt"] = { price = 10000000 }, --VIP
	["patriot2"] = { price = 550000 },
	["speedo4"] = { price = 240000 },
	["stafford"] = { price = 400000 },
	["swinger"] = { price = 250000 },
	["brutus"] = { price = 350000 },
	["clique"] = { price = 360000 },
	["deveste"] = { price = 800000 },
	["deviant"] = { price = 300000 },
	["impaler"] = { price = 300000 },
	["imperator"] = { price = 400000 },
	["italigto"] = { price = 700000 },
	["schlagen"] = { price = 600000 },
	["toros"] = { price = 310000 },
	["tulip"] = { price = 300000 },
	["vamos"] = { price = 320000 },
	["mazdarx7"] = { price = 1000000 },
	["akuma"] = { price = 420000 },
	["avarus"] = { price = 350000 },
	["bagger"] = { price = 240000 },
	["bati"] = { price = 300000 },
	["bf400"] = { price = 260000 },
	["carbonrs"] = { price = 300000 },
	["chimera"] = { price = 280000 },
	["cliffhanger"] = { price = 250000 },
	["defiler"] = { price = 380000 },
	["enduro"] = { price = 160000 },
	["esskey"] = { price = 260000 },
	["faggio"] = { price = 4000 },
	["faggio2"] = { price = 5000 },
	["faggio3"] = { price = 5000 },
	["fcr"] = { price = 320000 },
	["fcr2"] = { price = 320000 },
	["gargoyle"] = { price = 280000 },
	["hakuchou"] = { price = 310000 },
	["hakuchou2"] = { price = 450000 },
	["innovation"] = { price = 210000 },
	["lectro"] = { price = 310000 },
	["nemesis"] = { price = 280000 },
	["pcj"] = { price = 180000 },
	["ruffian"] = { price = 280000 },
	["sanctus"] = {  price = 350000 },
	["sovereign"] = { price = 240000 },
	["thrust"] = { price = 300000 },
	["vader"] = { price = 280000 },
	["vindicator"] = { price = 250000 },
	["vortex"] = { price = 300000 },
	["wolfsbane"] = { price = 230000 },
	["blazer"] = { price = 200000 },
	["blazer4"] = { price = 300000 },
	["deathbike"] = { price = 350000 },
	["shotaro"] = { price = 1000000 },
	["coach"] = { price = 20000 },
	["bus"] = { price = 20000 },
	["policiacharger2018"] = { price = 20000 },
	["policiasilverado"] = { price = 20000 },
	["policiatahoe"] = { price = 20000 },
	["policiataurus"] = { price = 20000 },
	["policiavictoria"] = { price = 20000 },
	["policiabmwr1200"] = { price = 20000 },
	["policiaheli"] = { price = 20000 },
	["paramedicoambu"] = { price = 20000 },
	["paramedicocharger2014"] = { price = 20000 },
	["paramedicoheli"] = { price = 20000 },
	["pbus"] = { price = 20000 },
	["flatbed"] = { price = 20000 },
	["taxi"] = { price = 20000 },
	["boxville2"] = { price = 20000 },
	["tribike3"] = { price = 20000 },
	["trash"] = { price = 20000 },
	["trash2"] = { price = 20000 },
	["scorcher"] = { price = 2000 },
	["tribike"] = { price = 2000 },
	["tribike2"] = { price = 2000 },
	["fixter"] = { price = 2000 },
	["cruiser"] = { price = 2000 },
	["bmx"] = { price = 2000 },
	["dinghy"] = { price = 100000 },
	["jetmax"] = { price = 100000 },
	["marquis"] = { price = 100000 },
	["seashark3"] = { price = 100000 },
	["speeder"] = { price = 100000 },
	["speeder2"] = { price = 100000 },
	["squalo"] = { price = 100000 },
	["suntrap"] = { price = 100000 },
	["toro"] = { price = 100000 },
	["toro2"] = { price = 100000 },
	["tropic"] = { price = 100000 },
	["ds4"] = { price = 73000 },
	["punto"] = { price = 70000 },
	["f150"] = { price = 175000 },
	["fusion"] = { price = 100000 },
	["fordka"] = { price = 45000 },
	["vwgolf"] = { price = 60000 },
	["civic"] = { price = 55000 },
	["eletran17"] = { price = 110000 },
	["sonata18"] = { price = 120000 },
	["veloster"] = { price = 85000 },
	["monza"] = { price = 13000 },
	["p207"] = { price = 23000 },
	["vwpolo"] = { price = 90000 },
	["evoq"] = { price = 220000 },
	["santafe"] = { price = 140000 },
	["celta"] = { price = 17000 },
	["amarok"] = { price = 185000 },
	["civic2016"] = { price = 120000 },
	["fiat"] = { price = 10000 },
	["jetta2017"] = { price = 200000 },
	["l200civil"] = { price = 180000 },
	["saveiro"] = { price = 70000 },
	["upzinho"] = { price = 20000 },
	["voyage"] = { price = 40000 },
	["golg7"] = { price = 85000 },
	["fiattoro"] = { price = 80000 },
	["palio"] = { price = 20000 },
	["fiatuno"] = { price = 15000 },
	["fiatstilo"] = { price = 80000 },
	["biz25"] = { price = 10000 },
	["150"] = { price = 13000 },
	["bros60"] = { price = 25000 },
	["xt66"] = { price = 40000 },
	["450crf"] = { price = 100000 },
	["xj"] = { price = 240000 },
	["hornet"] = { price = 260000 },
	["dm1200"] = { price = 300000 },
	["z1000"] = { price = 290000 },
	["r1250"] = { price = 320000 },
	["hiluxpf "] = { price = 0 },
	["trailpf "] = { price = 0 },
	["hiluxsrvbope "] = { price = 0 },
	["2015polstang "] = { price = 0 },
	["trailblazerbope"] = { price = 0 },
	["tropic2"] = { price = 100000 }
--	["rumpo3"] = { price = 15000 },
--	["benson"] = { price = 50000 },
--	["mule2"] = { price = 30000 },
--	["burrito2"] = { price = 7000 }
}

local idveh = {}
RegisterServerEvent("vrp_adv_garages_id")
AddEventHandler("vrp_adv_garages_id",function(netid,enginehealth,bodyhealth,fuel)
	if idveh[netid] and netid ~= 0 then
		local user_id = idveh[netid][1]
		local carname = idveh[netid][2]
		local player = vRP.getUserSource(user_id)
		if player then
			vRPgarage.despawnGarageVehicle(player,carname)
		end

		if enginehealth < 0 then
			enginehealth = 0
		end

		if bodyhealth < 0 then
			bodyhealth = 0
		end

		if fuel > 100 then
			fuel = 100
		end

		local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = carname })
		if #rows > 0 then
			vRP.execute("vRP/set_vehstatus",{ user_id = user_id, vehicle = carname, engine = parseInt(enginehealth), body = parseInt(bodyhealth), fuel = parseInt(fuel) })
		end
	end
end)

function openGarage(source,gid,payprice,location)
	local source = source
	local user_id = vRP.getUserId(source)
	local vehicles = garage_types[gid]
	local gtypes = vehicles._config.gtype
	local mods = vehicles._shop
	local menu = { name = gid }

	for _,gtype in pairs(gtypes) do
		if gtype == "personal" then
			menu["Possuídos"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Possuídos" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = vname })
							local data = vRP.getSData("custom:u"..user_id.."veh_"..vname)
							local custom = json.decode(data) or ""
							if not payprice then
								vRP.closeMenu(source)
								local cond,netid,carname = vRPgarage.spawnGarageVehicle(source,vname,custom,parseInt(rows[1].engine),parseInt(rows[1].body),parseInt(rows[1].fuel),parseInt(location))
								if cond then
									idveh[netid] = { user_id,carname }
								else
									TriggerClientEvent("Notify",source,"aviso","Já tem um veículo deste modelo fora da garagem.")
								end
							else
								if (vRP.getBankMoney(user_id)+vRP.getMoney(user_id)) >= parseInt(carros[vname].price*0.000) then -- 0.005 padrão 
									vRP.closeMenu(source)
									local cond,netid,carname = vRPgarage.spawnGarageVehicle(source,vname,custom,parseInt(rows[1].engine),parseInt(rows[1].body),parseInt(rows[1].fuel),parseInt(location))
									if cond and vRP.tryFullPayment(user_id,parseInt(carros[vname].price*0.000)) then -- 0.005 padrão 
										idveh[netid] = { user_id,carname }
									else
										TriggerClientEvent("Notify",source,"aviso","Já tem um veículo deste modelo fora da garagem.")
									end
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					end

					local choosedetido = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local ok = vRP.request(source,"Veículo na detenção, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(carros[vname].price*0.1)).."</b> reais?",60)
							if ok then
								if vRP.tryFullPayment(user_id,parseInt(carros[vname].price*0.1)) then
									vRP.closeMenu(source)
									vRP.execute("vRP/set_detido",{ user_id = user_id, vehicle = vname, detido = 0, time = 0 })
									TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.")
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					end

					local choosedetidotime = function(source,choice)
						local vname = kitems[choice]
						if vname then
							local ok = vRP.request(source,"Veículo na retenção, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(carros[vname].price*0.5)).."</b> reais?",60)
							if ok then
								if vRP.tryFullPayment(user_id,parseInt(carros[vname].price*0.5)) then
									vRP.closeMenu(source)
									TriggerClientEvent("Notify",source,"sucesso","Seguradora foi acionada, aguarde a notificação da liberação.")
									TriggerClientEvent("progress",source,30000,"liberando")
									SetTimeout(30000,function()
										vRP.execute("vRP/set_detido",{ user_id = user_id, vehicle = vname, detido = 0, time = 0 })
										TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.")
									end)
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					end

					local pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					for k,v in pairs(pvehicles) do
						local vehicle
						for x,garage in pairs(garage_types) do
							vehicle = garage[v.vehicle]
							if vehicle then break end
						end

						if vehicle then
							local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = v.vehicle })
							if parseInt(rows[1].detido) <= 0 then
								submenu[vehicle[1]] = { choose,"<text01>Lataria:</text01> <text02>"..vRP.format(parseInt(rows[1].body*0.1)).."%</text02><text01>Motor:</text01> <text02>"..vRP.format(parseInt(rows[1].engine*0.1)).."%</text02><text01>Gasolina:</text01> <text02>"..vRP.format(parseInt(rows[1].fuel)).."%</text02><text01>Seguro:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.005)).."</text02><text01>Detenção:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.1)).."</text02><text01>Retenção:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.5)).."</text02>" }
							else
								if os.time() <= parseInt(rows[1].time+24*60*60) then
									submenu[vehicle[1]] = { choosedetidotime,"<text01>Lataria:</text01> <text02>"..vRP.format(parseInt(rows[1].body*0.1)).."%</text02><text01>Motor:</text01> <text02>"..vRP.format(parseInt(rows[1].engine*0.1)).."%</text02><text01>Gasolina:</text01> <text02>"..vRP.format(parseInt(rows[1].fuel)).."%</text02><text01>Seguro:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.005)).."</text02><text01>Detenção:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.1)).."</text02><text01>Retenção:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.5)).."</text02>" }
								else
									submenu[vehicle[1]] = { choosedetido,"<text01>Lataria:</text01> <text02>"..vRP.format(parseInt(rows[1].body*0.1)).."%</text02><text01>Motor:</text01> <text02>"..vRP.format(parseInt(rows[1].engine*0.1)).."%</text02><text01>Gasolina:</text01> <text02>"..vRP.format(parseInt(rows[1].fuel)).."%</text02><text01>Seguro:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.005)).."</text02><text01>Detenção:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.1)).."</text02><text01>Retenção:</text01> <text02>$"..vRP.format(parseInt(carros[rows[1].vehicle].price*0.5)).."</text02>" }
								end
							end
							kitems[vehicle[1]] = v.vehicle
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }

			menu["Guardar"] = { function(player,choice)
				local vehicle = vRPclient.getNearestVehicle(source,15)
				if vehicle then
					TriggerClientEvent('deletarveiculo',source,vehicle)
				end
			end }
		elseif gtype == "rent" then
			menu["Aluguel"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Aluguel" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local data = vRP.getSData("custom:u"..user_id.."veh_"..vname)
							local custom = json.decode(data) or ""
							local cond,netid,carname = vRPgarage.spawnGarageVehicle(source,vname,custom,1000,1000,100,parseInt(location))
							if cond then
								idveh[netid] = { user_id,carname }
							else
								TriggerClientEvent("Notify",source,"aviso","Já tem um veículo deste modelo fora da garagem.")
							end
							vRP.closeMenu(source)
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(vehicles) do
						if k ~= "_config" and k ~= "_shop" and pvehicles[string.lower(k)] == nil then
							submenu[v[1]] = { choose }
							kitems[v[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }

			menu["Guardar"] = { function(player,choice)
				local vehicle = vRPclient.getNearestVehicle(source,15)
				if vehicle then
					TriggerClientEvent('deletarveiculo',source,vehicle)
				end
			end }
		elseif gtype == "store" then
			menu["Comprar"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Comprar" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local vehicle = vehicles[vname]
							if vehicle then
								local ok = vRP.request(source,"Tem certeza que deseja <b>comprar</b> este veículo?",30)
								if ok then
									local rows = vRP.query("vRP/count_vehicle",{ vehicle = vname })
									if vehicle[4] ~= -1 and parseInt(rows[1].qtd) >= vehicle[4] then
										TriggerClientEvent("Notify",source,"importante","Estoque indisponivel.")
									else
										local totalv = vRP.query("vRP/get_maxcars",{ user_id = user_id })
										if vRP.hasPermission(user_id,"bronze.permissao") then
											if parseInt(totalv[1].quantidade) >= totalgaragem + 2 then
												TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem.")
												return
											end
										elseif vRP.hasPermission(user_id,"prata.permissao") then
											if parseInt(totalv[1].quantidade) >= totalgaragem + 4 then
												TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem.")
												return
											end
										elseif vRP.hasPermission(user_id,"ouro.permissao") then
											if parseInt(totalv[1].quantidade) >= totalgaragem + 5 then
												TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem.")
												return
											end
										elseif vRP.hasPermission(user_id,"platina.permissao") then
											if parseInt(totalv[1].quantidade) >= totalgaragem + 10 then
												TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem.")
												return
											end
										else
											if parseInt(totalv[1].quantidade) >= totalgaragem then
												TriggerClientEvent("Notify",source,"importante","Atingiu o número máximo de veículos em sua garagem.")
												return
											end
										end
										if vRP.tryFullPayment(user_id,vehicle[2]) then
											vRP.execute("vRP/add_vehicle",{ user_id = user_id, vehicle = vname })
											if vehicle[2] > 0 then
												TriggerClientEvent("Notify",source,"sucesso","Pagou <b>R$"..vRP.format(parseInt(vehicle[2])).." reais</b>.")
											end
											vRP.closeMenu(source)
										else
											TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
										end
									end
								end
							end
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(vehicles) do
						if k ~= "_config" and k ~= "_shop" and pvehicles[string.lower(k)] == nil then
							if v[2] > 0 then
								submenu[v[1]] = { choose,"<text01>Valor:</text01> <text02>$"..v[2].."</text02><text01>P-Mala:</text01> <text02>"..v[3].."</text02>" }
							else
								submenu[v[1]] = { choose }
							end
							kitems[v[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }
			menu["Vender"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				if user_id then
					local kitems = {}
					local submenu = { name = "Vender" }
					submenu.onclose = function()
						vRP.openMenu(source,menu)
					end

					local choose = function(player,choice)
						local vname = kitems[choice]
						if vname then
							local vehicle = vehicles[vname]
							if vehicle then
								local ok = vRP.request(source,"Tem certeza que deseja <b>vender</b> este veículo?",30)
								if ok then
									local price = math.ceil(vehicle[2]*0.7)
									local rows = vRP.query("vRP/get_vehicle",{ user_id = user_id, vehicle = vname })
									if #rows <= 0 then
										return
									end
									if parseInt(rows[1].detido) >= 1 then
										TriggerClientEvent("Notify",source,"aviso","Acione a seguradora antes de vender.")
										return
									end
									vRP.execute("vRP/remove_vehicle",{ user_id = user_id, vehicle = vname })
									vRP.setSData("custom:u"..user_id.."veh_"..vname,json.encode())
									vRP.giveMoney(user_id,parseInt(price))
									if parseInt(price) > 0 then
										TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>R$"..vRP.format(parseInt(price)).." reais</b>.")
									end
									vRP.closeMenu(source)
								end
							end
						end
					end

					local _pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
					local pvehicles = {}
					for k,v in pairs(_pvehicles) do
						pvehicles[string.lower(v.vehicle)] = true
					end

					for k,v in pairs(pvehicles) do
						local vehicle = vehicles[k]
						if vehicle then
							if vehicle[2] > 0 then
								submenu[vehicle[1]] = { choose,"<text01>Valor:</text01> <text02>$"..parseInt(math.ceil(vehicle[2]*0.7)).."</text02>" }
							else
								submenu[vehicle[1]] = { choose }
							end
							kitems[vehicle[1]] = k
						end
					end
					vRP.openMenu(source,submenu)
				end
			end }
		elseif gtype == "shop" then
			menu["Loja"] = { function(player,choice)
				local user_id = vRP.getUserId(source)
				local tosub = false
				if user_id then
					local submenu = { name = "Loja" }
					submenu.onclose = function()
						if not tosub then
							vRP.openMenu(source,menu)
						end
					end

					local ch_color = function(player,choice)
						local old_vname,old_custom = vRPgarage.getVehicleMods(source)
						local subsubmenu = { name = "Cores" }
						subsubmenu.onclose = function()
							tosub = false
							local vname,custom = vRPgarage.getVehicleMods(source)
							if custom then
								if vRP.tryFullPayment(user_id,3000) then
									if vname then
										local mPlaca = vRPclient.ModelName(player,7)
										local mPlacaUser = vRP.getUserByRegistration(mPlaca)
										if mPlacaUser then
											vRP.setSData("custom:u"..mPlacaUser.."veh_"..vname,json.encode(custom))
										end
										TriggerClientEvent("Notify",player,"sucesso","Pagou <b>$3.000 reais</b>.")
									end
								else
									vRPgarage.setVehicleMods(source,old_custom)
									TriggerClientEvent("Notify",player,"negado","Dinheiro insuficiente.")
								end
							end
						vRP.openMenu(source,submenu)
					end

					local ch_pri = function(player,choice,mod)
						vRPgarage.scrollVehiclePrimaryColour(source,mod)
					end

					local ch_sec = function(player,choice,mod)
						vRPgarage.scrollVehicleSecondaryColour(source,mod)
					end

					local ch_primaria = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setCustomPrimaryColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					local ch_secundaria = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setCustomSecondaryColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					local ch_perolada = function(player,choice,mod)
						vRPgarage.scrollVehiclePearlescentColour(source,mod)
					end

					local ch_rodas = function(player,choice,mod)
						vRPgarage.scrollVehicleWheelColour(source,mod)
					end

					local ch_fumaca = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setSmokeColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					subsubmenu["Primária"] = { ch_pri }
					subsubmenu["Secundária"] = { ch_sec }
					subsubmenu["Primária RGB"] = { ch_primaria }
					subsubmenu["Secundária RGB"] = { ch_secundaria }
					subsubmenu["Perolada"] = { ch_perolada }
					subsubmenu["Rodas"] = { ch_rodas }
					subsubmenu["Fumaça"] = { ch_fumaca }

					tosub = true
					vRP.openMenu(source,subsubmenu)
				end

				submenu["Cores"] = { ch_color,"<text01>Valor:</text01> <text02>$3.000</text02>" }

				local ch_neon = function(player,choice)
					local old_vname,old_custom = vRPgarage.getVehicleMods(source)
					local subsubmenu = { name = "Neon" }
					subsubmenu.onclose = function()
						tosub = false
						local vname,custom = vRPgarage.getVehicleMods(source)
						if custom then
							if vRP.tryFullPayment(user_id,1) then
								if vname then
									local mPlaca = vRPclient.ModelName(player,7)
									local mPlacaUser = vRP.getUserByRegistration(mPlaca)
									if mPlacaUser then
										vRP.setSData("custom:u"..mPlacaUser.."veh_"..vname,json.encode(custom))
									end
									TriggerClientEvent("Notify",player,"sucesso","Pagou <b>$1 dólar</b>.")
								end
							else
								vRPgarage.setVehicleMods(source,old_custom)
								TriggerClientEvent("Notify",player,"negado","Dinheiro insuficiente.")
							end
						end
						vRP.openMenu(source,submenu)
					end

					local ch_nleft = function(player,choice)
						vRPgarage.toggleNeon(source,0)
					end

					local ch_nright = function(player,choice)
						vRPgarage.toggleNeon(source,1)
					end

					local ch_nfront = function(player,choice)
						vRPgarage.toggleNeon(source,2)
					end

					local ch_nback = function(player,choice)
						vRPgarage.toggleNeon(source,3)
					end

					local ch_ncolor = function(player,choice)
						local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
						rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
						local r,g,b = table.unpack(splitString(rgb," "))
						vRPgarage.setNeonColour(source,tonumber(r),tonumber(g),tonumber(b))
					end

					subsubmenu["Traseiro"] = { ch_nback }
					subsubmenu["Dianteiro"] = { ch_nfront }
					subsubmenu["Esquerdo"] = { ch_nleft }
					subsubmenu["Direito"] = { ch_nright }
					subsubmenu["Cor"] = { ch_ncolor }
					tosub = true
					vRP.openMenu(source,subsubmenu)
				end

				submenu["Neon"] = { ch_neon,"<text01>Valor:</text01> <text02>$3.000</text02>" }

				local ch_mods = function(player,choice)
					local kitems = {}
					local old_vname,old_custom = vRPgarage.getVehicleMods(source)
					local subsubmenu = { name = "Modificações" }
					subsubmenu.onclose = function()
						tosub = false
						local vname,custom = vRPgarage.getVehicleMods(source)
						local price = 0
						local items = {}
						if custom then
							for k,v in pairs(custom.mods) do
								local old = old_custom.mods[k]
								local mod = mods[k]
								if mod then
									if old ~= v then
										if mod[4] then
											items[k] = { mod[4],mod[2] }
										else
											price = price + mod[2]
										end
									end
								end
							end
							if vRP.tryFullPayment(user_id,price) then
								if vname then
									local mPlaca = vRPclient.ModelName(player,7)
									local mPlacaUser = vRP.getUserByRegistration(mPlaca)
									if mPlacaUser then
										vRP.setSData("custom:u"..mPlacaUser.."veh_"..vname,json.encode(custom))
									end
									if price > 0 then
										TriggerClientEvent("Notify",source,"sucesso","Pagou <b>R$"..vRP.format(parseInt(price)).." reais</b>.")
									end
								end
							else
								vRPgarage.setVehicleMods(source,old_custom)
								TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
							end
						end
						vRP.openMenu(source,submenu)
					end

					local ch_mod = function(player,choice,mod)
						vRPgarage.scrollVehicleMods(source,kitems[choice],mod)
					end

					for k,v in pairs(mods) do
						if v[2] > 0 then
							subsubmenu[v[1]] = { ch_mod,"<text01>Valor:</text01> <text02>$"..parseInt(math.max(v[2],0)).."</text02>" }
						else
							subsubmenu[v[1]] = { ch_mod }
						end
						kitems[v[1]] = k
					end
					tosub = true
					vRP.openMenu(source,subsubmenu)
				end

				local ch_repair = function(player,choice)
					if vRP.tryFullPayment(user_id,100) then
						TriggerClientEvent('reparar',source)
						TriggerClientEvent("Notify",source,"sucesso","Veículo reparado.")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
					end
				end

				submenu["Modificações"] = { ch_mods }
				submenu["Reparar"] = { ch_repair,"<text01>Valor:</text01> <text02>$100</text02>" }
				vRP.openMenu(source,submenu)
				end
			end }
		end
	end
	vRP.openMenu(source,menu)
end

local function build_garages(source)
	local source = source
	local user_id = vRP.getUserId(source)
	local address = vRP.getUserAddress(user_id)
	if user_id then
		if #address > 0 then
			for k,v in pairs(cfg.garages) do
				local i,x,y,z,pay,loc = table.unpack(v)
				local g = cfg.garage_types[i]

				if g then
					for kk,vv in pairs(address) do
						local cfg = g._config
						if not cfg.ghome or cfg.ghome == vv.home then
							local garage_enter = function(player,area)
								if user_id and vRP.hasPermissions(user_id,cfg.permissions or {}) then
									openGarage(source,i,pay,loc)
								end
							end

							local garage_leave = function(player,area)
								vRP.closeMenu(source)
							end

							vRPclient._addMarker(source,27,x,y,z-0.95,2,2,0.5,178, 34, 34,100,100)
							vRP.setArea(source,"vRP:garage"..k,x,y,z,1.0,1.0,garage_enter,garage_leave)
						end
					end
				end
			end
		else
			for k,v in pairs(cfg.garages) do
				local i,x,y,z,pay,loc = table.unpack(v)
				local g = cfg.garage_types[i]

				if g then
					local cfg = g._config
						if not cfg.ghome then
							local garage_enter = function(player,area)
							if user_id and vRP.hasPermissions(user_id,cfg.permissions or {}) then
								openGarage(source,i,pay,loc)
							end
						end

						local garage_leave = function(player,area)
							vRP.closeMenu(source)
						end

						vRPclient._addMarker(source,27,x,y,z-0.95,2,2,0.5,178, 34, 34,100,100)
						vRP.setArea(source,"vRP:garage"..k,x,y,z,1.0,1.0,garage_enter,garage_leave)
					end
				end
			end
		end
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		build_garages(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER O VEÍCULO PARA OUTRO JOGADOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('vehs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local menu = vRP.buildMenu("vehicle",{ user_id = user_id, player = source, vname = name })
		menu.name = "Veículos"

		local kitems = {}
		local choose = function(source,choice)
			local tosub = false
			local vehicle = choice
			local vname = kitems[vehicle]
			local submenu = { name = vehicle }
			submenu.onclose = function()
				tosub = false
				vRP.openMenu(source,menu)
			end

			local ch_sell = function(source,choice)
				local nplayer = vRPclient.getNearestPlayer(source,3)
				if nplayer then
					local tuser_id = vRP.getUserId(nplayer)
					local totalv = vRP.query("vRP/get_maxcars",{ user_id = tuser_id })
					if vRP.hasPermission(tuser_id,"bronze.permissao") then
						if parseInt(totalv[1].quantidade) >= totalgaragem + 1 then
							TriggerClientEvent("Notify",source,"importante","A pessoa atingiu o número máximo de veículos na garagem.")
							return
						end
					elseif vRP.hasPermission(tuser_id,"prata.permissao") then
						if parseInt(totalv[1].quantidade) >= totalgaragem + 3 then
							TriggerClientEvent("Notify",source,"importante","A pessoa atingiu o número máximo de veículos na garagem.")
							return
						end
					elseif vRP.hasPermission(tuser_id,"ouro.permissao") then
						if parseInt(totalv[1].quantidade) >= totalgaragem + 5 then
							TriggerClientEvent("Notify",source,"importante","A pessoa atingiu o número máximo de veículos na garagem.")
							return
						end
					elseif vRP.hasPermission(tuser_id,"platina.permissao") then
						if parseInt(totalv[1].quantidade) >= totalgaragem + 10 then
							TriggerClientEvent("Notify",source,"importante","A pessoa atingiu o número máximo de veículos na garagem.")
							return
						end
					else
						if parseInt(totalv[1].quantidade) >= totalgaragem then
							TriggerClientEvent("Notify",source,"importante","A pessoa atingiu o número máximo de veículos na garagem.")
							return
						end
					end
					local owned = vRP.query("vRP/get_vehicle",{ user_id = tuser_id, vehicle = vname })
					if #owned == 0 then
						local price = tonumber(sanitizeString(vRP.prompt(source,"Valor:",""),"\"[]{}+=?!_()#@%/\\|,.",false))
						local ok = vRP.request(nplayer,"Aceita comprar um <b>"..vehicle.."</b> por <b>R$"..vRP.format(parseInt(price)).."</b> reais?",30)
						if ok then
							if parseInt(price) > 0 then
								if vRP.tryFullPayment(tuser_id,parseInt(price)) then
									vRP.execute("vRP/move_vehicle",{ user_id = user_id, tuser_id = tuser_id, vehicle = vname })
									local data = vRP.getSData("custom:u"..user_id.."veh_"..vname)
									local custom = json.decode(data) or ""
									vRP.setSData("custom:u"..tuser_id.."veh_"..vname, json.encode(custom))
									vRP.setSData("custom:u"..user_id.."veh_"..vname, json.encode())
									vRP.giveMoney(user_id,parseInt(price))
									TriggerClientEvent("Notify",nplayer,"sucesso","Pagou <b>R$"..vRP.format(parseInt(price)).." reais</b>.")
									TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>R$"..vRP.format(parseInt(price)).." reais</b>.")
									TriggerEvent('logs:ToDiscord', discord_webhook1 , "VENDA", "```Player "..user_id.." \nVendeu o veiculo: "..vname.." \nPara: "..tuser_id.." \nPreço: "..vRP.format(parseInt(price)).."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
								else
									TriggerClientEvent("Notify",nplayer,"negado","Dinheiro insuficiente.")
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
								end
							end
						end
					else
						TriggerClientEvent("Notify",nplayer,"importante","Veículo ja possuído.")
						TriggerClientEvent("Notify",source,"importante","Veículo ja possuído.")
					end
				end
			end
			submenu["Vender"] = { ch_sell }
			tosub = true
			vRP.openMenu(source,submenu)
		end

		local choosedetido = function(source,choice)
			TriggerClientEvent("Notify",source,"importante","Veículo roubado ou detido pela policia, acione a seguradora.")
		end

		local pvehicles = vRP.query("vRP/get_vehicles",{ user_id = user_id })
		for k,v in pairs(pvehicles) do
			local vehicle
			for x,garage in pairs(garage_types) do
				vehicle = garage[v.vehicle]
				if vehicle then break end
			end

			if vehicle then
				local rows = vRP.query("vRP/get_detido",{ user_id = user_id, vehicle = v.vehicle })
				if parseInt(rows[1].detido) <= 0 then
					menu[vehicle[1]] = { choose }
				else
					menu[vehicle[1]] = { choosedetido }
				end
				kitems[vehicle[1]] = v.vehicle
			end
		end

		vRP.openMenu(source,menu)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOTÃO L PARA TRANCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("buttonLock")
AddEventHandler("buttonLock",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,7)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if user_id == mPlacaUser then
		vRPgarage.toggleLock(source)
		TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
	end
end)

RegisterServerEvent("tryLock")
AddEventHandler("tryLock",function(nveh)
	TriggerClientEvent("syncLock",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOTÃO PAGEUP PARA ABRIR PORTA-MALAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("buttonTrunk")
AddEventHandler("buttonTrunk",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca,mName,mNet,mPrice,mBanido,mLock = vRPclient.ModelName(source,7)
	if not mLock then
		if mPlaca then
			if mName then
				if mBanido then
					TriggerClientEvent("Notify",source,"negado","Veículos de serviço ou alugados não podem utilizar o Porta-Malas.")
					return
				end
				local mPlacaUser = vRP.getUserByRegistration(mPlaca)
				if mPlacaUser then
					local chestname = "u"..mPlacaUser.."veh_"..string.lower(mName)
					local max_weight = cfg_inventory.vehicle_chest_weights[string.lower(mName)] or 50

					local cb_out = function(idname,amount)
						if parseInt(amount) > 0 then
							TriggerClientEvent("Notify",source,"sucesso","Retirado <b>"..amount.."x "..vRP.getItemName(idname).."</b>.")
						end
					end

					local cb_in = function(idname,amount)
						if parseInt(amount) > 0 then
							TriggerClientEvent("Notify",source,"sucesso","Colocado <b>"..amount.."x "..vRP.getItemName(idname).."</b>.")
						end
					end

					vRPgarage.toggleTrunk(source)
					vRP.openChest(source,chestname,max_weight,function()
						vRPgarage.toggleTrunk(source)
					end,cb_in,cb_out)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANCORAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ancorar',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,7)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if user_id == mPlacaUser then
		vRPgarage.toggleAnchor(source)
	end
end)