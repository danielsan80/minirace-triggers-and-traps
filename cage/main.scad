include <config/parameters.scad>
use <src/blade/blade.scad>
use <src/wall/wall.scad>
use <src/cage/cage.scad>
use <src/cage/print/cage.scad>
use <src/slides/slides.scad>

//blade(w=15, thick=3, l_thick=1);
//wall(w=50, h=50, thick=3, l_thick=1, n_big_uprights = 2, n_little_uprights=3, n_blades=15);
//cage_front();
//cage_back();
//cage_left();
//cage_right();
//cage_bottom();
//cage_top();
//cage_whole();


//slide_left_cut(true);
//slide_left_cut(false);
//
//slide_top_cut(true);
//slide_top_cut(false);
//
//slide_left_fix();


print_cage_main();
print_slide_left();
print_slide_top();





