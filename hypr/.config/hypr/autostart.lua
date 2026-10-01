-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
hl.exec_cmd("systemctl --user start xdg-desktop=portal-hyprland")
  hl.exec_cmd("nm-applet & hyprpaper & waybar")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
end)