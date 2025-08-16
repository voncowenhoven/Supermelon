enum CAMMODE {
	STAY = 1,
	FOLLOW = 2,
	HORIZONTALCINEMATIC = 3
}

mode = CAMMODE.FOLLOW;
target = oPlayerProtagonist;

function cam_change_target(t) {
	target = t;
}