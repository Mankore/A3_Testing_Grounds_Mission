	class DamageTracker {
		idd = 1236;
		onLoad = "uiNamespace setVariable ['DamageTracker', _this select 0];";
		duration =  99999;
        fadein =  0.1;
        fadeout =  2;
		class controls {
			class DamageTrackerBack: IGUIBack
			{
				idc = 2200;
				x = 0.577344 * safezoneW + safezoneX;
				y = 0.236 * safezoneH + safezoneY;
				w = 0.113437 * safezoneW;
				h = 0.506 * safezoneH;
			};
			class DamageTrackerText: RscStructuredText
			{
				idc = 1100;
				x = 0.5825 * safezoneW + safezoneX;
				y = 0.247 * safezoneH + safezoneY;
				w = 0.103125 * safezoneW;
				h = 0.462 * safezoneH;
			};
		}
	}