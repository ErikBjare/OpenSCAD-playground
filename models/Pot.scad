height = 35;
r_top = 20;
r_bottom = 15;
r_hole = 3;
wall = 2;
rim = 5;

$fs=1;

pot();

module pot() {
    difference() {
        bowl();
        //holes();
    }
}

module holes() {
    for(d = [0:120:360]) {
        rotate([0, 0, d])
        translate([r_bottom/2, 0, -1])
        union() {
            cylinder(rim, r_hole, r_hole);
            translate([r_bottom/2 - 3, 0, 1]) cube([10, 1, rim], center=true);
        }
    }
}

module bowl() {
    difference() {
        shell();
        r_inner_fac = (r_top - wall)/r_top;
        translate([0, 0, wall]) scale([r_inner_fac, r_inner_fac, 1]) shell();
    }
}

module shell() {
    hull() {
        union() {
            translate([0, 0, height]) cylinder(rim, r_top, r_top);
            cylinder(rim, r_bottom-1, r_bottom+1);
        }
    }
}
