import processing.sound.SoundFile; //<>//

PImage imgMario1, imgMario2, imgMario3, imgMario4, imgMario5, imgMario6, imgMario7, imgMario8, imgMario9, imgMario10, imgMarioParado, imgMarioAtingido;
PImage imgBG, imgCano, imgPlanta, imgCogumelo, imgBola, imgBala, imgCogumeloVerde, imgPonto, imgPontoDezena, imgMoldura, imgGameOver, imgMiss, imgInicial;
SoundFile gameover, losepoint, fall, hit, point;

boolean gameStart=false;
boolean gameOver=false;
boolean musicaGameOver=false;

//variáveis Mario
int xMario=(int)random(240, 348);
int yMario=196;
int tempoMario=0;
int countPulo=0;

//variáveis do cogumelo/bola (1);
float barraX1=173.0;
float barraY1=213.0;
float ang1=0;
boolean cogumelo1;
int nAleatorio1=0;

//variáveis do cogumelo/bola (2);
float barraX2=173.0;
float barraY2=300.0;
float ang2=0;
boolean cogumelo2;
int nAleatorio2=0;

//variáveis do cogumelo/bola (3);
float barraX3=481.0;
float barraY3=200.0;
float ang3=0;
boolean cogumelo3;
int nAleatorio3=0;

//variáveis do cogumelo/bola (4);
float barraX4=481.0;
float barraY4=500.0;
float ang4=0;
boolean cogumelo4;
int nAleatorio4=0;

//variáveis bala
int xbala=173;
int tempoBala=0;

//variáveis planta
float xplanta= 172;
int countPlanta=0;

//variáveis ponto
int countPonto=0;

//variáveis miss
float countMiss=0;
int tempoMiss=0;

//Estados Possiveis Mario
final int PARADO = 1;
final int ANDANDOESQUERDA = 2;
final int ANDANDODIREITA= 3;
final int PULANDO=4;
final int CHOQUE1=5;
final int CHOQUE2=6;

//Estados inicial Mario
int estadoMario=PARADO;

//Estados Possiveis Cogumelo
final int NABARRA=1;
final int CAINDO=2;
final int NOCHAO=3;
final int SOME=4;

//Estado incial Cogumelo
int estadoCogumelo1=SOME;
int estadoCogumelo2=SOME;
int estadoCogumelo3=SOME;
int estadoCogumelo4=SOME;

//Estado possiveis Planta
final int PLANTAAPARECE=1;
final int PLANTAPARADA=2;
final int PLANTADESAPARECE=3;

//Estado incial Planta
int estadoPlanta=PLANTADESAPARECE;

//Estado Bala
boolean estadoBala=false;

void setup() {
  size(653, 392);
  gameover = new SoundFile(this, "sons/gameover.wav");
  losepoint = new SoundFile(this, "sons/losepoint.wav");
  hit = new SoundFile(this, "sons/hit.wav");
  fall = new SoundFile(this, "sons/fall.wav");
  point = new SoundFile(this, "sons/coin.wav");

  imgBG = loadImage("imagens/cenario.png");
  imgCano= loadImage("imagens/cano.png");
  imgMario1 = loadImage("imagens/mario-e1.png");
  imgMario2 = loadImage("imagens/mario-e2.png");
  imgMario3 = loadImage("imagens/mario-e3.png");
  imgMario4 = loadImage("imagens/mario-e4.png");
  imgMario5 = loadImage("imagens/mariopulo-e.png");
  imgMario6 = loadImage("imagens/mario-w1.png");
  imgMario7 = loadImage("imagens/mario-w2.png");
  imgMario8 = loadImage("imagens/mario-w3.png");
  imgMario9 = loadImage("imagens/mario-w4.png");
  imgMario10 = loadImage("imagens/mariopulo-w.png");
  imgMarioParado=loadImage("imagens/marioparado.png");
  imgMarioAtingido=loadImage("imagens/marioatingido.png");
  imgPlanta= loadImage("imagens/planta.png");
  imgCogumelo =loadImage("imagens/red.png");
  imgBala= loadImage("imagens/bala.png");
  imgCogumeloVerde= loadImage("imagens/green.png");
  imgBola= loadImage("imagens/bola.png");
  imgMoldura= loadImage("imagens/moldura.png");
  imgGameOver= loadImage("imagens/gameover.png");
  imgMiss= loadImage("imagens/miss1.png");
  imgInicial = loadImage("imagens/telainicial.png");
}

