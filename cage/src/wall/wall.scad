include <../../config/parameters.scad>
use <../../src/blade/blade.scad>


module wall(w, h, thick, l_thick=1, n_big_uprights = 2, n_little_uprights=3, n_blades=15) {
    
    big_window = (w-thick*n_big_uprights)/(n_big_uprights+1);
    little_window = (big_window-l_thick*n_little_uprights)/(n_little_uprights+1);
    blade_height = blade_thick+thick-l_thick-blade_shift;
    big_upright_step = (w-thick)/(n_big_uprights+1);
    little_upright_step = (big_upright_step-thick+l_thick)/(n_little_uprights+1);
    blade_step = (h-thick*2-blade_height)/(n_blades-1);
    
    echo(
    "bigs:", n_big_uprights,
    "littles:", n_little_uprights,
    "blades:", n_blades,
    "w:", w,
    "big_window: ", big_window,
    "little_window: ", little_window
    );

    cube([w, thick, thick]);
    
    cube([thick, thick, h]);
    
    translate([0,0,h-thick])
    cube([w, thick, thick]);
    
    translate([w-thick,0,0])
    cube([thick, thick, h]);
    
    for (i = [0:n_big_uprights]) {
        translate([i*big_upright_step,0,0])
        cube([thick, thick, h]);
        
        for (j = [1:n_little_uprights]) {
            translate([i*big_upright_step+thick-l_thick+j*little_upright_step,thick-l_thick,0])
            cube([l_thick, l_thick, h]);
            
            
        }
    }
    
    for (i = [0:n_blades-1]) {
        translate([0,0,thick+i*blade_step])
        blade(w=w,thick=thick, l_thick=l_thick);
        
    }
    
}
