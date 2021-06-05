! 配列xの総和を求める処理
! スレッドが処理している間に、他のスレッドが処理をする可能性があるため、正しい結果を求められない
function total(x)
integer i
double precision t, total, x(1000)
t = 0.0
!$omp parallel do
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