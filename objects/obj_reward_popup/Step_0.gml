// obj_reward_popup STEP EVENT

// Exit if the game is paused
if (global.state == e_gameStates.PAUSED) exit;

// Animate the popup enlarging effect
if (is_animating) {
    scale_x = lerp(scale_x, 1, animation_speed);
    scale_y = lerp(scale_y, 1, animation_speed);
    if (scale_x > 0.99 && scale_y > 0.99) {
        scale_x = 1;
        scale_y = 1;
        is_animating = false;
    }
}

// Handle periodic giggle effect
if (!is_animating) {
    giggle_timer += giggle_speed;
    if (giggle_timer > 2 * pi) {
        giggle_timer = 0;  // Reset timer
    }
}

// Selection Phase
if (phase == "SELECT") {
   
    // Mouse selection logic
    if (continueBtn.hovering && InputCheck("confirm", e_input.MOUSE)) {
        selectedButton = "CONTINUE";
    } else if (mapBtn.hovering && InputCheck("confirm", e_input.MOUSE)) {
        selectedButton = "MAP";
    }

    // Keyboard input for selecting buttons
    pos += CheckHorizontalInput();
    if (pos >= numberOfButtons) pos = 0;
    if (pos < 0) pos = numberOfButtons - 1;
    
    // Confirm keyboard input
    if (InputCheck("confirm", e_input.KEYBOARD)) {
        if (pos == 0) selectedButton = "CONTINUE";
        else if (pos == 1) selectedButton = "MAP";
    }
}

// Process selected button
if (selectedButton == "CONTINUE") {
    // go_to_next_scene();
    show_debug_message("----------------NEXT SCENE----------------");
	instance_destroy();
}
else if (selectedButton == "MAP") {
    room_goto(rm_map);
    instance_destroy();
}
