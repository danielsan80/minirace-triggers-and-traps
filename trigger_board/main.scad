include <config/parameters.scad>
use <src/board/board.scad>
use <src/hangs/hangs.scad>
use <src/cage/cage.scad>
use <src/cage/print/cage.scad>


board_translate()
board();

print_cage_main();
//print_cage_slide_left();
//print_cage_slide_top();