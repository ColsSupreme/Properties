CF = nil

Citizen.CreateThread(function()
	while CF == nil do 
        Citizen.Wait(0)
        TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)
    end
    
end)

local locations = {
		{
			name = 'Little White Church',
			price = '$450,000',
			date = '08/18/2020',
			owner = nil,
            owners = {'Ray Y. - 50%', 'J. Cole - 50%'},
			x = -323.8,
			y = 2772.13,
			z = 62.6,
			ident = {identiy  = {"license:3644574414cbc484df25f5d756ae6b8256824e9e","license:1ad446d864d35da8eed6e3288ff1b0d56a2aa330"}, value = {50,50}},
		},
		{
			name = 'GOH 24/7',
			price = '$450,000',
			date = '08/18/2020',
			owner = nil,
			owners = {'Ray Y. - 50%', 'Mike S. - 50%'},
			x = -3037.04,
			y = 588.07,
			z = 7.82,
			ident = {identiy  = {"license:3644574414cbc484df25f5d756ae6b8256824e9e","license:af779157a54104be9b3a8d292ca4fc13de49aedd"}, value = {50,50}},
		},
		{
			name = 'Senora 24/7',
			price = '$450,000',
			date = '08/18/2020',
			owner = nil,
			owners = {'Ray Y. - 50%', 'Chris D. - 50%'},
			ident = {identiy  = {"license:3644574414cbc484df25f5d756ae6b8256824e9e","license:bf7ce597dc5ae4fc921cd644f85ddc86a6e5fd5e"}, value = {50,50}},
			x = 1723.5,
			y = 6409.42,
			z = 34.19,
		},	
		{
			name = 'Sons of Anarchy MC -6',
			price = '$825,000',
			date = '08/18/2020',
			owner = 'Sam W.',
			x = -358.46,
			y = 6324.24,
            z = 29.81,
            ident = {identiy  = {"license:260969b3730bcead7af92fa25d89283f92c08613"}, value = {100}},
		},
		{
			name = 'Slatt And Lucy\'s Crib',
			price = '$2,000,000',
			date = '09/10/2020',
			owner = nil,
			owners = {'Slattius - 50%', 'Lucy H - 50%'},
			x = -819.15,
			y = 814.89,
            z = 200.67,
            ident = {identiy  = {"license:9e3e2db5fde0963f0f5b2df2e3936214bc9d7323","license:90d38cbc7b1c0b53fcf52185d8002895de737879"}, value = {50,50}},
		},
		{
			name = 'Rt 68 24/7',
			price = '$425,000',
			date = '08/21/2020',
			owner = nil,
			owners = {'Ray - 80%', 'Chris D - 10%', 'Mike S - 10%'},
			x = 543.24,
			y = 2677.9,
            z = 42.23,
            ident = {identiy  = {"license:3644574414cbc484df25f5d756ae6b8256824e9e","license:bf7ce597dc5ae4fc921cd644f85ddc86a6e5fd5e","license:af779157a54104be9b3a8d292ca4fc13de49aedd" }, value = {80, 10 ,10 }},
		},
		{
		
			name = 'Sons of Anarchy MC -7',
			price = '$700,000',
			date = '08/21/2020',
			owner = nil,
			owners = {'Sam W - 50%', 'Jack N - 50%'},
			x = 795.39,
			y = -2128.03,
            z = 29.46,
            ident = {identiy  = {"license:260969b3730bcead7af92fa25d89283f92c08613","license:2733cbb6c53e00e614de289cecd015cb3872dcf2"}, value = {50,50}},
		},
		{
			name = 'BNR Traphouse -2',
			price = '$525,000',
			date = '08/23/20',
			owner = nil,
			owners = {'A. Ramirez - 50%', 'Braden S - 50%'},
			x = -0.07,
			y = 6547.17,
			z = 31.55,
			ident = {identiy  = {"license:daa3abdc0c0b894e390c42da76a74362f63a2864","license:4594018e40d58986da2595fdab04744f77b225e9"}, value = {50, 50}},
		},
		{
			name = 'Jack\'s Crackhouse',
			price = '$1,500,000',
			date = '08/24/20',
			owner = 'Jack D',  
			x = 3325.48,
			y = 5168.13,
            z = 18.40,
            ident = {identiy  = {"license:4f212000921477c7f5f850152df01d501bc76853"}, value = {100}},
		},
		{
			name = 'The Big D Dealership',
			price = '$1,100,000',
			date = '08/24/20',
			owner = nil,
			owners = {'Darius - 75%', 'Jesus Derulo - 15%', 'G. Davis - 10%'},
			x = -194.62,
			y = -1395.85,
            z = 31.1,
            ident = {identiy  = {"license:2aed4606429bf113e7b61420179bde48642d3f6f","license:33d794ceb313b80c3239cd2e63a8ea8eb0b45723","license:b2fb1f3e4a536a6f7422099471634df3cb3eb7ef" }, value = {75, 10 ,15 }},
		},
		{
			name = 'StreetRunners',
			price = '$2,000,000',
			date = '08/27/20',
			owner = nil,
			owners = {'A. Ramirez - 75%', 'Braden S. - 25%'},
			x = -998.76,
			y = 794.91,
            z = 171.79,
            ident = {identiy  = {"license:daa3abdc0c0b894e390c42da76a74362f63a2864","license:4594018e40d58986da2595fdab04744f77b225e9"}, value = {75, 25}},
		},
		{
			name = 'Sons of Anarchy MC -8',
			price = '$1,750,000',
			date = '08/20/2020',
			owner = 'Sam W.',
			x = -20.73,
			y = -1390.74,
            z = 29.39,
            ident = {identiy  = {"license:260969b3730bcead7af92fa25d89283f92c08613"}, value = {100}},
            
		},
		{
			name = 'Vagos Trap',
			price = '$300,000',
			date = '09/18/2020',
			owner = nil,
			owners = {'Trey J. - 50%', 'J. Santos - 50%'},
			x = -373.15,
			y = 6181.2,
            z = 31.5,
            ident = {identiy  = {"license:a1f30ed6a3e47452e2688e19838c11153d5756b9","3AA"}, value = {50, 50}},
		},

}
--[[Citizen.CreateThread(function()
	for k,v in ipairs(locations) do
		print(k)
		local name = locations[k].name
		local price = locations[k].price
		local date = locations[k].date
		local owner = locations[k].owner
		local owners = json.encode(locations[k].owners)
		local ident = json.encode(locations[k].ident)
		local coords = json.encode({x = {locations[k].x},y = {locations[k].y},z = {locations[k].z}})
		MySQL.Async.execute('INSERT INTO properties (`name`,`price`,`owner`,`owners`,`date`,`identifiers`,`data`) VALUES (@name,@price,@owner,@owners,@date,@ident,@coords);',
		{
			["@name"] = name,
			["@price"] = price,
			["@owner"] = owner,
			["@owners"] = owners,
			["@date"] = date,
			["@ident"] = ident,
			["@coords"] = coords
		})
		print("Added Added")
		Citizen.Wait(100)
	end
end)   ]]    

