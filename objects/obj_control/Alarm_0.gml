/// @description Insert description here
// You can write your code in this editor

instance_create_layer(irandom_range(100, room_width - 100), irandom_range(100, room_height - 100), "Instances", obj_food);

alarm[0] = irandom_range(65, 300);