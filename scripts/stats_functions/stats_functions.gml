// Keeps _val between _min and _max cyclically encapsulating values outside the range
function Wrap(_val, _min, _max) {
	if _val > _max return _min;
	else if _val <_min return _max;
	else return _val;
}

// Keep _val between min and max
function WrapInside(_val, _min, _max) {
	if _val > _max return _max;
	else if _val <_min return _min;
	else return _val;
}

function StatsGetWilting() {
	return global.playerStats.wilting;
}

function StatsGetGrowth() {
	return global.playerStats.growth;
}

function StatsGetBlossom() {
	return global.playerStats.blossom;
}

// Set specified flag to true
function FlagSet(_nome) {
	switch (_nome) {
		case "favePlace": global.flags.favePlace = true; break;
		case "love": global.flags.love = true; break;
		case "bad": global.flags.bad = true; break;
	}
}

function FlagGetFavePlace() {
	return global.flags.favePlace;
}

function FlagGetLove() {
	return global.flags.love;
}

function FlagGetBad() {
	return global.flags.bad;
}
