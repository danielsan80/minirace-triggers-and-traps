include <../../config/parameters.scad>

module slide_left_cut(void=true) {
    function p() = void?0:0.4;
    function pr() = void?0.4:0;
    
    
    x_offset = 6;
    z_offset = 3;
    
    w=25;
    h=9;
    
    color("red")
    translate([0,thick,thick])
    union() {
        difference() {
            
            hull() {
                
                translate([-fix,fix+p(),fix+p()])
                cube([thick+fix*2, inner_l-fix*2-p()*2,  inner_h+thick+fix-fix-p()]);
                
                translate([(thick-fix)/2, -thick/2+p(), fix+p()])
                cube([fix, fix, inner_h+thick+fix-fix-p()]);
                
                translate([(thick-fix)/2, inner_l-fix+thick/2-fix-p(), fix+p()])
                cube([fix, fix, inner_h+thick+fix-fix-p()]);
            }
            
            translate([-fix*2, x_offset+fix+pr(),0])
            cube([thick+fix*4,w-fix*2-pr()*2,h+z_offset-fix]);
        }
    }
}


module slide_top_cut(void=true) {
    function p() = void?0:0.15;
    function more() = void?thick*2:0;
    
    color("red")
    translate([0, thick, thick+inner_h])
    union() {
        hull() {
            
            translate([thick+fix+p()-more(),fix+p(),-fix])
            cube([inner_w-fix*2-p()*2+more(), inner_l-fix*2-p()*2,  thick+fix*2]);
            
            translate([thick+fix+p()-more(), fix+p()-thick/2, (thick-fix)/2])
            cube([inner_w-fix*2-p()*2+more(), fix, fix]);
            
            translate([thick+fix+p()-more(), inner_l-fix+thick/2-fix-p(), (thick-fix)/2])
            cube([inner_w-fix*2-p()*2+more(), fix, fix]);
        }
    }
}


module slide_left_fix() {
    translate([0,2,thick])
    cube([thick, thick, inner_h]);
    
    translate([0,inner_l+thick-2,thick])
    cube([thick, thick, inner_h]);
    
}