// Increase resolution a bit
$fa = 6;
$fs = 0.5;

extrude_height = 2;

module aperture() {
    translate([0, 0, extrude_height/2])
    intersection() {
        cylinder(d=50, h=extrude_height*2, center=true);
        for(shutter = [0,1,2,3,4,5,6,7]) {
            rotate([0, 0, shutter*360/8])
            translate([12, -2, 0])
            linear_extrude(height=extrude_height*1.01, center=true) {
                polygon(points=[[0, 0], [0, 50], [50, 50]]);
            }
        }
    }
}

module backplate() {
    height = 4;
    hull() {        
        for(corners = [[1, 1], [1, -1], [-1, 1], [-1, -1]]) {
            translate([95*corners[0], 25*corners[1], -height])
                cylinder(d=15, h=height);
        }
    }
}

union() {
    translate([-70, 0, 0])
        aperture();
    translate([-35, -10, 0])
        linear_extrude(extrude_height)
        text("Laboratory", 20);
    color("white")
        backplate();
}
