cutRsc ["ExampleTitle","PLAIN"];
_display = findDisplay 1235;

_idc = 1100;
_ctrl = _display displayCtrl _idc;
_ctrl ctrlSetStructuredText (parseText "TEXTETXTEXT");