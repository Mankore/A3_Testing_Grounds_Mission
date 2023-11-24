params ["_hitPoint"];
// returns rgba color in 0 - 1 range
_color = [];

switch (true) do
{
	case (_hitPoint == "hithull" || _hitPoint == "hitammo" || _hitPoint == "hitammohull"): {
		_color = "#FF0000"; // red
	};
	case (_hitPoint == "hitengine" || _hitPoint == "hitltrack" || _hitPoint == "hitrtrack" || _hitPoint == "hitfuel"): {
		_color = "#FFFF00"; // yellow
	};
	case (_hitPoint == "hitgun" || _hitPoint == "hitturret"): {
		_color = "#FF00FF"; // purple
	};
	default {
		_color = "#FFFFFF"; // white
	}
};

_color;