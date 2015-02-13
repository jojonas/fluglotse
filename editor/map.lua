return { 
	metersPerPixel = 1.25,
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
				["start"] = "takeoff3", 
			}, 
		}, 
		["40"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 2613.6041413955, 
				[2] = 367.48856967769, 
			}, 
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
			["queueing"] = false, 
			["pos"] = { 
				[1] = 2592.1322084164, 
				[2] = 678.83159787457, 
			}, 
			["actions"] = { 
			}, 
			["altitude"] = 300, 
		}, 
		["157"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 840.46831992314, 
				[2] = 57.116071796663, 
			}, 
			["actions"] = { 
				["auto"] = "148", 
			}, 
			["altitude"] = 100, 
		}, 
		["110"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 353.05351410095, 
				[1] = 1133.5586378908, 
			}, 
			["actions"] = { 
				["start"] = "takeoff1", 
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
		["takeoff3"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 510.69961635499, 
				[1] = 1394.9293269758, 
			}, 
			["actions"] = { 
				["auto"] = "41", 
			}, 
		}, 
		["158"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 381.27829232653, 
				[1] = 1168.5888864113, 
			}, 
			["actions"] = { 
				["auto"] = "13", 
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
		}, 
		["145"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1140.3507269106, 
				[2] = 59.712456272745, 
			}, 
			["actions"] = { 
				["auto"] = "157", 
			}, 
			["altitude"] = 100, 
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
		["83"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 404.52876197124, 
				[1] = 1005.7002515256, 
			}, 
			["actions"] = { 
				["start"] = "takeoff2", 
			}, 
		}, 
		["gateN2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1361.5003182259, 
				[2] = 62.626280165309, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesN", 
			}, 
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
				[1] = 1230.4808193058, 
				[2] = 60.562980969717, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesN", 
			}, 
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
		["targetRunway2"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 831.65752915838, 
				[2] = 395.43359075979, 
			}, 
			["actions"] = { 
				["auto"] = "land2threshold", 
			}, 
		}, 
		["decideRunway3"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 492.5528001281, 
				[2] = 537.4471998719, 
			}, 
			["actions"] = { 
				["changeToRunway2"] = "targetRunway2", 
				["auto"] = "targetRunway3", 
			}, 
			["altitude"] = 100, 
		}, 
		["150"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1145.5434958628, 
				[2] = 120.72749146068, 
			}, 
			["actions"] = { 
				["auto"] = "151", 
			}, 
			["altitude"] = 80, 
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
		}, 
		["gateN3"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1499.7413643305, 
				[2] = 62.626280165309, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesN", 
			}, 
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
		["148"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 673.00152121583, 
				[2] = 232.37202393222, 
			}, 
			["actions"] = { 
				["auto"] = "targetRunway2", 
			}, 
			["altitude"] = 100, 
		}, 
		["sToStart2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[2] = 567.11469048233, 
				[1] = 1002.5909455028, 
			}, 
			["actions"] = { 
				["cross"] = "83", 
			}, 
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
		["121"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 1248.0016655608, 
				[1] = 2050.3061589026, 
			}, 
			["actions"] = { 
			}, 
			["altitude"] = 300, 
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
		["151"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1097.5103830553, 
				[2] = 68.799801939033, 
			}, 
			["actions"] = { 
				["auto"] = "152", 
			}, 
			["altitude"] = 100, 
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
		}, 
		["targetRunway1"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 212.22080411616, 
				[1] = 1023.2908289764, 
			}, 
			["actions"] = { 
				["changeToRunway2"] = "runway1To2", 
				["changeToRunway3"] = "runway1To3", 
				["auto"] = "158", 
			}, 
			["altitude"] = 50, 
		}, 
		["156"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1185.7874552421, 
				[2] = 136.30579831717, 
			}, 
			["actions"] = { 
				["auto"] = "145", 
			}, 
			["altitude"] = 80, 
		}, 
		["runway1To2"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1133.8597657204, 
				[2] = 218.09190931377, 
			}, 
			["actions"] = { 
				["auto"] = "156", 
			}, 
			["altitude"] = 60, 
		}, 
		["gateS1"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1161.3602962535, 
				[2] = 851.50031822587, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesS", 
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
				["gate2"] = "gateN2", 
				["gate1"] = "gateN1", 
				["gate3"] = "gateN3", 
			}, 
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
		["land2End"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1600.6908522644, 
				[2] = 403.6579297631, 
			}, 
			["actions"] = { 
				["auto"] = "mergeEast", 
			}, 
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
		["decideRunway2"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 473.07991655749, 
				[2] = 368.68220892654, 
			}, 
			["actions"] = { 
				["auto"] = "targetRunway2", 
				["changeToRunway3"] = "targetRunway3", 
			}, 
			["altitude"] = 100, 
		}, 
		["runway1To3"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 1123.4742278161, 
				[2] = 180.44433441057, 
			}, 
			["actions"] = { 
				["auto"] = "150", 
			}, 
			["altitude"] = 60, 
		}, 
		["gateS2"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1310.9494879339, 
				[2] = 851.50031822587, 
			}, 
			["actions"] = { 
				["taxi"] = "rallyOutGatesS", 
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
		}, 
		["152"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 635.35394631263, 
				[2] = 85.676301033568, 
			}, 
			["actions"] = { 
				["auto"] = "154", 
			}, 
			["altitude"] = 100, 
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
		["38"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 714.90319685538, 
				[2] = -217.72296688961, 
			}, 
			["actions"] = { 
				["auto"] = "targetRunway1", 
			}, 
			["altitude"] = 200, 
		}, 
		["rallyInGatesS"] = { 
			["queueing"] = true, 
			["pos"] = { 
				[1] = 1400.7030029421, 
				[2] = 704.04443672726, 
			}, 
			["actions"] = { 
				["gate2"] = "gateS2", 
				["gate1"] = "gateS1", 
			}, 
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
		}, 
		["targetRunway3"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[2] = 512.67940958322, 
				[1] = 735.18341533566, 
			}, 
			["actions"] = { 
				["auto"] = "land3Threshold", 
			}, 
			["altitude"] = 50, 
		}, 
		["154"] = { 
			["queueing"] = false, 
			["pos"] = { 
				[1] = 496.44737684223, 
				[2] = 440.08278201881, 
			}, 
			["actions"] = { 
				["auto"] = "targetRunway3", 
			}, 
			["altitude"] = 100, 
		}, 
	}, 
	["imageFilename"] = "map1.png", 
	["mapEntrances"] = { 
		[1] = "1", 
		[2] = "37", 
		[3] = "38", 
	}, 
}