mainRod_dia = 45.8;
mainRod_angle = 15;
structRod_dia =  20.8;//22.8;
structRod_len = 150;
rearAxisRod_len = 350;
wheel_dia = 100;
wheel_thick = 20;


module screw(base_thikness = 8, screw_radius = 2.1, screw_length = 5, head_length = 10) {
	$fn = 24;
	cylinder(r=screw_radius, h=screw_length);
	translate([0, 0, screw_length])
	cylinder(r1=screw_radius, r2=screw_radius*2, h=2);
	translate([0, 0, screw_length + 2])
	cylinder(r=screw_radius*2, h=head_length);
}
module axleJoint() {
	$fn=48;
	mirror()
	difference() {
		union() {
			hull() {
				sphere(d=mainRod_dia, center=true);
				translate([0, 0, 35])
				sphere(d=mainRod_dia, center=true);
				translate([40, 0, 0])
				sphere(d=mainRod_dia, center=true);

			}
		}
		translate([40, 0, 0])
		rotate([0, -55, 0])

		cylinder(d=structRod_dia, h=100);
		rotate([0, 90, 0])
		translate([0, 0, 20])
		cylinder(d=structRod_dia, h=120, center=true);
	}

}
module sphericalRearHub() {
	rotate([-90, 0, 0])
	difference() {
		$fn=96;
		sphere(45);
		translate([0, 0, -20])
		rotate([15, 0, 0])
		cylinder(d=45, h=200);
		translate([0, -13, 0])
		rotate([0, 90, 50])
		cylinder(d=structRod_dia, h=200);
		mirror()
		translate([0, -13, 0])
		rotate([0, 90, 50])
		cylinder(d=structRod_dia, h=200);
	};
	%rotate([-90, 0, 0]) {
		%translate([0, -13, 0])
		rotate([0, 90, 50])
		cylinder(d=structRod_dia, h=structRod_len);
		%mirror()
		translate([0, -13, 0])
		rotate([0, 90, 50])
		cylinder(d=structRod_dia, h=structRod_len);
	}

}
module rearHub() {
	rotate([105, 0, 0])
	difference() {
		union() {
			translate([0, 0, 14.2]) {
				cylinder(d=mainRod_dia + 20, h=mainRod_dia - 7, $fn=64);
				sphere(r=(mainRod_dia + 20) / 2, , $fn=64);
			}

			$fn=64;
			rotate([75, 0, 40])
			translate([0, 22.5, 23])
			difference() {
				hull() {
					sphere(d=mainRod_dia);
					translate([0, 0, 20])
					sphere(d=mainRod_dia - 5);
				}
				rotate([90, 0, 0])
				translate([0, 20, 10])
				screw();

				rotate([0, 90, 0])
				translate([-20, 0, 10])
				screw();

				rotate([0, -90, 0])
				translate([20, 0, 10])
				screw();
			}

			mirror()
			rotate([75, 0, 40])
			translate([0, 22.5, 23])
			difference() {
				hull() {
					sphere(d=mainRod_dia);
					translate([0, 0, 20])
					sphere(d=mainRod_dia - 5);
				}
				rotate([90, 0, 0])
				translate([0, 20, 10])
				screw();

				rotate([0, 90, 0])
				translate([-20, 0, 10])
				screw();

				rotate([0, -90, 0])
				translate([20, 0, 10])
				screw();
			}
		}
		rotate([75, 0, 40])
		translate([0, 22.5, 23])
		cylinder(d=structRod_dia, h=structRod_len);
		mirror()
		rotate([75, 0, 40])
		translate([0, 22.5, 23])
		cylinder(d=structRod_dia, h=structRod_len);

		translate([0, 0, -605])
		cylinder(d = mainRod_dia, h=mainRod_dia + 600);

		rotate([90, 0, 0])
		translate([0, 25, 22])
		screw();
		rotate([-90, 0, 0])
		translate([0, -25, 22])
		screw();
		rotate([-90, 0, 90])
		translate([0, -25, 22])
		screw();
		rotate([-90, 0, -90])
		translate([0, -25, 22])
		screw();
	}
	%rotate([105, 0, 0]) {
		rotate([75, 0, 35])
		translate([0, 22.5, 23])
		cylinder(d=structRod_dia, h=structRod_len);
		mirror()
		rotate([75, 0, 35])
		translate([0, 22.5, 23])
		cylinder(d=structRod_dia, h=structRod_len);
	}

}
module rearAxis() {
	rotate([0, 90, 0])
	cylinder(d=structRod_dia, h=rearAxisRod_len, center=true);

