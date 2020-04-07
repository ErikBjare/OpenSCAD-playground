$fa=0.5;   // minimum angle for a fragment
$fs=0.5; // minimum size for a fragment
txt="−   •   • − •   • − • •   • −";
length=50;
height=3;
thickness=1;

// I've looked for ways to bend this such that it would look nice on a wrist 
// or as a neclace, but someone suggested it might be easier to just bend it 
// in the oven (which would also yield a stronger part).
textband(txt, length, height, thickness);

module donut(r1, r2){
    rotate_extrude($fn=50)
    translate([r1, 0, 0])
    circle(r = r2);
}

// A disc with rounded edges
module plate(r, thickness) {
    union() {
        donut(r, thickness);
        cylinder(r=r, h=thickness);
    }
}

module band(width, height, thickness) {
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

module textband(txt, width, height, thickness) {
    difference() {
        // You can find a morse table at:
        //   http://ascii-table.com/morse-code.php
        band(width, height, thickness);
        scale([0.8, 0.8, 1.2*thickness]) {
            translate([0, -0.6, 0]) {
                text(txt, height*1.5, valign="center", halign="center");
            }
        }
    }
}