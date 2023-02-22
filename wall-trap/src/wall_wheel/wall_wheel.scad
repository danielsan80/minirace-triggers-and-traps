include <../../config/parameters.scad>
use <../../src/wall/profile.scad>

module _wall_wheel_sector_shape() {
    translate([ramp_h/2,0,0])
    rotate(90)
    rotate_extrude(angle=90, convexity=10)
    rotate(-90)
    translate([-wall_wheel_thick/2-fix,0])
    square([wall_wheel_thick+fix*2, wall_wheel_outer_r*2]);
}

module _wall_shape() {
    linear_extrude(wall_wheel_side_gap+fix*2)
    wall_profile();
}

module _wall_wheel_pin_guide() {
    
    translate([0,ramp_h/2,0])
    rotate([0,0,45])
    hull() {
        translate([0, wall_wheel_margin,0])
        translate([0,wall_wheel_pin_r+wall_wheel_pin_play,0])
        translate([0,wall_wheel_inner_r,0])
        cylinder(d=wall_wheel_pin_d+wall_wheel_pin_play*2, h=wall_wheel_thick+fix*2, center=true);
        
        translate([0,-wall_wheel_margin,0])
        translate([0,-wall_wheel_pin_r-wall_wheel_pin_play,0])
        translate([0,wall_wheel_outer_r,0])
        cylinder(d=wall_wheel_pin_d+wall_wheel_pin_play*2, h=wall_wheel_thick+fix*2, center=true);
    }
}


module _wall_wheel_body() {
    translate([0,ramp_h/2])
    rotate_extrude(angle=270, convexity=10)
    rotate(-90)
    translate([-wall_wheel_thick/2,wall_wheel_inner_r])
    square([wall_wheel_thick, wall_wheel_outer_r-wall_wheel_inner_r]);
    
}

module _wall_wheel_connection() {
    translate([0,0,-wall_wheel_thick/2])
    translate([0,0,-wall_wheel_side_gap-fix])
    intersection() {
        _wall_wheel_body();
        _wall_shape();
    }
}


module wall_wheel() {
    
    translate([0,-wall_wheel_thick/2-wall_wheel_side_gap])
    rotate([90,0,0])
    union() {
        difference() {
            intersection() {
                _wall_wheel_body();
                _wall_wheel_sector_shape();
            }

            _wall_wheel_pin_guide();
        }
        
        _wall_wheel_connection();
    }
}
