timer++;

if (timer >= time_till_destroy) {
	instance_destroy();
}
