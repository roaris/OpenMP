! ループの順序を入れ替えて、スレッド生成, 廃棄のオーバーヘッドを軽減したが、今度はメモリアクセスが低速になる
program loop2
implicit none
integer i, j
integer a(5, 5)

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
    do j = 2, 5
        a(i, j) = a(i, j) + a(i, j-1)
    enddo
enddo

print *, '-----------------------------------------'

do i = 1, 5
    do j = 1, 5
        write (*, fmt='(I5)', advance='no') a(i, j)
    enddo
    print *, ''
enddo

end program loop2