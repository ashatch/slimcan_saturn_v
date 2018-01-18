
/*
stage1 diameter is 33ft
scale: 33ft to 53mm
*/

function scale(x) = x * 1.606060606060606;

can_diameter=53;
can_height=134.6;

module slimcan(center_xy=false, center_z=false) {
  function xyTranslate(center_xy) = (center_xy)
    ? [-can_diameter/2, can_diameter/2, 0]
    : [0, 0, 0];

  function zTranslate(center_z) = (center_z)
    ? [0, 0, -can_height / 2]
    : [0, 0, 0];

  translate(xyTranslate(center_xy))
    translate(zTranslate(center_z))
      rotate([90, 0, 0])
        import("redbull-1.STL");
}

slimcan(center_xy=true, center_z=false);
translate([0, 0, can_height]) 
  slimcan(center_xy=true, center_z=false);

translate([-70, 0, 0])
  union() {
    cylinder(r=scale(33/2),h=scale(138));
    translate([0, 0, scale(138)]) cylinder(r=scale(33/2),h=scale(81.5));
  }
