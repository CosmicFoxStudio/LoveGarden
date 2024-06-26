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
