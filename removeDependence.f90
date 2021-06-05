! a(i) = a(i + 1) + c(i)を並列化することはできないが、別の配列にコピーしておけば、並列化できる
program removeDependence
implicit none
integer i
double precision a(100), b(100), c(100)

!$omp parallel do
do i = 1, 100
    b(i) = a(i)
end do

!$omp parallel do
do i = 1, 99
    a(i) = b(i + 1) + c(i)
end do

end program removeDependence