:set ff=unix
#!/bin/sh
conky -c ~/.config/conky/conky-top.conf &
conky -c ~/.config/conky/conky-bottom.conf &
