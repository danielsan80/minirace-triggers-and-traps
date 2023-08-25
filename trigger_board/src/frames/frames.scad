include <../../config/parameters.scad>
include <../../lib/base_cage/values.scad>

module frame1(void=false) {
    
    function m() = (void) ? frame_thick : 0;
    function f() = (void) ? fix : 0;
    
    x_offset = 6;
    z_offset = 2;
    
    w=20;
    h=9;
    
    
    translate([thick+inner_w()-f(), thick+x_offset-frame_thick+m(), thick+z_offset-frame_thick+m()])
    cube([thick+f()*2,w+frame_thick*2-m()*2,h+frame_thick*2-m()*2]);
}



module frame2(void=false) {
    
    function m() = (void) ? frame_thick : 0;
    function f() = (void) ? fix : 0;
    
    x_offset = 6;
    z_offset = 2;
    
    w=25;
    h=10;
    
    
    translate([-f(), thick+x_offset-frame_thick+m(), thick+z_offset-frame_thick+m()])
    cube([thick+f()*2,w+frame_thick*2-m()*2,h+frame_thick*2-m()*2]);
}