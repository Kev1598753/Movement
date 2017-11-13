/// @description Insert description here
// You can write your code in this editor
draw_self();

if (global.isDebug)
{
	var closestFood = hasEaten ? "N/A" : string(closest_food);
	var distToFood = hasEaten ? "N/A" : string(distance_to_object(closest_food));

	draw_text(x - 50, y - 70, "Life: " + string(life));
	draw_text(x - 50, y - 50, "Food: " + closestFood);
	draw_text(x - 50, y - 30, "Dist: " + distToFood);
}