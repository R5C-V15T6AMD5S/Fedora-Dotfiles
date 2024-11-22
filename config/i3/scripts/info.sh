:set ff=unix
#!/bin/sh

conky -c ~/.config/conky/conky-top.conf &
conky -c ~/.config/conky/conky-bottom.conf &

feh --no-fehbg --bg-scale ~/Pictures/WallPP/Colorschemes/gruvbox/OS/fedora_center.png &
