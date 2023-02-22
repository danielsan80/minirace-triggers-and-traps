include <../../config/parameters.scad>
use <../../src/hinge/hinge.scad>

module wall_hinge() {
    
    translate([0,hinge_l/2,0])
    translate([0,0,ramp_h/2])
    rotate([-90,0,0])
    hinge(side="B", l=hinge_l, r=hinge_r, n=hinge_chunks_n);
}

module wall_hinge_void() {
    
    translate([0,hinge_l/2,0])
    translate([0,0,ramp_h/2])
    rotate([-90,0,0])
    hinge_void(side="B", l=hinge_l, r=hinge_r, n=hinge_chunks_n, cut_angle=-90-wall_slope);
}