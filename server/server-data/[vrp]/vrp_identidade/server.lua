local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("identidade",func)

local cfg = module("vrp","cfg/groups")
local groups = cfg.groups

function func.Identidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local carteira = vRP.getMoney(user_id)
		local banco = vRP.getBankMoney(user_id)
		local identidade = vRP.getUserIdentity(user_id)
		local multas = vRP.getUData(user_id,"vRP:multas")
		local mymultas = json.decode(multas) or 0
		local paypal = vRP.getUData(user_id,"vRP:paypal")
		local mypaypal = json.decode(paypal) or 0
		local groupv = func.getTrabalho(user_id,"job")
		local cargo = func.getTrabalho(user_id,"cargo")
		if cargo ~= "" then
			groupv = cargo
		end
		if identidade then
			return identidade.foto,identidade.name,identidade.firstname,identidade.user_id,identidade.registration,identidade.age,identidade.phone,vRP.format(parseInt(carteira)),vRP.format(parseInt(banco)),vRP.format(parseInt(mymultas)),vRP.format(parseInt(mypaypal)),groupv
		end
	end
end

function func.getTrabalho(user_id,gtype)
	local user_groups = vRP.getUserGroups(user_id)
	for k,v in pairs(user_groups) do
		local kgroup = groups[k]
		if kgroup then
			if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == gtype then
				return kgroup._config.title
			end
		end
	end
	return ""
end