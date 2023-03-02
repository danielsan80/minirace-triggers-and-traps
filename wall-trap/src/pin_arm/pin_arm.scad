include <../../config/parameters.scad>

module pin_arm() {
    
    module body() {
        d_ext = pin_arm_play*2+pin_arm_wall_thick*2;
        h = pin_arm_base_thick+pin_arm_wall_h;
        
        hull(){
            cylinder(d=engine_arm_d1+d_ext, h=h);
        
            translate([0,engine_arm_l-engine_arm_d1/2-engine_arm_d2/2,0])
            cylinder(d=engine_arm_d2+d_ext, h=h);
        };
    }
    
    module hollow() {
        d_ext = pin_arm_play*2;
        h = pin_arm_wall_thick+pin_arm_wall_h;
        
        translate([0,0,pin_arm_base_thick])
        hull(){
            cylinder(d=engine_arm_d1+d_ext, h=h);
        
            translate([0,engine_arm_l-engine_arm_d1/2-engine_arm_d2/2,0])
            cylinder(d=engine_arm_d2+d_ext, h=h);
        };
    }
    
    module cover() {
        d_ext = pin_arm_play*2+pin_arm_wall_thick*2;
        h = pin_arm_base_thick;
        translate([0,0,pin_arm_base_thick+pin_arm_wall_h])
        difference() {
            hull(){
                cylinder(d=engine_arm_d1+d_ext, h=h);
            
                translate([0,engine_arm_l-engine_arm_d1/2-engine_arm_d2/2,0])
                cylinder(d=engine_arm_d2+d_ext, h=h);
            };
            
            translate([0,0,-fix])
            cylinder(d=engine_arm_d1*pin_arm_cover_ratio, h=h+fix*2);
            
        }
    }
    
    module pin() {
        translate([0,engine_arm_l-engine_arm_d1/2-engine_arm_d2/2,0])
        translate([0,0,fix])
        translate([0,0,-pin_arm_pin_h])
        cylinder(d=pin_arm_pin_d, h=pin_arm_pin_h);
    }
    
    
    translate([0,pin_arm_play,0])
    translate([0,pin_arm_base_thick,0])
    translate([0,engine_arm_thick,0])
    rotate([90,0,0])
    union() {
        difference() {
            body();
            hollow();
        }
        cover();
        pin();
    }
}

module print_pin_arm_transform() {
    b = engine_arm_l-engine_arm_d1/2-engine_arm_d2/2;
    h = engine_arm_d1/2-engine_arm_d2/2;
    hp = sqrt(pow(b,2)+pow(h,2));
    slope = asin(h/hp);
    
    translate([0,0,pin_arm_wall_thick])
    translate([0,0,pin_arm_play])
    translate([0,0,engine_arm_d1/2])
    rotate([0,90+slope,0])
    children();
}


