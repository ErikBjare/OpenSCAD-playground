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

extrude_height = 3;

module aperture() {
    translate([0, 0, extrude_height/2])
    intersection() {
        cylinder(d=50, h=extrude_height*2, center=true);
        for(shutter = [0,1,2,3,4,5,6,7]) {
            rotate([0, 0, shutter*360/8])
            translate([10, 0, 0])
            linear_extrude(height=extrude_height*1.01, center=true) {
                polygon(points=[[0, 0], [0, 50], [50, 50]]);
            }
        }
    }
}

union() {
    color("white")
        translate([0, 0, -2.5])
        cube([220, 70, 5], center=true);
    translate([-70, 0, 0])
        aperture();
    translate([-35, -10, 0])
        linear_extrude(extrude_height)
        text("Laboratory", 20);
}
