class chooseVehicleDialog
{
	idd = 1234;
	class controls {
		class backgroundUI: IGUIBack
		{
			idc = 2200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class baseFrame: RscFrame
		{
			idc = 1801;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class redVehicleList: RscListBox
		{
			idc = 1500;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.5};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
		};
		class blueVehicleList: RscListBox
		{
			idc = 1501;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.5};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
		};
		class targetVehicleButton: RscButton
		{
			idc = 1600;

			text = "Spawn Targets"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class playerVehicleButton: RscButton
		{
			idc = 1601;

			text = "Select Player Vehicle"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class distanceSlider: RscSlider
		{
			idc = 1900;
			text = "Distance"; //--- ToDo: Localize;
			type = CT_XSLIDER;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.055 * safezoneH;
			sliderRange[] = {50,4000};
			sliderStep = 50;
			onSliderPosChanged = "targetDistance = _this select 1; ctrlSetText [1001, format ['Distance: %1', (_this select 1)]];"

			color[] = {1,1,1,0.6};
			colorActive[] = {1,1,1,0.5};
			colorDisable[] = {1,1,1,0.4};
			colorDisabled[] = {1,1,1,0.2};
			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class distanceText: RscText
		{
			idc = 1001;
			text = ""; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Red Shop"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "Blue Shop"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class rightBackground: IGUIBack
		{
			idc = 2201;
			x = 0.721719 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 1.001 * safezoneH;
		};
		class rightTextContainer: RscStructuredText
		{
			idc = 1100;
			x = 0.732032 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.935 * safezoneH;
		};
	};
}