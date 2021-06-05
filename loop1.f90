! 依存関係のない内側のループを並列化しているが、スレッドの生成, 廃棄が外側のループ回数文行われるため、オーバーヘッドが大きくなる
program loop1
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

do j = 2, 5
!$omp parallel do
    do i = 1, 5
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

end program loop1