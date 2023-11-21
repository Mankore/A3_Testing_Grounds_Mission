"MKR_DamageTrackerLayer" cutRsc ["DamageTracker", "PLAIN"];

_display = uiNameSpace getVariable "DamageTracker";
_idc = 1100;
_leftTextControl = _display displayCtrl _idc;
uiNamespace setVariable ["damageTrackerTextControl", _leftTextControl];