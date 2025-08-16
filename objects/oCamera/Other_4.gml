// Camera Init
camera_destroy(view_camera[0]);

view_enabled = true;
view_visible[0] = true;
view_wport[0] = global.resWidth;
view_hport[0] = global.resHeight;
view_xport[0] = 0;
view_yport[0] = 0;

// Camera Creation
cam = camera_create_view(0, 0, view_wport[0], view_hport[0]);
view_set_camera(0, cam);