include <../../config/parameters.scad>
use <../../src/engine/engine.scad>


module engine_box_base() {
    cube([
        engine_box_w,
        engine_box_l,
        engine_box_base_thick
    ]);
}

module engine_box_wall_left() {
    cube([
        engine_box_wall_thick,
        engine_box_l,
        engine_box_h
    ]);
}
module engine_box_wall_right() {
    translate([engine_box_w-engine_box_wall_thick,0,0])
    engine_box_wall_left();
}

module engine_box_wall_back() {
    difference() {
        cube([
            engine_box_w,
            engine_box_wall_thick,
            engine_box_h
        ]);

        translate([0,-fix,0])
        translate([0,0,engine_box_cable_slit_z_offset])
        translate([0,0,engine_box_base_thick])
        translate([engine_wing_l,0,0])
        translate([engine_box_play,0,0])
        translate([engine_box_wall_thick,0,0])
        cube([engine_box_cable_slit_w,engine_box_wall_thick+fix*2,engine_box_h]);
    }
}

module engine_box_wall_front() {

    module gear_cases_hole() {
        translate([0,0,engine_h/2])
        translate([engine_wing_l,0,0])
        translate([engine_box_play,0,0])
        translate([engine_box_wall_thick,0,0])
        translate([0,-fix,0])
        translate([0,-engine_box_wall_thick,0])
        translate([0,engine_box_l,0])
        translate([0,0,engine_box_base_thick])
        rotate([-90,0,0])
        color("red")
        union() {
            translate([engine_gear_case1_r,0,0])
            cylinder(d=engine_gear_case1_d+engine_box_play*2, h=engine_box_wall_thick+fix*2);
            
            translate([engine_gear_cases_l-engine_gear_case2_d/2,0,0])
            cylinder(d=engine_gear_case2_d+engine_box_play*2, h=engine_box_wall_thick+fix*2);
        }
    }

    difference() {
        translate([0,engine_box_l-engine_box_wall_thick,0])
        cube([
            engine_box_w,
            engine_box_wall_thick,
            engine_box_h
            ]);
        
//        translate([0,0,engine_box_base_thick])
//        translate([-engine_box_play,0,0])
//        translate([engine_box_play,0,0])
//        translate([engine_wing_l,0,0])
//        translate([engine_box_wall_thick,0,0])
//        translate([0,-fix,0])
//        translate([0,-engine_box_wall_thick,0])
//        translate([0,engine_box_l,0])
//        color("red")
//        cube([
//            engine_gear_cases_l+engine_box_play*2,
//            engine_box_wall_thick+fix*2,
//            engine_box_h
//        ]);
    
        gear_cases_hole();
    }
}

module engine_box_holder_wing_left() {
    translate([0,-engine_box_play,0])
    translate([0,-engine_wing_offset,0])
    translate([0,-engine_box_play,0])
    translate([0,-engine_box_wall_thick,0])
    translate([0,-engine_box_holder_w,0])
    translate([0,engine_box_l,0])
    translate([engine_box_wall_thick,0,0])
    translate([0,0,engine_box_base_thick])
    cube([
        engine_wing_l,
        engine_box_holder_w,
        engine_box_holder_h
    ]);

}

module engine_box_holder_wing_right() {
    translate([0,-engine_box_play,0])
    translate([0,-engine_wing_offset,0])
    translate([0,-engine_box_play,0])
    translate([0,-engine_box_wall_thick,0])
    translate([0,-engine_box_holder_w,0])
    translate([0,engine_box_l,0])
    translate([-engine_wing_l,0,0])
    translate([-engine_box_wall_thick,0,0])
    translate([engine_box_w,0,0])
    translate([0,0,engine_box_base_thick])
    cube([
        engine_wing_l,
        engine_box_holder_w,
        engine_box_holder_h
        ]);
    
}

module engine_box_holders() {
    engine_box_holder_wing_left();
    engine_box_holder_wing_right();
}


module engine_box_walls() {
    engine_box_wall_left();
    engine_box_wall_right();
    engine_box_wall_back();
    engine_box_wall_front();
}

module engine_box_connection() {
    translate([0,-engine_box_connection_l,0])
    cube([engine_box_connection_w, engine_box_connection_l, engine_box_base_thick]);
}

module engine_box() {
    
    engine_box_base();
    engine_box_walls();
    engine_box_holders();
}

module engine_box_on_engine_transform() {
    translate([
        -engine_wing_l-engine_box_play-engine_box_wall_thick,
        -engine_box_play-engine_box_wall_thick-engine_box_back_play,
        -engine_box_base_thick
    ])
    children();
}

module engine_box_on_wall_trap_transform() {
    translate(engine_offset())
    children();
}