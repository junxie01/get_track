module globe_data
integer grids             !
integer ntrk,id
integer nlon,nlat
integer error
real*4 track_x(200),track_y(200)
real*4 evla,evlo,stla,stlo
real*4 lomin,lomax,lamin,lamax,glon
real*4 dist,azi
real*4 space
real*4 pi,radius,convdeg
parameter(pi=3.14159265,radius=6371.0,convdeg=3.14159265/180.0)
end module
