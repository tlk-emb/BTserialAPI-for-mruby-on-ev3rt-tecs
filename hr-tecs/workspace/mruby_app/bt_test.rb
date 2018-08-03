# coding: cp932
include EV3RT_TECS

# タッチセンサポート番号の設定
TOUCH_SENSOR = Parameter.touch_sensor_port

#mainプログラム
begin
    # 各オブジェクトを生成・初期化する
    LCD.puts "initialize touch sensor"
    @touch = TouchSensor.new(TOUCH_SENSOR)
    # スタート待機
    LCD.puts "Ready to start"
    # タッチセンサーが押されるとBTシリアルの送受信開始
    while true
        break if @touch.pressed?
        RTOS.delay(10)
    end
    # 以下4行　改行及びCRを送信
    str = "\n"
    BTserial.send_byte(str)
    str = "\r"
    BTserial.send_byte(str)
    while true
        # 1バイト（1文字）受信
        code = BTserial.read_byte()
        # 受信した1バイト（int型）をstringに変換したもの（文字列）を送信（デバッグ用）
        str = code.to_s
        len = str.length
        i = 0
        while i < len do
          BTserial.send_byte(str[i])
          i = i + 1
        end
	# 以下4行　改行及びCRを送信
        str = "\n"
        BTserial.send_byte(str)
        str = "\r"
        BTserial.send_byte(str)
        # LCDに受信した1バイトの数値(int)を表示
        LCD.puts "receive"
        LCD.puts code
        RTOS.delay(10)
        # q を受信しているとbreak
        if code == 113
          break
        end
    end
    # 改行CR quit 改行CR を送信
    str = "\n"
    BTserial.send_byte(str)
    str = "\r"
    BTserial.send_byte(str)
    str = "q"
    BTserial.send_byte(str)
    str = "u"
    BTserial.send_byte(str)
    str = "i"
    BTserial.send_byte(str)
    str = "t"
    BTserial.send_byte(str)
    str = "\n"
    BTserial.send_byte(str)
    str = "\r"
    BTserial.send_byte(str)
    LCD.puts "quit"
rescue => e
  LCD.error_puts e
end
