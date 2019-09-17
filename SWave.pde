class SWave {

  ArrayList<Wave> waves;
  Wave sum;
  float px, py;


  float ampf, ampb;
  float kf,kb;
  float wf,wb;
  float pf,pb;

  SWave() {
    waves = new  ArrayList<Wave>();
    px =100;
    py =100;
    
    ampf = 40;
    kf =1;
    wf =2;
    pf =0;
   
    waves.add(new Wave("forward wave", px, py, ampf,  kf,  wf,  pf, 255, 0, 0));
    ampb = 40;
    kb =1;
    wb =2;
    pb =0;

    waves.add(new Wave("backwards wave", px, py, ampb,  -kb,  wb,  pb, 0, 0, 255));
    
    sum = new Wave("Standing Wave",px, py+100,0,0,0,waves);
  }
  
  
  void renderSWave(){
   waves.get(0).renderWave();
   waves.get(1).renderWave();
   sum.renderWave();
  
  }
  

  
}
