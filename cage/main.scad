include <config/parameters.scad>
use <src/blade/blade.scad>
use <src/wall/wall.scad>
use <src/box/box.scad>

//blade(w=15, thick=3, l_thick=1);
//wall(w=50, h=50, thick=3, l_thick=1, n_big_uprights = 2, n_little_uprights=3, n_blades=15);
//box_front();
//box_back();
//box_left();
//box_right();
//box_bottom();
//box_top();
//all_sides();

module trigger_board_hangs() {
    include <vendor/Triggers/trigger_board_hangs.scad>;
    trigger_board_hangs();
}

module trigger_board() {
    include <vendor/Triggers/trigger_board.scad>;
    trigger_board();
}



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

module frame2(hole=false) {
    
    function m() = (hole) ? m_thick : 0;
    function f() = (hole) ? fix : 0;
    
    x_offset = 6;
    z_offset = 3;
    
    w=25;
    h=9;
    
    
    translate([-f(), thick+x_offset-m_thick+m(), thick+z_offset-m_thick+m()])
    cube([thick+f()*2,w+m_thick*2-m()*2,h+m_thick*2-m()*2]);
}


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

//slide_left_cut();


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

module box() {
    
    difference() {
        union() {
            all_sides();
            slide_left_fix();
            
            frame1();
            frame2();
            
            keeps();
        }
        frame1(true);
        frame2(true);
    }
}

module print_box() {
    
    difference() {
        box();
        slide_left_cut(void=true);
        slide_top_cut(void=true);
    }
}

module print_slide_left() {
    
    //    color("blue")
    intersection() {
        box();
        slide_left_cut(void=false);
    }
}


module print_slide_top() {
    
    //    color("green")
    intersection() {
        box();
        slide_top_cut(void=false);
    }
}

module trigger_board_r() {
    translate([board_w,board_l,0])
    rotate([0,0,180])
    trigger_board();
}

module trigger_board_hangs_r() {
    translate([board_w,board_l,0])
    rotate([0,0,180])
    trigger_board_hangs();
}

module keeps() {
    
    translate([thick,thick+board_y_offset,thick])
    trigger_board_hangs_r();
    
}



//wall(w=inner_w+thick*2,h=inner_h+thick*2, thick=thick);

//box();
//trigger_board_hangs();

//translate([thick,thick+board_y_offset,thick])
//trigger_board_r();
//slide_left_fix();


//print_box();
//print_slide_left();
//print_slide_top();





