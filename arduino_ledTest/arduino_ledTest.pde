  
import processing.serial.*;
Serial myPort; 

String keyDisp;
void setup() {
  
  size(400, 300); // 제어 프로그램 창 크기 
  // List all the available serial ports
  printArray(Serial.list());
  
  // Open the port you are using at the rate you want:
  //myPort = new Serial(this, Serial.list()[0], 9600);
  myPort = new Serial(this, Serial.list()[Serial.list().length - 1], 9600);
  
  keyDisp = "-";
}
void draw() {
  background(155);  // 배경화면 밝기
  fill(0);
  
  String buf = String.format("숫자 돌아가는거 : %d", frameCount);
  text(buf, 0,10); // 온 오프 숫자 위치
  //int i = frameCount % 255;
  text(keyDisp, 20,40); //
  
}

void keyPressed() {
    keyDisp = String.format("%c", key);
    myPort.write(key);
}