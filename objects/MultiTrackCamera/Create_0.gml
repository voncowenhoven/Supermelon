/// @desc Adapated from https://marketplace.gamemaker.io/assets/10066/multi-object-tracking-camera
/*
	Albertros has probably one of the worst code formatting styles in history. Everything about this
	is a disaster. I also had to create the local package myself because his asset was just packaged as
	a regular GM project.
	
	However, Albertros is a dark wizard who has figured out a simple, relatively clean way to do multi-object
	tracking in GameMaker, so I am using his asset. I have taken the liberty of making the following additions:
	
	* All functions renamed to be GM2017 compliant
	* God-awful formatting fixed (Allmancels seething at Kenneth and Ritchiechads)
	* The camera object itself now initializes viewports and important camera stuff
*/

#macro DEFAULT_ZOOM 0.9 // lower value is more zoomed in, this is the value the camera will default to if there's only one tracked object 
#macro SMOOTHING_FACTOR 15 // the higher the smoothing the slower the camera pans, 1 = immediate. 
#macro ZOOM_SMOOTHING 0.2 // how quickly the camera zooms in or out, 1 = immediate, 0 = never. 
#macro CAMERA_BORDER 100 //padding around tracked objects

viewport_number = 0; // assuming view_port 0 as a default, change this if the camera runs on a different view_port

camera = camera_create();
view_camera[viewport_number] = camera;
to_track = array_create(0);
zoom_factor = DEFAULT_ZOOM;
clamp_to_room = true; 
initialized = false; 

	

//init screen shake values
_shake_magnitude = 0;
_shake_remain = 0;
_shake_counter = 0;
_shake_duration = 0;
_xcurve_channel = -1; _ycurve_channel = -1;
_curve = 0;

/// @func camera_shake(_magnitude, _duration, _shakeCurve)
/// @param {real} _magnitude scaling factor for the screen shake, bigger magnitude bigger shake, defaults to 5
/// @param {real} _duration duration of the shake, in frames, defaults to one second (room speed)
/// @param {index} _shakeCurve an index for a two channel curve used for this shake, optional
/// @desc this is a simple screen shake, it can work simply by calling Shake_Camera and provide a basic shake, more elaborate types of shakes can be created using an animation curve

function camera_shake(_magnitude = 5, _duration = game_get_speed(gamespeed_fps), _shakeCurve) {
	_shake_magnitude = _magnitude;
	_shake_remain = _duration;
	_shake_duration = _duration;
	
	if(!is_undefined(_shakeCurve)) _curve = animcurve_get(_shakeCurve);
	
	if(_curve)
		{
		_xcurve_channel = animcurve_get_channel(_curve,0);
		_ycurve_channel = animcurve_get_channel(_curve,1);
			
		}
	}

/// @func camera_track_objects(args...)
/// @param {Asset.GMObject} args... Object(s) to be tracked by the camera.
/// @desc Adds an object to the tracking array, enabling it to be tracked. Multiple objects can be passed. Should work for instances too.
/* 
	This function formerly worked by passing either an array or an individual instance/object.
	It now allows you to pass each object you want to track as its own argument.  
	It also now reports an error properly when you pass it a bad object
	instead of silently failing.
*/
function camera_track_objects() {
	for (var i = 0; i < argument_count; i++) {
		
		if (!instance_exists(argument[i])) {
			show_debug_message("[WARN]: camera_track_objects() was passed an instance that does not exist. Ignoring.");
			continue;
		}
		
		array_push(to_track, argument[i]);
	}
	
	return array_length(to_track);
}

/// @func camera_stop_tracking_objects(_object_or_instance_array)
/// @param {real} _object_or_instance_or_array object or instance id of the object_index or instance to STOP tracking
/// @desc removes object index or instance number from tracking list, note that if some object is listed
/// both as an instance as well as included within a tracked object index it might keep on tracking

function camera_stop_tracking_objects(_object_or_instance_or_array) {
	
	find_and_delete = function(_to_delete){

	for(var i = 0; i < array_length(to_track); i++) {
	
		if (to_track[@ i] == _to_delete) {
			array_delete(to_track, i, 1);	
			return true;	
			}
		
		}
}


if(is_array(_object_or_instance_or_array)) {
	while(array_length(_object_or_instance_or_array) > 0) {
		find_and_delete(array_pop(_object_or_instance_or_array))
	}
	
	} else {
	find_and_delete(_object_or_instance_or_array);	
	}	

	return false; 
	
}

function camera_stop_tracking_all() {
	to_track = array_create(0);	
}

