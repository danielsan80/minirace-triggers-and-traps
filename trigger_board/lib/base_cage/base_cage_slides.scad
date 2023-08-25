use <../../vendor/cage/src/cage/cage.scad>
use <../../vendor/cage/src/slides/slides.scad>


module base_cage_slide_left_cut(void=true) {
    slide_left_cut(void=void);
}

module base_cage_slide_top_cut(void=true) {
    slide_top_cut(void=void);
}

module base_cage_slide_left_fix() {
    slide_left_fix();
}