_display = uiNameSpace getVariable "DamageSideLog";

if (!isNull _display) then {
	_display closeDisplay 1;
} else {
	"MKR_SideLayer" cutRsc ["DamageSideLog", "PLAIN"];
	_newDisplay = uiNameSpace getVariable "DamageSideLog";

	_idc = 1500;
	_listBoxControl = _newDisplay displayCtrl _idc;
	uiNamespace setVariable ["leftTextControl", _listBoxControl];
};