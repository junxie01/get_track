! calculate the azimuth and dist in rad
subroutine cal_dist_azi
use globe_data,only : convdeg,radius,dist,azi,evla,evlo,stla,stlo
real*4 ea,sa,do
real*4 cos_ab,sin_ab
real*4 cosaz
do=(stlo-evlo)*convdeg
ea=(90-evla)*convdeg
sa=(90-stla)*convdeg
cos_ab=cos(ea)*cos(sa)+sin(ea)*sin(sa)*cos(do)
dist=acos(cos_ab)/convdeg          ! in deg
!*radius
sin_ab=sqrt(1-cos_ab**2)
cosaz=(cos(sa)-cos_ab*cos(ea))/sin_ab/sin(ea)
azi=acos(cosaz)                    ! in rad
return
end subroutine
