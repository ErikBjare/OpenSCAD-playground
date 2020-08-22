d_hole = 5;
hole_sep = 32;
hole_depth = 3;
wall_width = 1;

shelf_depth = 100;
fastener_loc = 25;

$fs = 1;
$fa = 5;

union() {
    translate([fastener_loc, 0, 0]) shelf();
    translate([0, 0, 5]) fastener();
}

module shelf() {
    length = 50;
    translate([0, length/2, 0]) cube([shelf_depth, length, wall_width], center=true);
}

module peg() {
    hull() {
        cylinder(hole_depth, d_hole/2, d_hole/2);
        translate([0, 0, hole_depth]) sphere(d_hole/2);
    }
}

module fastener() {
    translate([0, wall_width/2, hole_sep/2]) cube([10, wall_width, hole_sep+10], center=true);
    rotate([90, 0, 0]) union() {
        peg();
        translate([0, hole_sep, 0]) peg();
    }
}