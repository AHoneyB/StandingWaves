class Wave {

  ArrayList<Complex> wave;
  ArrayList<Wave> wavelist;
  String s;
  float px, py;
  float w, k, phase;
  float R, G, B;
  float amp;
  float st;
  int num;
  int time, position;
  int date;
  float fp=80;

  // Individual Wave constructor
  Wave(String s, float px, float py, float a, float k, float w, float p, float R, float G, float B) {
    wave = new  ArrayList<Complex>();
    this.s = s;
    this.R = R;
    this.G = G;
    this.B = B;
    this.px = px;
    this.py = py;

    st=8;
    num = 100;
    time =0;
    position =0;

    setPhysicalValues(a, k, w, p);
    calcWave();
  }

  // List of waves constructor
  Wave(String s, float px, float py, float R, float G, float B, ArrayList<Wave> wavelist) {
    wave = new  ArrayList<Complex>();
    this.wavelist = wavelist;
    this.s = s;
    this.R = R;
    this.G = G;
    this.B = B;
    this.px = px;
    this.py = py;
   
    st=8;
    num = 100;
    time =0;
    position =0;
    calcWaveList();
  }


  void setPhysicalValues(float a, float k, float w, float p) {
    this.amp = a;
    this.phase = p;
    this.w=w;
    this.k=k;
  }

  void calcWave() {
    wave.clear();
    Float re, im;
    for (int i=0; i<num; i++) {
      float xx = map(i, 0, num-1, 0, TWO_PI);
      for (int j=0; j<num; j++) {
        float tt = map(j, 0, num-1, 0, TWO_PI);
        re = amp *  (float)(Math.cos((k*xx-w*tt+phase)));
        im = amp *  (float)(Math.sin((k*xx-w*tt+phase)));
        Complex c = new Complex(re, im);

        wave.add(c);
      }
    }
  }

  void calcWaveList() {
    wave.clear();
    println("List size ="+wavelist.size());
    Float re;
    float im;
    for (int i=0; i<num; i++) {
      float xx = map(i, 0, num-1, 0, TWO_PI);
      for (int j=0; j<num; j++) {
        float tt = map(j, 0, num-1, 0, TWO_PI);
        re =0.0;
        im =0.0;
       
        for (int index=0; index<wavelist.size(); index++) {
          
          Wave cWave = wavelist.get(index);
          re += cWave.amp *  (float)(Math.cos((cWave.k*xx-cWave.w*tt+cWave.phase)));
          im += cWave.amp *  (float)(Math.sin((cWave.k*xx-cWave.w*tt+cWave.phase)));
          
        }
        Complex c = new Complex(re, im);
        wave.add(c);
      }
    }
  }


  // ----------
  //MAIN DRAW 
  // ----------
  void renderWave() {

    int dirc =0;
    if (time>=num) 
      time =0;
    if (position>=num) 
      position =0;

    renderSHMform(px, py, R, G, B, dirc);



    time +=1;
    position +=1;
  }

  void renderSHMform(float pX, float pY, float R, float G, float B, int dir) {
    strokeWeight(1);
    stroke(0, 50);
    if (dir==0) {   // Horizontal
      line(pX+fp, pY+amp, pX+fp, pY-amp );
      line(pX+fp, pY, pX+fp+num*st, pY );
    } else {      // Vertical
      line(pX+amp, pY+fp, pX-amp, pY+fp );
      line(pX, pY+1.5*amp, pX, pY+1.5*amp+num*st );
    }

    //textLabels( pX,  pY);


    beginShape();
    noFill();
    stroke(R, G, B);
    strokeWeight(1);
    for (int t=0; t<num; t++) {
      if (dir==0) {
        vertex(pX+st*t+fp, pY+wave.get(t+position*num).im );
      } else {
        vertex(pX+wave.get(t+position*num).re, pY+st*t+fp);
      }
    }
    endShape();
    stroke(0);
  }
}
