# FortranによるOpenMP入門

## 基本的な使い方
OpenMPでは、プログラム内の並列化したい部分を、 `!$omp parallel`と、`!$omp end parallel`で囲む。ループの並列化の場合、ループの直前に`!omp parallel do`を挿入する。

スレッド数は環境変数`OMP_NUM_THREADS`で決まる。  
`OMP_NUM_THREADS`の変更はexportコマンドを利用する。 ex. export OMP_NUM_THREADS=5  
確認はechoコマンドもしくはprintenvコマンドを利用する。

## リージョンとスレッド
複数のスレッドがそれぞれ処理を進める範囲を並列リージョン、並列リージョン以外の範囲を逐次リージョンと呼ぶ。逐次リージョンを担当するスレッドをマスタースレッドと呼び、並列リージョンではマスタースレッドからスレーブスレッドと呼ばれるスレッドが生成される。

## 共有変数とプライベート変数
スレッド間で共有された領域に配置される変数を共有変数、スレッド毎に持つ独自の変数をプライベート変数と呼ぶ。共有変数の指定は`!$omp parallel shared(a)`, プライベート変数の指定は`!$omp parallel private(a)`などとする。まとめて、`!$omp parallel shared(a, b, c) private(d, e)`などと書くこともできる。明示して指定しなくても、基本的には共有変数、ループ変数等はプライベート変数となる。

## リダクション変数
リダクション変数を用いることで、配列の総和や最大値を求める処理を並列化することができる。リダクション変数は、プライベート変数や共有変数の両方の性質を持ち、並列リージョンではプライベート変数として扱われる。並列リージョンを抜けると、各スレッドのリダクション変数は、1つにまとめられ、共有変数として扱われる。まとめ方には、和、積、最大値等がある。指定は、`!$omp parallel do reduction(+:t)`などとする。