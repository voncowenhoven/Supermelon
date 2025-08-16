var camW = global.resWidth;
var camH = global.resHeight;

switch (mode) {
    case CAMMODE.FOLLOW:
        if (instance_exists(target)) {
			
			// Do some math to properly focus on the target
			var camX = camera_get_view_x(cam);
			var camY = camera_get_view_y(cam);
			
			var targetX = target.x - camH / 2;
			var targetY = target.y - camW / 2;
			
			targetX = clamp(targetX, 0, room_width - camW);
			targetY = clamp(targetY, 0, room_height - camH);
			
			camX = lerp(camX, targetX, 1);
			camY = lerp(camY, targetY, 1);
			
			camera_set_view_pos(cam, camX, camY);
			
		} 
        break;
		
	case CAMMODE.STAY:
		// Just stay where you are
		camera_set_view_pos(cam, camera_get_view_x(cam), camera_get_view_y(cam));
        break;
		
	case CAMMODE.HORIZONTALCINEMATIC:
		// Follows the target in a "cinematic" manner
		// TODO: This needs clamping
		if (instance_exists(target)) {
			camera_set_view_pos(cam, target.x / 2, target.y / 4);
		}
        break;
		
    default:
        // code here
        break;
}
