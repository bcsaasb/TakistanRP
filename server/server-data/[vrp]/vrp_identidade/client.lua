local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
func = Tunnel.getInterface("identidade")
vRP = Proxy.getInterface("vRP")

local open = false

function openGui()
  SendNUIMessage({openMeter = true})
end

--Fechar o Gui e desabilitar o NUI
function closeGui()
  SendNUIMessage({openMeter = false})
end

function AtualizaHUD(nome, primeiroNome, id, registro, idade, telefone, carteira, banco, multas, paypal, trabalho)
  SendNUIMessage(
    {
      updateBalance = true,
      nome = nome,
      primeiroNome=primeiroNome,
      id=id,
      registro=registro,
      idade=idade,
      telefone=telefone,
      carteira=carteira,
      banco=banco,
      multas=multas,
      paypal=paypal,
      trabalho =trabalho
    }
  )
end
local identity = true
Citizen.CreateThread(
  function()
    while true do
     Citizen.Wait(1)
if IsControlJustPressed(0,344) then
 if identity then
			openGui()
			identity = false
        local foto, nome, primeiroNome, id, registro, idade, telefone, carteira, banco, multas, paypal, trabalho =
        func.Identidade()
        AtualizaHUD(nome, primeiroNome, id, registro, idade, telefone, carteira, banco, multas, paypal, trabalho)

			else
	 closeGui()
			identity = true
			end

end
        if open then
       
      end
    end
  end
)

RegisterCommand(
  "rg",
  function()
    if not open then
      openGui()
      open = true
    else
      closeGui()
      open = false
    end
  end
)

RegisterNetEvent("fecharGui")
AddEventHandler(
  "fecharGui",
  function()
    closeGui()
    chamou = false
  end
)

function notificacao(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
