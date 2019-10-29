c     =====================================================
      subroutine qinit(meqn,mbc,mx,my,xlower,ylower,
     &     dx,dy,q,maux,aux)
c     =====================================================
c
c     # Set initial conditions for q.
c     # Sample scalar equation with data that is piecewise constant with
c     # q = 1.0  if  0.1 < x < 0.6   and   0.1 < y < 0.6
c     #     0.1  otherwise
c
      implicit double precision (a-h,o-z)
      dimension q(meqn, 1-mbc:mx+mbc, 1-mbc:my+mbc)
      dimension aux(maux, 1-mbc:mx+mbc, 1-mbc:my+mbc)

c     # set concentration profile
c     ---------------------------

      qin = 1.d0    ! value inside blob
      qout = 0.d0   ! value outside

       do 50 i=1,mx
          xlow = xlower + (i-1)*dx
          do 20 j=1,my
c            # set (xlow,ylow) to lower left corner of grid cell:
             ylow = ylower + (j-1)*dy
             call cellave(xlow,ylow,dx,dy,win)
c            # win is now the fraction of the cell that lies inside the circle
             do 10 m=1,meqn
                q(m,i,j) = win*qin + (1.d0-win)*qout
  10            continue
  20         continue
  50      continue

      return
      end
