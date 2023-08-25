include <../../config/parameters.scad>
use <../../lib/base_cage/values.scad>

module base() {
    color("violet")
    difference() {
        cube([board_w,board_l,board_thick]);
        
        translate([5.5,board_l-2.3,-fix])
        cylinder(r=1,h=board_thick+fix*2);
        
        translate([board_w-3.5,2.3,-fix])
        cylinder(r=1,h=board_thick+fix*2);
    }
}

module battery_plugin() {
    color("white")
    translate([-0.5,0.8,board_thick])
    cube([4.3,5.6,5.7]);
}

module in_power_supply() {
    color("white")
    translate([-3.7,board_l-2-5.6,board_thick])
    cube([5.7,5.6,4.3]);
}

module switch() {
    translate([0,8.4,board_thick])
    union() {
        color("gray")
        cube([4.1,8.8,4.4]);
        
        color("black")
        translate([-4,(8.4-2)/2,4.4-2-1.2])
        cube([4,2,2]);
    }
}

module out_power_supply() {
    color("white")
    translate([board_w-2.2,board_l-1.1-7.2,board_thick])
    cube([4.6,7.2,3.4]);
}

module pins() {
    translate([board_w-1-2,5.0,board_thick])
    for(i = [0:3]) {
        translate([0,i*2.5,0])
        union() {
            color("gray")
            translate([0.9,1,4])
            union() {
                cube([8,0.5,0.5]);
                translate([0,0,-2])
                cube([0.5,0.5,2]);
            }
            
            color("black")
            cube([2.3,2.5,2.5]);
        }
    }
}

module arduino() {
    translate([(board_w-10)/2,board_l-1-4.7,board_thick])
    union() {
        color("black")
        cube([10,4.7,11]);
        
        color("green")
        translate([-(14-10)/2,0.2-25+4.7,11])
        cube([14,25,3]);
    }
}

module battery() {
    translate([(board_w-17)/2,-1,0])
    rotate([90,0,0])
    color("cyan")
    cube([17,33,8]);
}

module board() {
    bottom_gap = board_z_offset;
    w = board_w;
    l = board_l;
    h = board_thick;
    
    translate([0,0,bottom_gap])
    union() {
        
        base();
        
        battery_plugin();
        
        switch();
        
        in_power_supply();
        
        out_power_supply();
        
        
        pins();
        
        
        arduino();
        
        battery();
        
    }
}

module board_translate() {
    translate([thick(),thick()+board_y_offset,thick()])
    translate([board_w,board_l,0])
    rotate([0,0,180])
    children();
}