RegisterServerEvent("GetProperties")
AddEventHandler("GetProperties", function()
	_source = source
	ID = GetPlayerIdentifier(_source, 1)
	print(_source .. " Source")
	MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(players)
		print(players)
		print(ID)
		TriggerClientEvent("AddBlips", _source,players,ID)
	end)
	print("players")
	print(tab)
end)


--,`price`,`owner`,`owners`,`date`,`identifiers`,`Coordinates`
--,@price,@owner,@owners,@date,@ident,@coords)

RegisterServerEvent("UpdateName")
AddEventHandler("UpdateName", function(data,name)
	print(data)
	print(name)
	MySQL.Async.fetchAll('UPDATE properties SET name=@name WHERE name = @Cname', {
		["@name"] =data,
		["@Cname"] = name,
	})
end)


RegisterServerEvent("SellTo")
AddEventHandler("SellTo", function(name,amount,id,property,toChange,person,check)
	print(name .. "Propery Name")
	print(amount .. "Total")
	print(id .. "ID")
	print(property)
	print(toChange .. "To Change")
	print(person .. "Going to")
	print(check .. "Persons name")
	local ident = json.decode(property.identifiers)["identiy"]
	local val = json.decode(property.identifiers)[""]
	local found = false
	for k,v in ipairs(ident) do
		local CID = ident[k]
		local PID = GetPlayerIdentifier(id,1)
		print(PID .. "  PID")
		print(CID)
		if found == false then
			if #ident == 4 then
				if CID == PID then
					print()
					found = true
					print("found")
					pos = k
				else
					print("OFF")
				end
			else

				if CID == PID then
					found = true
					print("found")
					pos = k
				else
					print("OFF")
				end
			end
		end
	end
	print(pos)
	if found == true then
		local olddata = property.identifiers
		print(olddata)
		if amount-toChange == 0 then
			print("noneleft")
			
		else 
			print("someleft")
			local temp = json.decode(olddata)
			recivervalue = temp.value[pos] + toChange
			print(recivervalue)
		end
	end 
	
end)

RegisterServerEvent("CheckPerson")
AddEventHandler("CheckPerson", function(name,amount,id,property,toChange,person)
	local id = source
	local check = GetPlayerName(person)
	if check ~= nil then
		giver = GetPlayerName(source)
		CF.ShowNotification(source,"~g~You have transfered " .. toChange .. "% of the property to " .. check .. "~g~ You have ".. amount-toChange .. "% remaining")
		CF.ShowNotification(person,"~g~You have been given " .. toChange.. "% of ".. name .. " by ".. giver)
		TriggerEvent("SellTo",name,amount,id,property,toChange,person,check)
	else
		CF.ShowNotification(source,"~r~This person is not online")
	end
end)



function updatdb(name,amount,id,property,toChange,person,check)


end