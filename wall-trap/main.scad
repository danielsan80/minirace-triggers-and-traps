include <config/parameters.scad>
use <src/ramp/ramp.scad>


module sim_cut() {
    difference() {
        children();
        translate([-wall_h,-fix, -fix])
        cube([wall_h+fix,wall_w+fix*2,ramp_h+fix*2]);
    }
}


//sim_cut()
ramp();
//sim_cut()
wall();