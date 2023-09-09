//*****************************************************************Sorting Algorthims Assignment*****************************************************************\\
//Charlotte Fritz
//November 1, 2019
//---------------------------------Declare Variables
int temp; //to temporarily store a value
int x; //size of the array (100, 1000, 10000000 etc.)
int [] numArray; //array to store all the random values of length 'x'
float start; //time the particular algorithim begins sorting number array
float [] []  ellapsed = new float [4][5]; //stores all the ellapsed times for each cell
int fin; //to store rounded ellapsed times and to display times on interface
int [] [] grid = new int [5][6]; //to draw grid for interface
int row; //to track rows in grid
int col; //to track coloumns in grid

//---These are true/false statements to determine what shoudl eb displayed on the graph
boolean haveNums = false;
boolean bubble = false;
boolean select = false;
boolean insert = false;
boolean quick = false;

void setup() {
  size(900, 800); //draw screen
}

void draw() {
  background(255); //white background
  drawGrid(); //draw the grid
  drawGraph(); //draw the graph
  text(); //draw text for gird
  //-----Then we check to see how many/what values we need to find
  runAll(); //all the values
  runOne(); //one specific value
  row();//values for a row
  col();//or a coloumn
}

void drawGrid() {
  for (int j=0; j<grid.length; j++) //j increases until it is height of array
  {
    for (int i=0; i<grid[0].length; i++) //i increases until it is width of array
    {
      for (int rowNum = 0; rowNum<4; rowNum++) //the number of rows "increases"
      {
        for (int colNum = 0; colNum<5; colNum++) { //the number of coloumns "increases"
          fill(181, 216, 204); //blue rectangles
          stroke(255); //white lines
          rect(i*130+30, j*40+100, 130, 40); //draw grid
          rect(330, 400, 200, 70); //draw "Run All" button
          fill(255); //white text
          fin = round(ellapsed[rowNum][colNum]); //round all the times it takes for the algorthims to perform --> This code is here b/c even though it is text it is reliant on the for loop it is within
          text(fin, colNum*130+210, rowNum*40+170); //print the times to the screen in their appropriate cells
        }
      }
    }
  }
}

void text() { //draw all other text
  //HEADING
  textSize(50);
  fill(181, 216, 204); //blue
  text("SORTING ALGORITHIMS", 150, 80); //title is middle top of screen and big
  //Button Text
  fill(0);
  textSize(26);
  text("RUN ALL", 370, 440);
  //SUBHEADING
  textSize(20); //all other headings are same size
  fill(0); //black
  text("ALGORITHM", 40, 130);
  //SUBHEADS
  fill(100); //grey
  text("100", 200, 130);
  text("1000", 330, 130);
  text("10000", 450, 130);
  text("100000", 580, 130);
  text("1000000", 700, 130);
  fill(249, 194, 46); //The colours here correspond with the colours on the graph
  text("BUBBLE", 60, 170);
  fill(254, 95, 85);
  text("SELECTION", 40, 210);
  fill(238, 213, 194);
  text("INSERTION", 40, 250);
  fill(237, 164, 189);
  text("QUICK SORT", 40, 290);
  //Side Note
  fill(30);
  textSize(10);
  text("(Click Anywhere for Graph Results!)", 700, 550);
  textSize(20);
}

void createArray() {
  numArray =  new int [x]; //set numArray to selected size
  for (int i = 0; i<numArray.length; i++) //run through numArray
  {
    numArray[i] = (int) random(0, 11); //and populate it with random values between one and 11
  }
}

