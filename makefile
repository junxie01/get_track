#FFLAG=-ffixed-line-length-none
FC=ifort
bin=get_track
objects=globe_data.o get_track.o cal_dist_azi.o track.o swap.o
all: globe_data.mod $(bin)
globe_data.mod:
	$(FC) globe_data.f90 -c
%.o: %.f90
	$(FC) -c $(FFLAG) $<
$(bin):$(objects)
	$(FC) $(objects) $(FFLAG) -o $@
clean:
	rm $(objects)
