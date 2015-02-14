return { 
	["bounds"] = { 
		[2] = { 
			[2] = 860.88513673156, 
			[1] = 1903.3271968348, 
		}, 
		[1] = { 
			[2] = 43.738649142152, 
			[1] = 38.802462069062, 
		}, 
	}, 
	["metersPerPixel"] = 1.25, 
	["mapExits"] = { 
		[1] = "41", 
		[2] = "40", 
		[3] = "121", 
	}, 
	["nodes"] = { 
		["70"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 512.32144458599, 
				[1] = 828.26016031357, 
			}, 
			["actions"] = { 
				["takeoff"] = "takeoff3", 
			}, 
		}, 
		["40"] = { 
			["pos"] = { 
				[1] = 2613.6041413955, 
				[2] = 367.48856967769, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
			}, 
			["altitude"] = 300, 
		}, 
		["toStart3"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 638.742035273, 
				[1] = 829.58614228843, 
			}, 
			["actions"] = { 
				["auto"] = "70", 
			}, 
		}, 
		["5"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1645.8046275123, 
				[2] = 456.6572270713, 
			}, 
			["actions"] = { 
				["auto"] = "mergeEast", 
			}, 
		}, 
		["41"] = { 
			["pos"] = { 
				[1] = 2592.1322084164, 
				[2] = 678.83159787457, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
			}, 
			["altitude"] = 300, 
		}, 
		["157"] = { 
			["pos"] = { 
				[1] = 840.46831992314, 
				[2] = 57.116071796663, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "148", 
			}, 
			["altitude"] = 100, 
		}, 
		["110"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 339.05351410095, 
				[1] = 1127.5586378908, 
			}, 
			["actions"] = { 
				["takeoff"] = "takeoff1", 
			}, 
		}, 
		["12"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1536.8807498512, 
				[2] = 620.4808193058, 
			}, 
			["actions"] = { 
				["auto"] = "mergeSouth", 
			}, 
		}, 
		["toRallyOutGatesN3"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1511.9221167796, 
				[2] = 219.36714090402, 
			}, 
			["actions"] = { 
				["auto"] = "rallyOutGatesN", 
			}, 
		}, 
		["13"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1414.1144477135, 
				[2] = 589.53133137192, 
			}, 
			["actions"] = { 
				["auto"] = "12", 
			}, 
			["speedFactor"] = 1.5, 
		}, 
		["land2threshold"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 404.52876197124, 
				[1] = 1103.376245527, 
			}, 
			["actions"] = { 
				["auto"] = "land2End", 
			}, 
			["speedFactor"] = 2, 
		}, 
		["mergeSouth"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1574.754171691, 
				[2] = 699.43416702323, 
			}, 
			["actions"] = { 
				["auto"] = "rallyInGatesS", 
			}, 
		}, 
		["sToStart2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 577.11469048233, 
				[1] = 1006.5909455028, 
			}, 
			["actions"] = { 
				["cross"] = "83", 
			}, 
		}, 
		["holdRunway2"] = { 
			["pos"] = { 
				[2] = 339.84894010763, 
				[1] = 630.39681722649, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "245", 
			}, 
			["altitude"] = 100, 
		}, 
		["83"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 404.52876197124, 
				[1] = 1005.7002515256, 
			}, 
			["actions"] = { 
				["takeoff"] = "takeoff2", 
			}, 
		}, 
		["245"] = { 
			["pos"] = { 
				[2] = 262.71514121577, 
				[1] = 656.96512573369, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "246", 
			}, 
			["altitude"] = 100, 
		}, 
		["toGatesS"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1866.1777469091, 
				[2] = 601.26598391184, 
			}, 
			["actions"] = { 
				["auto"] = "29", 
			}, 
		}, 
		["gateN1"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1259.9594736424, 
				[2] = 145.72082049683, 
			}, 
			["actions"] = { 
				["auto"] = "217", 
			}, 
		}, 
		["254"] = { 
			["pos"] = { 
				[2] = 289.18253232756, 
				[1] = 460.24593342579, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "154", 
			}, 
			["altitude"] = 100, 
		}, 
		["233"] = { 
			["pos"] = { 
				[2] = 843.66712018244, 
				[1] = 142.20450153067, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "242", 
			}, 
			["altitude"] = 100, 
		}, 
		["decideRunway3"] = { 
			["pos"] = { 
				[1] = 638.5528001281, 
				[2] = 515.4471998719, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["changeToRunway2"] = "targetRunway2", 
				["holdForRunway"] = "holdRunway3", 
				["auto"] = "targetRunway3", 
			}, 
			["altitude"] = 100, 
		}, 
		["land3End"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1476.1585671112, 
				[2] = 508.06512416255, 
			}, 
			["actions"] = { 
				["auto"] = "5", 
			}, 
			["speedFactor"] = 1.5, 
		}, 
		["37"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = -362.2700642927, 
				[2] = 273.97949322239, 
			}, 
			["actions"] = { 
				["auto"] = "decideRunway2", 
			}, 
			["altitude"] = 300, 
		}, 
		["takeoff2"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 403.44233481364, 
				[1] = 1473.2193772403, 
			}, 
			["actions"] = { 
				["auto"] = "40", 
			}, 
			["speedFactor"] = 2, 
		}, 
		["255"] = { 
			["pos"] = { 
				[2] = 173.64371531053, 
				[1] = 486.65480588683, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "254", 
			}, 
			["altitude"] = 100, 
		}, 
		["holdRunway3"] = { 
			["pos"] = { 
				[2] = 552.56217309631, 
				[1] = 729.84072550618, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "240", 
			}, 
			["altitude"] = 100, 
		}, 
		["29"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1796.0255742589, 
				[2] = 700.30434530024, 
			}, 
			["actions"] = { 
				["auto"] = "mergeSouth", 
			}, 
		}, 
		["toGateN2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1458.3316180306, 
				[2] = 292.49062517829, 
			}, 
			["actions"] = { 
				["auto"] = "gateN2", 
			}, 
		}, 
		["land2End"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1600.6908522644, 
				[2] = 403.6579297631, 
			}, 
			["actions"] = { 
				["auto"] = "mergeEast", 
			}, 
			["speedFactor"] = 1.5, 
		}, 
		["243"] = { 
			["pos"] = { 
				[2] = 663.59486685043, 
				[1] = 77.435430174095, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "235", 
			}, 
			["altitude"] = 100, 
		}, 
		["rallyInGatesS"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1400.7030029421, 
				[2] = 704.04443672726, 
			}, 
			["actions"] = { 
				["gate2"] = "gateS2", 
				["gate1"] = "toGateS1", 
				["passGates"] = "rallyOutGatesS", 
			}, 
		}, 
		["217"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1254.9543989462, 
				[2] = 132.20813375633, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesN", 
			}, 
			["speedFactor"] = 0.01, 
		}, 
		["170"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 790.41641749847, 
				[1] = 1168.1492711795, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesS", 
			}, 
			["speedFactor"] = 0.01, 
		}, 
		["toRallyOutGatesS"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 656.82858591781, 
				[1] = 1224.721752234, 
			}, 
			["actions"] = { 
				["auto"] = "rallyOutGatesS", 
			}, 
		}, 
		["242"] = { 
			["pos"] = { 
				[2] = 759.68085182996, 
				[1] = 77.435430174095, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "243", 
			}, 
			["altitude"] = 100, 
		}, 
		["takeoff3"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 510.69961635499, 
				[1] = 1394.9293269758, 
			}, 
			["actions"] = { 
				["auto"] = "41", 
			}, 
			["speedFactor"] = 2, 
		}, 
		["158"] = { 
			["pos"] = { 
				[2] = 381.27829232653, 
				[1] = 1168.5888864113, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 2, 
			["actions"] = { 
				["auto"] = "13", 
			}, 
			["altitude"] = 20, 
		}, 
		["takeoff1"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 549.10981684077, 
				[1] = 1368.3777045689, 
			}, 
			["actions"] = { 
				["auto"] = "121", 
			}, 
			["speedFactor"] = 2, 
		}, 
		["215"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1540.9965456572, 
				[2] = 133.71067110443, 
			}, 
			["actions"] = { 
				["taxi"] = "toRallyOutGatesN3", 
			}, 
			["speedFactor"] = 0.01, 
		}, 
		["decideWest"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 689.08081303652, 
				[1] = 1009.7056359852, 
			}, 
			["actions"] = { 
				["taxiStart3"] = "toStart3", 
				["taxiStart2"] = "sToStart2", 
			}, 
		}, 
		["toRallyOutGatesN2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1348.6463916192, 
				[2] = 296.4973914399, 
			}, 
			["actions"] = { 
				["auto"] = "rallyOutGatesN", 
			}, 
		}, 
		["targetRunway3"] = { 
			["pos"] = { 
				[2] = 512.67940958322, 
				[1] = 790.18341533566, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 2.5, 
			["actions"] = { 
				["auto"] = "land3Threshold", 
			}, 
			["altitude"] = 50, 
		}, 
		["249"] = { 
			["pos"] = { 
				[2] = 120.44613437077, 
				[1] = 107.60106918161, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "250", 
			}, 
			["altitude"] = 100, 
		}, 
		["248"] = { 
			["pos"] = { 
				[2] = 81.879234924836, 
				[1] = 203.58979669149, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "249", 
			}, 
			["altitude"] = 100, 
		}, 
		["186"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 796.64856063393, 
				[1] = 1344.2466581423, 
			}, 
			["actions"] = { 
				["taxi"] = "toRallyOutGatesS", 
			}, 
			["speedFactor"] = 0.01, 
		}, 
		["250"] = { 
			["pos"] = { 
				[2] = 231.86162165902, 
				[1] = 70.748254155499, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "251", 
			}, 
			["altitude"] = 100, 
		}, 
		["decideEast"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 413.82661639743, 
				[1] = 1851.2602537406, 
			}, 
			["actions"] = { 
				["taxiGatesS"] = "toGatesS", 
				["taxiGatesN"] = "toGatesN", 
			}, 
		}, 
		["225"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 93.169592599968, 
				[2] = -112.92676880683, 
			}, 
			["actions"] = { 
				["auto"] = "targetRunway1", 
			}, 
			["altitude"] = 300, 
		}, 
		["targetRunway2"] = { 
			["pos"] = { 
				[1] = 909.65752915838, 
				[2] = 403.43359075979, 
			}, 
			["queueing"] = false, 
			["altitude"] = 50, 
			["actions"] = { 
				["auto"] = "land2threshold", 
			}, 
			["speedFactor"] = 2.5, 
		}, 
		["156"] = { 
			["pos"] = { 
				[1] = 1185.7874552421, 
				[2] = 136.30579831717, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "145", 
			}, 
			["altitude"] = 100, 
		}, 
		["150"] = { 
			["pos"] = { 
				[1] = 1145.5434958628, 
				[2] = 120.72749146068, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "151", 
			}, 
			["altitude"] = 100, 
		}, 
		["154"] = { 
			["pos"] = { 
				[1] = 558.44737684223, 
				[2] = 459.08278201881, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "targetRunway3", 
			}, 
			["altitude"] = 100, 
		}, 
		["gateN2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1401.7292783238, 
				[2] = 145.72251206223, 
			}, 
			["actions"] = { 
				["auto"] = "212", 
			}, 
		}, 
		["257"] = { 
			["pos"] = { 
				[2] = 74.610443581657, 
				[1] = 651.71025876829, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "255", 
			}, 
			["altitude"] = 100, 
		}, 
		["145"] = { 
			["pos"] = { 
				[1] = 1140.3507269106, 
				[2] = 59.712456272745, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "157", 
			}, 
			["altitude"] = 100, 
		}, 
		["148"] = { 
			["pos"] = { 
				[1] = 673.00152121583, 
				[2] = 232.37202393222, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "targetRunway2", 
			}, 
			["altitude"] = 100, 
		}, 
		["240"] = { 
			["pos"] = { 
				[2] = 605.96103960452, 
				[1] = 765.96223796931, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "238", 
			}, 
			["altitude"] = 100, 
		}, 
		["232"] = { 
			["pos"] = { 
				[2] = 843.66712018244, 
				[1] = 549.32437862912, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "233", 
			}, 
			["altitude"] = 100, 
		}, 
		["121"] = { 
			["pos"] = { 
				[2] = 1248.0016655608, 
				[1] = 2050.3061589026, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
			}, 
			["altitude"] = 300, 
		}, 
		["251"] = { 
			["pos"] = { 
				[2] = 326.99330695899, 
				[1] = 123.8848711699, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "decideRunway2", 
			}, 
			["altitude"] = 100, 
		}, 
		["151"] = { 
			["pos"] = { 
				[1] = 1097.5103830553, 
				[2] = 68.799801939033, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "257", 
			}, 
			["altitude"] = 100, 
		}, 
		["toGateN1"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1298.0609675664, 
				[2] = 212.85614572891, 
			}, 
			["actions"] = { 
				["auto"] = "gateN1", 
			}, 
		}, 
		["targetRunway1"] = { 
			["pos"] = { 
				[2] = 232.22080411616, 
				[1] = 1023.2908289764, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 2.5, 
			["actions"] = { 
				["changeToRunway2"] = "runway1To2", 
				["changeToRunway3"] = "runway1To3", 
				["auto"] = "158", 
			}, 
			["altitude"] = 100, 
		}, 
		["113"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 290.77205290405, 
				[1] = 1143.0453360518, 
			}, 
			["actions"] = { 
				["taxiStart1"] = "110", 
				["taxiStart2"] = "nToStart2", 
			}, 
		}, 
		["land3Threshold"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 507.10211360812, 
				[1] = 930.94355316105, 
			}, 
			["actions"] = { 
				["auto"] = "land3End", 
			}, 
			["speedFactor"] = 2, 
		}, 
		["runway1To2"] = { 
			["pos"] = { 
				[1] = 1133.8597657204, 
				[2] = 218.09190931377, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "156", 
			}, 
			["altitude"] = 100, 
		}, 
		["gateS1"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 776.51378247771, 
				[1] = 1171.1005886899, 
			}, 
			["actions"] = { 
				["auto"] = "170", 
			}, 
		}, 
		["toGatesN"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1813.5636174215, 
				[2] = 302.94277614327, 
			}, 
			["actions"] = { 
				["auto"] = "rallyInGatesN", 
			}, 
		}, 
		["rallyInGatesN"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1624.1144477135, 
				[2] = 280.93733725616, 
			}, 
			["actions"] = { 
				["gate2"] = "toGateN2", 
				["gate3"] = "gateN3", 
				["gate1"] = "toGateN1", 
				["passGates"] = "rallyOutGatesN", 
			}, 
		}, 
		["238"] = { 
			["pos"] = { 
				[2] = 693.48828439962, 
				[1] = 749.32557699392, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "230", 
			}, 
			["altitude"] = 100, 
		}, 
		["235"] = { 
			["pos"] = { 
				[2] = 595.26705530943, 
				[1] = 188.46812392822, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "decideRunway3", 
			}, 
			["altitude"] = 100, 
		}, 
		["1"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = -372.65062922906, 
				[2] = 707.72678471948, 
			}, 
			["actions"] = { 
				["auto"] = "decideRunway3", 
			}, 
			["altitude"] = 300, 
		}, 
		["230"] = { 
			["pos"] = { 
				[2] = 809.50321441194, 
				[1] = 711.60293103899, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "232", 
			}, 
			["altitude"] = 100, 
		}, 
		["247"] = { 
			["pos"] = { 
				[2] = 76.736981665378, 
				[1] = 555.83414496435, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "248", 
			}, 
			["altitude"] = 100, 
		}, 
		["decideRunway2"] = { 
			["pos"] = { 
				[1] = 585.07991655749, 
				[2] = 398.68220892654, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["holdForRunway"] = "holdRunway2", 
				["changeToRunway3"] = "targetRunway3", 
				["auto"] = "targetRunway2", 
			}, 
			["altitude"] = 100, 
		}, 
		["runway1To3"] = { 
			["pos"] = { 
				[1] = 1123.4742278161, 
				[2] = 180.44433441057, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "150", 
			}, 
			["altitude"] = 100, 
		}, 
		["gateS2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 783.07825640777, 
				[1] = 1347.3914688797, 
			}, 
			["actions"] = { 
				["auto"] = "186", 
			}, 
		}, 
		["gateN3"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1544.5024661361, 
				[2] = 146.72082049683, 
			}, 
			["actions"] = { 
				["auto"] = "215", 
			}, 
		}, 
		["rallyOutGatesS"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1088.1710351184, 
				[2] = 698.17103511845, 
			}, 
			["actions"] = { 
				["auto"] = "decideWest", 
			}, 
		}, 
		["rallyOutGatesN"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1218.1831857962, 
				[2] = 279.28484638016, 
			}, 
			["actions"] = { 
				["auto"] = "113", 
			}, 
		}, 
		["toGateS1"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 657.99294136357, 
				[1] = 1296.5594492483, 
			}, 
			["actions"] = { 
				["auto"] = "gateS1", 
			}, 
		}, 
		["nToStart2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 298.6213749357, 
				[1] = 1009.5133747366, 
			}, 
			["actions"] = { 
				["auto"] = "83", 
			}, 
		}, 
		["212"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1396.7225120622, 
				[2] = 132.20982532173, 
			}, 
			["actions"] = { 
				["taxi"] = "toRallyOutGatesN2", 
			}, 
			["speedFactor"] = 0.01, 
		}, 
		["246"] = { 
			["pos"] = { 
				[2] = 159.87007602661, 
				[1] = 662.10737899315, 
			}, 
			["queueing"] = false, 
			["speedFactor"] = 3, 
			["actions"] = { 
				["auto"] = "247", 
			}, 
			["altitude"] = 100, 
		}, 
		["mergeEast"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1763.8679627217, 
				[2] = 416.83504022041, 
			}, 
			["actions"] = { 
				["auto"] = "decideEast", 
			}, 
		}, 
	}, 
	["imageFilename"] = "map1.png", 
	["mapEntrances"] = { 
		[1] = "1", 
		[2] = "37", 
		[3] = "225", 
	}, 
}