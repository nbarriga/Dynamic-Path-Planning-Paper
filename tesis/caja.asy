import graph;

unitsize(1cm);

marker mymarker=marker(scale(0.6mm)*unitcircle,black,FillDraw(black));
pair startpos=(0,0);

struct square{
    pair pos;
    pair size;
    void operator init(pair pos, pair size) {
        this.pos=pos;
        this.size=size;
    }
}

void drawSquare(square sq){

    fill((sq.pos.x,sq.pos.y) -- (sq.pos.x, sq.pos.y+sq.size.y) -- (sq.pos.x+sq.size.x, sq.pos.y+sq.size.y) -- (sq.pos.x+sq.size.x, sq.pos.y) -- cycle, grey);
    draw((sq.pos.x,sq.pos.y) -- (sq.pos.x, sq.pos.y+sq.size.y) -- (sq.pos.x+sq.size.x, sq.pos.y+sq.size.y) -- (sq.pos.x+sq.size.x, sq.pos.y) -- cycle, black + 1pt);
}

void drawPath(pair pos, path g){
    g=shift(pos)*g;
    draw(g, black + 1pt,mymarker); 
}

void drawScene(pair deviation,square[] s1, square[] s2, path[] p1, path[] p2, Label label){
    pair pos=shift(deviation)*startpos;

    for(int i=0;i<s1.length;++i){
        s1[i].pos=shift(deviation)*s1[i].pos;
        drawSquare(s1[i]);
    }
    for(int i=0;i<p1.length;++i){
        drawPath(pos,p1[i]);
    }
    arrow("",shift(deviation)*(0.4,-1.7),N,1.2cm);

    pos=shift(0,-3.5)*pos;

    for(int i=0;i<s1.length;++i){
        s2[i].pos=shift(deviation)*shift(0,-3.5)*s2[i].pos;
        drawSquare(s2[i]);
    }
    for(int i=0;i<p2.length;++i){
        drawPath(pos,p2[i]);
    }
    label(label,shift(deviation)*(0.5,-4));
}


square[] s1={square((0,0),(1,1))};
square[] s2={square((0,0),(1,1))};
path[] p1={(-1, 0.2) -- (0.4, -0.1) -- (1.5, 1.3) -- (1.7,-0.2),(-0.9,1.1) -- (0.9, 1.1) -- (1.7,-0.2)};
path[] p2={(-1, 0.2) -- (0.4, -0.1) -- (0.9, 1.1) -- (1.7,-0.2),(-0.9, 1.1) -- (1.5, 1.3) -- (1.7,-0.2)};
pair dev=(0,0);
drawScene(dev,s1,s2,p1,p2,Label("Crossover"));


square[] s1={square((0,0),(1,1))};
square[] s2={square((0,0),(1,1))};
path[] p1={(-1, 0.2) -- (2.8, 0.4) -- (0.2, 1.4) -- (3, 1.4)};
path[] p2={(-1, 0.2) -- (0.2, 1.4) -- (3, 1.4)};
pair dev=(0,-8);
drawScene(dev,s1,s2,p1,p2,Label("Delete"));


square[] s1={square((0,0),(1,1)), square((1.1, 0.6),(0.2, 0.9))};
square[] s2={square((0,0),(1,1)), square((1.1, 0.6),(0.2, 0.9))};
path[] p1={(-1, 1) -- (0.9, 1.2) -- (1.1, 1.7) -- (2.2, 1.4)};
path[] p2={(-1, 1) -- (0.6, 1.6) -- (1.1, 1.7) -- (2.2, 1.4)};
pair dev=(6,0);
drawScene(dev,s1,s2,p1,p2,Label("Mutation\_1"));


square[] s1={square((0,0),(1,1))};
square[] s2={square((0,0),(1,1))};
path[] p1={(-1, 0.2) -- (2.8, 0.4) -- (0.2, 1.4) -- (3, 1.4)};
path[] p2={(-1, 0.2) --  (0.2, 1.4) -- (2.8, 0.4) --(3, 1.4)};
pair dev=(6,-8);
drawScene(dev,s1,s2,p1,p2,Label("Swap"));


square[] s1={square((0,0),(1,1))};
square[] s2={square((0,0),(1,1))};
path[] p1={(-1, 0.2) -- (-0.5, 0.9) -- (0.1, -0.3) -- (2.2, 0.3)};
path[] p2={(-1, 0.2) -- ((-1, 0.2)+(-0.5, 0.9))/2 -- ((-0.5, 0.9)+(0.1, -0.3))*3/4 -- (0.1, -0.3) -- (2.2, 0.3)};
pair dev=(12,-8);
drawScene(dev,s1,s2,p1,p2,Label("Smooth"));
path g=shift(dev)*shift(0,-3.5)*((-1, 0.2) -- (-0.5, 0.9) -- (0.1, -0.3));
draw(g, black + 1pt + dotted,mymarker);

square[] s1={square((0,0),(0.7,0.2)), square((0.9, 0.1),(0.5, 0.7)),
square((0.6,0.9),(0.7,0.5))};
square[] s2={square((0,0),(0.7,0.2)), square((0.9, 0.1),(0.5, 0.7)),
square((0.6,0.9),(0.7,0.5))};
path[] p1={(-0.2,1) -- (0.7, 0.7) -- (2.2, -0.3)};
path[] p2={(-0.2,1) -- (-1, -0.1) -- (2.2, -0.3)};
pair dev=(12,0);
drawScene(dev,s1,s2,p1,p2,Label("Mutation\_2"));

square[] s1={square((0,0),(1,1)),square((2,0.5),(1,1))};
square[] s2={square((0,0),(1,1)),square((2,0.5),(1,1))};
path[] p1={(-1, 1) -- (1.5,0.4) -- (2.5, 1) -- (4, 0.2)};
path[] p2={(-1, 1) -- (0.9,1.8) -- (1.5,0.4) -- (4, 0.2)};
pair dev=(18,0);
drawScene(dev,s1,s2,p1,p2,Label("Insert\_Delete"));

square[] s1={square((0,0),(1,1))};
square[] s2={square((0,0),(1,1))};
path[] p1={(-1.5, 0.2) -- (-0.3, 0.8) -- (2.2, 0.3)};
path[] p2={(-1.5, 0.2) -- (-0.3, 0.8) -- (-0.1,0.75) -- (-0.1,-0.1) -- (1.1,-0.1) -- (1.1,0.55) -- (2.2, 0.3)};
pair dev=(18,-8);
drawScene(dev,s1,s2,p1,p2,Label("Repair"));
