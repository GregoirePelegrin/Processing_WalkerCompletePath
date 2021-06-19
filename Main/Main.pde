int NB_CELLS_HEIGHT = 5;
int NB_CELLS_WIDTH = 5;

ArrayList<Cell> cells;
Path path;

void setup(){
    size(600, 600);
    frameRate(30);

    cells = new ArrayList<Cell>();

    for(int i=0; i<NB_CELLS_WIDTH; i++){
        for(int j=0; j<NB_CELLS_HEIGHT; j++){
            cells.add(new Cell(i, j));
        }
    }

    path = new Path(listGet(int(random(NB_CELLS_WIDTH)), int(random(NB_CELLS_HEIGHT))));
}

void draw(){
    background(47, 79, 79);
    path.display();
    if(!path.update()){
        boolean mustDoAgain = false;
        for(Cell cell : cells){
            if(!cell.visited){
                mustDoAgain = true;
                path.pop();
                // println("I'm stuck");
                break;
            }
        }
        if(!mustDoAgain){
            println("Solved it!");
            noLoop();
        }
    }
}

Cell listGet(int _i, int _j){
    for(Cell cell : cells) if(cell.i == _i && cell.j == _j) return cell;
    return null;
}