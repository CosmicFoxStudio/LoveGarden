// This script is for adding custom functions to be used with Scribble

/// This one was taken from the Scribble documentation
/// @function scribble_event_rumble(_parameter_array)
/// @param parameter_array
/// @description Makes the controller rumble. TAG: [rumble, 0.2]
function scribble_event_rumble(_parameter_array) {
    var amount = real(_parameter_array[0]);
    gamepad_set_vibration(global.current_gamepad, amount, amount);
}
