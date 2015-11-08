// Dimensions are in millimeters.
INCH = 25.4;
AQUARIUM_LENGTH = 18.5 * INCH;
AQUARIUM_WIDTH = 10.5 * INCH;
AQUARIUM_HEIGHT = 13 * INCH;
GLASS_THICKNESS = 0.25 * INCH;
SURFACE_HEIGHT = 9 * INCH;
RESIN_DEPTH = 1 * INCH;

BLOCK_LENGTH = 4 * INCH;
BLOCK_WIDTH = 2 * INCH;
BLOCK_HEIGHT = 2 * INCH;

STEPPER_GAP = 8 * INCH;
SUPPORT_LENGTH = AQUARIUM_LENGTH - 1 * INCH;

module dual_x() {
    for (i = [0 : 1 : $children-1]) {
        children(i);
        mirror([1, 0, 0]) children(i);
    }
}

module dual_y() {
    for (i = [0 : 1 : $children-1]) {
        children(i);
        mirror([0, 1, 0]) children(i);
    }
}

module quad() {
    for (i = [0 : 1 : $children-1]) {
        dual_x()
            dual_y()
                children(i);
    }
}

// Aquarium

translate([-.5 * AQUARIUM_LENGTH, -.5 * AQUARIUM_WIDTH, 0])
    cube([AQUARIUM_LENGTH, AQUARIUM_WIDTH, GLASS_THICKNESS]);
%color([0.7, 0.9, 0.9, 0.3]) {
    dual_y()
        translate([-.5 * AQUARIUM_LENGTH, -.5 * AQUARIUM_WIDTH - GLASS_THICKNESS, 0])
            cube([AQUARIUM_LENGTH, GLASS_THICKNESS, AQUARIUM_HEIGHT]);
    dual_x()
        translate([-.5 * AQUARIUM_LENGTH - GLASS_THICKNESS, -.5 * AQUARIUM_WIDTH, 0])
            cube([GLASS_THICKNESS, AQUARIUM_WIDTH, AQUARIUM_HEIGHT]);
}

// Resin floating on salt water
color([0.3, 0.9, 0.5]) {
    translate([-.5 * AQUARIUM_LENGTH + GLASS_THICKNESS,
               -.5 * AQUARIUM_WIDTH + GLASS_THICKNESS,
               SURFACE_HEIGHT - RESIN_DEPTH])
        cube([AQUARIUM_LENGTH - 2 * GLASS_THICKNESS,
              AQUARIUM_WIDTH - 2 * GLASS_THICKNESS,
              RESIN_DEPTH]);
}

translate([0, 0, AQUARIUM_HEIGHT + .5 * STEPPER_GAP]) {
    rotate([45, 0, 0]) {
        // Mirror support
        color([1, 0, 0])
            translate([-2 * INCH, -1 * INCH, 0.25 * INCH])
                cube([4 * INCH, 2 * INCH, 1 * INCH]);
        translate([-.5 * (AQUARIUM_LENGTH - 4 * INCH), 0.5 * INCH, 0.75 * INCH])
            rotate([0, 90, 0])
                threadedrod(AQUARIUM_LENGTH - 4 * INCH);
        translate([-.5 * (AQUARIUM_LENGTH - 4 * INCH), -0.5 * INCH, 0.75 * INCH])
            rotate([0, 90, 0])
                threadedrod(AQUARIUM_LENGTH - 4 * INCH);

        // Mirror
        color([0, 0.8, 1])
            translate([-4 * INCH, -3 * INCH, 0])
                cube([8 * INCH, 6 * INCH, 0.25 * INCH]);
    }
}

dual_x() {
    color([1, 0, 0]) {
        translate([.5 * AQUARIUM_LENGTH - 4 * INCH,
                   -1.5 * INCH,
                   AQUARIUM_HEIGHT + .5 * STEPPER_GAP - 0.5 * INCH])
            cube([1.5 * INCH, 2 * INCH, 2 * INCH]);
    }
}



module baseblock() {
    color([1, 0, 0]) {
        translate([-0.5 * BLOCK_LENGTH,
                   -0.5 * BLOCK_WIDTH,
                   -0.5 * BLOCK_HEIGHT])
            cube([BLOCK_LENGTH, BLOCK_WIDTH, BLOCK_HEIGHT]);
    }
}

module threadedrod(L) {
    color([0, 0, 1]) {
        cylinder(d=0.25 * INCH, h=L);
    }
}

module stepper() {
    color([0, 0.8, 1]) {
        cylinder(d=2*INCH, h=1.75*INCH);
        translate([-1 * INCH, -1 * INCH, 0])
            cube([2 * INCH, 2 * INCH, 0.25 * INCH]);
    }
}


dual_y() {
    translate([-.5 * (AQUARIUM_LENGTH - 5 * INCH),
               .5 * (AQUARIUM_WIDTH + 0.75 * INCH),
               AQUARIUM_HEIGHT + STEPPER_GAP - 1 * INCH])
        rotate([0, 90, 0])
            threadedrod(AQUARIUM_LENGTH - 5 * INCH);
}

dual_x() {
    translate([.5 * AQUARIUM_HEIGHT - .75 * INCH,
               .5 * (AQUARIUM_WIDTH + 3 * INCH),
               AQUARIUM_HEIGHT + STEPPER_GAP - 0.5 * INCH])
        rotate([90, 0, 0])
            threadedrod(AQUARIUM_WIDTH + 3 * INCH);
}

color([1, 0, 0])
    quad() {
        translate([.5 * AQUARIUM_WIDTH - 0.5 * INCH,
                   AQUARIUM_WIDTH / 2 - 1.75 * INCH,
                   AQUARIUM_HEIGHT + STEPPER_GAP - .5 * INCH])
            cube([3.5 * INCH,
                  2.75 * INCH,
                  .5 * INCH]);
        translate([.5 * AQUARIUM_WIDTH - 0.5 * INCH,
                   AQUARIUM_WIDTH / 2 - 1.75 * INCH,
                   AQUARIUM_HEIGHT + STEPPER_GAP - 1.5 * INCH])
            cube([1.5 * INCH,
                  2.75 * INCH,
                  1.5 * INCH]);
    }

quad() {
    translate([.5 * AQUARIUM_LENGTH - 3 * INCH,
               .5 * AQUARIUM_WIDTH - 0.5 * INCH,
               AQUARIUM_HEIGHT])
        baseblock();
    translate([.5 * AQUARIUM_LENGTH - 2 * INCH,
               .5 * AQUARIUM_WIDTH - 0.75 * INCH,
               .5 * INCH])
        threadedrod(AQUARIUM_HEIGHT + STEPPER_GAP - 0.45 * INCH);
    translate([.5 * AQUARIUM_LENGTH - 2 * INCH,
               .5 * AQUARIUM_WIDTH - 0.75 * INCH,
               AQUARIUM_HEIGHT + STEPPER_GAP])
        stepper();
    translate([.5 * AQUARIUM_LENGTH - 4 * INCH,
               .5 * AQUARIUM_WIDTH - 0.75 * INCH,
               AQUARIUM_HEIGHT - 1.5 * INCH])
        threadedrod(STEPPER_GAP + 2.25 * INCH);
}
