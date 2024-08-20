if (!global.midTransition) {
	// Stretch the stripe
	if (state == 1) {
		// Enlarge the stripe
		stripeXScale += 0.04;
		stripeYScale += 0.01;
	
		// Clamp it to a maximum scale
		if (stripeXScale >= 1.2) { stripeXScale = 1.2; stripeYScale = 0.4; }
	}

	// Text move in until middle
	if (state == 2) {
		textMoveInX += 30;
		if (textMoveInX >= 0) { state = 3; }
	}

	// Fade in header text
	if (state == 3) {	
		textHeadlineAlpha += 0.01;
		if (textHeadlineAlpha >= 1) { state = 4; }
	}

	// Fade in text below, but slower
	if (state == 4) { 
		textBelowAlpha += 0.01;
	
		if (textBelowAlpha >= 1) { textBelowAlpha = 1; state = 5; alarm_set(2, 120); }
	}

	if (state == 6) {
		alphaAll -= 0.005;
		if (alphaAll < -0.95) { finishedAnim = true; }
	}
}

// Animation finished, go to dormitory room
if (finishedAnim == true) {
	GameTransitionChangeRoom(rm_dormitory, sq_trans_fade_black);
}
