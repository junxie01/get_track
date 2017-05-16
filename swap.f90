! make sure the evlo is smaller than stlo
subroutine swap
use globe_data,only : evla,evlo,stla,stlo
real tmp
if (evlo > stlo )then
           tmp=evlo
           evlo=stlo
           stlo=tmp
           tmp=evla
           evla=stla
           stla=tmp
endif
end subroutine
