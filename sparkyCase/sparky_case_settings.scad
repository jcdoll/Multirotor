// Coordinate system: (0,0) is SW corner of case
w_board = 36; // bounding box of board
t_board = 5; // maximum height of board + components

h_standoff = 1;
h_standoff_lid = 8;

t_base = 0.75; // three layers thick
w_wall = 0.8; // two lines wide
t_top = 0.75; // three layers thick
d_hole = 3.8; // M3 for board-case and case-frame
d_standoff = d_hole + 2*w_wall;

t_ribs = 2;
w_ribs = 0.8;
t_slots = 9; // height of slots for cable passage
t_slot_usb = 4;

w_case = 41;
t_case = t_slots + t_top; // height excluding standoffs
r_case = 3; // corner radii for base of case

// Four thru holes from SW in CW order
// See github/TauLabs/flight/targets/sparky/hw/assembly_v1.1.pdf
x = [2.75, 2.75,  33.25, 33.25];
y = [2.75, 33.25, 25.63, 2.75];

w_slots = y[2]-y[0]; // width of slows to allow right angle PWM pins through

so_inset = r_case;
x_standoff = [so_inset, so_inset, w_case-so_inset, w_case-so_inset];
y_standoff = [so_inset, w_case-so_inset, w_case-so_inset, so_inset];

x_offset = (w_case-w_board)/2;
y_offset = (w_case-w_board)/2;

$fn = 20;

// Define helper functions
module roundedRect(size, radius) {
  x = size[0];
  y = size[1];
  z = size[2];

  linear_extrude(height=z)
  hull() {
    translate([radius, radius, 0])
    circle(r=radius);

    translate([x - radius, radius, 0])
    circle(r=radius);

    translate([x - radius, y - radius, 0])
    circle(r=radius);

    translate([radius, y - radius, 0])
    circle(r=radius);
  }
}
