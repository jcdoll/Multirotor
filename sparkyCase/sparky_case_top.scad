include <sparky_case_settings.scad>;

difference() {
  union() {
  
    // Main body of the case
    difference() {
      roundedRect([w_case, w_case, t_case], r_case);

      // Case cavity
      translate([w_wall, w_wall, t_top])
      roundedRect([w_case-2*w_wall, w_case-2*w_wall, t_case], r_case-w_wall);
  
      // Cable cutout
	   translate([-w_case/2, y[0]+y_offset, t_top])
  	   cube([w_case, w_slots, t_slots]);

      // USB and flexi cutout
	   translate([+w_case/2, y[0]+y_offset, t_case-t_slot_usb])
    	 cube([w_case, w_slots, t_slot_usb]);
    }

    // Mounting posts (mirror x to maintain correct orientation)
    for (ii = [0:3]) {	
      translate([-(x[ii]+x_offset)+w_case, y[ii]+y_offset, 0])
      cylinder(h=h_standoff_lid, r=d_standoff/2);
    }

    // Support ribs
    translate([w_case/3,0,t_top])
    cube([w_ribs, w_case, t_ribs]);

    translate([2*w_case/3,0,t_top])
    cube([w_ribs, w_case, t_ribs]);
  }

  // Mounting holes (mirror x to maintain correct orientation)
  for (ii = [0:3]) {	
    translate([-(x[ii]+x_offset)+w_case, y[ii]+y_offset, 0])
    cylinder(h=t_case, r=d_hole/2);
  }
};