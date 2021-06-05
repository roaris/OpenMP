# OpenMP入門

OpenMPでは、プログラム内の並列化したい部分を、 
`!$omp parallel`と、`!$omp end parallel`で囲む。

分担するプロセッサの数は環境変数`OMP_NUM_THREADS`で決まる。 
`OMP_NUM_THREADS`の変更はexportコマンドを利用する。 ex. export OMP_NUM_THREADS=5  
確認はechoコマンドもしくはprintenvコマンドを利用する。