var roomName = room_get_name(room);

switch (roomName) {
	case "rm_boat": 
		// Move the BG sprites
		skyPosX = skyPosX-0.2;
		mountainsPosX = mountainsPosX-0.3;
		lakePosX = lakePosX-0.4;
		aqueductPosX = aqueductPosX-0.5;
		treePosX = aqueductPosX;
		
		var sky = 0;
		var mountains = 1;
		var lake = 2;
		var aqueduct = 3;
		var tree = 4;
		var boat = 5;
		
		//layer_x(sky, lerp(0, xpos, 0.5));
		draw_sprite_tiled(spr_boat, sky, skyPosX, 0);
		draw_sprite_tiled(spr_boat, mountains, mountainsPosX, 0);
		draw_sprite_tiled(spr_boat, lake, lakePosX, 0);
		draw_sprite_tiled(spr_boat, aqueduct, aqueductPosX, 0);
		draw_sprite_tiled(spr_boat, tree, treePosX, 0);
		draw_sprite(spr_boat, boat, 0, 0);
	break;
	
	default:
	    // Exit event
	    exit;
}
