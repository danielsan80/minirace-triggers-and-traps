use <../../lib/base_cage/base_cage.scad>
use <../../lib/base_cage/base_cage_slides.scad>
use <../../src/frames/frames.scad>
use <../../src/slides/slides.scad>
use <../../src/board/board.scad>
use <../../src/hangs/hangs.scad>


module cage_whole() {
    
    difference() {
        union() {
            base_cage_whole();
            base_cage_slide_left_fix();
            
            frame1();
            frame2();
            
            board_translate()
            hangs();
        }
        frame1(true);
        frame2(true);
    }
}