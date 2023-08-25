use <../../../lib/base_cage/base_cage_slides.scad>
use <../../../src/cage/cage.scad>
use <../../../src/slides/slides.scad>



module print_cage_main() {
    
    difference() {
        cage_whole();
        base_cage_slide_left_cut(void=true);
        base_cage_slide_top_cut(void=true);
    }
}

module print_cage_slide_left() {
    
    //    color("blue")
    intersection() {
        cage_whole();
        base_cage_slide_left_cut(void=false);
    }
}


module print_cage_slide_top() {
    
    //    color("green")
    intersection() {
        cage_whole();
        base_cage_slide_top_cut(void=false);
    }
}