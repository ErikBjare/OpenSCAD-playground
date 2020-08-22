top_width = 42;  // The inner width
bottom_width = 30;
depth = 12;
rounding = 1.8;
length = 152;  // The length of the *inset*
full_length = length + 2 * rounding;  // The full length

wing_length = 8;
wing_width = 10;
wing_thickness = rounding;

$fa = 10;
$fs = 0.2;

main();

module main() {
    // Front and back side
    translate([full_length/2, 0, 0]) frontback();
    translate([-full_length/2, 0, 0]) frontback();

    // Left and right side
    side();
    mirror([0, 1, 0]) side();

    // Bottom
    hull() {
        translate([0, bottom_width/2, -depth]) rod(full_length, rounding);
        translate([0, -bottom_width/2, -depth]) rod(full_length, rounding);
    }
}

module frontback() {
    hull() {
        translate([0, 0, 0]) rotate([0, 0, 90]) rod(top_width, rounding);
        translate([0, 0, -depth]) rotate([0, 0, 90]) rod(bottom_width, rounding);
    }
}

module wingpair() {
    translate([full_length/2-wing_width/2, top_width/2, rounding-wing_thickness]) {
        hull() {
            rod(wing_width, wing_thickness);
            translate([0, wing_length, 0])
                rod(wing_width, wing_thickness);
        }
    }
}

module side() {
    hull() {
        translate([0, top_width/2, 0]) rod(full_length, rounding);
        translate([0, bottom_width/2, -depth]) rod(full_length, rounding);
    }

    wingpair();
    mirror([1, 0, 0]) wingpair();
}

module rod(length, r) {
    hull() {
        translate([length/2, 0, 0]) sphere(r);
        translate([-length/2, 0, 0]) sphere(r);
    }
}
