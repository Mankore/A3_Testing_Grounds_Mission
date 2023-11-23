	class DamageSideLog
	{    
		idd = 1235;
		onLoad = "uiNamespace setVariable ['DamageSideLog', _this select 0];";
		duration =  99999;
        fadein =  0.1;
        fadeout =  2;
		class controls
		{
			class backgroundLeft: IGUIBack
			{
				idc = 2200;
				x = -0.000156274 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.159844 * safezoneW;
				h = 0.55 * safezoneH;
				colorBackground[] = {0,0,0,0.5};
			};
			class leftListbox: RscListbox
			{
				idc = 1500;
				x = 0.005 * safezoneW + safezoneX;
				y = 0.247 * safezoneH + safezoneY;
				w = 0.144375 * safezoneW;
				h = 0.506 * safezoneH;
				class ListScrollBar
				{
					color[] = {0,0,0,0};
					shadow = 0;
					width = 0;
					height = 0;
				};
			};
		};	
	};