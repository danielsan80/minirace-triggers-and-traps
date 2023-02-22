include <../../config/parameters.scad>
use <../../src/hinge/hinge.scad>

module ramp_hinge() {
    
    translate([0,hinge_l/2,0])
    translate([0,0,ramp_h/2])
    rotate([-90,0,0])
    hinge(side="A", l=hinge_l, r=hinge_r, n=hinge_chunks_n);
}

module ramp_hinge_void() {
    
    translate([0,hinge_l/2,0])
    translate([0,0,ramp_h/2])
    rotate([-90,0,0])
    hinge_void(side="A", l=hinge_l, r=hinge_r, n=hinge_chunks_n, cut_angle=-90+wall_slope);
}