void draw() {
  if (gameStart==false) {
    mostraTela();
  } else {

    if (gameOver==false) {
      mostraBackground();
      mostraMario();
      mefMario();
      mostraPlanta();
      movePlanta();
      mefPlanta();
      mostraCogumelo1();
      moveCogumelo1();
      mefCogumelo1();
      mostraCogumelo2();
      moveCogumelo2();
      mefCogumelo2();
      mostraCogumelo3();
      moveCogumelo3();
      mefCogumelo3();
      mostraCogumelo4();
      moveCogumelo4();
      mefCogumelo4();
      mostraBala();
      moveBala();
      mefBala();
      verificaPonto();
      desenhaPonto(434, 108);
      contaMiss();
      mostraMiss();
      verificaColisaoBalaMario();
    } else if (estadoMario == CHOQUE1 || estadoMario == CHOQUE2) {
      mostraGameOverBala();
    } else {
      if (musicaGameOver==false) {
        gameover.play();
        musicaGameOver = true;
      }
      image(imgGameOver, 0, 0);
      desenhaPonto(320, 235);
      if (keyPressed == true && key== ENTER) {
        inicializa();
      }
    }
  }
  //println(mouseX, mouseY);
}

void inicializa () {
  gameStart=false;
  gameOver=false;
  musicaGameOver=false;

  //variáveis Mario
  xMario=(int)random(240, 348);
  yMario=196;
  tempoMario=0;
  countPulo=0;

  //variáveis do cogumelo/bola (1);
  barraX1=173.0;
  barraY1=213.0;
  ang1=0;
  cogumelo1 = false;
  nAleatorio1=0;

  //variáveis do cogumelo/bola (2);
  barraX2=173.0;
  barraY2=300.0;
  ang2=0;
  cogumelo2 = false;
  nAleatorio2=0;

  //variáveis do cogumelo/bola (3);
  barraX3=481.0;
  barraY3=200.0;
  ang3=0;
  cogumelo3 = false;
  nAleatorio3=0;

  //variáveis do cogumelo/bola (4);
  barraX4=481.0;
  barraY4=500.0;
  ang4=0;
  nAleatorio4=0;

  //variáveis bala
  xbala=173;
  tempoBala=0;

  //variáveis planta
  xplanta= 172;
  countPlanta=0;

  //variáveis ponto
  countPonto=0;

  //variáveis miss
  countMiss=0;
  tempoMiss=0;


  //Estados inicial Mario
  estadoMario=PARADO;

  //Estado incial Cogumelo
  estadoCogumelo1=SOME;
  estadoCogumelo2=SOME;
  estadoCogumelo3=SOME;
  estadoCogumelo4=SOME;

  //Estado incial Planta
  estadoPlanta=PLANTADESAPARECE;

  //Estado Bala
  estadoBala=false;
}

void mostraTela() {
  image(imgInicial, 0, 0);
  if (keyPressed == true)
    if (key==ENTER) {
      gameStart=true;
    }
}

void mostraGameOverBala() {
  mostraBackground();
  mostraMario();
  mefMario();
  mostraPlanta();
  mostraCogumelo1();
  mostraCogumelo2();
  mostraCogumelo3();
  mostraCogumelo4();
  mostraBala();
  mostraMiss();
  desenhaPonto(434, 108);
}

