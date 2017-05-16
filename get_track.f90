program main
use globe_data
integer i,j
character(90) args,output
if(iargc().ne.7)then
        write(*,*)'usage: get_track evlo evla stlo stla id grid output'
        write(*,*)'id==1 for great cricle path'
        write(*,*)'id==2 for lanitude cricle path'
        call exit(-1)
endif
call getarg(1,args)
read(args,'(bn,f20.0)')evlo
call getarg(2,args)
read(args,'(bn,f20.0)')evla
call getarg(3,args)
read(args,'(bn,f20.0)')stlo
call getarg(4,args)
read(args,'(bn,f20.0)')stla
call getarg(5,args)
read(args,'(bn,1i10)')id
call getarg(6,args)
read(args,'(bn,f20.0)')space
!write(*,*)'id=',id
call getarg(7,output)
call swap
call cal_dist_azi
call track
if(error==-1)then
       write(*,*)'There are something wrong about the lanitude!'
       call exit(-1)
endif
open(10,file=output)
do i=1,ntrk
       write(10,'(2f7.1)')track_y(i),track_x(i)
enddo
close(10)
end program
