/*
 * A simple holder for a bottle and pipette.
 *
 * Useful for storing small volumes of liquids such as paint/coloring, extracts (such as from chili peppers), and others.
 * 
 * Note: this is just a draft, a lot of stuff isn't correct.
 */
 
// TODO: Correct measurements to fit these bottles

// Increase resolution a bit
$fa = 6;
$fs = 0.5;

height = 10;
base_width = 50;
bottle_width = 15;

pipette_width = 2;

module cross(width, height, crosswidth=1) {
    color("red")
    union() {
        translate([0, 0, height/2])
            cube([width, crosswidth, height], center=true);
        translate([0, 0, height/2])
            cube([crosswidth, width, height], center=true);
    }
}

module base() {
    hull() {
        rotate([0, 0, 45])
        for(corner = [0, 1, 2, 3]) {
            rotate([0, 0, corner*90])
            translate([base_width/2, 0, 0])
            cylinder(d=10, h=2);
        }
    }
}

module pipettholder() {
    difference() {
        cylinder(r=pipette_width+1, h=height);
        translate([0, 0, 10])
            cylinder(r=pipette_width, h=height, center=true);
    }
}

union() {
    a = bottle_width + (base_width - bottle_width)/2;
    translate([2*sqrt(a), 2*sqrt(a), 0])
        pipettholder();
    
    difference() {
        union() {
            base();
            cylinder(d=bottle_width+4, h=height);
        }
        cylinder(d=bottle_width, h=2*height + 10, center=true);
    }
    
    cross(19.5, 1, crosswidth=3);
}
