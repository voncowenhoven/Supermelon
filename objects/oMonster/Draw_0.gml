if (attrs.hp < attrs.maxHp) and (!(attrs.hp <= 0)) {
	var pc = (attrs.hp / attrs.maxHp) * 100;
	draw_healthbar(x - 10, y - 100, x + 50, y - 80, pc, c_black, c_red, c_lime, 0, true, true);
}

draw_self();