// An array of structs representing levels in the game and their associated info. Follows this format:
/*
	name : the name of the map
	next : the level that comes after this map
	music : the music that starts when this level starts
	levelRoom : the Room that this level is in
	mapNum : The numeric order of this map
	world : the world this map belongs to

*/

global.mapinfo =
[

// World 1

{
	name : "Vacation from Hell",
	next : undefined,
	music : undefined,
	levelRoom : rLevel_1,
	mapNum : 1,
	world : 1
},

]
