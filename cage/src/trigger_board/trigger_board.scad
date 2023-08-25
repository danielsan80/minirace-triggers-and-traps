include <../../vendor/trigger_board/config/parameters.scad>
use <../../vendor/trigger_board/src/board/board.scad>
use <../../vendor/trigger_board/src/hangs/hangs.scad>

module trigger_board_hangs() {
    hangs();
}

module trigger_board() {
    board();
}

module trigger_board_r() {
    translate([board_w,board_l,0])
    rotate([0,0,180])
    trigger_board();
}

module trigger_board_hangs_r() {
    translate([board_w,board_l,0])
    rotate([0,0,180])
    trigger_board_hangs();
}

function trigger_board_y_offset() = board_y_offset;