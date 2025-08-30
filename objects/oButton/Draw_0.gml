draw_self();

if(Icon != noone){
    draw_sprite_ext(Icon,0,x,y,Icon_Scale,Icon_Scale,image_angle,Colour,1);
} else {
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_set_font(Font);
    draw_set_colour(Colour);
    draw_text_transformed(x,y,Text,Font_Scale,Font_Scale,image_angle);
}