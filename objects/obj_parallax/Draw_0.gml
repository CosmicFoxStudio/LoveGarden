var roomName = room_get_name(room);

switch (roomName) {
    case "rm_boat": 
        // Update background positions
        for (var i = 0; i < array_length(backgroundLayers); i++) {
            backgroundLayers[i].posX -= backgroundLayers[i].spd;
        }
        
        // Draw background sprites
        for (var i = 0; i < array_length(backgroundLayers); i++) {
            draw_sprite_tiled(spr_boat, i, backgroundLayers[i].posX, 0);
        }
        
        // Draw boat sprite
        draw_sprite(spr_boat, 5, 0, 0);
        break;
        
    default:
        // Exit event
        exit;
}
