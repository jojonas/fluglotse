return {
	bounds = {{0,0},{2200,1600}},
	mapEntrances = {"airIncoming"},
	mapExits = {"airOutgoing"},
	
	nodes = {
		["gate1"] = {
			pos = {1000,1300},
			actions = {["taxi"] = "crossing"},
		},
		["gate2"] = {
			pos = {1300,1300},
			actions = {["taxi"] = "crossing"},
		},
		["crossing"] = {
			pos = {1000,900},
			actions = {["cross"] = "fwdTakeoff1"},
		},
		["fwdTakeoff1"] = {
			pos = {1000,200},
			actions = {["auto"] = "fwdTakeoff2"},
		},
		["fwdTakeoff2"] = {
			pos = {200,200},
			actions = {["auto"] = "takeoffQueue"},
		},
		["takeoffQueue"] = {
			pos = {200,600},
			actions = {["takeoff"] = "takeoff"},
		},
		["takeoff"] = {
			pos = {400,600},
			actions = {["auto"] = "airOutgoing"},
		},
		["land"] = {
			pos = {2000,600},
			actions = {["auto"] = "fwdLand1"},
		},
		["fwdLand1"] = {
			pos = {2000,1000},
			actions = {["auto"] = "fwdLand2"},
		}, 
		["fwdLand2"] = {
			pos = {1500,1000},
			actions = {["gate1"] = "gate1", ["gate2"] = "gate2"},
		},
		["airIncoming"] = {
			pos = {-100,600},
			actions = {["auto"] = "land"},
		},
		["airOutgoing"] = {
			pos = {2300,600},
			actions = {}
		}
	}
}