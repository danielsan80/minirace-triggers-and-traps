use <../../../src/trigger-board-box/trigger-board-box.scad>
use <../../../src/slides/slides.scad>



module print_box() {
    
    difference() {
        trigger_board_box();
        slide_left_cut(void=true);
        slide_top_cut(void=true);
    }
}

module print_slide_left() {
    
    //    color("blue")
    intersection() {
        trigger_board_box();
        slide_left_cut(void=false);
    }
}


module print_slide_top() {
    
    //    color("green")
    intersection() {
        trigger_board_box();
        slide_top_cut(void=false);
    }
}