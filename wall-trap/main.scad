include <config/parameters.scad>
use <src/ramp/ramp.scad>


module sim_cut() {
    difference() {
        children();
        translate([-wall_h,-fix, -fix])
        cube([wall_h+fix,wall_w+fix*2,ramp_h+fix*2]);
    }
}

module sim_trig_wall(angle=90) {
    translate([0,0,ramp_h/2])
    rotate([0,angle,0])
    translate([0,0,-ramp_h/2])
    children();

}


//sim_cut()
ramp();
//sim_cut()
//sim_trig_wall(angle=90)
union() {
    wall();
    wall_wheel();
}
