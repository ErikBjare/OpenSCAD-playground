$fa=0.2;
$fs=0.2;

module donut(r1, r2){
    rotate_extrude($fn=50)
    translate([r1, 0, 0])
    circle(r = r2);
}

module plate(r, thickness) {
    union() {
        donut(r, thickness);
        cylinder(r=r, h=thickness);
    }
}

// Original strip, has some sharp edges
module strip(width, height, thickness) {
    union() {
        translate([width / 2, 0, 0]) {
            cylinder(r=height/2, thickness, center=true);
        }
        resize([width, height, thickness]) {
            cube(center=true);
        }
        translate([-width / 2, 0, 0]) {
            cylinder(r=height/2, thickness, center=true);
        }
    }
}

module stripsmooth(width, height, thickness) {
    hull() {
        translate([width / 2, 0, 0]) {
            plate(height/2, thickness/2);
        }
        resize([width, height, thickness]) {
            cube(center=true);
        }
        translate([-width / 2, 0, 0]) {
            plate(height/2, thickness/2);
        }
    }
}

module textstrip(txt, width, height, thickness) {
    difference() {
        // You can find a morse table at:
        //   http://ascii-table.com/morse-code.php
        stripsmooth(width, height, thickness);
        scale([0.8, 0.8, 1.2*thickness]) {
            translate([0, -0.6, 0]) {
                text(txt, height*1.5, valign="center", halign="center");
            }
        }
    }
}

union() {
    // I've looked for ways to bend this such that it would look nice on a wrist or as a neclace, but someone suggested it might be easier to just bend it in the oven (which would also yield a stronger part).
    textstrip("−   •   • − •   • − • •   • −", 50, 3, 1);
}
