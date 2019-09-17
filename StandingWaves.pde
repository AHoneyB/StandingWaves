SWave sw;

void setup(){
 size(1200, 700);
 sw = new SWave();
 frameRate(80);
}


void draw(){
 background(230);
 sw.renderSWave();

}
