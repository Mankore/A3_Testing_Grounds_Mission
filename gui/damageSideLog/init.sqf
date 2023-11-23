"MKR_SideLayer" cutRsc ["DamageSideLog", "PLAIN"];
_newDisplay = uiNameSpace getVariable "DamageSideLog";

_idc = 1500;
_listBoxControl = _newDisplay displayCtrl _idc;
uiNamespace setVariable ["listboxControl", _listBoxControl];