/// @description Destroy buttons instances

for ( var j = 0; j < array_length(rectBtnInstArray); j++ ) {
	for ( var i = 0; i < array_length(rectBtnInstArray[j]); i++ ) {
		instance_destroy(rectBtnInstArray[j][i]);
	}

	array_delete(rectBtnInstArray[j], 0, array_length(rectBtnInstArray[j]));
}

global.hoveringConfigButton = false;