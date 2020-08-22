difference() {
    // Foot base
    // Outer edge 40mm
    // Height 55mm
    cube([40, 40, 55], center=true);
    
    // The hole in the foot
    // 35mm sides (tv bench feet are 33mm, so 2mm clearance)
    // +27.5mm to be in the middle of the top of the cube
    // 10mm to make a 5mm deep hole
    translate([0, 0, 27.5])
        cube([35, 35, 10], center=true);
}