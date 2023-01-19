  
## 励磁モードは3つ用意してある There're 3types of extation mode
|File|content|
|---|---|
src/Motor_12.sv | 1－2相励磁　駆動モジュール  
src/Motor_w12.sv | W1－2相励磁　駆動モジュール  
src/Motor_2.sv | 2相励磁　駆動モジュール  
src/top_w12.sv | トップモジュール  
src/top.cst | MotorDriver Board for TangNano9K用物理制約ファイル  
src/StepperMotor.rao | 
  
3つある駆動モジュールのインターフェースは全て同じなので容易に入れ替えできます．  
Because of same interface, You can easily swap motor driver module.
  
### 駆動モジュールのインターフェース

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
    

  
ステッピングモータの回転　1ステップを `rotate_pulse` で指令します．  
3つある駆動モジュールそれぞれの1ステップに対する機械角は1：2：4（2相/1-2相/W1-2相）になります．  
これらを統一するため， `Motor_2.sv` モジュール内では， `rotate_pulse` を4分周しています．  
同様に， `Motor_12.sv` モジュール内では2分周しています．  
これによって，どのモジュールであっても，同じ周波数のパルスを `rotate_pulse` に与えれば，モータは同じ機械角速度で回転します．  
