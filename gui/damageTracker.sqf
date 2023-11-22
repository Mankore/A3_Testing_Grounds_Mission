"MKR_DamageTrackerLayer" cutRsc ["DamageTracker", "PLAIN"];
_newDisplay = uiNameSpace getVariable "DamageTracker";

_idc = 1100;
_textControl = _newDisplay displayCtrl _idc;
uiNamespace setVariable ["damageTrackerTextControl", _textControl];