sap.ui.define([
	"sap/ui/core/mvc/Controller",
	'sap/m/MessageToast',
	"AnkiAi/util/DataLoader",
	"AnkiAi/util/TrackMap"
], function(Controller, MessageToast, DataLoader, TrackMap) {
	"use strict";

	return Controller.extend("AnkiAi.controller.Dashboard", {
		trackMapDone: false,
		isTrackScanning: "true",
		trackLoader: null,
		onInit: function() {
			var that = this;
			
			setInterval(reloadData, 2500);
			this.trackloader = setInterval(loadTrack, 1000);
			
			function reloadData() {
				DataLoader.getMLData(function(oModel) {
					jQuery.sap.log.info("model:" + oModel);
					that.getOwnerComponent().setModel(oModel);
					
					var oChart = that.getView().byId("idVizFrame");
					oChart.getDataset().bindData("/stuff", null, null,null);

					if( oModel.getData().stuff.length === 0 && that.trackMapDone === true ){
						jQuery.sap.log.info("Starting trackloader again...");
						that.trackMapDone = false;
						that.isTrackScanning = "true";
						that.trackloader = setInterval(loadTrack, 1000);
					}
				});
				
			}
			function loadTrack(){
				if( that.trackMapDone === false && that.isTrackScanning === "true"){
					DataLoader.getTrackData(function(oModel){
						that.getOwnerComponent().setModel(oModel,"trackData");
						var trackData = oModel.getData().track;
						TrackMap.resetTrackMap();
						for(var i = 0; i < trackData.length; i++){
							var clockwise = (trackData[i].piece,trackData[i].clockwise === "false") ? false : true;
							TrackMap.addTrackToMap(trackData[i].piece,clockwise);
							that.isTrackScanning = trackData[i].isTrackScanning;
						}
						TrackMap.getTrackMap();
						if( TrackMap.isTrackMapDone()){
							that.trackMapDone = true;
							clearInterval(that.trackloader);
						}
					});
				}
			}
		},
		onReset: function(evt){
			DataLoader.resetMLModel(function(){
				jQuery.sap.log.info("Model reset successfully");
				MessageToast.show("Model reset successfully!");
			});
		},
		onAfterRendering: function(){
			TrackMap.initializeMap(this);
		}
	});
});