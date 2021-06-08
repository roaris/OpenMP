program matrixMultiplication
implicit none
integer, parameter :: N = 100
real(kind=8), dimension(N, N) :: a, b, c
integer :: i, j, k
real(kind=8) :: rand

!$omp parallel do
    do j = 1, N
        do i = 1, N
            a(i, j) = rand(0)
            b(i, j) = rand(0)
            c(i, j) = 0.0D0
        end do
    end do

!$omp parallel do
    do j = 1, N
        do k = 1, N
            do i = 1, N
                c(i, j) = c(i, j) + a(i, k) * b(k, j)
            end do
        end do
    end do

end program matrixMultiplication