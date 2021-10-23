int gridsize = 30;
Orb[] orbs = new Orb[gridsize * gridsize];
void setup() {
   size(1080, 1080);
   int count = 0;
   for (int i = 1; i < gridsize; i++) {
      for (int j = 1; j < gridsize; j++) {
         float x = width * i / gridsize;
         float y = height * j / gridsize;
         Orb temp = new Orb(x, y);
         orbs[count] = temp;
         count += 1;
      }
   }
}

void draw() {
   background(0);
   for (int i = 0; i < ((gridsize-1)*(gridsize-1)); i++) {
      orbs[i].move();
      orbs[i].display();
   }
}

class Orb {
   float orb_size;
   float x_speed;
   float y_speed;
   float xpos;
   float ypos;

   public Orb(float x, float y){
      orb_size = random(1,3) * height/40;
      x_speed = random(-1, 1)*width/512;
      y_speed = random(-1, 1)*width/512;
      xpos = x;
      ypos = y;
   }

   void display(){
      noStroke();
      double dist = distance(xpos, ypos, width/2, height/2);
      int fill_color = (int)(((40*width/512)/dist) * 255);
      fill_color -= 45;
      if (fill_color > 255) {
         fill_color = 255;
      }
      fill(fill_color, fill_color, fill_color);
      ellipse(xpos, ypos, orb_size, orb_size);
   }

   void move(){
      if (xpos + x_speed + orb_size/2 > width || xpos + x_speed - orb_size/2 < 0){
         x_speed *= -1;
      }
      if (ypos + y_speed + orb_size/2 > height || ypos + y_speed - orb_size/2 < 0){
         y_speed *= -1;
      }
      xpos = xpos + x_speed;
      ypos = ypos + y_speed;
   } 
}

double distance(float x1, float y1, float x2, float y2){
   return sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
}


