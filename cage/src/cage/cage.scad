include <../../config/parameters.scad>
use <../../src/wall/wall.scad>



module cage_bottom() {
    cube([inner_w+thick*2,inner_l+thick*2, thick]);
}

module cage_front() {
    wall(w=inner_w+thick*2,h=inner_h+thick*2, thick=thick, n_big_uprights = 2, n_little_uprights=2);
}

//cage_front();

module cage_back() {
    translate([0,inner_l+thick*2,0])
    mirror([0,1,0])
    cage_front();
    
}

module cage_right_and_left() {
    wall(w=inner_l+thick*2,h=inner_h+thick*2, thick=thick, n_big_uprights = 2, n_little_uprights=2);
}

module cage_right() {
    translate([outer_w,0,0])
    rotate([0,0,90])
    cage_right_and_left();
}

module cage_left() {
    translate([0,outer_l,0])
    rotate([0,0,-90])
    cage_right_and_left();
}


module cage_top() {
    
    translate([0,0,outer_h-thick])
    cube([outer_w, outer_l, m_thick]);
}


module cage_whole() {
    
    cage_bottom();
    
    cage_front();
    
    cage_back();
    
    cage_right();
    
    cage_left();
    
    cage_top();
}
