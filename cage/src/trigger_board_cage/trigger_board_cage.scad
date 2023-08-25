use <../../src/cage/cage.scad>
use <../../src/frames/frames.scad>
use <../../src/slides/slides.scad>
use <../../src/keeps/keeps.scad>


module trigger_board_cage() {
    
    difference() {
        union() {
            cage_whole();
            slide_left_fix();
            
            frame1();
            frame2();
            
            keeps();
        }
        frame1(true);
        frame2(true);
    }
}