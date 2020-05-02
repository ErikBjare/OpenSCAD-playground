/*
 * A simple holder for a bottle and pipette.
 *
 * Useful for storing small volumes of liquids together with a pipette. Useful for paint/coloring, extracts (such as from chili peppers), and solvents (just make sure your bottle is HDPE!).
 */

// Parameters
height = 15;        // Height of the holder
base_width = 35;    // Width of the base
bottle_width = 30;  // Inner diameter of the bottle hole
pipette_width = 5;  // Inner diameter of the pipette hole
rounding = 4;       // Outer diameter of pipette holder

// # Manual reference measurements
//
// 30ml HDPE bottle: Diameter ~30mm
// 1ml pipette: Cylinder diameter ~5mm, tip diameter: ?mm

// # First print
//
// 28mm bottle width was too tight. 
// 5mm pipette width fit the tip perfectly.

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
                cylinder(r=rounding, h=height);
        }
    
        // Hole in pipette holder
        translate([pipette_offset, pipette_offset, 2])
            cylinder(d=pipette_width, h=20);
    }
}
