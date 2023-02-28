include <config/parameters.scad>
use <src/ramp/ramp.scad>
use <src/wall/wall.scad>
use <src/wall_wheel/wall_wheel.scad>
use <src/engine/engine.scad>
use <src/engine_box/engine_box.scad>
use <src/pin_arm/pin_arm.scad>
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

//
//////test_hinge_cut()
//union() {
//    //sim_cut()
//    ramp();
//    //sim_cut()
//    sim_trig_wall(angle=90)
//    union() {
//        wall();
//        wall_wheel();
//    }
//}
//
//translate([35,0,0])
//translate([0,ramp_w/2,0])
//translate([0,0,ramp_h])
//rotate([0,0,-90])
//car();


engine_on_wall_trap_transform()
union() {
    engine();


    engine_arm_on_engine_pinion_transform(angle=-56)
    union() {
        engine_arm();
//        translate([0,5,0])
        pin_arm();
    }

}

engine_box_on_wall_trap_transform()
engine_box_on_engine_transform()
engine_box();



