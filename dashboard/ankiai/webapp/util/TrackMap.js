sap.ui.define(['sap/m/MessageBox', "sap/ui/model/json/JSONModel"], function(MessageBox, JSONModel) {
	"use strict";

	var trackShape = new Array(1);
	trackShape[0] = new Array(1);

	var startFound = false;
	var mapX = 0;
	var mapY = 0;
	var mapDir = 0;
	var trackMapDone = false;
	var TrackMap = {
		_canvas: null,
		initializeMap: function(controller) {
			var id = controller.getView().byId("myCanvas").getId();
			//this._canvas = document.getElementById(id);
			this._canvas = jQuery( "#" + id )[0];
		//	var ctx = this._canvas.getContext("2d");
		},
		// Building a track array:
		// 0 - No track
		// 1 - Start/Finish 
		// 2 - Straight Horizontal
		// 3 - Straight Vertical
		// 4 - Curve - North -> East (West -> South)
		// 5 - Curve - East -> South (North -> West)
		// 6 - Curve - West -> North (South -> East)
		// 7 - Curve - South -> West (East -> North)
		// 8 - Straight Horizontal over Vertical
		// 9 - Straight Vertical over Horizontal
		//10 - Two Curve - West -> North AND East -> South
		//11 - Two Curve - South -> West AND North -> East
		//12 - Curve - North -> East over Vertical
		//13 - Curve - North -> West over Vertical
		//14 - Curve - South -> East over Vertical
		//15 - Curve - South -> West over Vertical
		//16 - Curve - North -> East over Horizontal
		//17 - Curve - North -> West over Horizontal
		//18 - Curve - South -> East over Horizontal
		//19 - Curve - South -> West over Horizontal
		//20 - Crossover - No change in direction
		//21 - Two Curve - West -> North AND North -> East
		//22 - Two Curve - South -> West AND East -> South
		//23 - Two Curve - East -> South AND North -> East
		//24 - Two Curve - South -> West AND West -> North
		// I just don't deal with straight over curve...
		addTrackToMap: function(trackId, clockwise) {
			var trackTypes = ["unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", //  0- 9
					"Crossover", "Turn", "unknown", "unknown", "unknown", "unknown", "unknown", "Turn", "Turn", "unknown", // 10-19
					"Turn", "unknown", "unknown", "Turn", "unknown", "unknown", "unknown", "unknown", "unknown", "unknown", // 20-29
					"unknown", "unknown", "unknown", "Start", "Finish", "unknown", "Straight", "unknown", "unknown", "Straight", // 30-39
					"Straight", "unknown", "unknown", "Straight", "unknown", "unknown", "Straight", "unknown", "unknown", "unknown"
				]; // 40-49
			var trackType = trackTypes[trackId];
			if (trackType === "Start") {
				if (startFound === true) { // We've already done the whole map.
					trackMapDone = true;
				}
				startFound = true;
				trackShape[mapY][mapX] = 1;
				mapDir = 1; // East
				mapX += 1;
				this.updateTrackShape();
			}

			if (startFound === false) {
				return;
			}

			jQuery.sap.log.info("Found track type[" + trackId + "]: " + trackType);
			if (trackType === "Straight") {
				if (mapDir === 1) { // East
					switch (trackShape[mapY][mapX]) {
						case 0:
							trackShape[mapY][mapX] = 2;
							break;
						case 3:
							trackShape[mapY][mapX] = 8;
							break;
						case 4:
							trackShape[mapY][mapX] = 16;
							break;
						case 5:
							trackShape[mapY][mapX] = 17;
							break;
						case 6:
							trackShape[mapY][mapX] = 18;
							break;
						case 7:
							trackShape[mapY][mapX] = 19;
							break;
						default:
							break; // Leave it alone if something is there.
					}
					mapX += 1;
					this.updateTrackShape();
				} else if (mapDir === 2) { // South
					switch (trackShape[mapY][mapX]) {
						case 0:
							trackShape[mapY][mapX] = 3;
							break;
						case 4:
							trackShape[mapY][mapX] = 12;
							break;
						case 5:
							trackShape[mapY][mapX] = 13;
							break;
						case 6:
							trackShape[mapY][mapX] = 14;
							break;
						case 7:
							trackShape[mapY][mapX] = 15;
							break;
						case 2:
							trackShape[mapY][mapX] = 9;
							break;
						default:
							break; // Leave it alone if something is there.
					}
					mapY += 1;
					this.updateTrackShape();
				} else if (mapDir === 3) { // West
					switch (trackShape[mapY][mapX]) {
						case 0:
							trackShape[mapY][mapX] = 2;
							break;
						case 3:
							trackShape[mapY][mapX] = 8; // Horz over Vert
							break;
						case 4:
							trackShape[mapY][mapX] = 16;
							break;
						case 5:
							trackShape[mapY][mapX] = 17;
							break;
						case 6:
							trackShape[mapY][mapX] = 18;
							break;
						case 7:
							trackShape[mapY][mapX] = 19;
							break;
						default:
							break; // Leave it alone if something is there.
					}
					mapX -= 1;
					this.updateTrackShape();
				} else if (mapDir === 0) { // North
					switch (trackShape[mapY][mapX]) {
						case 0:
							trackShape[mapY][mapX] = 3;
							break;
						case 4:
							trackShape[mapY][mapX] = 12;
							break;
						case 5:
							trackShape[mapY][mapX] = 13;
							break;
						case 6:
							trackShape[mapY][mapX] = 14;
							break;
						case 7:
							trackShape[mapY][mapX] = 15;
							break;
						case 2:
							trackShape[mapY][mapX] = 9;
							break;
						default:
							break; // Leave it alone if something is there.
					}
					mapY -= 1;
					this.updateTrackShape();
				}
			}
			if (trackType === "Turn") {
				if (clockwise) {
					trackType = "Right Turn";
					if (mapDir === 1) { // East
						switch (trackShape[mapY][mapX]) {
							case 0: // Nothing there.
								trackShape[mapY][mapX] = 5;
								break;
							case 2: // Over horiz
								trackShape[mapY][mapX] = 17;
								break;
							case 3: // Over vert
								trackShape[mapY][mapX] = 13;
								break;
							case 4: // Over corner turn
								trackShape[mapY][mapX] = 22;
								break;
							case 6: // Over corner turn
								trackShape[mapY][mapX] = 11;
								break;
							case 7: // Over corner turn
								trackShape[mapY][mapX] = 24;
								break;
							default: // Don't touch
								break;
						}
						mapDir = 2; // South
						mapY += 1;
						this.updateTrackShape();
					} else if (mapDir === 2) { // South
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 7;
								break;
							case 2:
								trackShape[mapY][mapX] = 19;
								break;
							case 3:
								trackShape[mapY][mapX] = 15;
								break;
							case 4:
								trackShape[mapY][mapX] = 10;
								break;
							case 5:
								trackShape[mapY][mapX] = 24;
								break;
							case 6:
								trackShape[mapY][mapX] = 21;
								break;
							default:
								break;
						}
						mapDir = 3; // West
						mapX -= 1;
						this.updateTrackShape();
					} else if (mapDir === 3) { // West
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 6;
								break;
							case 2:
								trackShape[mapY][mapX] = 18;
								break;
							case 3:
								trackShape[mapY][mapX] = 14;
								break;
							case 4:
								trackShape[mapY][mapX] = 23;
								break;
							case 5:
								trackShape[mapY][mapX] = 11;
								break;
							case 7:
								trackShape[mapY][mapX] = 21;
								break;
							default:
								break;
						}
						mapDir = 0; // North
						mapY -= 1;
						this.updateTrackShape();
					} else if (mapDir === 0) { // North
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 4;
								break;
							case 2:
								trackShape[mapY][mapX] = 16;
								break;
							case 3:
								trackShape[mapY][mapX] = 12;
								break;
							case 5:
								trackShape[mapY][mapX] = 22;
								break;
							case 6:
								trackShape[mapY][mapX] = 23;
								break;
							case 7:
								trackShape[mapY][mapX] = 10;
								break;
							default:
								break;
						}
						mapDir = 1; // East
						mapX += 1;
						this.updateTrackShape();
					}
				} else {
					trackType = "Left Turn";
					if (mapDir === 1) { // East
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 7;
								break;
							case 2:
								trackShape[mapY][mapX] = 19;
								break;
							case 3:
								trackShape[mapY][mapX] = 15;
								break;
							case 5:
								trackShape[mapY][mapX] = 24;
								break;
							case 6:
								trackShape[mapY][mapX] = 21;
								break;
							case 7:
								trackShape[mapY][mapX] = 10;
								break;
							default:
								break;
						}
						mapDir = 0; // North
						mapY -= 1;
						this.updateTrackShape();
					} else if (mapDir === 2) { // South
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 6;
								break;
							case 2:
								trackShape[mapY][mapX] = 18;
								break;
							case 3:
								trackShape[mapY][mapX] = 14;
								break;
							case 4:
								trackShape[mapY][mapX] = 23;
								break;
							case 5:
								trackShape[mapY][mapX] = 11;
								break;
							case 7:
								trackShape[mapY][mapX] = 21;
								break;
							default:
								break;
						}
						mapDir = 1; // East
						mapX += 1;
						this.updateTrackShape();
					} else if (mapDir === 3) { // West
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 4;
								break;
							case 2:
								trackShape[mapY][mapX] = 16;
								break;
							case 3:
								trackShape[mapY][mapX] = 12;
								break;
							case 5:
								trackShape[mapY][mapX] = 22;
								break;
							case 6:
								trackShape[mapY][mapX] = 23;
								break;
							case 7:
								trackShape[mapY][mapX] = 10;
								break;
							default:
								break;
						}
						mapDir = 2; // South
						mapY += 1;
						this.updateTrackShape();
					} else if (mapDir === 0) { // North
						switch (trackShape[mapY][mapX]) {
							case 0:
								trackShape[mapY][mapX] = 5;
								break;
							case 2:
								trackShape[mapY][mapX] = 17;
								break;
							case 3:
								trackShape[mapY][mapX] = 13;
								break;
							case 4:
								trackShape[mapY][mapX] = 22;
								break;
							case 6:
								trackShape[mapY][mapX] = 11;
								break;
							case 7:
								trackShape[mapY][mapX] = 24;
								break;
							default:
								break;
						}
						mapDir = 3; // West
						mapX -= 1;
						this.updateTrackShape();
					}
				}
			}
			if (trackType === "Crossover") {
				switch (trackShape[mapY][mapX]) {
					case 0:
						trackShape[mapY][mapX] = 20;
						break;
					default:
						break; // Leave it alone if something is there.
				}

				if (mapDir === 1) { // East
					mapX += 1;
				} else if (mapDir === 2) { // South
					mapY += 1;
				} else if (mapDir === 3) { // West
					mapX -= 1;
				} else if (mapDir === 0) { // North
					mapY -= 1;
				}
				this.updateTrackShape();
			}
			if (trackType === "unknown") {
				jQuery.sap.log.error("Unknown type: " + trackId);
			}
			//console.log("New Track Shape: ", trackShape);
		},

		isTrackMapDone: function() {
			return trackMapDone;
		},

		setTrackMapDone: function() {
			trackMapDone = true;
		},

		resetTrackMap: function() {
			trackMapDone = false;
			startFound = false;
			mapX = 0;
			mapY = 0;
			mapDir = 0;
			trackShape = new Array(1);
			trackShape[0] = new Array(1);
		},

		getTrackMapData: function() {
			return trackShape;
		},

		setTrackMapData: function(newMap) {
			trackShape = newMap;
		},

		getTrackMap: function(size) {
			var segmentImages = new Array(25);
			segmentImages[0] = jQuery( "#0")[0];
			segmentImages[1] = jQuery( "#1")[0];
			segmentImages[2] = jQuery( "#2")[0];
			segmentImages[3] = jQuery( "#3")[0];
			segmentImages[4] = jQuery( "#4")[0];
			segmentImages[5] = jQuery( "#5")[0];
			segmentImages[6] = jQuery( "#6")[0];
			segmentImages[7] = jQuery( "#7")[0];
			segmentImages[8] = jQuery( "#8")[0];
			segmentImages[9] = jQuery( "#9")[0];
			segmentImages[10] = jQuery( "#10")[0];
			

			var segmentSize = 64;
			var width = trackShape[0].length * segmentSize;
			var height = trackShape.length * segmentSize;
			this._canvas.width = width;
			this._canvas.height = height;
			
			var ctx = this._canvas.getContext("2d");
			for (var x = 0; x < trackShape[0].length; x++) {
				for (var y = 0; y < trackShape.length; y++) {
					ctx.drawImage(segmentImages[trackShape[y][x]], x * segmentSize, y * segmentSize);
				}
			}
			return (this._canvas);
		},
		updateTrackShape: function() {
			var i = 0;
			var newRow;
			if (mapX < 0) {
				for (i = 0; i < trackShape.length; i++) {
					trackShape[i].unshift(0);
				}
				mapX = 0;
			}
			if (mapY < 0) {
				newRow = new Array(trackShape[0].length);
				for (i = 0; i < trackShape[0].length; i++) {
					newRow[i] = 0;
				}
				trackShape.unshift(newRow);
				mapY = 0;
			}
			if (trackShape.length <= mapY) {
				newRow = new Array(trackShape[0].length);
				for (i = 0; i < trackShape[0].length; i++) {
					newRow[i] = 0;
				}
				trackShape.push(newRow);
			}
			if (trackShape[mapY].length <= mapX) {
				for (i = 0; i < trackShape.length; i++) {
					trackShape[i].push(0);
				}
			}
		}
	};

	return TrackMap;

}, true);