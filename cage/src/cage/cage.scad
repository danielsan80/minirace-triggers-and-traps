include <../../config/parameters.scad>
use <../../src/wall/wall.scad>



module box_bottom() {
    cube([inner_w+thick*2,inner_l+thick*2, thick]);
}

module box_front() {
    wall(w=inner_w+thick*2,h=inner_h+thick*2, thick=thick, n_big_uprights = 2, n_little_uprights=2);
}

//box_front();

module box_back() {
    translate([0,inner_l+thick*2,0])
    mirror([0,1,0])
    box_front();
    
}

module box_right_and_left() {
    wall(w=inner_l+thick*2,h=inner_h+thick*2, thick=thick, n_big_uprights = 2, n_little_uprights=2);
}

module box_right() {
    translate([outer_w,0,0])
    rotate([0,0,90])
    box_right_and_left();
}

module box_left() {
    translate([0,outer_l,0])
    rotate([0,0,-90])
    box_right_and_left();
}


module box_top() {
    
    translate([0,0,outer_h-thick])
    cube([outer_w, outer_l, m_thick]);
}


module all_sides() {
    
    box_bottom();
    
    box_front();
    
    box_back();
    
    box_right();
    
    box_left();
    
    box_top();
}