void verificaPonto() {
  if (estadoMario!=PARADO) {
    int raioCogumelo = 10;
    int maoMario=238;

    if (estadoMario==PULANDO) {
      maoMario=212;
    }

    float dist2Cogumelo1 = dist(xMario, maoMario, barraX1, barraY1);
    float dist2Cogumelo2 = dist(xMario, maoMario, barraX2, barraY2);
    float dist2Cogumelo3 = dist(xMario + 67, maoMario, barraX3, barraY3);
    float dist2Cogumelo4 = dist(xMario + 67, maoMario, barraX4, barraY4); 

    if (dist2Cogumelo1 < raioCogumelo) {
      if (cogumelo1==true) {
        countPonto++;
        point.play();
      } else {
        countPonto-=2;
        losepoint.play();
      }
      nAleatorio1= int(random(0, 5));
      estadoCogumelo1=SOME;
    } else if (dist2Cogumelo2 < raioCogumelo) {
      if (cogumelo2==true) {
        countPonto++;
        point.play();
      } else {
        countPonto-=2;
        losepoint.play();
      }
      nAleatorio2= int(random(0, 5));
      estadoCogumelo2=SOME;
    } else if (dist2Cogumelo3 < raioCogumelo) {
      if (cogumelo3==true) {
        countPonto++;
        point.play();
      } else {
        countPonto-=2;
        losepoint.play();
      }
      nAleatorio3= int(random(0, 5));
      estadoCogumelo3=SOME;
    } else if (dist2Cogumelo4 < raioCogumelo) {
      if (cogumelo4==true) {
        countPonto++;
        point.play();
      } else {
        countPonto-=2;
        losepoint.play();
      }
      nAleatorio4= int(random(0, 5));
      estadoCogumelo4=SOME;
    }

    if (countPonto<0)
      countPonto=0;
  }
}

void mostraBackground() {
  background(imgBG);
}

void mostraMario() {

  if (estadoMario==PARADO) {
    image(imgMarioParado, xMario, 196);
  } else if (estadoMario==ANDANDOESQUERDA) {
    if (tempoMario<10) image(imgMario6, xMario, 196);
    else if (tempoMario<20) image(imgMario7, xMario, 196);
    else if (tempoMario<30) image(imgMario8, xMario, 196);
    else if (tempoMario<40) image(imgMario9, xMario, 196);
    else tempoMario=0;
    tempoMario++;
    if (tempoMario==40) 
      tempoMario=0;
  } else if (estadoMario==ANDANDODIREITA) {
    if (tempoMario<10) image(imgMario1, xMario, 196);
    else if (tempoMario<20) image(imgMario2, xMario, 196);
    else if (tempoMario<30) image(imgMario3, xMario, 196);
    else if (tempoMario<40) image(imgMario4, xMario, 196);
    else tempoMario=0;
    tempoMario++;
    if (tempoMario==40) 
      tempoMario=0;
  } else if (estadoMario==PULANDO) {
    if (key=='q')
      image(imgMario10, xMario, 170);
    else if (key=='p')
      image(imgMario5, xMario, 170);
  } else if (estadoMario==CHOQUE1) {
    image(imgMarioAtingido, xMario, yMario);
    tempoMario++;
  } else if (estadoMario==CHOQUE2) {
    image(imgMarioAtingido, xMario, yMario);
    image(imgMoldura, 0, 0);
  }
}

void mefMario() {
  if (gameOver==false) {
    if (xMario>=240 && xMario<=348) {
      if (keyPressed && key=='a') {
        estadoMario=ANDANDOESQUERDA;
        xMario=xMario-4;
      } else if (keyPressed && key=='l') {
        estadoMario=ANDANDODIREITA;
        xMario=xMario+4;
      } else if (keyPressed && (key=='q'||key=='p')) {
        estadoMario=PULANDO;
      } else estadoMario=PARADO;
    }

    if (xMario<240)
      xMario=240;
    if (xMario>348)
      xMario=348;
  }

  if (gameOver==true && estadoMario==CHOQUE1) {
    if (yMario>160) {
      yMario-=2;
    } else {
      estadoMario = CHOQUE2;
    }
  }
  if (gameOver==true && estadoMario==CHOQUE2) {
    if (yMario<300) {
      yMario+=2;
    } else if (yMario==300)
      estadoMario=PARADO;
  }
}