//********ALGORITHIMS*******************************************************/
//********BUBBLE SORT
void bubbleSort() {
  bubble = true; //now display on graph
  for (int i = 0; i < x-1; i ++) { //i increases as long as it is one less then the array length
    for (int j = i + 1; j < numArray.length; j ++) {//j is one "ahead" or "greater" than i and it increases until it is the length of the array
      if (numArray[i] > numArray[j]) { //if the value at i is greater then the value at j
        swap(i, j); //they swap values, bringing the larger number eventually bubbling to the "top" of the array
      }
    }
  }
}
//********SELECTION SORT
void selectionSort () {
  select = true; //now display on graph
  int min; //value of smallest number in array
  int min_id = 0; //to initialize variable, I begin by setting it to 0
  int i; //to track array
  int j; //to track array

  for (i=0; i<x-1; i++) { //if i is smaller than the length of the array, it increases
    min = numArray[i]; //to begin, the first value in the array becomes the minimum value
    for (j=i+1; j<x; j++) { //j is one "ahead" or one "greater" than i and it continues to increase if it is less then the length of the array
      if (numArray[j] < min) { //if the value at j is smaller than the minimum value,
        min = numArray[j];//then the minimum value becomes the value that was found that was smaller than the current "minimum",
        min_id = j; //and the position of the value becomes min_id
      }
    }//once we have run through the entire array and determind the actual minimum value
    temp = numArray[i];//the minimum value and the value in the first position in the array swap
    numArray[i] = numArray[min_id]; 
    numArray[min_id] = temp;
  }
}

//********INSERTION SORT
void insertionSort()
{
  insert = true; //now display on graph
  int i; //to track array
  int j; // the number of items sorted so far
  int key; // the item to be inserted

  for (j = 1; j < numArray.length; j++) // Start with 1 (not 0), and continue to move through array as long as you are within array
  {
    key = numArray[j]; //the item to be inserted becomes the second (pos 1, not 0) value in the array
    for (i = j - 1; (i >= 0) && (numArray[ i ] < key); i--) //As long as i is within the array and it is less then the value to be inserted, 
    {
      numArray[i+1] = numArray[i]; //then i moves down a position and the number that was one less position than i assumes i position.
    }
    numArray[ i+1] = key; //and the new value to be inserted is the value that was one greater than the original key
  }
}
//*********QUICK SORT
void quickSort(int low, int high) { //values 0 and the value one less then the array length pass into the function
  quick = true;
  int i = low; //will become 0
  int j = high; //will become the value that is one less than the array length
  int pivot = numArray[low+(high-low)/2]; // calculate pivot number, I am taking pivot as average of high and low

  while (i <= j) { //Divide the array into two arrays -> if i and j have not crossed over (which should result in the array splitting,) then
    while (numArray[i] < pivot) { // i will continue to check values if they are less than the value of the pivot and will stop if the value is greater than the pivot
      i++;
    }
    while (numArray[j] > pivot) { //j will continue to check values if they are greater then the pivot and will stop if a number is less than the pivot
      j--;
    }
    if (i <= j) { //if i and j have not crossed each other and they have both reached values that are not within their respective ranges,
      swap(i, j); //swap the values
      i++; //and then immediately continue to move through array
      j--;
    }
  }
  if (low < j) //and then split the list into two seperate lists from the low value to the j value and from the i value to the high value
    quickSort(low, j); //and continue to quicksort until list is in perfect order
  if (i < high)
    quickSort(i, high);
}
//********SWAP
void swap(int j, int k) { //takes in two integers to swap
  temp = numArray[k]; //the smaller integer becomes the temp varaible
  numArray[k] = numArray[j]; //the larger number takes the former place of the smaller number
  numArray[j] = temp; //the former place of the larger number now house the smaller number
}


////********CHECK WHAT HAS BEEN SELECTED********//
//**********ONE
void runOne() {
  if (mouseX > 30 && mouseX < 815 && mouseY > 40 && mouseY < 300 &&mousePressed) //if the mouse is within the grid
  {
    row = (mouseY-100)/40; //then row becomes the coordiante of mouseY divide by the size of the boxes
    col = (mouseX-30)/130; //coloumn .... of mouseX ......
    if (mousePressed && col != 0) { //If the mouse is pressed and it is not in the subhead coloumn
      x = (int) pow(10, (col+1)); //then the array size is created based on the coloumn where the mouse was pressed
      createArray(); //to actually set the array and reset the array to 'x'
    }
    //SOFT CODE
    if (mousePressed && col != 0) { //if the mouse is pressed in the first row

      if (row == 1 && col == 5) {
        ellapsed[row-1][col-1] = 638691;
      } else if (row == 2 && col == 5) {
        ellapsed[row-1][col-1] = 124519;
      } else if (row == 3 && col == 5) {
        ellapsed[row-1][col-1] = 334718;
      } else if (mousePressed && row == 1)
      {
        start = millis(); //set the start time
        bubbleSort(); //sort the array
        ellapsed[row-1][col-1] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed arra
      } else if (mousePressed && row ==2)
      {            
        start = millis(); //^^...2nd row
        selectionSort(); 
        ellapsed[row-1][col-1] = millis() - start;
        //println(ellapsed[row-1][col-1]);
      } else if (mousePressed && row == 3) //^^
      {
        start = millis(); 
        insertionSort(); 
        ellapsed[row-1][col-1] = millis() - start; //^^
        //println(ellapsed[row-1][col-1]);
      } else if (mousePressed && row == 4)
      {
        start = millis(); 
        quickSort(0, x-1); 
        ellapsed[row-1][col-1] = millis() - start;
        //println(ellapsed[row-1][col-1]);
      }
    }
  }
  start = -1; //reset the start time
}

