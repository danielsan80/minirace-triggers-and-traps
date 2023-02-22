include <../../config/parameters.scad>


module engine_upside_down_transform() {
    translate([engine_w,0,engine_h])
    rotate([0,180,0])
    children();
}

module engine() {
    
    color("blue")
    union() {
        cube([engine_w, engine_l, engine_h]);
        
        translate([engine_w-engine_pivot_pos.x,engine_l,engine_pivot_pos.y])
        rotate([-90,0,0])
        cylinder(r=engine_gear_r, h=engine_gear_h);
        
        translate([-engine_wing_l,engine_l-engine_wing_offset,0])
        cube([engine_wing_l, engine_wing_thick, engine_h]);
        translate([engine_w,engine_l-engine_wing_offset,0])
        cube([engine_wing_l, engine_wing_thick, engine_h]);
    }
}