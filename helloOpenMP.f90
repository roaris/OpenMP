! コンパイル: gfortran -fopenmp helloOpenMP.f90
! omp_get_thread_num()関数を使うと、同時に動いているプロセッサのうちで何番目に当たるかを知ることができる
program helloOpenMP
implicit none
integer omp_get_thread_num
print *, "並列世界へようこそ"
!$omp parallel
print *, "並列世界で処理中. 番号 ", omp_get_thread_num()
!$omp end parallel
print *, "さようなら"
end program helloOpenMP