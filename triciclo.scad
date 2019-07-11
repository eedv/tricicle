mainRod_dia = 45.8;
structRod_dia = 22.8;
structRod_len = 120;
rearAxisRod_len = 350;
wheel_dia = 100;
wheel_thick = 20;


module screw() {
	base_thikness = 8;
	screw_radius = 2.1;
	$fn = 24;
	cylinder(r=screw_radius, h=3);
	translate([0, 0, 3])
	cylinder(r1=screw_radius, r2=screw_radius*2, h=2);
	translate([0, 0, 5])
	cylinder(r=screw_radius*2, h=base_thikness +2);
}
module rearHub() {
	rotate([15, 0, 0])
	difference() {
		union() {
			cylinder(d=mainRod_dia + 20, h=mainRod_dia + 10, $fn=128);

			$fn=80;
			rotate([80, 0, 45])
			translate([0, 22.5, 23])
			difference() {
				hull() {
					sphere(d=mainRod_dia);
					translate([0, 0, 45])
					sphere(d=mainRod_dia - 5);
				}
				rotate([90, 0, 0])
				translate([0, 20, 10])
				screw();

				rotate([0, 90, 0])
				translate([-40, 0, 10])
				screw();

				rotate([0, -90, 0])
				translate([20, 0, 10])
				#screw();
			}

			mirror()
			rotate([80, 0, 45])
			translate([0, 22.5, 23])
			difference() {
				hull() {
					sphere(d=mainRod_dia);
					translate([0, 0, 45])
					sphere(d=mainRod_dia - 5);
				}
				rotate([90, 0, 0])
				translate([0, 20, 10])
				screw();

				rotate([0, 90, 0])
				translate([-40, 0, 10])
				screw();

				rotate([0, -90, 0])
				translate([20, 0, 10])
				#screw();
			}


			sphere(r=(mainRod_dia + 20) / 2, , $fn=128);
		}
		rotate([80, 0, 45])
		translate([0, 22.5, 23])
		#cylinder(d=structRod_dia, h=structRod_len);
		mirror()
		rotate([80, 0, 45])
		translate([0, 22.5, 23])
		#cylinder(d=structRod_dia, h=structRod_len);

		translate([0, 0, -605])
		cylinder(d = mainRod_dia, h=mainRod_dia + 600);

		rotate([90, 0, 0])
		translate([0, 25, 22])
		#screw();
		rotate([-90, 0, 0])
		translate([0, -25, 22])
		#screw();
		rotate([-90, 0, 90])
		translate([0, -25, 22])
		#screw();
		rotate([-90, 0, -90])
		translate([0, -25, 22])
		#screw();
	}

}
module rearAxis() {
	rotate([0, 90, 0])
	translate([-22.5, -100, -rearAxisRod_len/2])
	#cylinder(d=structRod_dia, h=rearAxisRod_len);

	rotate([0, 90, 0])
	translate([-22.5, -100, -rearAxisRod_len/2])
	cylinder(d=wheel_dia, h=wheel_thick);

	mirror()
	rotate([0, 90, 0])
	translate([-22.5, -100, -rearAxisRod_len/2])
	cylinder(d=wheel_dia, h=wheel_thick);
}
module frontHub() {
	translate([0, 70, 0])
	cylinder(d=structRod_dia, h=350);
	translate([0, -70, 0])
	cylinder(d=structRod_dia, h=350);

	translate([-structRod_dia/2, -75, 0])
	cube([structRod_dia, 20, 50])

	mirror()
	translate([-structRod_dia/2, -75, 0])
	cube([structRod_dia, 20, 50]);

	translate([0, 0, 310])
	cube([structRod_dia + 15, 140 + structRod_dia + 15, 25], center=true);
	translate([0, 0, 190])
	cube([structRod_dia + 15, 140 + structRod_dia + 15, 25], center=true);

	// Wheel
	rotate([90, 0, 0])
	cylinder(d=100, h=20, center=true);

	// Hub
	translate([0, 0, 232.5])
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
		#cylinder(d=8 + 1, h=100);
	}

}
module seat() {
	hull() {
		cylinder(d=30, h=25);
		translate([0, -100, 0])
		cylinder(d=100, h=25);
	}
	translate([0, -45, -140])
	rotate([15, 0, 0])
	cylinder(d=structRod_dia, h=150);
}

/* rotate([90, 0, 0])
{
	difference() {
		rearHub();

	}
	rotate([15, 0, 0])
		translate([0, 0, -605])
		#cylinder(d = mainRod_dia, h=mainRod_dia + 600);
translate([0, 0, 25])
rearAxis();
}
translate([0, 280, 100])
seat();

translate([0, 650, -83])
rotate([0,-15,90])
frontHub(); */
rearHub();