! 配列xの総和を求める処理
! リダクション変数を用いている
function total(x)
integer i
double precision t, total, x(1000)
t = 0.0
!$omp parallel do reduction(+:t)
do i = 1, 1000
    t = t + x(i)
end do
total = t
end

program badTotal
implicit none
integer i
double precision x(1000), total
do i = 1, 1000
    x(i) = i
end do
print *, total(x)
end program badTotal