include <../../config/parameters.scad>
use <../../src/engine/engine.scad>


module engine_box_bottom_base() {
    cube([
        engine_box_w,
        engine_box_l,
        engine_box_bottom_base_thick
    ]);
}

module engine_box_bottom_wall_left() {
    cube([
        engine_box_wall_thick,
        engine_box_l,
        engine_box_bottom_h
    ]);
}
module engine_box_bottom_wall_right() {
    translate([engine_box_w-engine_box_wall_thick,0,0])
    engine_box_bottom_wall_left();
}

module engine_box_bottom_wall_back() {
    difference() {
        cube([
            engine_box_w,
            engine_box_wall_thick,
            engine_box_bottom_h
        ]);

        translate([0,-fix,0])
        translate([0,0,engine_box_cable_slit_z_offset])
        translate([0,0,engine_box_bottom_base_thick])
        translate([engine_wing_l,0,0])
        translate([engine_box_play,0,0])
        translate([engine_box_wall_thick,0,0])
        cube([engine_box_cable_slit_w,engine_box_wall_thick+fix*2,engine_box_bottom_h]);
    }
}

module engine_box_bottom_wall_front() {

    module gear_cases_hole() {
        translate([0,0,engine_h/2])
        translate([engine_wing_l,0,0])
        translate([engine_box_play,0,0])
        translate([engine_box_wall_thick,0,0])
        translate([0,-fix,0])
        translate([0,-engine_box_wall_thick,0])
        translate([0,engine_box_l,0])
        translate([0,0,engine_box_bottom_base_thick])
        rotate([-90,0,0])
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
            engine_box_bottom_h
            ]);
        gear_cases_hole();
    }
}

module engine_box_bottom_walls() {
    engine_box_bottom_wall_left();
    engine_box_bottom_wall_right();
    engine_box_bottom_wall_back();
    engine_box_bottom_wall_front();
}


function engine_box_connection_l() = 0
    -engine_offset_y()
    -engine_l
    -wall_wheel_side_gap
    -engine_box_play
    -engine_box_wall_thick
;

module engine_box_connection() {
    translate([0,-engine_box_connection_l(),0])
    intersection() {
        
        union() {
            translate([0,-wall_wheel_side_gap,0])
            translate([-engine_box_connection_w/2,0,0])
            cube([engine_box_connection_w, engine_box_connection_l(), engine_box_connection_h]);
            
            cube([engine_box_connection_w/2, engine_box_connection_l(), engine_box_connection_h]);

            translate([0,0,ramp_h/2])
            rotate([-90,0,0])
            cylinder(d=ramp_h, h=engine_box_connection_l());
            
        }
        
        translate([0,0,ramp_h/2])
        rotate([-90,0,0])
        translate([0,0,-a_lot/2])
        cylinder(r=wall_wheel_inner_r-engine_box_connection_gap, h=a_lot);
    }
}

module engine_box_bottom() {
    engine_box_bottom_base();
    engine_box_bottom_walls();
}


module engine_box_top_base() {
    cube([
        engine_box_w,
        engine_box_l,
        engine_box_top_base_thick
    ]);
    
    translate([engine_box_play,engine_box_play,0])
    translate([engine_box_wall_thick,engine_box_wall_thick,0])
    translate([0,0,engine_box_top_base_thick])
    cube([
        engine_box_w - engine_box_wall_thick*2 - engine_box_play*2,
        engine_box_l - engine_box_wall_thick*2 - engine_box_play*2,
        engine_box_top_margin
    ]);
    
    translate([-engine_wing_l,,0])
    translate([-engine_box_wall_thick,0,0])
    translate([-engine_box_cable_slit_w,0,0])
    translate([engine_box_w,0,0])
    translate([0,0,engine_box_top_base_thick])
    cube([engine_box_cable_slit_w-engine_box_play*2,engine_box_wall_thick+engine_box_back_gap,engine_box_top_margin]);
}

module engine_box_top_filler_right() {
    translate([0,engine_box_back_gap,0])
    translate([engine_box_play,engine_box_play,0])
    translate([engine_box_wall_thick,engine_box_wall_thick,0])
    translate([0,0,engine_box_top_margin])
    translate([0,0,engine_box_top_base_thick])
    cube([
        engine_wing_l-engine_box_play,
        engine_box_l-engine_box_wall_thick*2-engine_box_play*2-engine_box_back_gap-engine_wing_offset-engine_wing_thick-engine_box_play,
        engine_h-engine_box_top_margin-engine_box_bottom_margin
    ]);
}

module engine_box_top_filler_left() {
    translate([0,engine_box_back_gap,0])
    translate([-engine_box_play,engine_box_play,0])
    translate([-engine_box_wall_thick,engine_box_wall_thick,0])
    translate([-engine_wing_l+engine_box_play, 0,0])
    translate([engine_box_w, 0,0])
    translate([0,0,engine_box_top_margin])
    translate([0,0,engine_box_top_base_thick])
    cube([
        engine_wing_l-engine_box_play,
        engine_box_l-engine_box_wall_thick*2-engine_box_play*2-engine_box_back_gap-engine_wing_offset-engine_wing_thick-engine_box_play,
        engine_h-engine_box_top_margin-engine_box_bottom_margin
    ]);
}

module engine_box_top_fillers() {
    engine_box_top_filler_left();
    engine_box_top_filler_right();
}


module engine_box_top() {
    engine_box_top_base();
    engine_box_top_fillers();
    
}

module engine_box_top_on_engine_box_bottom_transform() {
    translate([0,0,engine_box_bottom_h])
    translate([0,0,engine_box_play])
    translate([0,0,engine_box_top_base_thick])
    translate([engine_box_w,0,0])
    rotate([0,180,0])
    children();
}

module engine_box_on_engine_transform() {
    translate([
        -engine_wing_l-engine_box_play-engine_box_wall_thick,
        -engine_box_play-engine_box_wall_thick-engine_box_back_gap,
        -engine_box_bottom_base_thick
    ])
    children();
}

module engine_box_on_wall_trap_transform() {
    translate(engine_offset())
    children();
}