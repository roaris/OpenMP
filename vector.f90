! ベクトルxの各要素に実数aを掛け, 実数yを足し、ベクトルzに格納する処理
program vector
implicit none
integer i
double precision z(100), a, x(100), y

do i = 1, 100
    z(i) = 0.0
    x(i) = 2.0
end do
a = 4.0
y = 1.0

call daxpy(z, a, x, y)

end program vector

subroutine daxpy(z, a, x, y)
integer i
double precision z(100), a, x(100), y
!$omp parallel do
do i = 1, 100
    z(i) = a * x(i) + y
end do
return
end