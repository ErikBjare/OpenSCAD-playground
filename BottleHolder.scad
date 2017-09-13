/*
 * A simple holder for a bottle and pipette.
 *
 * Useful for storing small volumes of liquids such as paint/coloring, extracts (such as from chili peppers), and others.
 * 
 * Note: this is just a draft, a lot of stuff isn't correct.
 */

// Increase resolution a bit
$fa = 6;
$fs = 0.5;

module cross(width, height, crosswidth=1) {
    color("red")
    union() {
        translate([0, 0, height/2])
            cube([width, crosswidth, height], center=true);
        translate([0, 0, height/2])
            cube([crosswidth, width, height], center=true);
    }
}

module base(width, rounding) {
    hull() {
        for(corner = [0, 1, 2, 3]) {
            rotate([0, 0, corner*90])
            translate([width/2 - rounding, width/2 - rounding, 0])
                cylinder(r=rounding, h=2);
        }
    }
}

union() {
    height = 10;
    base_width = 20;
    bottle_width = 16; // TODO: Correct measurements to fit the bottles
    pipette_width = 3; // TODO: Correct measurements to fit the pipettes
    rounding = 2.5;
    
    difference() {
        pipette_offset = base_width/2 - rounding;
        
        union() {
            // Tube that holds bottle
            difference() {
                union() {
                    // Rounded rectangle base
                    base(base_width, rounding=rounding);
                    cylinder(d=base_width, h=height);
                }
                
                // Center hole where cross is placed
                cylinder(d=bottle_width, h=3*height, center=true);
            }
            
            // Bottom cross
            cross(1.05*bottle_width, 1, crosswidth=3);
    
            // Pipette holder in corner
            translate([pipette_offset, pipette_offset, 0])
                cylinder(r=rounding, h=10);
        }
    
        // Hole in pipette holder
        translate([pipette_offset, pipette_offset, 2])
            cylinder(d=pipette_width, h=20);
    }
}
