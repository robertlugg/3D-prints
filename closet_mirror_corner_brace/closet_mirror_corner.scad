// Block
// Width is 7.5mm
// Fatten center width to 4.  15-3=12/2=6

$fa = 8; $fs = 0.4;
eps = .001;


module case () {
    difference () {
        union () {
            color("red") cube([76, 15, 50]); // The main cube
            // Little blockers on bottom
            translate([20, -2, 0]) cube([10, 2, 3]);
            translate([46, -2, 0]) cube([10, 2, 3]);
        }
        translate([3, 0-eps, 3]) color("blue") cube([70, 6, 44]); // Front big opening
        translate([3, 9+eps, 3]) color("blue") cube([70, 6, 44]); // Back big opening
    }
}


module ramp_front_bottom() {
    difference () {
        cube([76 - 6, 4.5, 4.5]);
        translate([-eps, 0, 0]) rotate(a=[45, 0, 0]) cube([76 - 6 + 2 * eps, 4.5 * sqrt(2), 4.5 * sqrt(2)]);
    }
}


module ramps(mod=0) {
    translate([3, 1.5, 3]) ramp_front_bottom();
    translate([73, 15, 3]) rotate(a=[0, 0, 180]) ramp_front_bottom();
    translate([73, 1.5, 47]) rotate(a=[0, 180, 0]) ramp_front_bottom();
    translate([3, 15, 47]) rotate(a=[0, 180, 180]) ramp_front_bottom();
}


module solids() {
    case();
    ramps();
    hull () { // Large mount for large openings on top
        translate([25, 7.5, 25]) cylinder(25+eps, d=14, center=false);
        translate([51, 7.5, 25]) cylinder(25+eps, d=14, center=false);
    }
    // Forward screw pillars
    translate([12, 1.5, 25]) rotate(a=[-90, 0, 0]) cylinder(13.5+eps, d=9, center=false);  // Left
        translate([64, 1.5, 25]) rotate(a=[-90, 0, 0]) cylinder(13.5+eps, d=9, center=false);  // Right
    // Top screw pillars
    translate([6.5, 7.5,-eps]) cylinder(50, d=7, center=false, $fn=6); // Left
    translate([38, 7.5, -eps]) cylinder(50, d=7, center=false, $fn=6); // Center
    translate([69.5, 7.5, -eps]) cylinder(50, d=7, center=false, $fn=6); // Right
}

translate([0, 0, 0]) {
    difference() {
        solids();
        // Thickness (Y) of block is 15 in center but 13.5 on edges
        translate([-eps, -eps, -eps]) cube([20+2*eps, 1.5+2*eps, 50+2*eps]);
        translate([56-eps, 0-eps, 0-eps]) cube([20+2*eps, 1.5+2*eps, 50+2*eps]);
        // Large top openings
        translate([25, 7.5, 10]) cylinder(40 + 2 * eps, d=12, center=false);  // left
        translate([51, 7.5, 10]) cylinder(40 + 2 * eps, d=12, center=false);  // right
        // Three top screw opening
        // Top screw pillars - openings
        //left
        translate([6.5, 7.5, 0-eps]) cylinder(50+2*eps, d=3, center=false);
        translate([6.5, 7.5, 48]) cylinder(2+eps, d1=3, d2=7, center=false);
        //center
        translate([38, 7.5, 0-eps]) cylinder(50+2*eps, d=3, center=false);
        translate([38, 7.5, 48]) cylinder(2+2*eps, d1=3, d2=7, center=false);
        //right
        translate([69.5, 7.5, 0-eps]) cylinder(50+2*eps, d=3, center=false);
        translate([69.5, 7.5, 48]) cylinder(2+eps, d1=3, d2=7, center=false);
        // Two forward-facing screw openings
        translate([12, 1.5-eps, 25]) rotate(a=[-90, 0, 0]) cylinder(13.5+3*eps, d=2.5, center=false);
        translate([12, 1.5-eps, 25]) rotate(a=[-90, 0, 0]) cylinder(2+2*eps, d1=5.0, d2=2.5, center=false);
        translate([64, 1.5-eps, 25]) rotate(a=[-90, 0, 0]) cylinder(13.5+3*eps, d=2.5, center=false);
        translate([64, 1.5-eps, 25]) rotate(a=[-90, 0, 0]) cylinder(2+2*eps, d1=5.0, d2=2.5, center=false);
    }
}
