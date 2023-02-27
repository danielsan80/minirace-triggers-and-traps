include <../../config/parameters.scad>

module engine_arm() {
    
    module pinion_grabber() {
        translate([0,0,fix])
        difference() {
            cylinder(d = engine_arm_d1, h = engine_arm_pinion_grabber_h);
            translate([0, 0, engine_arm_thick])
            cylinder(r = engine_gear_r, h = engine_arm_pinion_grabber_h);
        }
    
    }
    
    module holes() {
        for(i=[0:engine_arm_holes_n-1]) {
        
            translate([0,-i*engine_arm_holes_step,0])
            translate([0,-engine_arm_holes_step_offset,0])
            translate([0,engine_arm_l-engine_arm_d1/2,0])
            translate([0,0,-fix])
            cylinder(d=engine_arm_holes_d, h=a_few);
        
        }
        
    }
    
    module arm() {
        hull(){
            cylinder(d=engine_arm_d1, h=engine_arm_thick);
        
            translate([0,engine_arm_l-engine_arm_d1/2-engine_arm_d2/2,0])
            cylinder(d=engine_arm_d2, h=engine_arm_thick);
        };
    }
    
    
    color("white")
    translate([0,engine_arm_thick,0])
    rotate([90,0,0])
    difference() {
        union() {
            pinion_grabber();
            arm();
        }
        holes();
    }

}


module engine_arm_on_engine_pinion_transform(angle = 0) {
    translate([engine_gear_case_r,0,engine_gear_case_r])
    translate([0,engine_pinion_h,0])
    translate([0,engine_gear_case_h,0])
    translate([0,engine_l,0])
    rotate([0,angle,0])
    children();
}



module engine() {
    
    module body() {
        cube([engine_w, engine_l, engine_h]);
    }
    
    module wings() {
        translate([-engine_wing_l,engine_l-engine_wing_offset,0])
        cube([engine_wing_l, engine_wing_thick, engine_h]);
        translate([engine_w,engine_l-engine_wing_offset,0])
        cube([engine_wing_l, engine_wing_thick, engine_h]);
    }
    
    module gear_case() {
        translate([engine_gear_case_r,0,engine_gear_case_r])
        translate([0,engine_l,0])
        rotate([-90,0,0])
        cylinder(d=engine_gear_case_d, h=engine_gear_case_h);
    }
    
    module gear_case2() {
        translate([engine_gear_cases_w-engine_gear_case2_d/2,0,engine_h/2])
        translate([0,engine_l,0])
        rotate([-90,0,0])
        cylinder(d=engine_gear_case2_d, h=engine_gear_case_h);
    }
    
    module pinion() {
        translate([engine_gear_case_r,0,engine_gear_case_r])
        translate([0,engine_gear_case_h,0])
        translate([0,engine_pinion_h,0])
        translate([0,engine_l,0])
        rotate([90,0,0])
        cylinder(d=engine_pinion_d, h=engine_pinion_h);
    }
    
    color("blue")
    union() {
        body();
        
        gear_case();
        gear_case2();
        
        pinion();
        
        wings();
    }
}

function engine_offset_x() = -engine_gear_case_r;
function engine_offset_y() = 0
    -engine_l
    -engine_gear_case_h
    -engine_pinion_h
    -engine_arm_thick
    -pin_arm_play
    -pin_arm_base_thick
    -wall_wheel_side_gap
    -wall_wheel_side_gap-wall_wheel_thick
    -engine_gear_case_r
;
function engine_offset_z() = engine_box_base_thick;

function engine_offset() = [
    engine_offset_x(),
    engine_offset_y(),
    engine_offset_z()
];

module engine_on_wall_trap_transform() {
    translate(engine_offset())
    children();
}
