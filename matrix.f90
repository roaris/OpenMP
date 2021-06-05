! 行列とベクトルの積を求める関数
! 外側のループを並列化した場合、jが共有変数となってしまうので、明示的に指定する
subroutine matvec(a, x, y)
integer i, j
double precision a(100, 100), x(100), y(100)
!$omp parallel do private(j)
do i = 1, 100
    do j = 1, 100
        y(i) = y(i) + a(j, i) * x(i)
    end do
end do
return
end