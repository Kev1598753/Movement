/// @description Insert description here
// You can write your code in this editor

global.Up = 90;
global.Down = 270;
global.Left = 180;
global.Right = 0;

var current_value = random(359);

image_angle = current_value;
direction = current_value;

target_value = 0;
wander_amount = 180;
lead_dist = 2;

life = irandom_range(85, 100);
metabolism = random_range(0.08, 0.12);

closest_food = -1;
hasEaten = false;

speed = 3;