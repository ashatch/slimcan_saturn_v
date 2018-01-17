can_radius=53;
can_height=134.6;

module slimcan(center_xy=false, center_z=false) {
  function xyTranslate(center_xy) = (center_xy)
    ? [-can_radius/2, can_radius/2, 0]
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
