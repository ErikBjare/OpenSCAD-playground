color_metal = [0.8, 0.8, 0.8, 1];
color_glass = [1, 1, 1, 0.5];

module cupola(r=100) {
    difference() {
        sphere(r=r);
        sphere(r=r*0.98);
        translate([0, 0, -50])
            cube([3*r, 3*r, r], center=true);
    }
}

module cupola_half() {
    difference() {
        cupola();
        translate([0, 100, 0])
            cube([200, 200, 200], center=true);
    }
}

module cupola_quarter() {
    difference() {
        cupola_half();
        rotate([0, 0, 90])
            translate([0, 100, 0])
                cube([200, 200, 200], center=true);
    }
}

module cupola_twelveth() {
    difference() {
        cupola_quarter();
        rotate([0, 0, 90+60])
            translate([0, 100, 0])
                cube([200, 200, 200], center=true);
    }
}

module gate_door(closed_factor) {
    for(i = [0:3]) {
        scale(pow(0.97, i))
            rotate([0, 0, -20*i*closed_factor])
                cupola_twelveth();
    }
}

module halfpipe() {
    rotate([0, 270, 90])
    difference() {
        cylinder(r=100, h=100);
        cylinder(r=95, h=300, center=true);
        translate([-50, 0, 50]) 
            cube([100, 400, 400], center=true);
    }
}

module gate(closed_factor=0.5) {
    // Center
    hull() {
        translate([0, 0, 100]) sphere(r=5);
        translate([0, 0, 85]) sphere(r=3);
        //translate([0, 0, 90]) cylinder(r=5, h=10);
    }
    cylinder(r=3, h=90);
    
    gate_door(closed_factor);
    mirror() gate_door(closed_factor);
}

union() {
    
    progress = (min(2, max(1, 3*$t)) - 1);
    
    color(color_glass)
        gate(closed_factor=progress);
    
    color(color_metal)
        translate([0, 100, 0]) scale(1.01) halfpipe();
}