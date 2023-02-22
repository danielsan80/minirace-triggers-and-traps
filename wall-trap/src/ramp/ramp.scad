include <../../config/parameters.scad>
use <../../src/wall/hinge.scad>
use <../../src/ramp/hinge.scad>

module ramp_body() {
    translate([0,ramp_w,0])
    rotate([90,0,0])
    linear_extrude(ramp_w)
    polygon([
        [0,0],
        [ramp_l,0],
        [ramp_l, min_thick],
        [ramp_up_l, ramp_h],
        [0, ramp_h],
    ]);
}

module ramp() {
    difference() {
        ramp_body();
        wall_hinge_void();
    }
    ramp_hinge();
}