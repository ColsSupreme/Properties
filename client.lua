CF = nil

Citizen.CreateThread(function()
	while CF == nil do 
        Citizen.Wait(0)
        TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)
    end
    
end)


Citizen.CreateThread(function()
	TriggerServerEvent("GetProperties")
end)

function HelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("AddBlips")
AddEventHandler("AddBlips", function(source,ID)
	print(ID)
	print(table.unpack(source))
	while true do
		Citizen.Wait(0)
        local _inside_marker = false
		for k,v in pairs(source) do 
			local property = source[k]
			local data = source[k].data
			local xt = json.decode(data)["x"]
			local x = table.unpack(xt)
			local zt = json.decode(data)["z"]
			local z = table.unpack(zt)
			local yt = json.decode(data)["y"]
			local y = table.unpack(yt)
			local ply_coords = GetEntityCoords(GetPlayerPed(-1), true)
			if (GetDistanceBetweenCoords(ply_coords, x,y,z, true) < 15.0) then -- If true, render marker.
				
                DrawMarker(23, x,y,z-1, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 1.50, 1.50, 1.50, 0, 100, 255, 150, false, true, 2, false, false, false, false)
                if (GetDistanceBetweenCoords(ply_coords, x,y,z, true) < 1.25) then -- If true, show marker's action prompt.
					_inside_marker = true
					HelpText('Press ~o~~INPUT_PICKUP~~s~ to view ~r~' .. property.name .. '~s~ info.')
					
					if (IsControlJustReleased(0, 51)) then -- Interaction
						menu(property,ID)
					end
                end
			end
		end
        inside_marker = _inside_marker
    end
end)



function HelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function menu(property,ID)
	local place = property
	local name = property.name
	local _elements = {}
    table.insert(_elements, {label = "<span style='color: #ffffff'><b>Name: " .. property.name .. "</b>",   value = 'name'})
    table.insert(_elements, {label = "<span style='color: #ffffff'><b>Date: " .. property.date .. "</b>",   value = 'date'})
	table.insert(_elements, {label = "<span style='color: #ffffff'><b>Sold For: " .. property.price .. "</b>",   value = 'price'})
	if property.owner ~= nil then 
		table.insert(_elements, {label = "<span style='color: #ffffff'><b>Owner: " .. property.owner .. "</b>",   value = 'owner'})
	else
		local owner = json.decode(place.owners)
		local val = json.decode(place.identifiers)["value"]
		print(#owner)
		for i=1, #owner, 1 do
			print(owner[i])
			table.insert(_elements, {label = "<span style='color: #ffffff'><b>Owner: " .. owner[i] .. " - " .. val[i] .. "%</b>",   value = 'owner'})
		end
	end
    local ident = json.decode(place.identifiers)["identiy"]
	
	
	for k,v in ipairs(ident) do
		print(ident[k])
		if ID == ident[k]then
			table.insert(_elements, {label = "<span style='color: color: #ffffff';><b>Owner Menu</b>",   value = 'ownerMenu'})
		end

	end

    table.insert(_elements, {label = '<span style="color: red"><b>Exit</b></span>',       value = 'exit'})
    

    CF.UI.Menu.CloseAll()

    CF.UI.Menu.Open('default1', GetCurrentResourceName(), 'Prop_Menu', {
        title    = name,
        align    = 'center',
        elements = _elements,
	},function(data, menu)
        if data.current.value == 'exit' then
			menu.close()
		
		elseif data.current.value == "ownerMenu" then
			OwnerMenu(property,ID,name)
		end
        end)

end



function OwnerMenu(property,ID,name)
	local place = property
	local name = property.name
	local _elements1 = {}
	print(place.identifiers)
	local owner = json.decode(place.owners)
	local ident = json.decode(place.identifiers)["identiy"]
	local val = json.decode(place.identifiers)["value"]
	for k,v in ipairs(ident) do
		if ident[k] == ID then
			if val[k] >= 51 then
				table.insert(_elements1, {label = '<span style="color: white"><b>Change Name</b></span>',       value = 'change'})
			end
		end
	end
	table.insert(_elements1, {label = '<span style="color: white"><b>Sell to someone</b></span>',       value = 'ST'})
	
	for k,v in ipairs(ident) do
		if ident[k] == ID then
			table.insert(_elements1, {label = '<span style="color: white"><b>You own '..val[k] ..'% </b></span>',       value = 'you'})
		end
	end
	table.insert(_elements1, {label = '<span style="color: red"><b>Exit</b></span>',       value = 'exit'})

	CF.UI.Menu.CloseAll()

    CF.UI.Menu.Open('default1', GetCurrentResourceName(), 'Owner_menu', {
	title    = "Owner Menu",
        align    = 'center',
        elements = _elements1,
	},function(data, menu)
        if data.current.value == 'exit' then
			menu.close()
		
		elseif data.current.value == "change" then
			ChangeName(name)
		elseif data.current.value == "ST" then
			SellTO(name,property,ID)
		end
		
        end)
end



function ChangeName(name)
	CF.UI.Menu.CloseAll()
	CF.ShowNotification("To cancel press confirm while box is empty")
	

    CF.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Change_Name', {
		title    = "Name Change (Will change on the next restart)",
        align    = 'center',
        elements = _elements1,
	},function(data, menu)
		print(table.unpack(menu))
		
		if data.value ~= nil then
			local NewName = data.value
			TriggerServerEvent("UpdateName", NewName ,name)
			menu.close()
		else
      		menu.close()
		end

        end)
