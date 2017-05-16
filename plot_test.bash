#!/bin/bash
evla=60
stla=60
evlo=125
stlo=65
./get_track $evlo $evla $stlo $stla 1 0.5 track.dat
psbasemap -R0/360/-90/90 -JG100/60/6i -B30g30/15g15:."Orthographic": -P -K> ortho.ps
psxy track.dat -R -J -B -: -Sc0.1i -O -K -Gblack >>ortho.ps
psxy -R -O -K -St0.2i -Gred -J -B >>ortho.ps<<eof
$evlo $evla
$stlo $stla
eof
psxy -R -J -O -K -B -W1p,red>>ortho.ps<<eof
0 90
$evlo $evla
eof
