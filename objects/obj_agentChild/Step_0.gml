/// @description Insert description here
// You can write your code in this editor
//event_inherited();

/// PARENT ////////////////////////////
switch (keyboard_key)
	{
	case vk_left:
		wander_amount--;
		break;
	case vk_right:
		wander_amount++;
		break;
	case vk_up:
		lead_dist += 0.01;
		break;
	case vk_down:
		lead_dist -= 0.01;
		break;
	default:
		break;
   }
   
   
target_value += random_range(-wander_amount, wander_amount);

if (lead_dist < 0.01) lead_dist = 0.01;

var valueChange = dsin(target_value) / lead_dist;

direction += valueChange;
image_angle += valueChange;

if (x > room_width) x -= room_width;
if (x < 0) x += room_width;
if (y > room_height) y -= room_height;
if (y < 0) y += room_height;

life -= metabolism;

if (life <= 0)
{
	instance_create_layer(x, y, "Instances", obj_food);
	instance_destroy();
}

speed = 3;

closest_food = instance_nearest(x, y, obj_food);

var distanceToFood = distance_to_object(closest_food);
if (distanceToFood < 100)
{
	if (!hasEaten)
	{
		var direct = point_direction(x,y,closest_food.x,closest_food.y);
		
		if (abs(direct - direction) > 180) direct += 360;
		var adjustment = ((direction*0.9) + ((direct + direction) / 2)*0.1);
	
		direction = adjustment;
		image_angle = adjustment;
	
		if (distanceToFood < 5)
		{
			closest_food.quantity -= 1;
			life += 3;
			speed = 0;
			
			if (life > 200 && sprite_index != spr_agentXS)
			{
				for (var i = 0; i < 50; i++)
				{
					instance_create_layer(x, y, "Instances", obj_agentChild);
				}
				instance_destroy();
			}
		}
	}
	
}
else
{
	hasEaten = false;
}
///////////////////////////////////////

closestPredator = instance_nearest(x, y, obj_agent);

var distanceToPredator = distance_to_object(closestPredator);
if (distanceToPredator < 100)
{
		var direct = point_direction(closestPredator.x,closestPredator.y,x,y);
		
		if (abs(direct - direction) > 180) direct += 360;
		var adjustment = ((direction*0.9) + ((direct + direction) / 2)*0.1);
	
		direction = adjustment;
		image_angle = adjustment;
}

if (distanceToPredator < 20)
{
		closestPredator.life += 5;
		
		instance_destroy();
}