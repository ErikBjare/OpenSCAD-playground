innerbottom = 8;
outerbottom = 10;
wall = (outerbottom-innerbottom)/2;
raiseheight = 2;

difference() {
    scale([1, 1, 0.5])
        cube(outerbottom);
    translate([1, 1, 1 + (raiseheight)])
        cube(innerbottom);
}