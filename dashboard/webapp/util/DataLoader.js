sap.ui.define(["sap/m/MessageBox", "sap/ui/model/json/JSONModel"], function(MessageBox, JSONModel) {
	"use strict";

	var _serviceUrl = "/AnkiAi/ankiai/api/v1.0/ml";
	var _trackUrl = "/AnkiAi/ankiai/api/v1.0/ml/trackscan";
	var _resetUrl = "/AnkiAi/ankiai/api/v1.0/ml/reset";

	var DataLoader = {
		getTrackData: function(fnSuccess){
			var oModel = new sap.ui.model.json.JSONModel(_trackUrl);
			oModel.attachRequestCompleted(function(oData, response) {
				if (fnSuccess) {
					fnSuccess(oModel);
				}
			});
		},
		getMLData: function(fnSuccess) {
			var oModel = new sap.ui.model.json.JSONModel(_serviceUrl);
			var that = this;
			oModel.attachRequestCompleted(function(oData, response) {
				var stuff = oModel.getData().stuff;
				var lastLaptime = 0;
				var fastestLaptime = 100000000;
				var batteryLevel = 5;
				for (var i = 0; i < stuff.length; i++) {
					var endEpoch = stuff[i].endTime;
					var strEndTime = that.getTimeString(endEpoch);
					stuff[i].lapTimestamp = strEndTime;
					lastLaptime = stuff[i].lapTime;
					batteryLevel = stuff[i].batteryLevel;
					fastestLaptime = (stuff[i].lapTime < fastestLaptime) ? stuff[i].lapTime : fastestLaptime;
				}
				fastestLaptime = parseInt(fastestLaptime * 1000, 10) / 1000;
				lastLaptime = parseInt(lastLaptime * 1000, 10) / 1000;
				oModel.getData().summary = { "lastLaptime" : lastLaptime, "fastestLaptime" : fastestLaptime, "batteryLevel" : batteryLevel, "laps" : stuff.length };
				if (fnSuccess){
					fnSuccess(oModel);
				} 
			});
		},
		resetMLModel: function(fnSuccess) {
			$.ajax({
				url: _resetUrl,
				success: fnSuccess,
				error: function(e) {
					// log error in browser
					jQuery.sap.log.error(e.message);
				}
			});
		},
		getTimeString: function(epoch) {
			var date = new Date(epoch);
			return date;
		}
	};

	return DataLoader;

}, true);