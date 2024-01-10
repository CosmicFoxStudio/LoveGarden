/// @description Subimage Handling

// Checking if the slot is highlighted
if (obj_save_load.selectedOption == slotIndex) image_index = 1;
else image_index = 0;

// Animate slot sprite (for save slots that have a save file)
spriteImage += 0.1;
if (spriteImage > sprite_get_number(spr_sprout)) spriteImage = 0;
