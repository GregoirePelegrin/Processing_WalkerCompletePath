class Path {
    ArrayList<Cell> path;

    Path(Cell start){
        path = new ArrayList<Cell>();

        path.add(start);
    }

    void display(){
        this.path.get(0).display();
        for(int i=1; i<this.path.size(); i++){
            Cell cell1 = this.path.get(i-1);
            Cell cell2 = this.path.get(i);
            
            noFill();
            stroke(255);
            strokeWeight(5);
            line(cell1.x, cell1.y, cell2.x, cell2.y);
            cell2.display();
        }
    }
    void pop(){
        this.path.get(this.path.size()-1).reinitialize();
        this.path.remove(this.path.size()-1);
    }
    boolean update(){
        Cell cell = path.get(path.size()-1);
        Cell nextCell = cell.nextStep();
        if(nextCell == null) return false;
        this.path.add(nextCell);
        return true;
    }
}