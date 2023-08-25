include <../../config/parameters.scad>
include <../../lib/base_cage/values.scad>

module frame1(void=false) {
    
    function m() = (void) ? frame_thick : 0;
    function f() = (void) ? fix : 0;
    
    x_offset = frame1_x_offset;
    z_offset = frame1_z_offset;
    
    w=frame1_w;
    h=frame1_h;
    
    
    translate([thick+inner_w()-f(), thick+x_offset-frame_thick+m(), thick+z_offset-frame_thick+m()])
    cube([thick+f()*2,w+frame_thick*2-m()*2,h+frame_thick*2-m()*2]);
}



module frame2(void=false) {
    
    function m() = (void) ? frame_thick : 0;
    function f() = (void) ? fix : 0;
    

    
    x_offset = frame2_x_offset;
    z_offset = frame2_z_offset;
    
    w=frame2_w;
    h=frame2_h;
    
    
    translate([-f(), thick+x_offset-frame_thick+m(), thick+z_offset-frame_thick+m()])
    cube([thick+f()*2,w+frame_thick*2-m()*2,h+frame_thick*2-m()*2]);
}