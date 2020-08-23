// This design is intended to be put under the
// feet of a TV bench (or similar) to raise it.

// Total height of foot
height = 55;

// Outer width of foot
outer = 38.5;

// Width of the bench foot to extend (assuming square foot)
benchfoot_w = 33;

// Margin for foot
clearance = 0.5;

module main() {
    difference() {
        // Foot base
        // Outer edge 40mm
        // Height 55mm
        cube([outer, outer, height], center=true);

        // The hole in the foot
        // 35mm sides (tv bench feet are 33mm, so 2mm clearance)
        // +27.5mm to be in the middle of the top of the cube
        // 10mm to make a 5mm deep hole
        translate([0, 0, height/2])
            cube([benchfoot_w + clearance,
                  benchfoot_w + clearance, 10], center=true);
    }
}

// This adds some chamfer to the sides
intersection() {
    main();
    rotate([0, 0, 45]) scale([1.35, 1.35, 2]) main();
}
