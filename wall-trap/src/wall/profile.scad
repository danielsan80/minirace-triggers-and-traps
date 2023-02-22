include <../../config/parameters.scad>

module wall_profile() {
    polygon([
        [0,0],
        [0, ramp_h],
        [-wall_l, min_thick],
        [-wall_l, 0],
    ]);
}
