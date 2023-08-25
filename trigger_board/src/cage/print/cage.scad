include <../../../config/parameters.scad>
use <../../../lib/base_cage/base_cage_slides.scad>
use <../../../lib/base_cage/values.scad>
use <../../../src/cage/cage.scad>


module _print_cage_slide_left_cut(void=true) {
    function pr() = void?0.4:0;
    
    x_offset = frame2_x_offset;
    z_offset = frame2_z_offset;
    
    w=frame2_w;
    h=frame2_h;
    
    
    difference() {
        base_cage_slide_left_cut(void=void);
        
        translate([0,thick(),thick()])
        translate([-fix()*2, x_offset+fix()+pr(),0])
        cube([thick()+fix()*4,w-fix()*2-pr()*2,h+z_offset-fix()]);
    }
}


module print_cage_main() {
    
    difference() {
        cage_whole();
        _print_cage_slide_left_cut(void=true);
        base_cage_slide_top_cut(void=true);
    }
}

module print_cage_slide_left() {
    
    //    color("blue")
    intersection() {
        cage_whole();
        _print_cage_slide_left_cut(void=false);
    }
}


module print_cage_slide_top() {
    
    //    color("green")
    intersection() {
        cage_whole();
        base_cage_slide_top_cut(void=false);
    }
}