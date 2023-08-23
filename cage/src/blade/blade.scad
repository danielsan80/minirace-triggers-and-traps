include <../../config/parameters.scad>

module blade(w, thick, l_thick) {
    shift = blade_shift;
    
    hull() {
        translate([0,thick-l_thick,0])
        cube([w,l_thick, blade_thick]);
        
        translate([0,shift,thick-l_thick-shift])
        cube([w,l_thick, blade_thick]);
    }
}