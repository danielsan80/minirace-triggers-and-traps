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


engine_l = 23.97;
engine_w = 22.76;
engine_h = 12.36;
engine_gear_cases_l = 14.55;
engine_gear_cases_w = 11.54;
engine_gear_cases_h = 4.19;
engine_gear_case1_d = engine_gear_cases_w;
engine_gear_case1_r = engine_gear_case1_d/2;
engine_gear_case2_d = 5.43;
engine_pinion_h = 2.81;
engine_pinion_d = 4.83;

engine_wing_thick = 2.48;
engine_wing_l = 4.93;
engine_wing_offset = 4.27;

engine_arm_l = 19.51;
engine_arm_d1 = 6.89;
engine_arm_d2 = 4.04;
engine_arm_thick = 1.45;
engine_arm_pinion_grabber_h = 3.88;
engine_arm_holes_step_offset = 1.5;
engine_arm_holes_step = 2;
engine_arm_holes_n = 6;
engine_arm_holes_d = 1;

//engine_arm_screw_d = 1.8;
//engine_arm_screw_l = 8.4;
//engine_arm_screw_head_h = 1.3;
//engine_arm_screw_head_d = 5;

pin_arm_base_thick = 1.5;
pin_arm_play = 0.2;
pin_arm_wall_thick = 1.2;
pin_arm_wall_h = engine_arm_thick+pin_arm_play*2;
pin_arm_cover_ratio = 1.8;
pin_arm_pin_d = wall_wheel_pin_d;
pin_arm_pin_overhange = 2;
pin_arm_pin_h = wall_wheel_thick+wall_wheel_side_gap+pin_arm_pin_overhange;
pin_arm_angle = 68.5;


engine_box_bottom_base_thick = 4; //ramp_h;
engine_box_top_base_thick = 2;
engine_box_top_margin = 2;
engine_box_wall_thick = 1.5;
engine_box_play = 0.2;
engine_box_back_gap = 2;

engine_box_w = engine_w+engine_wing_l*2+engine_box_play*2+engine_box_wall_thick*2;
engine_box_l = engine_l+engine_box_play*2+engine_box_wall_thick*2+engine_box_back_gap;
engine_box_bottom_h = engine_h+engine_box_bottom_base_thick+engine_box_top_margin;
engine_box_h = engine_box_bottom_h+engine_box_top_base_thick;
engine_box_cable_slit_w = 2;
engine_box_cable_slit_z_offset = 3;

engine_box_connection_gap = 1;
engine_box_connection_w = wall_wheel_inner_r*2;
engine_box_connection_h = engine_box_bottom_base_thick;

t0 = 0;