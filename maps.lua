map1 = {
	bounds = {{0,0},{22,16}},
	inbound = {"airIncoming"},
	
	nodes = {
		["gate1"] = {
			pos = {10,13},
			nxt = {"crossing"},
		},
		["gate2"] = {
			pos = {13,13},
			nxt = {"crossing"},
		},
		["crossing"] = {
			pos = {10,9},
			nxt = {"fwdTakeoff1"},
		},
		["fwdTakeoff1"] = {
			pos = {10,2},
			nxt = {"fwdTakeoff2"},
		},
		["fwdTakeoff2"] = {
			pos = {2,2},
			nxt = {"takeoffQueue"},
		},
		["takeoffQueue"] = {
			pos = {2,6},
			nxt = {"takeoff"},
		},
		["takeoff"] = {
			pos = {4,6},
			nxt = {"land"},
		},
		["land"] = {
			pos = {20,6},
			nxt = {"fwdLand1"},
		},
		["fwdLand1"] = {
			pos = {20,10},
			nxt = {"fwdLand2"},
		}, 
		["fwdLand2"] = {
			pos = {15,10},
			nxt = {"gate1", "gate2"},
		},
		["airIncoming"] = {
			pos = {-1,6},
			nxt = {"land"},
		}
	}
}