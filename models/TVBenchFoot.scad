difference() {
    // Foot base
    cube([50, 50, 150], center=true);
    
    // The hole in the foot
    translate([0, 0, 100])
        cube([40, 40, 100], center=true);
}