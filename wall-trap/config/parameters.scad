$fn=150;
fix = 0.01;
a_lot = 1000;
a_few = 10;

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



hinge_chunk_cone_margin = 0.2;
hinge_chunk_cone_r2 = 0.2;
hinge_chunk_gap = 0.2;

hinge_chunks_n = 5;
hinge_r = ramp_h/2;
hinge_l = ramp_w;


wall_wheel_side_gap = 0.3;
wall_wheel_inner_gap = 4;
wall_wheel_outer_r = 30;
wall_wheel_inner_r = ramp_h/2+wall_wheel_inner_gap;
wall_wheel_thick = 3;
wall_wheel_margin = 2.5;

wall_wheel_pin_d =2.5;
wall_wheel_pin_r = wall_wheel_pin_d/2;
wall_wheel_pin_play = 0.2;


engine_l = 23.6;
engine_w = 22.6;
engine_h = 12.4;
engine_gear_case_h = 4.7;
engine_gear_case_d = engine_h;
engine_gear_case_r = engine_gear_case_d/2;
engine_gear_case2_d = 5;
engine_gear_cases_w = 14.4;
engine_pinion_h = 3.3;
engine_pinion_d = 4.7;

engine_wing_thick = 2;
engine_wing_l = 5.5;
engine_wing_offset = 5;
engine_gear_r = 2.5;
engine_gear_h = 8;

engine_arm_l = 20;
engine_arm_d1 = 6.8;
engine_arm_d2 = 3.7;
engine_arm_thick = 1.4;
engine_arm_pinion_grabber_h = 3.7;
engine_arm_holes_step_offset = 1.5;
engine_arm_holes_step = 2;
engine_arm_holes_n = 6;
engine_arm_holes_d = 1;

engine_arm_screw_d = 1.8;
engine_arm_screw_l = 8.4;
engine_arm_screw_head_h = 1.3;
engine_arm_screw_head_d = 5;

pin_arm_base_thick = 1.5;
pin_arm_play = 0.2;
pin_arm_wall_thick = 1.2;
pin_arm_wall_h = engine_arm_thick;
pin_arm_pin_d = wall_wheel_pin_d;
pin_arm_pin_overhange = 2;
pin_arm_pin_h = wall_wheel_thick+wall_wheel_side_gap+pin_arm_pin_overhange;

engine_box_connection_w_gap = 1;
engine_box_connection_w = wall_wheel_inner_r-engine_box_connection_w_gap;
engine_box_connection_l = 10;

engine_box_base_thick = ramp_h;
engine_box_top_thick = 2;
engine_box_wall_thick = 1.5;
engine_box_play = 0.2;
engine_box_back_play = 2;

engine_box_w = engine_w+engine_wing_l*2+engine_box_play*2+engine_box_wall_thick*2;
engine_box_l = engine_l+engine_box_play*2+engine_box_wall_thick*2+engine_box_back_play;
engine_box_h = engine_h+engine_box_base_thick+engine_box_top_thick;
engine_box_cable_slit_w = 2;
engine_box_cable_slit_z_offset = 3;

