! 転置行列での処理に置き換えることで、スレッド生成, 廃棄のオーバーヘッド、メモリアクセスのオーバーヘッドを軽減する
program loop3
implicit none
integer i, j
integer a(5, 5), ta(5, 5)

do i = 1, 5
    do j = 1, 5
        a(i, j) = i + j
    enddo
enddo

do i = 1, 5
    do j = 1, 5
        write (*, fmt='(I5)', advance='no') a(i, j)
    enddo
    print *, ''
enddo

!$omp parallel do private(j)
do i = 1, 5
    do j = 1, 5
        ta(i, j) = a(j, i)
    enddo
enddo

!$omp parallel do private(j)
do i = 1, 5
    do j = 2, 5
        ta(j, i) = ta(j, i) + ta(j-1, i)
    enddo
enddo

!$omp parallel do private(j)
do i = 1, 5
    do j = 1, 5
        a(i, j) = ta(j, i)
    enddo
enddo

print *, '-----------------------------------------'

do i = 1, 5
    do j = 1, 5
        write (*, fmt='(I5)', advance='no') a(i, j)
    enddo
    print *, ''
enddo

end program loop3