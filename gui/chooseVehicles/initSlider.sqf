params ["_display"];

_distanceSlider = _display displayCtrl 1900;
_distanceText = _display displayCtrl 1001;

_distanceSlider sliderSetPosition targetDistance;
_distanceText ctrlSetText format ["Distance: %1", targetDistance];