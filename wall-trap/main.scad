include <config/parameters.scad>
use <src/ramp/ramp.scad>
use <src/engine/engine.scad>
use <vendor/car/src/car.scad>


module sim_cut() {
    difference() {
        children();
        translate([-wall_h,-fix, -fix])
        cube([wall_h+fix,wall_w+fix*2,ramp_h+fix*2]);
    }
}

module sim_trig_wall(angle=90) {
    translate([0,0,ramp_h/2])
    rotate([0,angle,0])
    translate([0,0,-ramp_h/2])
    children();

}

module test_hinge_cut() {
    intersection() {
        translate([-11,-50,0])
        cube([20,100,4.5]);
        children();
    }
}


//test_hinge_cut()
union() {
    //sim_cut()
    ramp();
    //sim_cut()
    //sim_trig_wall(angle=90)
    union() {
        wall();
        wall_wheel();
    }
}

translate([35,0,0])
translate([0,ramp_w/2,0])
translate([0,0,ramp_h])
rotate([0,0,-90])
car();


translate([0,-wall_wheel_side_gap-wall_wheel_thick,0])
translate([0,-engine_gear_h,0])
translate([-engine_pivot_pos.x,0,0])
translate([0,-engine_l,0])
engine_upside_down_transform()
engine();