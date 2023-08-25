include <../../config/parameters.scad>
use <../../src/trigger_board/trigger_board.scad>

module keeps() {
    translate([thick,thick+trigger_board_y_offset(),thick])
    trigger_board_hangs_r();
}
