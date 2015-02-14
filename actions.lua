actionOrder = {
	"changeToRunway2", "changeToRunway3", "holdForRunway", "***",
	"gate1", "gate2", "gate3", "passGates",
	"taxiGatesN", "taxiGatesS", "cross", "taxi",
	"taxiStart1", "taxiStart2", "taxiStart3", "takeoff"
}

local function enterGate(map, plane)
	map.score = map.score + scoreChangeOnGate
end

actions = {
	["taxi"] = {
		name = "Leave gate",
		message = "Permission to taxi.",
		shortcut = "f"
	},
	["cross"] = {
		name = "Cross runway",
		message = "Permission to cross runway",
		shortcut = "d"
	},
	["takeoff"] = {
		name = "Take off",
		message = "Runway cleared for takeoff",
		shortcut = "f"
	},
	["gate1"] = {
		name = "To gate 1",
		message = "Permission to continue to gate 1 ($ " .. tostring(scoreChangeOnGate) .. ")",
		shortcut = "a",
		onEnter = enterGate
	},
	["gate2"] = {
		name = "To gate 2",
		message = "Permission to continue to gate 2 ($ " .. tostring(scoreChangeOnGate) .. ")",
		shortcut = "s",
		onEnter = enterGate
	},
	["gate3"] = {
		name = "To gate 3",
		message = "Permission to continue to gate 3 ($ " .. tostring(scoreChangeOnGate) .. ")",
		shortcut = "d",
		onEnter = enterGate
	},
	["taxiStart1"] = {
		name = "To runway 31",
		message = "Permission to taxi to runway 31",
		shortcut = "a",
	},
	["taxiStart2"] = {
		name = "To runway 27 L",
		message = "Permission to taxi to runway 27 L",
		shortcut = "s",
	},
	["taxiStart3"] = {
		name = "To runway 27 R",
		message = "Permission to taxi to runway 27 R",
		shortcut = "d",
	},
	["taxiGatesN"] = {
		name = "To northern gates",
		message = "Proceed to northern gates",
		shortcut = "a",
	},
	["taxiGatesS"] = {
		name = "To southern gates",
		message = "Proceed to southern gates",
		shortcut = "s",
	},
	["changeToRunway2"] = {
		name = "Change to runway 27 L",
		message = "Cancel approach, change to runway 27 L",
		shortcut = "s",
	},
	["changeToRunway3"] = {
		name = "Change to runway 27 R",
		message = "Cancel approach, change to runway 27 R",
		shortcut = "a",
	},
	["holdForRunway"] = {
		name = "Hold for touchdown",
		message = "Cancel approach, proceed with holding pattern ($ " .. tostring(scoreChangeOnHold) .. ")",
		shortcut = "d",
		onEnter = function(map, plane) 
			map.score = map.score + scoreChangeOnHold
		end
	},
	["passGates"] = {
		name = "Pass Gates",
		message = "Do not stop at gates, continue to runway out ($ " .. tostring(scoreChangeOnPass) .. ")",
		shortcut = "f",
		onEnter = function(map, plane)
			map.score = map.score + scoreChangeOnPass
		end
	},
	
}