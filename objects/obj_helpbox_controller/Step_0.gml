// Mouse Left Pressed event for the panel object

// Get the width of the panel
var panelWidth = sprite_width;

// Check if the mouse click is on the left (less than 50%)
if (mouse_x < x + panelWidth * 0.5) {
    // Go back a page (implement your logic here)
    // For example: if you have pages stored in a variable, decrease the page index
    if (currentPage > 1) currentPage -= 1;
}
// Check if the mouse click is on the right (50% or more)
else if (mouse_x >= x + panelWidth * 0.5) {
    // Advance to the next page (implement your logic here)
    // For example: if you have pages stored in a variable, increase the page index
    if (currentPage < 10) currentPage += 1;
}