void mostraCogumelo1() {
  if (estadoCogumelo1 != SOME) {
    if (nAleatorio1==1) 
      cogumelo1=false;
    else
      cogumelo1=true;

    if (cogumelo1==true) {
      pushMatrix();
      translate(barraX1, barraY1);
      rotate(ang1);
      image(imgCogumelo, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }
    if (cogumelo1==false) {
      pushMatrix();
      translate(barraX1, barraY1);
      rotate(ang1);
      image(imgBola, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }

    if (barraX1==243 && barraY1==279) {
      fall.play();
    }
  }
}


void mefCogumelo1() {
  if (barraX1<=243 && barraX1>=173 && barraY1<=203) {
    estadoCogumelo1=NABARRA;
  }
  if (barraX1>243 && barraY1< 279) {
    estadoCogumelo1=CAINDO;
  }
  if (barraX1>173 && barraY1== 279) {
    estadoCogumelo1=NOCHAO;
  } 
  if (barraX1<173 && barraY1==279) {
    estadoCogumelo1=SOME;
    nAleatorio1= int(random(0, 5));
  }
  //println(barraY1);
}


void moveCogumelo1() {
  if (estadoCogumelo1==NABARRA) {
    barraX1+=0.5;
    ang1+=PI/36;
  } 
  if (estadoCogumelo1==CAINDO) {
    barraY1++;
    ang1+=PI/36;
  } 
  if (estadoCogumelo1==NOCHAO) {
    barraX1-=0.5;
    ang1-=PI/36;
  }
  if (estadoCogumelo1==SOME) {
    barraX1=173;
    barraY1--;
  }
}

void mostraCogumelo2() {
  if (estadoCogumelo2 != SOME) {

    if (nAleatorio2==1) 
      cogumelo2=false;
    else
      cogumelo2=true;

    if (cogumelo2==true) {
      pushMatrix();
      translate(barraX2, barraY2);
      rotate(ang2);
      image(imgCogumelo, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }
    if (cogumelo2==false) {
      pushMatrix();
      translate(barraX2, barraY2);
      rotate(ang2);
      image(imgBola, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }

    if (barraX2==243 && barraY2==279) {
      fall.play();
    }
  }
}


void mefCogumelo2() {
  if (barraX2<=243 && barraX2>=173 && barraY2<=156) {
    estadoCogumelo2=NABARRA;
  }
  if (barraX2>243 && barraY2< 279) {
    estadoCogumelo2=CAINDO;
  }
  if (barraX2>173 && barraY2== 279) {
    estadoCogumelo2=NOCHAO;
  } 
  if (barraX2<173 && barraY2==279) {
    estadoCogumelo2=SOME;
    nAleatorio2= int(random(0, 5));
  }
  //println(barraY2);
}


void moveCogumelo2() {

  if (estadoCogumelo2==NABARRA) {
    barraX2+=0.5;
    ang2+=PI/36;
  } 
  if (estadoCogumelo2==CAINDO) {
    barraY2++;
    ang2+=PI/36;
  } 
  if (estadoCogumelo2==NOCHAO) {
    barraX2-=0.5;
    ang2-=PI/36;
  }
  if (estadoCogumelo2==SOME) {
    barraX2=173;
    barraY2--;
  }
}

void mostraCogumelo3() {
  if (estadoCogumelo3 != SOME) {

    if (nAleatorio3==1) 
      cogumelo3=false;
    else
      cogumelo3=true;

    if (cogumelo3==true) {
      pushMatrix();
      translate(barraX3, barraY3);
      rotate(ang3);
      image(imgCogumelo, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }
    if (cogumelo3==false) {
      pushMatrix();
      translate(barraX3, barraY3);
      rotate(ang3);
      image(imgBola, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }
    if (barraX3==412 && barraY3==279) {
      fall.play();
    }
  }
}


void mefCogumelo3() {
  if (barraX3>=412 && barraX3<=481 && barraY3<=154) {
    estadoCogumelo3=NABARRA;
  }
  if (barraX3<412 && barraY3< 279) {
    estadoCogumelo3=CAINDO;
  }
  if (barraX3<481 && barraY3== 279) {
    estadoCogumelo3=NOCHAO;
  } 
  if (barraX3>481 && barraY3==279) {
    estadoCogumelo3=SOME;
    nAleatorio3= int(random(0, 5));
  }
}


void moveCogumelo3() {

  if (estadoCogumelo3==NABARRA) {
    barraX3-=0.5;
    ang3-=PI/36;
  } 
  if (estadoCogumelo3==CAINDO) {
    barraY3++;
    ang3-=PI/36;
  } 
  if (estadoCogumelo3==NOCHAO) {
    barraX3+=0.5;
    ang3+=PI/36;
  }
  if (estadoCogumelo3==SOME) {
    barraX3=481;
    barraY3--;
  }
}

void mostraCogumelo4() {
  if (estadoCogumelo4 != SOME) {
    if (nAleatorio4==1) 
      cogumelo4=false;
    else
      cogumelo4=true;

    if (cogumelo4==true) {
      pushMatrix();
      translate(barraX4, barraY4);
      rotate(ang4);
      image(imgCogumelo, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }
    if (cogumelo4==false) {
      pushMatrix();
      translate(barraX4, barraY4);
      rotate(ang4);
      image(imgBola, -10, -10);
      popMatrix();
      image(imgMoldura, 0, 0);
    }
    if (barraX4==412 && barraY4==279) {
      fall.play();
    }
  }
}


void mefCogumelo4() {
  if (barraX4>=412 && barraX4<=481 && barraY4<=201) {
    estadoCogumelo4=NABARRA;
  }
  if (barraX4<412 && barraY4< 279) {
    estadoCogumelo4=CAINDO;
  }
  if (barraX4<481 && barraY4== 279) {
    estadoCogumelo4=NOCHAO;
  } 
  if (barraX4>481 && barraY4==279) {
    estadoCogumelo4=SOME;
    nAleatorio4= int(random(0, 5));
  }
}


void moveCogumelo4() {

  if (estadoCogumelo4==NABARRA) {
    barraX4-=0.5;
    ang4-=PI/36;
  } 
  if (estadoCogumelo4==CAINDO) {
    barraY4++;
    ang4-=PI/36;
  } 
  if (estadoCogumelo4==NOCHAO) {
    barraX4+=0.5;
    ang4+=PI/36;
  }
  if (estadoCogumelo4==SOME) {
    barraX4=481;
    barraY4--;
  }
}

void mefPlanta() {
  if (estadoPlanta==PLANTAPARADA && xplanta==172) {
    estadoPlanta=PLANTADESAPARECE;
  }

  if (estadoPlanta==PLANTADESAPARECE && countPlanta>=300) {
    estadoPlanta=PLANTAAPARECE;
  } else if (estadoPlanta==PLANTAAPARECE) {
    countPlanta=0;
  }
  countPlanta++;
}

void mostraPlanta() {
  image(imgCano, 173, 102);

  if (estadoPlanta==PLANTAAPARECE && xplanta<=220) {
    image(imgPlanta, xplanta, 101);
    image(imgCano, 173, 102);
  } 
  if (estadoPlanta==PLANTAAPARECE && xplanta>220 ) {
    estadoPlanta=PLANTAPARADA;
    image(imgPlanta, xplanta, 101);
  }
  if (estadoPlanta==PLANTAPARADA && xplanta>172) {
    image(imgPlanta, xplanta, 101);
    image(imgCano, 173, 102);
  }
}

void movePlanta() {
  if (estadoPlanta==PLANTAAPARECE && xplanta<=220) {
    xplanta+=0.5;
  }
  if (estadoPlanta==PLANTAPARADA && xplanta>172) {
    xplanta-=0.5;
  }
}

void mostraBala() {
  if (estadoBala==true) {
    image(imgBala, xbala, 262);
  }
}

void moveBala() {
  if (xbala>172 && xbala<454) {
    xbala+=2;
  } else
    xbala=173;
}

void mefBala() {
  if (estadoBala==false && tempoBala>=480) {
    estadoBala=true;
    xbala=173;
  } else if (estadoBala==true && xbala >=454) {
    estadoBala=false;
    tempoBala=0;
  }

  tempoBala++;
}

void verificaColisaoBalaMario() {
  if (estadoBala==true && estadoMario!=PULANDO) {
    if (xbala>=xMario-2 && xbala<=xMario+70) {
      hit.play();
      tempoMario=0;
      estadoMario=CHOQUE1;
      gameOver=true;
      if (xbala>=xMario-2 && xbala<=xMario+70 && yMario<=160) {
        estadoMario=CHOQUE2;
      }
    }
  }
}

void mostraMiss() {
  if (countMiss == 0.5) {
    if (tempoMiss > 30) {
      image(imgCogumeloVerde, 374, 128);
    }
  }
  if (countMiss == 1.0) {
    image(imgCogumeloVerde, 374, 128);
  } 
  if (countMiss == 1.5) {
    image(imgCogumeloVerde, 374, 128);
    if (tempoMiss > 30) {
      image(imgCogumeloVerde, 354, 128);
    }
  }
  if (countMiss == 2.0) {
    image(imgCogumeloVerde, 374, 128);
    image(imgCogumeloVerde, 354, 128);
  }
  if (countMiss == 2.5) {
    image(imgCogumeloVerde, 374, 128);
    image(imgCogumeloVerde, 354, 128);
    if (tempoMiss > 30) {
      image(imgCogumeloVerde, 334, 128);
    }
  }
  if (countMiss >= 3.0) {
    image(imgCogumeloVerde, 374, 128);
    image(imgCogumeloVerde, 354, 128);
    image(imgCogumeloVerde, 334, 128);
  }

  if (countMiss > 0) {
    image(imgMiss, 350, 115);
  }

  tempoMiss++;
  if (tempoMiss == 60)
    tempoMiss = 0;
}

void contaMiss() {
  if ((estadoCogumelo1==NOCHAO && barraX1==243.5 && barraY1==279 && cogumelo1 == true)||
    (estadoCogumelo2==NOCHAO && barraX2==243.5 && barraY2==279 && cogumelo2 == true)||
    (estadoCogumelo3==NOCHAO && barraX3==412.5 && barraY3==279 && cogumelo3 == true)||  //Os ifs daqui podem nao estar batendo a condicao nos cogumelo da direita
    (estadoCogumelo4==NOCHAO && barraX1==412.5 && barraY1==279 && cogumelo4 == true)) { 
    if (estadoPlanta==PLANTADESAPARECE) {
      countMiss+=0.5;
    } else {
      countMiss++;
    }
  }
  if (countMiss==3) {
    gameOver=true;
  }
}

void desenhaPonto(int x, int y) {
  if (countPonto<10) {
    imgPonto = loadImage("imagens/n-" + countPonto  + ".png");
    image(imgPonto, x, y); //434, 108
  } else {
    String ponto = String.valueOf(countPonto);
    imgPonto = loadImage("imagens/n-" + ponto.charAt(1) + ".png");
    image(imgPonto, x, y);
    imgPontoDezena =  loadImage("imagens/n-" + ponto.charAt(0) + ".png");
    image(imgPontoDezena, x-18, y);
  }
}
