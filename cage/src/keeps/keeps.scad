include <../../config/parameters.scad>
use <../../src/trigger-board/trigger-board.scad>

module keeps() {
    translate([thick,thick+trigger_board_y_offset(),thick])
    trigger_board_hangs_r();
}
