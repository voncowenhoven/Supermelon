var fly = instance_create_layer(0, 0, "Instances", oEditorFly);
var cam = instance_create_layer(0, 0, "Instances", MultiTrackCamera);

with (cam) {
	camera_track_objects(fly);
}