end


function SellTO(name,property,ID)
	CF.UI.Menu.CloseAll()
	CF.ShowNotification("To cancel press confirm while box is empty")
	local place = property
	local ident = json.decode(place.identifiers)["identiy"]
	local val = json.decode(place.identifiers)["value"]
	for k,v in ipairs(ident) do
		if ident[k] == ID then
			amount = val[k]
		end
	end
	
    CF.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Sell_To', {
		title    = "You own "..amount .." %. How much are you selling?" ,
        align    = 'center',
        elements = _elements1,
	},function(data, menu)
		
		print(table.unpack(menu))
		if data.value ~= nil then
			if tonumber(data.value) ~= nil then
				local toChange = tonumber(data.value)
				if toChange > amount then
					CF.ShowNotification("~r~You do not own enough of this property")
					menu.close()
				else	
					if toChange ~= amount then
						if #ident >= 4 then 
							CF.ShowNotification("~r~You can only have 4 people on a property")
						else
							Confirm(name,amount,id,property,toChange)
						end
					else 
						Confirm(name,amount,id,property,toChange)
					end
				end
			menu.close()
			end
		else
      		menu.close()
		end

        end)
end



function Confirm(name,amount,id,property,toChange)
	local _elements = {}
	local am = toChange
	table.insert(_elements, {label = "<span style='color: #ffffff'><b>Name: " .. property.name .. "</b>",   value = 'name'})
	table.insert(_elements, {label = "<span style='color: #ffffff'><b>You are selling: " .. am .. "%</b>",   value = 'name'})
	table.insert(_elements, {label = "<span style='color: #00ff08'><b>Confirm</b>",   value = 'Yes'})
	table.insert(_elements, {label = "<span style='color: #ff0000'><b>Cancel</b>",   value = 'exit'})
	CF.UI.Menu.CloseAll()
    CF.UI.Menu.Open('default1', GetCurrentResourceName(), 'Confirm', {
		title    = "Owner Menu",
        align    = 'center',
        elements = _elements,
	},function(data, menu)
        if data.current.value == 'exit' then
			menu.close()
		elseif data.current.value == "Yes" then
			GetPer(name,amount,id,property,toChange)
		end
		
    end)
end



function GetPer(name,amount,id,property,toChange)
	CF.UI.Menu.CloseAll()
	CF.ShowNotification("To cancel press confirm while box is empty")
	local place = property
	local ident = json.decode(place.identifiers)["identiy"]
	local val = json.decode(place.identifiers)["value"]
	for k,v in ipairs(ident) do
		if ident[k] == ID then
			amount = val[k]
		end
	end
	
    CF.UI.Menu.Open('dialog', GetCurrentResourceName(), 'GetPer', {
		title    = "You own "..amount .." %. Who are you selling to?" ,
        align    = 'center',
        elements = _elements1,
	},function(data, menu)
		local person = data.value
		if person ~= nil then
			TriggerServerEvent("CheckPerson",name,amount,id,property,toChange,person)
			menu.close()
		else
			CF.ShowNotification("~r~This input is not a number try again")
		end
    end)
end