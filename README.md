# TangNano9K_motordriverボード
MotorDriver board for TangNano9K(Sipeed)

Tang Nano 9K(Sipeed)用のマザーボード（拡張ボード）です．  
This is mother board for Tang Nano 9K(Sipeed).  
オープンソースの回路CADである，KiCAD のプロジェクトになっています．  
These files were made by KiCAD.

## 機能 Functions
次の機能を実装できます．
- ステッピングモータドライバ x2ch <TB67S101ANG(TOSHIBA)>
- ロータリエンコーダ x2
- 8x8 マトリクスLED <OSL641501-BRA(Optsupply)>
- 7セグメントLED
- DIP Switch(8ch)

You can install these functions with this board.
- Stepper motor driver x2ch
- Rotary encoder x2
- 8x8 Matrix LED
- DIP Switch(8ch)

## 電源 Power supply
ボード上にDC-DCコンバータBP5293-50(ROHM)を実装できます．  
DC-DCコンバータには7～24Vを入力し，出力される5VをTang Nano 9Kへ供給できます．
DC-DC converter can be installed on the board.

## 排他利用する機能の選択
　モータドライバの励磁モード選択はINA1，INA2，INB1，INB2端子で行います．  
　2CH目（基板下側）のモータドライバは，ソルダジャンパJP1～JP4をショートすると，INA1～INB2の全てがVCCに接続され，励磁モードが2相励磁に固定されます．  
 　2ch目で1-2相励磁やW1-2相励磁を行いたい場合，ソルダジャンパJP5～JP8をショートさせます．するとINA1～INB2がFPGAに接続されるので，FPGAからHi/Lowを制御できます．  
![](doc/jp5-8.png "ソルダジャンパで選択する")  
  FPGA側では，これらの端子をロータリエンコーダの2ch目と共有しています．従って，モータドライバの2ch目の1-2相励磁選択と，ロータリエンコーダの2ch目は排他利用となります．  
   
  　
 
 （1）TB67S101ANGデータシート  
 https://toshiba.semicon-storage.com/jp/semiconductor/product/motor-driver-ics/stepping-motor-driver-ics/detail.TB67S101ANG.html
