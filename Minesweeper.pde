import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20;
int tileCount = 0;
boolean lose = false;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 500);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to initialize buttons goes here
    buttons = new MSButton [NUM_ROWS] [NUM_COLS];
    for (int i = 0; i<NUM_ROWS;i++)
        for (int j = 0; j<NUM_COLS;j++)
            buttons [i][j] = new MSButton(i,j);
    
    
    
    for (int i = 0; i < 50; i++)
        setMines();
}
public void setMines()
{
    //your code
    int r = (int)(Math.random()*NUM_ROWS);
    int c = (int)(Math.random()*NUM_COLS);
    if (!mines.contains(buttons[r][c]))
        mines.add(buttons[r][c]);
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
    for (int i = 0; i < NUM_ROWS; i++) {
    for (int j = 0; j < NUM_COLS; j++) {
        buttons[i][j].draw();
}
public boolean isWon()
{
    //your code here
   /*for (int i = 0; i<NUM_ROWS;i++)
        for (int j = 0; j<NUM_COLS;j++)
            if(buttons[i][j].isFlagged() == false)
                return false; */
    return  false;
}
public void displayLosingMessage()
{
    for(int i=0;i<mines.size();i++)
        if(mines.get(i).isFlagged()==false)
            mines.get(i).mousePressed();
    lose = true;
    fill(255, 0, 0);
    text("YOU WON!", 200, 450);
    //your code here
}
public void displayWinningMessage()
{
    lose = true;
    fill(0, 255, 0);
    text("YOU WON!", 200, 450);
    //your code here
}
public boolean isValid(int r, int c)
{
    //your code here
    return (r < NUM_ROWS && r >=0 && c >=0 && c < NUM_COLS);
}
public int countMines(int row, int col)
{
    int numMines = 0;
    //your code here
    for (int i = row-1; i <= row+1; i++){
    for (int j =col-1; j <= col+1; j++){
      if (isValid(i,j) == true && mines.contains(buttons[i][j])==true)
        numMines++;
    }
  } 
  if (mines.contains(buttons[row][col])==true)
    numMines--;
  return numMines;
}
public class MSButton
{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;
    
    public MSButton ( int row, int col )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }

    // called by manager
    public void mousePressed () 
    {
        clicked = true;
        //your code here
        if (lose == false) {
        if (mouseButton == RIGHT && buttons[r][c].isFlagged()) {}
        else if (mouseButton == RIGHT) {marked = !marked;}
        else if (marked == true) {}
        else if (mines.contains(this)) {
          flagged = true;
          displayLosingMessage();
        }
        else if (countmines(r,c) > 0) {
          label = ""+countmines(r,c);
          if (!flagged) {tileCount+=1;}
          if (tileCount == 600-mines.size()) {displayWinningMessage();}
          flagged = true;
        }
        else {

          
            if (!flagged) {tileCount+=1;}
            if (tileCount == 600-mines.size()) {displayWinningMessage();}
            flagged = true;
            if (!flagged) {tileCount+=1;}
            if (tileCount == 600-mines.size()) {displayWinningMessage();}
            if (isValid(myRow-1,myCol-1)&&buttons[myRow-1][myCol-1].clicked ==false)
                buttons[myRow-1][myCol-1].mousePressed();
            if (isValid(myRow-1,myCol)&&buttons[myRow-1][myCol].clicked ==false)
                buttons[myRow-1][myCol].mousePressed();
            if (isValid(myRow-1,myCol+1)&&buttons[myRow-1][myCol+1].clicked ==false)
                buttons[myRow-1][myCol+1].mousePressed();
            if (isValid(myRow,myCol-1)&&buttons[myRow][myCol-1].clicked ==false)
                buttons[myRow][myCol-1].mousePressed();
            if (isValid(myRow,myCol+1)&&buttons[myRow][myCol+1].clicked ==false)
                buttons[myRow][myCol+1].mousePressed();
            if (isValid(myRow+1,myCol-1)&&buttons[myRow+1][myCol-1].clicked ==false)
                buttons[myRow+1][myCol-1].mousePressed();
            if (isValid(myRow+1,myCol)&&buttons[myRow+1][myCol].clicked ==false)
                buttons[myRow+1][myCol].mousePressed();
            if (isValid(myRow+1,myCol+1)&&buttons[myRow+1][myCol+1].clicked ==false)
                buttons[myRow+1][myCol+1].mousePressed();
        }
    } 
    public void draw () 
    {    
        if (flagged)
            fill(0);
        else if( clicked && mines.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        myLabel = newLabel;
    }
    public void setLabel(int newLabel)
    {
        myLabel = ""+ newLabel;
    }
    public boolean isFlagged()
    {
        return flagged;
    }
}
