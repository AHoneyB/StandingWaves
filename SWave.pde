class SWave {

  float px, py;
  Wave fWave, bWave ;

  float ampf, ampb;
  float kf,kb;
  float wf,wb;
  float pf,pb;

  SWave() {
    px =100;
    py =100;
    
    ampf = 30;
    kf =1;
    wf =1;
    pf =0;
    fWave = new Wave("forward wave", px, py, ampf,  kf,  wf,  pf, 255, 0, 0);
    
    ampb = 30;
    kb =1;
    wb =1;
    pb =0;
    bWave = new Wave("backwards wave", px, py+100, ampb,  -kb,  wb,  pb, 0, 0, 255);
  }
  
  
  void renderSWave(){
   fWave.renderWave();
   bWave.renderWave();
  
  }
  
  
}
