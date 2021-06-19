class Cell{
    int i;
    int j;
    boolean[] explored;
    boolean[] options;
    float sizeHeight;
    float sizeWidth;
    boolean visited;
    float x;
    float y;

    Cell(int _i, int _j){
        this.i = _i;
        this.j = _j;

        this.explored = new boolean[4];
        this.options = new boolean[4];
        this.initialOptions();

        this.sizeHeight = height/NB_CELLS_HEIGHT;
        this.sizeWidth = width/NB_CELLS_WIDTH;

        this.visited = false;

        this.x = sizeWidth * (this.i + 0.5);
        this.y = sizeHeight * (this.j + 0.5);
    }

    void display(){
        fill(255);
        noStroke();
        ellipse(this.x, this.y, 2*this.sizeWidth/5, 2*this.sizeHeight/5);
    }
    void initialOptions(){
        for(int i=0; i<this.options.length; i++){
            this.explored[i] = false;
            this.options[i] = true;
        }
        if(this.i == 0) this.options[0] = false;
        else if(this.i == NB_CELLS_WIDTH-1) this.options[1] = false;
        if(this.j == 0) this.options[2] = false;
        else if(this.j == NB_CELLS_HEIGHT-1) this.options[3] = false;
    }
    Cell nextStep(){
        this.visited = true;

        boolean[] validOptions = new boolean[4];
        arrayCopy(this.options, validOptions);
        if(this.options[0] && (this.explored[0] || listGet(this.i-1, this.j).visited)) validOptions[0] = false;
        if(this.options[1] && (this.explored[1] || listGet(this.i+1, this.j).visited)) validOptions[1] = false;
        if(this.options[2] && (this.explored[2] || listGet(this.i, this.j-1).visited)) validOptions[2] = false;
        if(this.options[3] && (this.explored[3] || listGet(this.i, this.j+1).visited)) validOptions[3] = false;

        int count = 0;
        for(boolean bool : validOptions) if(bool) count++;

        if(count == 0) return null;

        int index = int(random(count));
        int realIndex = 0;
        while(realIndex < validOptions.length){
            if(validOptions[realIndex]){
                index--;
                if(index <= 0) break;
            }
            realIndex++;
        }
        
        Cell cell = new Cell(-5, -5);
        if(realIndex == 0) {
            cell = listGet(this.i-1, this.j);
            this.explored[0] = true;
            // println("Left");
        } else if(realIndex == 1) {
            cell = listGet(this.i+1, this.j);
            this.explored[1] = true;
            // println("Right");
        } else if(realIndex == 2) {
            cell = listGet(this.i, this.j-1);
            this.explored[2] = true;
            // println("Up");
        } else if(realIndex == 3) {
            cell = listGet(this.i, this.j+1);
            this.explored[3] = true;
            // println("Down");
        }
        cell.visited = true;
        return cell;
    }
    void reinitialize(){
        this.initialOptions();
        this.visited = false;
    }
}