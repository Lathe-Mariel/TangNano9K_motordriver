  
|File|content|
|---|---|
src/Motor_12.sv | 1－2相励磁　駆動モジュール  
src/Motor_w12.sv | W1－2相励磁　駆動モジュール  
src/Motor_2.sv | 2相励磁　駆動モジュール  
src/top.sv | トップモジュール  
src/top.cst | MotorDriver Board for TangNano9K用物理制約ファイル  
  
3つある駆動モジュールのインターフェースは全て同じなので容易に入れ替えできます．  
Because of same interface, You can easily swap motor driver module.
  
### インターフェース

  input  wire       clk,　　システムクロック（←トップモジュール）  
  output logic      phase_a,　　A相コイル（→ドライバIC）  
  output logic      phase_b,　　B相コイル（→ドライバIC）  
  output logic      INB1,　　INB1信号（→ドライバIC）  
  output logic      INB2,　　INB2信号（→ドライバIC）  
  output logic      INA1,　　INA1信号（→ドライバIC）  
  output logic      INA2,　　INA2信号（→ドライバIC）  
  output logic      STANBY,　　スタンバイ（→ドライバIC）　ONでドライバICがレディ（レディ状態で，回転指令がないの場合はロータ位置を保持）  
  output logic      VREF_PWM,　　電流設定用の電圧をdutyで出力（→ドライバIC）　ボード上にRCフィルタ有り  
  input  wire       rotate_pulse,　　回転速度指令（←トップモジュール）  
  input  wire       direction,　　回転方向指令  （←トップモジュール）  
  input  wire       module_enable,　　モジュール・イネーブル指令（←トップモジュール）  
  input  wire[3:0]       vref_level　　駆動電流値指令　｛0～15の16段階｝  （←トップモジュール）  
    
  モジュールへの指令は下段の4つの信号で行います．  
  top.svモジュールからこの4つの信号を使って指令すれば，このモジュール内でモータドライバICへ送る信号が生成されます．  
    
