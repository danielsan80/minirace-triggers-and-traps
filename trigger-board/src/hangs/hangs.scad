include <../../config/parameters.scad>
use <../../src/board/board.scad>


module hangs() {
    w=2;
    l1=3;
    l2=2;
    h1=board_z_offset;
    h2=board_z_offset + board_thick+play;
    
    module hang1() {
        translate([0,-l1,0])
        union() {
            cube([w,l1,h2+w-0.2]);
            translate([0,l1,0])
            cube([w,l2,h1]);
            
            translate([0,l1-0.4,h2+w/2-0.1])
            rotate([0,90,0])
            cylinder(h=w, r=w/2);
        }
    }
    
    module hang2() {
        translate([0,board_l,0])
        mirror([0,1,0])
        hang1();
        
    }
    
    
    offset = 5;
    
    translate([offset,0,0])
    hang1();
    
    translate([board_w-w-offset,0,0])
    hang1();
    
    translate([offset,0,0])
    hang2();
    
    translate([board_w-w-offset,0,0])
    hang2();
    
    
}

