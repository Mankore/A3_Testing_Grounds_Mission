"TAG_textLayer" cutRsc ["ExampleTitle","PLAIN"];

waitUntil {!isNull (uiNameSpace getVariable "leftTextLog")};
	_display = uiNameSpace getVariable "leftTextLog";
	_idc = 1100;
	leftTextControl = _display displayCtrl 1100;

	