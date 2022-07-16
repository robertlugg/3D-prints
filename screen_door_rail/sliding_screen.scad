// Improve the back sliding screen doors

echo(version=version());

$fa = 8; $fs = 0.4;
eps = .001;
nozzle = 0.8; // 0.4mm
step = 0.18; // 0.12mm



module body () {
    translate([2, 0, 0]) cube([9.8, 80, 12]); // base
    translate([0, 0, 12]) cube([12.8, 80, 2]); // top jut
    translate([2, 80+eps, 5]) rotate([90, 0, 0]) cylinder(d=1, 80+2*eps); // side rail
    translate([11.8, 80+eps, 5]) rotate([90, 0, 0]) cylinder(d=1, 80+2*eps); // side rail
}

difference () {
    body();
    translate([0, 20, 5]) rotate([0, 90, 0]) cylinder(d=2, 14); // side screw hole
    translate([0, 60, 5]) rotate([0, 90, 0]) cylinder(d=2, 14); // side screw hole
}

module cone () {
    difference () {
        intersection () {
            translate([-10, 0, -3]) rotate([-90, 0, 0]) cylinder(r=16.7, 80);
            translate([10, 0, -3]) rotate([-90, 0, 0]) cylinder(r=16.7, 80);
        }
        translate([-100/2, -eps, -100]) cube([100, 80+2*eps, 100]);
    }
}


difference () {
    translate([6.4, 0, 14]) cone();
    translate([-2, -3, 14]) rotate([30, 0, 0])  cube([16, 25, 15]);
    translate([-2, 83, 14]) rotate([60, 0, 0])  cube([16, 25, 25]);
}





// translate([0, 0, 14]) cube([12.8, 80, 10]);
//module long_bar () {
//    translate([-2, -80, 0]) cube([4, 80, 1.8]); // horizontal brace
//    translate([-0.8, -80, 0]) cube([1.6, 80, 3.96]); // Vertical brace
//    translate([-2, -10, 0]) cube([4, 10, 3.96]); // rectangele support at top.
//}
//
//module stake () {
//    difference () {
//        long_bar();
//        translate([-5, -80, 0]) rotate([30, 0, 0])  cube([10, 10, 10]); // Angle cut.
//    }
//}
//
//// Top structure
//module top_structure () {
//    difference () {
//        translate([0, 20, 0]) cylinder(3.96, r=20);
//        translate([0, 20, 0-eps]) cylinder(3.96+eps*2, r=16);
//        translate([-22.4-20, 15, 0-eps]) cube([(22.4+20)*2, 25, 3.96+eps*2]);
//    }
//}
//
//module part () {
//    stake();
//    top_structure();
//}
//
//module two_parts () {
//    part();
//    translate([10, -90, 0]) rotate([0, 0, 180]) part();
//}
//
//module four_parts () {
//    two_parts();
//    translate([25, 20, 0]) two_parts();
//}
//
//part();
////four_parts();