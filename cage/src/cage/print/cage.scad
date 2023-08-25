use <../../../src/cage/cage.scad>
use <../../../src/slides/slides.scad>


module _print_cage_whole() {
    cage_whole();
    slide_left_fix();
}


module print_cage_main() {
    
    difference() {
        _print_cage_whole();
        slide_left_cut(void=true);
        slide_top_cut(void=true);
    }
}

module print_slide_left() {
    
    //    color("blue")
    intersection() {
        _print_cage_whole();
        slide_left_cut(void=false);
    }
}


module print_slide_top() {
    
    //    color("green")
    intersection() {
        _print_cage_whole();
        slide_top_cut(void=false);
    }
}