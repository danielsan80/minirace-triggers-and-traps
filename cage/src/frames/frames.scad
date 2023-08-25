include <../../config/parameters.scad>

module frame1(void=false) {
    
    function m() = (void) ? m_thick : 0;
    function f() = (void) ? fix : 0;
    
    x_offset = 6;
    z_offset = 2;
    
    w=20;
    h=9;
    
    
    translate([thick+inner_w-f(), thick+x_offset-m_thick+m(), thick+z_offset-m_thick+m()])
    cube([thick+f()*2,w+m_thick*2-m()*2,h+m_thick*2-m()*2]);
}



module frame2(void=false) {
    
    function m() = (void) ? m_thick : 0;
    function f() = (void) ? fix : 0;
    
    x_offset = 6;
    z_offset = 2;
    
    w=25;
    h=10;
    
    
    translate([-f(), thick+x_offset-m_thick+m(), thick+z_offset-m_thick+m()])
    cube([thick+f()*2,w+m_thick*2-m()*2,h+m_thick*2-m()*2]);
}