	rotate([0, 90, 0])
	translate([0, 0, -rearAxisRod_len/2])
	cylinder(d=wheel_dia, h=wheel_thick);

	mirror()
	rotate([0, 90, 0])
	translate([0, 0, -rearAxisRod_len/2])
	cylinder(d=wheel_dia, h=wheel_thick);
}
module directionHub() {
	// Hub

	rotate([0, 0, 180])
	difference() {
		union() {
			rotate([0, 90, 0])
			hull() {
				sphere(d=mainRod_dia + 20, $fn=96);
				translate([-32.5, 0, 0])
				sphere(d=mainRod_dia + 20, $fn=96);
			}
			// Bearing base
			translate([0, 0, 58])
			cylinder(r=15, h=10, center=true);
			translate([0, 0, -25.5])
			cylinder(r=15, h=10, center=true);
		}
		// Bearing sockets
		translate([0, 0, 61])
		cylinder(r=11.3, h=15, center=true);
		translate([0, 0, -28.5])
		cylinder(r=11.3, h=15, center=true);

		// central rod hole
		rotate([0, 90, 0])
		translate([-16.25, 0,-20])
		cylinder(d=mainRod_dia + 0.6, h=100);

		// central axis hole
		translate([0, 0, -32.5])
		cylinder(d=8 + 1, h=100);

		rotate([90, 0, 0])
		translate([0, 16.25, 21])
		screw();

		#rotate([-90, 0, 0])
		translate([0, -16.25, 21])
		screw();
	}
}
module horizontalBar() {
	$fn=64;
	difference() {
		hull() {
			cylinder(d=structRod_dia+14, h=90 + structRod_dia * 2, center=true);
			rotate([90, 0, 0])
			translate([12, 0, 0])
			cylinder(d=structRod_dia+10, h=30, center=true);
		}
		cylinder(d=8.3, h=90 + structRod_dia * 2, center=true);

		translate([0, (structRod_dia+14) *.80 , 0])
		cube([structRod_dia * 5, structRod_dia+14, 90 + structRod_dia * 2], center=true);
		translate([0, (structRod_dia+14) *-.80 , 0])
		cube([structRod_dia * 5, structRod_dia+14, 90 + structRod_dia * 2], center=true);
		rotate([90, 0, 0]) {
			translate([12, 0, 0]) {
				cylinder(d=8.35, h=30, $fn=24, center=true);
				translate([0, 0, (structRod_dia-10)])
				cylinder(d=17, h=8, $fn=6, center=true);
				#translate([0, 0, -(structRod_dia-11)])
				cylinder(d=22.5, h=3, center=true);
			}
			translate([0, 50, -25])
			cylinder(d=structRod_dia, h=50);
			translate([0, -50, -25])
			cylinder(d=structRod_dia, h=50);

		}
	}

}
module direcion() {
	// Direction rods
	%translate([0, 50, 0])
	cylinder(d=structRod_dia, h=410);
	%translate([0, -50, 0])
	cylinder(d=structRod_dia, h=410);

	// Wheel spacers
	translate([-structRod_dia/2, -50, 0])
	cube([structRod_dia, 30, 50]);

	translate([-structRod_dia/2, 50-30, 0])
	cube([structRod_dia, 30, 50]);

	// Direction bars
	translate([0, 0, 365])
	rotate([90, 0, 0])
	horizontalBar();

	translate([0, 0, 242.5])
	rotate([90, 0, 0])
	horizontalBar();

	// Wheel
	%rotate([90, 0, 0])
	cylinder(d=100, h=20, center=true);
	translate([0, 0, 287.5])
	directionHub();

}
module seat() {
	hull() {
		cylinder(d=30, h=25);
		translate([0, -100, 0])
		cylinder(d=100, h=25);
	}
	translate([0, -40, -140])
	rotate([15, 0, 0])
	cylinder(d=structRod_dia, h=150);
}

//sphericalRearHub();
rearHub();
rotate([-90 + mainRod_angle, 0, 0])
%cylinder(d = mainRod_dia, h=600);

translate([0, -30, -150])
%rearAxis();

translate([-85.5, -30, -150])
axleJoint();
mirror()
translate([-85.5, -30, -150])
axleJoint();

translate([0, 280, 100])
seat();

translate([0, 600 + 60, -140])
rotate([0, -mainRod_angle, 90])
direcion();

//  sphericalRearHub();
// direcion();
// axleJoint();
// horizontalBar();
// directionHub();