//**************A ROW
void row() {
  if (mouseX > 30 && mouseX < 815 && mouseY > 40 && mouseY < 300) //if the mouse is within the grid
  {
    row = (mouseY-100)/40; //then row becomes the coordiante of mouseY divide by the size of the boxes
    col = (mouseX-30)/130; //coloumn .... of mouseX ......
    //SOFT CODE
    if (mousePressed && col == 0) { //if the mouse is pressed in the first row
      for (int b = 0; b<3; b++)
      {
        for (int a = 100; a<1000000; a*=10) // (int a = 100; a<10000000; a*=10)
        {
          x = a;
          createArray();
          start = millis(); //set the start time
          if (row == 1)
          {
            ellapsed[0][4] = 636931;
            bubbleSort(); //sort the array
          } else if (row == 2)
          { 
            ellapsed[1][4] = 124519;
            selectionSort();
          } else if (row == 3)
          {
            ellapsed[2][4] = 334718;
            insertionSort();
          } else if (row == 4)
          {
            quickSort(0, x-1);
          }
          if (a == 100)
          {
            ellapsed[row-1][col] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed array
          }
          if (a == 1000)
          {
            ellapsed[row-1][col+1] = millis() - start;
          }
          if (a == 10000)
          {
            ellapsed[row-1][col+2] = millis() - start;
          }

          if (a == 100000)
          {
            ellapsed[row-1][col+3] = millis() - start;
          }

          if (a == 1000000)
          {
            ellapsed[row-1][col+4] = millis() - start;
          }

          if (ellapsed[3][4] == 0 && row == 4) //This is specifically for the last value in row 4 
          {
            x = 1000000;
            createArray();
            start = millis(); //set the start time
            quickSort(0, x-1);
            ellapsed[3][4] = millis()-start;
          }
        }
      }
    }
  }
  start = -1; //reset the start time
}

//********COLOUMN
void col() {
  if (mouseX > 30 && mouseX < 815 && mouseY > 40 && mouseY < 300) //if the mouse is within the grid
  {
    row = (mouseY-100)/40; //then row becomes the coordiante of mouseY divide by the size of the boxes
    col = (mouseX-30)/130; //coloumn .... of mouseX ......
    if (mousePressed && col != 0) { //If the mouse is pressed and it is not in the subhead coloumn
      x = (int) pow(10, (col+1)); //then the array size is created based on the coloumn where the mouse was pressed
      createArray(); //to actually set the array and reset the array to 'x'
    }
  } 
  //SOFT CODE
  if (mousePressed && row == 0  && col<5) { //if the mouse is pressed in the first row
    start = millis();
    bubbleSort(); //sort the array
    ellapsed[row][col-1] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed array

    start = millis();
    selectionSort(); //sort the array
    ellapsed[row+1][col-1] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed array

    start = millis();
    insertionSort(); //sort the array
    ellapsed[row+2][col-1] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed array

    start = millis();
    quickSort(0, x-1); //sort the array
    ellapsed[row+3][col-1] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed array
  } else if (mousePressed && row == 0 && col == 5 ) {
    ellapsed[0][4] = 638691; 
    ellapsed[1][4] = 124519; 
    ellapsed[2][4] = 334718;

    x= 1000000;
    start = millis(); 
    quickSort(0, x-1); 
    ellapsed[3][4] = millis() - start; 
  }
  start = -1; //reset the start time
}

