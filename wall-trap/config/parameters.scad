$fn=100;
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


wall_h = 50;
wall_w = ramp_w;



hinge_joint_cone_r2 = 0.5;
hinge_joint_cone_gap = 0.3;



hinge_chunk_cone_margin = 0.5;
hinge_chunk_cone_r2 = 0.5;
hinge_chunk_gap = 0.3;

hinge_chunks_n = 5;
hinge_r = ramp_h/2;
hinge_l = ramp_w;