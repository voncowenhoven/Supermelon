image_xscale = base_xscale
image_yscale = base_yscale;
Icon_Scale = base_icon_scale;
Font_Scale = base_font_scale;
if(Sound != noone){
    audio_play_sound(Sound,10,false);
}
if(!is_undefined(Button_Release)){
    method_call(Button_Release);
} else {
    method_call(onRelease);
}
