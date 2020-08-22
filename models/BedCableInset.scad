inner_r = 4;
outer_r = 18;
top_r = 25;
top_h = 2;
bottom_h = 8;

$fs=1;
$fa=5;

module ring(h, inner_r, outer_r, slant=0) {
    difference() {
        cylinder(h, outer_r, outer_r-slant);
        translate([0,0,-1]) cylinder(h+2, inner_r, inner_r);
    }
}


difference() {
    union() {
        ring(bottom_h, outer_r-2, outer_r);
        translate([0, 0, bottom_h]) ring(top_h, inner_r, top_r, slant=2);
    }
    translate([20, 0, 0]) cube([40, 50, 50], center=true);
}