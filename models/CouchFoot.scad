// All except two of the feet are roughly 50x50mm
// The two outliers have a width of ~70x60mm

innerbottom = 70;
outer_top = 80;
outer_bottom = 70;
wall = (outer_bottom - innerbottom)/2;
t = (outer_top - outer_bottom)/2;
ledgeheight = 5;
raiseheight = 10;
totalheight = ledgeheight + raiseheight;

module roundcube() {
    union() {
        for(i = [1:4]) {
            sphere(10);
        }
    }
}

module main() {
    difference() {
        hull() {
            translate([0, 0, totalheight]) cube([outer_top, outer_top, 2], center=true);
            cube([outer_bottom, outer_bottom, 2], center=true);
        }
        //translate([wall, wall, 50/2 + raiseheight])
        //    cube([innerbottom, innerbottom, 50], center=true);
    }
}

module mainbevel() {
    intersection() {
        main();
        scale([sqrt(2)*0.95, sqrt(2)*0.95, 1])
        rotate([0, 0, 45])
            hull () {
                main();
            };
    }
}

difference () {
    mainbevel();
    translate([wall, wall, raiseheight])
        mainbevel();
}
