float h, s, a, b, d;

//障碍物随机出现20个
Fish[] fish;
int n=20;
int now = 0;
void setup() {
  size(700, 700);
  fish=new Fish[20];
  for (int i=0; i<fish.length; i++) {
    float x=random(width);
    float y=random(height);
    float sX=random(0.9, 1);
    float sY=random(0.9, 1);
    float r=random(150);
    float g=random(100, 200);
    float tb=random(50);
    fish[i]=new Fish(x, y, sX, sY, r, g, tb);

    frameRate(5);
  }
  textSize(22);
}

void draw() {
  background(255);
    if(now == 2)
  {
   background(0);
   text("GameOver",330,350);
  }
  if(now == 0){
  for (int i=0; i<fish.length; i++) {
    fish[i].fall();
    fish[i].display();
    fish[i].cheak(i);
  }
  player();
  bj();
  }
}
class Fish {
  float x, y, scalerX, scalerY, r, g, b;
  Fish(float tx, float ty, float tsX, float tsY, float tr, float tg, float tb) {
    x=tx; 
    y=ty;
    scalerX=tsX;
    scalerY=tsY;
    r=tr;
    g=tg;
    b=tb;
  }
  void fall() {
    x=x+random(-10, 10);
    y=y+5;
    if (y>height+50) {
      y=y-height-50;
    }
  }


  //障碍物的代码 
  void display() {
    fill(r, g, b);
    pushMatrix();
    //translate(x, y);
    //scale(scalerX, scalerY);
    //scale(0.3);

    //head
    ellipse(x, y, 62, 54);

    //eye
    noStroke();
    fill(0);
    ellipse(x-13, y-10, 15, 15);
    ellipse(x+14, y-10, 15, 15);

    //saihong
    fill(216, 127, 185, 150);
    ellipse(x-13, y+13, 20, 13);
    ellipse(x+17, y+13, 20, 13);
    popMatrix();
  }
  void cheak(int a){
    fill(#1E18F0);
    ellipse(666, 695,10,10);
    //ellipse(h*0.3+78,s*0.3+66,10,10);
    if(dist(h*0.3+78,s*0.3+66,x,fish[a].y+10)<50)
    now = 2;
    if(dist(h*0.3+78,s*0.3+66,666, 695)<50)
    now = 1;
    if(now == 1){
      n+=10;
      setup();
      now = 0;
      h = 100;
      s = 100;
    }
    
  }
}


//角色代码
void player() {
  strokeWeight(3);
  scale(0.3);
  fill(#FFDEA0);
  ellipse(h+230, s+150, 150, 180);//头部
  fill(#F26E3D);
  rect(h+155, s+165, 150, 200);//身体的长方形
  fill(#FFFFFF);
  ellipse(h+200, s+100, 35, 15);//左眼白
  ellipse(h+260, s+100, 35, 15);//右眼白
  fill(#000000);
  ellipse(h+200, s+100, 16, 15);//左眼球
  ellipse(h+260, s+100, 16, 15);//右眼球
  fill(#000000);
  quad(h+155, s+180, h+155, s+190, h+95, s+258, h+90, s+250);//左手轮廓
  stroke(#FFDEA0);
  line(h+155, s+185, h+94, s+252);//左手中
  stroke(#000000);
  quad(h+305, s+180, h+370, s+250, h+365, s+258, h+305, s+190);//右手轮廓
  stroke(#FFDEA0);
  line(h+305, s+185, h+365, s+252);//右手中
  strokeWeight(2);
  stroke(#000000);
  line(h+210, s+140, h+250, s+140);//嘴
  if ( keyPressed) {
    if (keyCode==LEFT) {
      h=h-100;
    } else if (keyCode==RIGHT) {
      h=h+100;
    } else if (keyCode==DOWN) {
      s=s+100;
    } else if (keyCode==UP) {
      s=s-100;
    }
  }
  fill(#FF0A0A);
  rect(2150, 2300, 200, 100);
}

//控制角色的左右移动代码
void bj() {

  h=h+a;
  s=s+b;
  if (h>width*3) {
    h=2000;
  } else if (h<0) {
    h=width;
  }
  if (s>height*3) {
    s=2000;
  } else if (s<0) {
    s=height;
  }
}