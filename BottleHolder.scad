// Increase resolution a bit
$fa = 6;
$fs = 0.5;

module cross(width, height, crosswidth=1) {
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
            translate([10, 0, 0])
            cylinder(d=10, h=2);
        }
    }
}

module pipettholder() {
    difference() {
        cylinder(r=3, h=10);
        translate([0, 0, 10])
            cylinder(r=2, h=20, center=true);
    }
}

union() {
    translate([8.5, 8.5, 0])
        pipettholder();
    
    difference() {
        union() {
            base();
            cylinder(d=20, h=10);
        }
        cylinder(d=18, h=30, center=true);
    }
    
    cross(19.5, 1, crosswidth=3);
}
