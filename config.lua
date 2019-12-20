--[[ 
----------TEMPLATE

	zoneXFromOutToIn = {
		x = obviously X,
		y = obviously Y,
		z = obviously Z,
		w = obviously WIDTH,
		h = obviously HEIGHT,		
		visible = true,
		t = obviously TYPE,
		color = {
			r = obviously RED,
			g = obviously GREEN,
			b = obviously BLUE
		}
	},

If you don't want the marker to be visible, you're not obliged to
type more data after it:

	zoneXFromOutToIn = {
		x = obviously X,
		y = obviously Y,
		z = obviously Z,
		w = obviously WIDTH,
		h = obviously HEIGHT,		
		visible = false
	},
]]
-- To get a list of available marker go to https://docs.fivem.net/game-references/markers/

Config = {}

-- C key by default
Config.actionKey = 38

-- markers AKA Teleporters
Config.zones = {
	
	WeedEnter = {           --This is the entrance where you go to enter the weed warehouse
		x = 100.81,
		y = -1912.67,
		z = 21.41,
		w = 1.8,
		h = 1.3,
		visible = true, -- Set this to true to make the marker visible. False to disable it.
		t = 27,          -- This is the marker. You can change it https://docs.fivem.net/game-references/markers
		color = {
			r = 255,
			g = 255,
			b = 255
		}
		
	},

	WeedExit = {           --This is the entrance where you go to enter the weed warehouse
	    x = 3540.78,
	    y = 3675.64,
	    z = 20.40,
		w = 1.8,
		h = 1.3,
		visible = true, -- Set this to true to make the marker visible. False to disable it.
		t = 27,          -- This is the marker. You can change it https://docs.fivem.net/game-references/markers
		color = {
			r = 255,
			g = 255,
			b = 255
		}
		
	},

	SpawnEnter = {           --This is the entrance where you go to enter the weed warehouse
	x = 1087.62,
	y = -3099.39,
	z = -39.9,
	w = 2.8,
	h = 1.3,
	visible = true, -- Set this to true to make the marker visible. False to disable it.
	t = 27,          -- This is the marker. You can change it https://docs.fivem.net/game-references/markers
	color = {
		r = 255,
		g = 255,
		b = 255
	}
	
    },
	
	--SpawnExit = {          --This is the exit where you go to exit the weed warehouse
	--	x =  1004,
	--	y = -3195.69,
	--	z = -38.99,
	--	w = 1.8,
	--	h = 1.3,
	--	visible = true,
	--	t = 27,
	--	color = {
	--		r = 255,
	--		g = 255,
	--		b = 255
	--	}
		
	--},
	
	MoneyWashEnter = {
		x = -489.57,
		y = 4240.79,
		z = 87.56,
		w = 2.0,
		h = 1.0,
		visible = true,
		t = 27,
		color = {
			r = 255,
			g = 255,
			b = 255
		}
		
	},

	CokeEnter = {
		x = 76.26,
		y = -1948.28,
		z = 20.17,
		w = 2.8,
		h = 1.3,		
		visible = true,
		t = 27,
		color = {
			r = 211,
			g = 211,
			b = 211
		}
	},
	
	CokeExit = {
		x = 151.3,
		y = -1007.63, 
		z = -99.0,
		w = 1.8,
		h = 0.8,		
		visible = true,
		t = 27,
		color = {
			r = 255,
			g = 255,
			b = 255
		}
	},
}

-- Landing point, keep the same name as markers
Config.point = {



	SpawnEnter = {           --This is where you land when you use the entrance teleport.
	x = -1039.51,
	y = -2741.54,
	z = 13.6
    },


	CokeEnter = {
		x = 151.3,
		y = -1007.63, 
		z = -99.0,
	},
	
	CokeExit = {
		x = 76.26,
		y = -1948.28,
		z = 20.17
	}
}


-- Automatic teleport list (no need to puseh E key in the marker)
Config.auto = {
--	'WeedEnter',
--	'WeedExit',
--	'MoneyWashEnter',
--	'MoneyWashExit',
--	'CokeEnter',
--	'CokeExit',
--	'MethEnter',
--	'MethExit'
}
