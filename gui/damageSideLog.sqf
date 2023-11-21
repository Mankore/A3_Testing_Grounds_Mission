"MKR_SideLayer" cutRsc ["DamageSideLog", "PLAIN"];

_display = uiNameSpace getVariable "DamageSideLog";
_idc = 1500;
_leftTextControl = _display displayCtrl _idc;
uiNamespace setVariable ["leftTextControl", _leftTextControl];