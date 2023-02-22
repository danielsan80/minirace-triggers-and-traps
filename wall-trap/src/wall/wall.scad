include <../../config/parameters.scad>
use <../../src/wall/profile.scad>
use <../../src/wall/hinge.scad>
use <../../src/ramp/hinge.scad>


module wall_body() {
    translate([0,ramp_w,0])
    rotate([90,0,0])
    linear_extrude(ramp_w)
    wall_profile();
}

module wall() {
    difference() {
        wall_body();
        ramp_hinge_void();
    }
    wall_hinge();
}

