class Player extends Sprite {
    boolean alive = true;

    boolean left, right, up, down;
    float speed = 1.2;
    Player(float x, float y){
        super(x, y, 40, 40); // super refers to the parent. Sprite
        team = 1;
    }

    @Override
    void update(){
        if(left) vel.add(new PVector(-speed, 0));
        if(right) vel.add(new PVector(speed, 0));
        if(up) vel.add(new PVector(0, -speed));
        if(down) vel.add(new PVector(0, speed));

        pos.add(vel);

        vel.mult(0.9);


        if(pos.x < 0 + size.x/2){
            pos.x = size.x/2;
        }
        if(pos.x > width - size.x/2){
            pos.x = width - size.x/2;
        }
        if(pos.y < 0 + size.y/2){
            pos.y = size.y/2;
            }
        if(pos.y > height - size.y/2){
            pos.y = height - size.y/2;
        }

    }

    @Override
    void display(){
        fill(200,0,200);
        ellipse(pos.x, pos.y, size.x, size.y);
    }

    @Override
    void handleCollision(){
       _SM.destroy(this);
       alive = false;
    }

    
    void keyUp() {
        switch(key){
            case 'a': left = false; break;
            case 'A':
            case 's': down = false; break;
            case 'S':
            case 'd': right = false; break;
            case 'D':
            case 'w': up = false; break;
            case 'W':
     }       
    }
      void keyDown() {
        if(alive){
        switch(key) {
            case 'a':
            case 'A': left = true; break;
            case 's':
            case 'S': down = true; break;
            case 'd':
            case 'D': right = true; break;
            case 'w':
            case 'W': up = true; break;
            case ' ':
            case 'f': fire(); break;
        
        }     
    }
    }

    void fire() { 
        PVector aim = new PVector(0, -10);
        _SM.spawn(new Bullet(pos.x,pos.y ,aim,team));
    }

}
