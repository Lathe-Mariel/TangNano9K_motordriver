# TangNano9K_motordriverボード

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
- 7segment LED
- DIP Switch(8ch)

## 電源 Power supply
ボード上にDC-DCコンバータBP5293-50(ROHM)を実装できます．  
DC-DCコンバータには7～26Vを入力し，出力される5VをTang Nano 9Kへ供給できます．  
DC-DC converter can be installed on the board.  

## 排他利用する機能の選択 Selection of exclusive functions
　モータドライバの励磁モード選択はINA1，INA2，INB1，INB2端子で行います．  
　2CH目（基板下側）のモータドライバは，ソルダジャンパJP1～JP4をショートすると，INA1～INB2の全てがVCCに接続され，励磁モードが2相励磁に固定されます（この場合，JP4～JP8はオープンのままにする）．   
 　2ch目のモータドライバで1-2相励磁やW1-2相励磁を行いたい場合，ソルダジャンパJP5～JP8をショートさせます．するとINA1～INB2がFPGAに接続されるので，FPGAからHi/Lowを制御できます．  
  　ちなみに1ch目のモータドライバについては，このようなソルダジャンパはありません．INA1～INB2は全てFPGAに直結されているので，どの様な励磁モードを使う場合でも，FPGAから制御する必要があります．  
![](doc/jp5-8.png "ソルダジャンパで選択する")  
  FPGA側では，これらの端子をロータリエンコーダの2ch目と共有しています．  
  従って，モータドライバの2ch目の1-2相励磁選択と，ロータリエンコーダの2ch目は排他利用となります．  
### 設定例
　①例えば，モータドライバを1chしか使わない場合は，JP1～JP8のソルダジャンパをオープンのまま使用します（7セグLEDを使うならJP9のみショートする）．  
 　②例えば，モータドライバの2ch目を1-2相励磁（あるいはW1-2相励磁）で使いたい場合は，JP5～JP8のソルダジャンパをショートします（INA1～INB2がFPGAと直結される）．  
  この場合7セグLEDとロータリエンコーダの2ch目は使用できません（実装もしない方がよいでしょう）．  

  
![](doc/schematics_jp.png "JP1～JP4またはJP5～JP8のどちらかのセットをショートさせる")
- JP1 ～ JP4　　ショートさせるとINA1～INB2をTB67S101ANGのVCCピンと接続
- JP5 ～ JP8　　ショートさせるとFPGAとINA1～INB2を接続
- JP9　　JP5の線を7セグLEDのコモンに接続

## 部品
　思いつく限り列挙．抜けがあるかもしれない．  
 ロータリエンコーダのみ，押しスイッチ付きのものが秋月さんに見当たらなかったので，リストに入っていません．  
 基板の4角には穴が開いています．足としてM3程度のボルト・ナットを用意するとよいでしょう．  
   
 ![](doc/aki.png "参考部品リスト")
 
## 機能の捕捉 Additional for Functions
### モータドライバTB67S101ANG（TOSHIBA）
　このICへ電流制御用のレファレンス電圧を供給する必要があります．PinはVREFA及びVREFBです．このボードではVREFAとVREFBは直結されています．これらとFPGAの27（モータドライバch1）が接続されています．FPGAからパルスのデューティで所望の電圧を送って下さい．電圧の平滑化のために，RCフィルタのパターンが実装されています．R7とC8（モータドライバch1）に適当な値のものを実装してください．  
  
  
   ![](doc/schematics2.png "モータドライバのレファレンス電圧供給経路にあるRCフィルタ")
   
   
 （1）TB67S101ANGデータシート  
 https://toshiba.semicon-storage.com/jp/semiconductor/product/motor-driver-ics/stepping-motor-driver-ics/detail.TB67S101ANG.html
