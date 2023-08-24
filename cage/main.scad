include <config/parameters.scad>
use <src/blade/blade.scad>
use <src/wall/wall.scad>
use <src/box/box.scad>
use <src/trigger-board/trigger-board.scad>
use <src/frames/frames.scad>
use <src/slides/slides.scad>
use <src/keeps/keeps.scad>
use <src/trigger-board-box/trigger-board-box.scad>
use <src/trigger-board-box/print/trigger-board-box.scad>

//blade(w=15, thick=3, l_thick=1);
//wall(w=50, h=50, thick=3, l_thick=1, n_big_uprights = 2, n_little_uprights=3, n_blades=15);
//box_front();
//box_back();
//box_left();
//box_right();
//box_bottom();
//box_top();
//all_sides();

//trigger_board();
//trigger_board_hangs();

//frame1(void=false);
//frame2(void=false);
//frame1(void=true);
//frame2(void=true);


//slide_left_cut(true);
//slide_left_cut(false);
//
//slide_top_cut(true);
//slide_top_cut(false);
//
//slide_left_fix();

//keeps();

//trigger_board_box();



print_box();
print_slide_left();
print_slide_top();