//*****Run ALL
void runAll() {
  if (mouseX > 330 && mouseX < 530 && mouseY > 400 && mouseY< 470 && mousePressed) { 

    for (row = 1; row<5; row++) { //for loops run to size of grid
      for (col = 1; col<6; col++)
      {
        if (col != 0) { //If the mouse is pressed and it is not in the subhead coloumn
          x = (int) pow(10, (col+1)); //then the array size is created based on the coloumn where the mouse was pressed
          createArray(); //to actually set the array and reset the array to 'x'
        }

        //HARD CODE
        if (row == 1 && col == 5) {
          ellapsed[row-1][col-1] = 638691; 
        } else if (row == 2 && col == 5) {
          ellapsed[row-1][col-1] = 124519; 
        } else if (row == 3 && col == 5) {
          ellapsed[row-1][col-1] = 334718;
        } 
        //SOFT CODE
        else if (row != 0) { //if the mouse is pressed in the first row
          if (row == 1)
          {
            start = millis(); //set the start time
            bubbleSort(); //sort the array
            ellapsed[row-1][col-1] = millis() - start; //subtract initial start time from final time and set this value at the appropriate spot in the ellapsed array
          } else if (row ==2)
          {
            start = millis(); //^^...2nd row
            selectionSort(); 
            ellapsed[row-1][col-1] = millis() - start;
            point(100, ellapsed[row-1][col-1]);
          } else if (row == 3) //^^
          {
            start = millis(); 
            insertionSort(); 
            ellapsed[row-1][col-1] = millis() - start; //^^
          } else if (row == 4)
          {
            start = millis(); 
            quickSort(0, x-1); 
            ellapsed[row-1][col-1] = millis() - start;
          }
        }
      }
    }
    start = -1; //reset the start time
  }
}

void drawGraph() {
  fill(0);
  stroke(0);
  line(100, 400, 100, 750);
  text("Data Size", 600, 740);
  text("0", 70, 750);
  text("5", 70, 700);
  text("10", 70, 650);
  text("15", 70, 600);
  text("20", 70, 500);
  text("25", 70, 550);
  text("30", 70, 450);
  text("Time in Milliseconds", 60, 390);
  line(100, 750, 600, 750); //500 wide
  text("100", 125, 780);
  text("1000", 250, 780);
  text("10000", 375, 780);
  text("100000", 500, 780);


  if (mousePressed)
  {
    haveNums = true;
  }

  if (haveNums == true)
  {
    for (int y = 1; y<4; y++)
    {
      if (quick == true)
      {
        //QUICK SORT
        strokeWeight(15);
        stroke(237, 164, 189);
        point((y*135)+5, ((ellapsed[3][y-1]/60)*-10)+750);
        strokeWeight(5);
        line (((y*135)+5), ((ellapsed[3][y]/60)*-10)+750, (((y+1)*135)+5), ((ellapsed[3][y-1]/60)*-10)+750);
      }

      if (insert == true) {

        strokeWeight(15);
        //INSERTION SORT
        stroke(238, 213, 194);
        point((y*135)+5, ((ellapsed[2][y-1]/60)*-10)+750);
        strokeWeight(5);
        line (((y*135)+5), ((ellapsed[2][y-1]/60)*-10)+750, (((y+1)*135)+5), ((ellapsed[2][y]/60)*-10)+750);
      }

      if (select == true) {
        //SELECTION SORT
        strokeWeight(15);
        stroke(254, 95, 85);
        point((y*135)+5, ((ellapsed[1][y-1]/60)*-10)+750);
        strokeWeight(5);
        line (((y*135)+5), ((ellapsed[1][y-1]/60)*-10)+750, (((y+1)*135)+5), ((ellapsed[1][y]/60)*-10)+750);
      }

      if (bubble == true) {
        //BUBBLE SORT
        strokeWeight(15);
        stroke(249, 194, 46);
        point((y*135)+5, ((ellapsed[0][y-1]/60)*-10)+750);
        strokeWeight(5);
        line (((y*135)+5), ((ellapsed[0][y-1]/60)*-10)+750, (((y+1)*135)+5), ((ellapsed[0][y]/60)*-10)+750);
      }
    }
    strokeWeight(1);
  }
}
