// Wall mount for CMKY -> HMDI converter
//
// Box dimensions 4 1/2 by 3 1/2 by 1"

$fa = 8; $fs = 0.4;
eps = .001;

length = 82.5;  // 3.50 * 25.4;
height = 109.0; // 4.50 * 25.4;
depth = 22.5; // 1.00 * 25.4;


// The object (for reference
// translate([0, -depth, 0]) color("blue") cube([length, depth, height]);


// bottom lip
module bottom_lip () {
    // Long bar
    translate([-3.4, -5.6, -3.6]) cube([length + 3 + 3, 8, 3.6]);
    // Left
    translate([-3.4,         -depth - 3.4, -3.6]) cube([7.4, depth + 5.8, 3.6]);
    // Right
    translate([length - 4, -depth - 3.4, -3.6]) cube([7.4, depth + 5.8, 3.6]);
}

//Front lip
module front_lip () {
    // left
    translate([-3, -depth - 3.4, -2]) cube([5, 2.4, height + 6]);
    // right
    translate([length - 2, -depth - 3.4, -2]) cube([5.4, 2.4, height + 6]);
}


module back () {
    translate([-3, 0, -2.8]) cube([length + 6, 2.4, height + 6.8]);

}

module sides () {
    translate([-3.4,         -depth - 3.4, -2.4]) cube([2.4, depth + 5.8, height + 6.4]);
    translate([length + 1.4, -depth - 3.4, -2.4]) cube([2.4, depth + 5.8, height + 6.4]);
}

module nubs () {
    translate([-1, (-depth - 3.4)/2, -2.4]) cylinder(r=1, h=height);
    translate([length + 1.4, (-depth - 3.4)/2, -2.4]) cylinder(r=1, h=height);
}

//main
bottom_lip();
front_lip();
back();
sides();
nubs();


/*
Second design changes

Solid frame instead of one cut-out
expand face screw holes from 2.5 to 3.5
expand face screw holes from 2.5 to 3.5
Created air holes at the bottom of the large top openings to avoid vacuum
*/


// translate([20, 0, 20]) color([1,0,0]) cube([.8, .8, .8]);

//module case2 () {
//    union () {
//        color("red") cube([76, 15, 50]); // The main cube
//        // Widest section
//        translate([20, -4, 0]) cube([36, 4, 28]);
//        // github
//        rotate(a=[90]) {
//            translate([22, 20, 2]) { color([0, 0, 1.0]) {
//                linear_extrude(height=3.5) text("github/",
//                     font = "Liberation Sans:style=Bold",
//                     size = 7);
//            }
//            }
//            translate([22, 11, 2]) { color([0, 0, 1.0]) {
//                linear_extrude(height=4) text("robert",
//                     font = "Liberation Sans:style=Bold",
//                     size = 7);
//            }
//            }
//            translate([22, 3, 2]) { color([0, 0, 1.0]) {
//                linear_extrude(height=4) text("lugg",
//                     font = "Liberation Sans:style=Bold",
//                     size = 7);
//            }
//            }
//        }
//    }
//}
//
//
//module front_screw_hole () {
//    union () {
//        rotate(a=[-90, 0, 0]) cylinder(13.5+8+3*eps, d=3.5, center=false);
//        rotate(a=[-90, 0, 0]) cylinder(2+2*eps, d1=7.0, d2=3.5, center=false);
//    }
//}
//
//module top_screw_hole () {
//    union () {
//        translate([0, 0, 0-eps]) cylinder(50+2*eps, d=3.5, center=false);
//        translate([0, 0, 48]) cylinder(2+eps, d1=3.5, d2=7, center=false);
//    }
//}
//
//rotate ([-90, 0, 0]) {
//translate ([0, -15,0]) {
//    difference() {
//        case2();
//        // Thickness (Y) of block is 15 in center but 13.5 on edges
//        translate([-eps, -eps, -eps]) cube([20+2*eps, 1.5+2*eps, 50+2*eps]);
//        translate([56-eps, 0-eps, 0-eps]) cube([20+2*eps, 1.5+2*eps, 50+2*eps]);
//        
//        // Top screw holes
//        // The 6.5, 38, and 69.5 are required.  The others
//        // would hold an additional screw
//        //left
//        translate([6.5, 7.5, 0]) top_screw_hole();
//        // extra left
//        translate([6.5+17, 7.5, 0]) top_screw_hole();
//        //center
//        translate([38, 7.5, 0]) top_screw_hole();
//        //right
//        translate([69.5, 7.5, 0]) top_screw_hole();
//        // extra right
//        translate([69.5-17, 7.5, 0]) top_screw_hole();
//        
//        // Front screw holes
//        // Two forward-facing screw openings
//        translate([12+0.5, 1.5-eps, 25]) front_screw_hole();
//        translate([64-0.5, 1.5-eps, 25]) front_screw_hole();
//        // Two additional forward-facing edge screw openings
//        // Would require drilling into metal
//        translate([12+0.5, 1.5-eps, 10]) front_screw_hole();
//        translate([64-0.6, 1.5-eps, 10]) front_screw_hole();
//        // Two additional forward-facing top screw openings
//        // Would require drilling into metal
//        translate([38-8.5, 0-eps, 43]) front_screw_hole();
//        translate([38+8.5, 0-eps, 43]) front_screw_hole();
//        
//    }
//}
//}
