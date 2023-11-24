params ["_hitPoint"];
// returns rgba color in 0 - 1 range
_color = [];

switch (true) do
{
	case (_hitPoint == "hithull" || _hitPoint == "hitammo" || _hitPoint == "hitammohull"): {
		_color = [1, 0, 0, 1]; // red
	};
	case (_hitPoint == "hitengine" || _hitPoint == "hitltrack" || _hitPoint == "hitrtrack" || _hitPoint == "hitfuel"): {
		_color = [1, 1, 0, 1]; // yellow
	};
	case (_hitPoint == "hitgun" || _hitPoint == "hitturret"): {
		_color = [1, 0, 1, 1]; // purple
	};
	default {
		_color = [1, 1, 1, 1]; // white
	}
};

_color;