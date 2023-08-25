use <../../../src/trigger_board_cage/trigger_board_cage.scad>
use <../../../src/slides/slides.scad>



module print_cage_main() {
    
    difference() {
        trigger_board_cage();
        slide_left_cut(void=true);
        slide_top_cut(void=true);
    }
}

module print_slide_left() {
    
    //    color("blue")
    intersection() {
        trigger_board_cage();
        slide_left_cut(void=false);
    }
}


module print_slide_top() {
    
    //    color("green")
    intersection() {
        trigger_board_cage();
        slide_top_cut(void=false);
    }
}