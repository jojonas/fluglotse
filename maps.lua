map1 = {
	bounds = {{0,0},{2200,1600}},
	inbound = {"airIncoming"},
	
	nodes = {
		["gate1"] = {
			pos = {1000,1300},
			nxt = {"crossing"},
		},
		["gate2"] = {
			pos = {1300,1300},
			nxt = {"crossing"},
		},
		["crossing"] = {
			pos = {1000,900},
			nxt = {"fwdTakeoff1"},
		},
		["fwdTakeoff1"] = {
			pos = {1000,200},
			nxt = {"fwdTakeoff2"},
		},
		["fwdTakeoff2"] = {
			pos = {200,200},
			nxt = {"takeoffQueue"},
		},
		["takeoffQueue"] = {
			pos = {200,600},
			nxt = {"takeoff"},
		},
		["takeoff"] = {
			pos = {400,600},
			nxt = {"land"},
		},
		["land"] = {
			pos = {2000,600},
			nxt = {"fwdLand1"},
		},
		["fwdLand1"] = {
			pos = {2000,1000},
			nxt = {"fwdLand2"},
		}, 
		["fwdLand2"] = {
			pos = {1500,1000},
			nxt = {"gate1", "gate2"},
		},
		["airIncoming"] = {
			pos = {-100,600},
			nxt = {"land"},
		}
	}
}