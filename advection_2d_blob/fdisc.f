c
c
c
c     =================================================
      real(kind=8) function fdisc(x,y)
c     =================================================
      
      real(kind=8), intent(in) :: x,y
      real(kind=8) :: r0,r,a,xoff,yoff,x0,y0,rad
      integer :: k
c
c     # for computing cell averages for initial data that has a
c     # discontinuity along some curve.  fdisc should be negative to the 
c     # left of the curve and positive to the right

      x0 = 0.5d0
      y0 = 0.5d0
      k = 12.d0
      r0 = 0.2d0
      a = 0.06d0

      r = sqrt((x-x0)**2 + (y-y0)**2)
      yoff = y-y0
      xoff = x-x0
      theta = atan2(yoff,xoff)

      rad = r0 + a*sin(k*theta)

      if (r < rad) then
         fdisc = -1.d0
      else
         fdisc =  1.d0
      endif
      
c
      return
      end
