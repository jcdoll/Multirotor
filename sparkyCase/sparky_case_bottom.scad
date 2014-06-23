include <sparky_case_settings.scad>;

difference() {

  // Plane and standoffs
  union() {
    translate([3/2*w_wall, 3/2*w_wall, 0])
    roundedRect([w_case-3*w_wall,w_case-3*w_wall,t_base],r_case);
    for (ii = [0:3]) {
      translate([x[ii]+x_offset, y[ii]+y_offset, t_base])
      cylinder(h=h_standoff, r=d_standoff/2);
    }
  };

  // Holes for frame and board mount
  union() {
    for (ii = [0:3]) {
      translate([x[ii]+x_offset, y[ii]+y_offset, 0])
      cylinder(h=t_base+h_standoff, r=d_hole/2);
    }
  };
};