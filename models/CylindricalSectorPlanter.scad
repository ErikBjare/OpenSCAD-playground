

// # Measurements of IKEA planter
// Height: 11cm
// Upper outer diameter: 14cm
// Upper inner diameter: 1cm
// Lower outer diameter: 11.5cm
// Lower inner diameter: 1.5cm

h = 110;
r_upper_outer = 140;
r_upper_inner = 10;
r_lower_outer = 115;
r_lower_inner = 15;
deg = 120;
sep_width = 5;

$fa = 3;
$fs = 0.1;


difference() {
    sink_tapered(h, r_upper_outer, r_upper_inner, r_lower_outer, r_lower_inner, deg, 0);
    //translate([0, 0, 1]) 
    //    sink_tapered(h, r_upper_outer-sep_width/2, r_upper_inner+sep_width/2, r_lower_outer-2, r_lower_inner+2, deg-sep_width, sep_width);
}

module sink_tapered(h, r_uo, r_ui, r_lo, r_li, deg_start, deg_end = 0)
    difference() {
        // Main part
        hull() {
            translate([0, 0, h]) sector(1, 2*r_uo, deg_start, deg_end);
            sector(1, 2*r_lo, deg_start, deg_end);
        }
        // Inner hole
        hull() {
            translate([0,0,h+0.1]) cylinder(h=1, d=2*r_ui);
            translate([0,0,-0.1]) cylinder(h=1, d=2*r_li);
        }
    }

module sink(h, r, r_inner, deg_start, deg_end = 0) {
    difference() {
        translate([0,0,0]) sector(h, 2*r, deg_start, deg_end);
        translate([0,0,-1]) cylinder(h=2*h, d=2*r_inner);
    }
}
//translate([22,0,0]) sector(30, 20, 300, 30);
//translate([0,22,0]) sector(30, 20, 30, 300);
//translate([22,22,0]) sector(30, 20, 10, 190);

module sector(h, d, a1, a2) {
    if (a2 - a1 > 180) {
        difference() {
            cylinder(h=h, d=d);
            translate([0,0,-0.5]) sector(h+1, d+1, a2-360, a1); 
        }
    } else {
        difference() {
            cylinder(h=h, d=d);
            rotate([0,0,a1]) translate([-d/2, -d/2, -0.5])
                cube([d, d/2, h+1]);
            rotate([0,0,a2]) translate([-d/2, 0, -0.5])
                cube([d, d/2, h+1]);
        }
    }
}  