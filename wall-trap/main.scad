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
        children();
        translate([-35,-50,0])
        cube([50,100,35]);
    }
}


////test_hinge_cut()
union() {
    //sim_cut()
    ramp();
    //sim_cut()
    sim_trig_wall(angle=(sin($t*360)/2+t0)*90)
    union() {
        wall();
        wall_wheel();
    }
}

engine_box_on_wall_trap_transform()
engine_box_on_engine_transform()
engine_box_bottom();

engine_box_connection();

engine_box_on_wall_trap_transform()
engine_box_on_engine_transform()
engine_box_top_on_engine_box_bottom_transform()
engine_box_top();



translate([35,0,0])
translate([0,ramp_w/2,0])
translate([0,0,ramp_h])
rotate([0,0,-90])
car();


engine_on_wall_trap_transform()
union() {
    engine();

    engine_arm_on_engine_pinion_transform(angle=-pin_arm_angle+(sin($t*360)/2+t0)*(pin_arm_angle*2))
    union() {
        engine_arm();
//        translate([0,5,0])
//        print_pin_arm_transform()
        pin_arm();
    }
}





