SpriteManager _SM;

void setup() {
    size(1024, 768);
    _SM = new SpriteManager(); 
    _SM.spawn(new Shooter(450, 100));
    _SM.spawn(new Shooter(750, 100));
    _SM.spawn(new Shooter(650, 100));
    _SM.spawn(new SprayShooter(150, 100));

    
}

void draw() {
    background(0);
    _SM.manage();
}

void keyPressed(){
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}
