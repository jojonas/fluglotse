return {
	bounds = {{0,0},{22,16}},
	mapEntrances = {"airIncoming"},
	mapExits = {"airOutgoing"},
	trafficFrequency = 1/50,
	metersPerPixel = 100,
	imageFilename = "map1.png",
	
	nodes = {
		["gate1"] = {
			pos = {10,13},
			actions = {["taxi"] = "crossing"},
		},
		["gate2"] = {
			pos = {13,13},
			actions = {["taxi"] = "crossing"},
		},
		["crossing"] = {
			pos = {10,9},
			actions = {["cross"] = "fwdTakeoff1"},
		},
		["fwdTakeoff1"] = {
			pos = {10,2},
			actions = {["auto"] = "fwdTakeoff2"},
		},
		["fwdTakeoff2"] = {
			pos = {2,2},
			actions = {["auto"] = "takeoffQueue"},
		},
		["takeoffQueue"] = {
			pos = {2,6},
			actions = {["takeoff"] = "takeoff"},
		},
		["takeoff"] = {
			pos = {4,6},
			actions = {["auto"] = "airOutgoing"},
		},
		["land"] = {
			pos = {20,6},
			actions = {["auto"] = "fwdLand1"},
			speedFactor = 13,
			queueing = false,
		},
		["fwdLand1"] = {
			pos = {20,10},
			actions = {["auto"] = "fwdLand2"},
		}, 
		["fwdLand2"] = {
			pos = {15,10},
			actions = {["gate1"] = "gate1", ["gate2"] = "gate2"},
		},
		["airIncoming"] = {
			pos = {-5,6},
			actions = {["auto"] = "land"},
			altitude = 300,
		},
		["airOutgoing"] = {
			pos = {29,6},
			actions = {},
			speedFactor = 8,
			queueing = false,
			altitude = 300
		}
	}
}