multiplex_4mm = 4;
multiplex_9mm = 9;
multiplex_12mm = 12;

//measurements
//eb_length = 598;
//eb_width = 398;
//eb_height_inner = 130; 

//https://en.wikipedia.org/wiki/Euro_container
eb_length = 594;
eb_width = 396;
//eb_height_inner = 132.5; 
eb_height_inner = 132; 

eb_in_out_diff = 18;

min_cut_width = 100;

//----------------------

plate_thickness = multiplex_4mm;
eb_height_stacked = eb_height_inner + plate_thickness;
echo("eb_height_inner", eb_height_inner);
echo("eb_height_stacked", eb_height_stacked);

//----------------------
// 2x footer
//----------------------
footer_single_size = [min_cut_width, eb_width-2*eb_in_out_diff, multiplex_9mm];

o_footer_x = (eb_length/2) - (min_cut_width/2) - eb_in_out_diff;
o_footer_z = multiplex_9mm/2;

translate([o_footer_x, 0, -o_footer_z])
    cube(footer_single_size, center = true);
translate([-o_footer_x, 0, -o_footer_z])
    cube(footer_single_size, center = true);
echo("footer:");
echo("2x", footer_single_size);

//----------------------
// 1x plate
//----------------------

o_plate_z = plate_thickness/2;
translate([0, 0, o_plate_z])
    cube([eb_length, eb_width, plate_thickness], center = true);
echo("plate:");
echo("1x", [eb_length, eb_width, plate_thickness]);

//----------------------
// 8x sides
//----------------------
sides_hight = (eb_height_inner/2) + plate_thickness;
side_short_length = eb_width - 2 * multiplex_4mm;

// sides-short-thin
o_short_x = eb_length/2-multiplex_4mm/2-multiplex_12mm;

translate([o_short_x, 0, sides_hight])
    cube([multiplex_4mm, side_short_length, eb_height_inner], center = true);
translate([-(o_short_x), 0, sides_hight])
    cube([multiplex_4mm, side_short_length, eb_height_inner], center = true);
echo("sides-short-thin:");
echo("2x", [multiplex_4mm, side_short_length, eb_height_inner]);

// sides-short-thick
o_short_T_z = eb_length/2-multiplex_12mm/2;
o_short_T_z_grip = (eb_height_inner - min_cut_width)/2;

translate([o_short_T_z, 0, sides_hight + o_short_T_z_grip])
    cube([multiplex_12mm, side_short_length, min_cut_width], center = true);
translate([-(o_short_T_z), 0, sides_hight + o_short_T_z_grip])
    cube([multiplex_12mm, side_short_length, min_cut_width], center = true);
echo("sides-short-thick:");
echo("2x", [multiplex_12mm, side_short_length, min_cut_width]);

// sides-long-thin
o_long_y = eb_width/2 - multiplex_4mm/2;
o_long_thick_y = eb_width/2 - multiplex_12mm/2 - multiplex_4mm;
side_long_length = eb_length - 2 * multiplex_12mm - 2 * multiplex_4mm;

translate([0, o_long_y, sides_hight])
    cube([eb_length, multiplex_4mm, eb_height_inner], center = true);
translate([0, -o_long_y, sides_hight])
    cube([eb_length, multiplex_4mm, eb_height_inner], center = true);
echo("sides-long-thin:");
echo("2x", [eb_length, multiplex_4mm, eb_height_inner]);


// sides-long-thick
translate([0, o_long_thick_y, sides_hight])
    cube([side_long_length, multiplex_12mm, eb_height_inner], center = true);
translate([0, -o_long_thick_y, sides_hight])
    cube([side_long_length, multiplex_12mm, eb_height_inner], center = true);
echo("sides-long-thick:");
echo("2x", [side_long_length, multiplex_12mm, eb_height_inner]);
