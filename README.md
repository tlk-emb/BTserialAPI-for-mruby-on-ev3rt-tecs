# BTserial API for mruby on ev3rt+tecs
このソフトウェアはMITライセンスの下で公開されています．ライセンスについてはLICENSEファイルを参照してください．

## 概要
本パッチはmruby on ev3rt+tecsに，mrubyから呼び出すことができるBluetooth Serial通信のAPIを追加するためのものです．hr-tecsディレクトリ以下の追加ファイルと，ファイル修正を行うdiff.patchで構成されています．対象とするmruby on ev3rt+tecのバージョンはbeta2.1.0です．

## 導入方法
1. mruby-on-ev3rt+tecs_package-beta2.1.0をTOPPERSのサイトからダウンロードします．
1. ダウンロードしたファイルを解凍します．
1. 本パッチに含まれるhr-tecsフォルダ及びdiff.patchを，解凍したフォルダ内のhr-tecsと同じディレクトリに配置します．
1. このディレクトリで以下のpatchコマンドを実行してください．

        $ patch -p1 < diff.patch
1. 以上でパッチは完了です．以後，通常のmruby on ev3rt+tecsの導入手順に従ってください．

## 使用方法
BTserialクラスのメソッドsend_byte及びread_byteが使用可能です．
- BTserial.send_byte(str)
- integer = BTserial.read_byte()

それぞれ1バイト（1文字）の送信及び受信を行います．
send_byte(str)の引数は文字列です．先頭の1文字のみが送信されます．
read_byteは受信した1バイトをint型の値として返します．この値はASCIIコードです．

## デモ
デモとして，bt_test.rbが追加されています．bt_test.rbは送受信のテスト用のプログラムです．タッチセンサが押されると送受信を開始します．read_byteで受信した値をLCDに表示すると同時に，send_byteで送り返します．
