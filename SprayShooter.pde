class SprayShooter extends Invader {

    long mark, wait = 2400;

    SprayShooter(float x, float y) {
        super(x,y);
        mark = millis();
    }

    @Override
    void display() {
        fill(50,205,50);
        ellipse(pos.x, pos.y, size.x, size.y);
    }

    @Override
    void update(){
        super.update();
        PVector aim1 = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        PVector aim2 = new PVector(_SM.player.pos.x - this.pos.x + 150, _SM.player.pos.y - this.pos.y);
        PVector aim3 = new PVector(_SM.player.pos.x - this.pos.x - 150, _SM.player.pos.y - this.pos.y);
        
        aim1 = aim1.normalize().mult(8);
        aim2 = aim2.normalize().mult(8);
        aim3 = aim3.normalize().mult(8);

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim1, team));
            _SM.spawn(new Bullet(pos, aim2, team));
            _SM.spawn(new Bullet(pos, aim3, team));
        }
    }
}