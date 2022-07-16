// Ground stakes to support strawberries and keep slugs away.

echo(version=version());

$fa = 8; $fs = 0.4;
eps = .001;
nozzle = 0.8; // 0.4mm
step = 0.18; // 0.12mm

module body () {
    hull () {
        cube([11, 8, 0.1]);
        translate([2, 2, 3]) sphere(d=4);
        translate([2, 6, 3]) sphere(d=4);
        translate([9, 2, 3]) sphere(d=4);
        translate([9, 6, 3]) sphere(d=4);
    };
}

points  = [
    [0, 0, 0],
    [20, 0, 0],
    [20, -2, 5],
    [0, -2, 5],
    [20, 2, 5],
    [0, 2, 5]
];

surfaces = [
    [0, 1, 2, 3],
    [0, 1, 4, 5]
];

module cut () {
    hull () polyhedron(points, surfaces);
}

difference () {
    body();
    color("blue") translate([0, 4, 2]) rotate([0, 0,-45]) cut();
    color("blue") translate([0, 15, 2]) rotate([0, 0,-45]) cut();
    color("blue") translate([0,  4, 2]) rotate([0, 0, 45]) cut();
    color("blue") translate([0, -7, 2]) rotate([0, 0, 45]) cut();
    color("red") translate([0, 4, 2]) cut();
    color("red") translate([11/2, 0, 2]) rotate([0, 0, 90]) cut();
}


//difference () {
//    body();
//    translate([-5, 5+3*1.414, 2]) {
//        rotate([0, 0,-45]) {
//            hull () polyhedron(points, surfaces)
//        }
//    };
//};
//translate([5, 5, 0]) sphere(d=5*2);
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