subroutine track
use globe_data
integer i,j
real minla,a,b
real ddist,dd
real*4 deg,ddeg
real*4 ea,cos_sa,sa,cos_ab,eo,so,do


ddeg=space/2.0
ntrk=int(dist/space)+1
ntrk=int(dist/ddeg)+1
track_x(1)=int(evlo/space)*space
track_y(1)=int(evla/space)*space
!write(*,*)'id=',id
if(id==1)then         ! for great circle
       if(stlo==evlo)then
              ntrk=int(abs(evla-stla)/space)+1
              track_x=int(stlo/space)*space
              minla=evla
              if(evla.gt.stla)then
                     minla=stla
              endif
              do i=1,ntrk
                     track_y(i)=int(minla/space)*space+space*(i-1)
              enddo
       else
              ea=(90-evla)*convdeg
              eo=(evlo)*convdeg     
              i=1
              j=1
 10           continue
!       deg=space/2.0*convdeg*i
             ! deg=space*convdeg*i
              deg=ddeg*convdeg*i
!              write(*,*)'deg=',deg
              cos_sa=cos(deg)*cos(ea)+sin(deg)*sin(ea)*cos(azi)
              sa=acos(cos_sa) 
              cos_ab=(cos(deg)-cos(ea)*cos_sa)/sin(sa)/sin(ea)
              do=acos(cos_ab)
              so=eo+do
              a=int((90-sa/convdeg)/space)*space
              b=int((so/convdeg)/space)*space
              if( a.ne.track_y(j).or.b.ne.track_x(j))then
                    track_y(j+1)=a
                    track_x(j+1)=b
                    j=j+1
              endif
              i=i+1
              if(i.le.ntrk)goto 10
              ntrk=j
       endif
elseif (id==2)then
       if(evla.ne.stla)then
              error=-1
              return
       endif
       ntrk=int((stlo-evlo)/space)+1
       do i=1,ntrk
              track_y(i)=int(evla/space)*space
              track_x(i)=int(evlo/space)*space+space*(i-1)
       enddo
endif
return
end subroutine 
