$fn=150;
fix = 0.01;
a_lot = 1000;

min_thick = 0.3;

ramp_l = 100;
ramp_h = 4;
ramp_w = 120;
ramp_up_l = 20;

ramp_hypotenuse = sqrt(pow(ramp_l-ramp_up_l,2)+pow(ramp_h,2));
ramp_slope = asin(ramp_h/ramp_hypotenuse);
echo("ramp_slope: ", ramp_slope);

wall_l = 50;
wall_w = ramp_w;
wall_h = ramp_h;

wall_hypotenuse = sqrt(pow(wall_l,2)+pow(ramp_h,2));
wall_slope = asin(ramp_h/wall_hypotenuse);
echo("wall_slope: ", wall_slope);


hinge_joint_cone_r2 = 0.5;
hinge_joint_cone_gap = 0.3;



hinge_chunk_cone_margin = 0.5;
hinge_chunk_cone_r2 = 0.5;
hinge_chunk_gap = 0.3;

hinge_chunks_n = 5;
hinge_r = ramp_h/2;
hinge_l = ramp_w;


wall_wheel_side_gap = hinge_chunk_gap;
wall_wheel_inner_gap = 4;
wall_wheel_outer_r = 30;
wall_wheel_inner_r = ramp_h+wall_wheel_inner_gap;
wall_wheel_thick = 3;
wall_wheel_margin = 2.5;

wall_wheel_pin_d =2.5;
wall_wheel_pin_r = wall_wheel_pin_d/2;
wall_wheel_pin_play = 0.3;