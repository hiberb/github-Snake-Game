//Dekalaration globaler Variablen mit Initialisieung

ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();    //Erstellung einer Array List
int w=30,h=30,bs=20,dir=2,ax=12,ay=10;
int[]dx={0,0,1,-1},dy={1,-1,0,0};
boolean gameover=false;  //Für Gameoverpage
boolean anfang = false;
color colorA = color(255,0,0);     //Rote Farbe für Game Over
color colorB = color(255,0,0);     //Farbe für den Anfang
color colorC = color(0,0,255);
color colorD = color(127,255,212);
color colorE = color(255,211,155);
color colorF = color(151,255,255);
color colorG = color(255,255,0);
color colorH = color(189,183,107);
color colorI = color(105,105,105);
color colorBlack = color(0,0,0);
int a = 0;
int speicher;  //Speichervariablen
int speicherung;  //Speichervariablen
int b;
public Boolean anfang1 = false;


void setup() 
{  
    size(600, 600); x.add(5); y.add(0);
}

  
 void draw() 
  {      
    background(0);
    
    if (anfang == false)
    {
        ausgabe();     //Startscreen erscheint am Anfang
    }
    else  
    
    background(255);  
    fill(colorBlack);
    
   if (anfang1 == false)
    {      
     text("Drücke ''m'' um zu Spielen!",280,300);       
     return; 
    }
    
    else
    
    
    text("Aktuelle Punktzahl: ",160,580);    
    text(a,330,580);    
    for (int i=0;i<w;i++) line(i*bs,0,i*bs,height);
    for(int i=0;i<h;i++)line(0,i*bs,width,i*bs);
    fill(0, 255, 0);
    
    if (a >= 10) //Wechseln der Schlangenfarben bei einer bestimmten Punktzahl --> hier 10
    {
        fill(colorA);
    }
    
      if (a >= 20)
    {
       fill(colorC);
    }
    
      if (a >= 30)
    {
       fill(colorD);
    }
    
      if (a >= 40)
    {
       fill(colorE);
    }
    if (a >= 50)
    {
       fill(colorF); 
    }
    if (a >= 60)
    {
       fill(colorG); 
    }
    if (a >= 70)
    {
       fill(colorH); 
    }
    
   
    
    for (int i = 0 ; i < x.size(); i++) 
    rect(x.get(i)*bs, y.get(i)*bs, bs, bs);
    
    if (gameover == false) 
    {  
        fill(colorBlack);     
        rect(ax*bs, ay*bs, bs, bs);   //rect mit vordimensioniertem Platzhalter
    
    if (frameCount%5==0) 
    {        
        x.add(0, x.get(0) + dx[dir]); y.add(0, y.get(0) + dy[dir]);
        if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true;
        for(int i=1;i<x.size();i++) if(x.get(0)==x.get(i)&&y.get(0)==y.get(i)) gameover=true;
        if (x.get(0)==ax && y.get(0)==ay)      
      { 
          ax = (int)random(0, w); ay = (int)random(0, h);  //random ax und random ay
          a = a + 1;
      
        if (a > speicher)  //Dreieckstausch
        {         
             b = a;
             speicher = a;        
        }                      
      }
        else 
      { 
            x.remove(x.size()-1); y.remove(y.size()-1); //Entferung
      }
   }
   }else 
    {
        background(0);
        fill(colorA); textSize(40); textAlign(CENTER); text("GAME OVER!",300,230);
        fill(colorA); textSize(40); textAlign(CENTER); text("|Enter|<- drücken ",300,350);
        if(keyPressed && key== ENTER) 
        { 
          x.clear(); y.clear(); x.add(5);  y.add(5); gameover = false; //Auf die Standartwerte zurücksetzen
          anfang = false;
          anfang1 = false;
      }    
    } 
  }
 
 
  void keyPressed() 
  { 
    int nd=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
    
    if (nd!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd]&&y.get(1)==y.get(0)+dy[nd])))
    {
        dir=nd;
    }
    
 

    if (keyPressed) // Zum Stoppen
    {
    if (key == 'p')
    {     
        noLoop();
        fill(colorA);
        text("Spiel pausiert",290,30);
    }
    }
    
    if (keyPressed)
    {
     if (key == 't')
     {
      
       loop();
       return;            
     }
    }
  
    if (keyPressed) //Zum Weiterspielen
    {
    if (key == 'z')
    {      
        loop();
        fill(colorC);        
    }
  }
  
   if (keyPressed) //Zum Weiterspielen
    {
    if (key == 'm')
    {      
        anfang1 = true;       
    } 
  }
}
 
    
  
 
void ausgabe()    //Der Startscreen der am Anfang erscheint
{
  background(0);  //Schwarzer Hintergrund
  if (anfang == false)
  {      
      x.clear(); y.clear();  x.add(100); y.add(0);  gameover = false; //Auf die Standartwerte zurücksetzen
    
      fill(colorG);
      text("Beste Punktzahl: ",140,540);    
      fill(colorG);
      text(b,290,540);
  }
  //<>//
     noStroke();
     fill(colorB); textSize(40); textAlign(CENTER); text("Spielsteuerung ''Snake''",width/2,height/14);
     fill(colorB); textSize(30); textAlign(CENTER); text("---------------------------",width/2,height/10);
     fill(colorC); textAlign(CENTER); text("|a| bewegt die Schlange nach links" ,300,90);
     fill(colorD); textAlign(CENTER); text("|s| bewegt die Schlange nach unten" ,300,130);
     fill(colorE); textAlign(CENTER); text("|d| bewegt die Schlange nach rechts" ,300,170);
     fill(colorF); textAlign(CENTER); text("|w| bewegt die Schlange nach oben" ,300,200);
     fill(colorH); textAlign(CENTER); text("|p| pausiert das Spiel" ,300,250);
     fill(colorH); textAlign(CENTER); text("|t| führt das Spiel fort" ,300,290);
     fill(colorG); textAlign(CENTER); text("drücke |Space| um das Spiel zu starten" ,300,400);     
     fill(colorB); textAlign(CENTER); text("----------------------------------" ,300,320);
     fill(colorA); textAlign(CENTER); text("----------------------------------",300,490);
     fill(colorG); textAlign(CENTER); text("---------------------------------" ,300,420);
     fill(colorG); textAlign(CENTER); text("---------------------------------" ,300,380);
     
       if (speicherung < b)  //Überprüfung ob neuer Rekord stattgefunden hat
        {
           fill(colorA);
           text("<--Neuer Rekord",460,540);
           fill(colorA);
           text(b,290,540);
        }
       
         
         
      if(keyPressed&&key== ' ') //Neustart des Spieles
      { 
          anfang = true;
          x.clear(); y.clear();  x.add(5); y.add(5);       
      }
      if (anfang == true)
      {
          speicherung = b;        
          a = 0;
          draw();     
      }  
  }
///////////////////////////////
  
// QUELLENANGABEN:

// https://processing.org/examples/arraylistclass.html -> Für Array List
// https://processing.org/examples/keyboardfunctions.html -> Für KeyPressed und Key Events
// https://processing.org/examples/array.html -> Für 1-dimensionales Array
// https://processing.org/examples/Color -> Für die Farben
// http://www.farb-tabelle.de/de/farbtabelle.htm -> Für die Farbcodes
// https://processing.org/reference/loop_.html  -> Pausierung des Spiels

///////////////////////////////
