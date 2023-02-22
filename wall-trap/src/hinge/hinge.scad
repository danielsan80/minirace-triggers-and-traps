include <../../config/parameters.scad>

function _is_first(i,n) = i==0;
function _is_last(i,n) = i==n-1;
function _is_odd(i) = i%2 == 1;
function _is_even(i) = i%2 == 0;

module hinge_chunk_cone(type="solid", dir= "up", r) {
    assert(type=="solid" || type=="void");
    assert(dir=="up" || dir=="down");
    
    gap = hinge_chunk_gap;
    margin = hinge_chunk_cone_margin;
    
    module cone_solid() {
        r1 = r - margin - gap/2*sin(45);
        r2 = hinge_chunk_cone_r2 - gap/2*sin(45);
        h = r1-r2;
        
        translate([0,0,-gap/2+fix])
        cylinder(r1=r1, r2=r2, h=h);
    }
    
    module cone_void() {
        r1 = r - margin + gap/2*sin(45);
        r2 = hinge_chunk_cone_r2 + gap/2*sin(45);
        h = r1-r2;
        
    
        translate([0,0,gap/2-fix])
        cylinder(r1=r1, r2=r2, h=h);
    }
    
    if (type=="solid") {
        if (dir=="up") {
            cone_solid();
        }
        if (dir=="down") {
            rotate([180,0,0])
            cone_solid();
        }
    }

    if (type=="void") {
        if (dir=="up") {
            cone_void();
        }
        if (dir=="down") {
            rotate([180,0,0])
            cone_void();
        }
    }
}

module hinge_chunk(side="A", l, r, i, n) {
    assert(side=="A" || side=="B");
    assert(_is_odd(n));
 
    if (side=="A") {
        if (_is_even(i)) {
            difference() {
                cylinder(r=r, h=l/n, center=true);
                
                if (!_is_first(i, n)) {
                    translate([0,0,-l/n/2])
                    cylinder(r=r+fix, h=hinge_chunk_gap, center=true);
                }
                
                if (!_is_last(i, n)) {
                    translate([0,0,l/n/2])
                    cylinder(r=r+fix, h=hinge_chunk_gap, center=true);
                    
                }
            }
            if (!_is_first(i, n)) {
                translate([0, 0, fix])
                translate([0, 0, -l/n/2])
                hinge_chunk_cone(type="solid", dir="down", r=r);
            }
            if (!_is_last(i, n)) {
                translate([0, 0, -fix])
                translate([0,0, l/n/2])
                hinge_chunk_cone(type="solid", dir="up", r=r);
            }
            
        }
    }
    
    if (side=="B") {
        if (_is_odd(i)) {
            difference() {
                cylinder(r=r, h=l/n, center=true);

                translate([0,0,-l/n/2])
                cylinder(r=r+fix, h=hinge_chunk_gap, center=true);

                translate([0,0,l/n/2])
                cylinder(r=r+fix, h=hinge_chunk_gap, center=true);
    
                translate([0,0,-l/n/2])
                hinge_chunk_cone(type="void", dir="up", r=r);
    
                translate([0,0,l/n/2])
                hinge_chunk_cone(type="void", dir="down", r=r);
            }
        }
    }
}

module hinge_chunk_void(side="A", l, r, i, n, cut_angle) {
    assert(side=="A" || side=="B");
    assert(_is_odd(n));
    
    gap = hinge_chunk_gap;
    
    if (side=="A") {
        if (_is_even(i)) {
            hull() {
                cylinder(r=r+gap, h=l/n+gap, center=true);
                
                rotate([0,0,cut_angle])
                translate([r,0,0])
                cylinder(r=r+gap, h=l/n+gap, center=true);
            }
            
            translate([0,0,l/n/2])
            hinge_chunk_cone(type="void", dir="up", r=r);
    
            translate([0,0,-l/n/2])
            hinge_chunk_cone(type="void", dir="down", r=r);
        }
    }
    
    if (side=="B") {
        if (_is_odd(i)) {
            hull() {
                cylinder(r = r + gap, h = l / n + gap, center = true);
                
                rotate([0, 0, cut_angle])
                translate([r, 0, 0])
                cylinder(r = r + gap, h = l / n + gap, center = true);
            }
        }
    }
}




module hinge(side="A", l, r, n) {
    assert(side=="A" || side=="B");
    assert(_is_odd(n));

    for(i=[0:n-1]) {
        translate([0,0,i*l/n])
        translate([0,0,-l/2+l/n/2])
        hinge_chunk(side=side, l=l, r=r, i=i, n=n);
    }
}

module hinge_void(side="A", l, r, n, cut_angle) {
    assert(side=="A" || side=="B");
    assert(_is_odd(n));
    
    for(i=[0:n-1]) {
        translate([0,0,i*l/n])
        translate([0,0,-l/2+l/n/2])
        hinge_chunk_void(side=side, l=l, r=r, i=i, n=n, cut_angle=cut_angle);
    }
}

module sim_hinge_cut() {
    difference() {
        children();
        translate([-a_lot/2,-wall_l, -a_lot/2])
        cube([a_lot,wall_l,a_lot]);
    }
}

