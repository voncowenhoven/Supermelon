base_xscale = image_xscale;
base_yscale = image_yscale;
base_icon_scale = Icon_Scale;
base_font_scale = Text_Size/font_get_size(Font);
Font_Scale = base_font_scale;

if(sprite_index == noone){
    if(Icon != noone){
        mask_index = Icon;
    } else {
        mask_index = sprite_index;
    }
}

onRelease = function(){
    //show_debug_message("Released");
}