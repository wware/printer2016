// Aquarium
cube([18.5*25.4, 10.5*25.4, 0.25*25.4]);
%color([0.7, 0.9, 0.9, 0.3]) {
    cube([18.5*25.4, 0.25*25.4, 13*25.4]);
    translate([0, (10.5-0.25)*25.4, 0]) cube([18.5*25.4, 0.25*25.4, 13*25.4]);
    cube([0.25*25.4, 10.5*25.4, 13*25.4]);
    translate([(18.5-0.25)*25.4, 0, 0]) cube([0.25*25.4, 10.5*25.4, 13*25.4]);
}

// Resin floating on salt water
color([0.3, 0.9, 0.5]) {
    translate([0.25*25.4, 0.25*25.4, 8*25.4]) cube([18.0*25.4, 10.0*25.4, 1*25.4]);
}

module baseblock() {
    color([1, 0, 0]) {
        translate([1*25.4, -0.5*25.4, (13-1)*25.4])
        cube([3*25.4, 2*25.4, 2*25.4]);
    }
}

baseblock();
translate([0, (10.5-1.5)*25.4, 0]) baseblock();
translate([13.5*25.4, 0, 0]) {
    baseblock();
    translate([0, (10.5-1.5)*25.4, 0]) baseblock();
}

module threadedrod(L) {
    color([0, 0, 1]) {
        cylinder(d=0.25*25.4, h=L);
    }
}

module drivenrod(L) {
    color([0, 0.8, 1]) {
        // stepper motors at the tops
        translate([0, 0, (L-0.01)])
            cylinder(d=2*25.4, h=2.2*25.4);
    }
    threadedrod(L);
}

translate([3*25.4, 0.75*25.4, 0.5*25.4])
    drivenrod(24*25.4);
translate([3*25.4, (10-0.75)*25.4, 0.5*25.4])
    drivenrod(24*25.4);
translate([13*25.4, 0, 0]) {
    translate([2.5*25.4, 0.75*25.4, 0.5*25.4])
        drivenrod(24*25.4);
    translate([2.5*25.4, (10-0.75)*25.4, 0.5*25.4])
        drivenrod(24*25.4);
}
