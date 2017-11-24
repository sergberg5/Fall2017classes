//queue.java
//demonstrates queue
//to run this program 
//Sergei Scharrenberg 
//09.25.17
//Assignment 5
/*
	Created a Wrap Around double queue
*/
//////////////////////////////////////////////////
class Queue
	{
	private int maxSize;
	private long[] queArray;
	private int front;
	private int rear;
	private int nItems;
//------------------------------------------------
	public Queue(int s)
		{
			maxSize = s;
			queArray = new long[maxSize];
			front = 0;
			rear = -1;
			nItems = 0;
		}
//------------------------------------------------
	public int getFront(){
		return front;
	}
//------------------------------------------------
	public int getRear(){
		return rear;
	}
//------------------------------------------------
	public int getItemLength(){
		return nItems;
	}
//------------------------------------------------
	public void insertRight(long j)
		{
			if(isFull() == true){
				System.out.println("Sorry but there is no space in the queue");
			}
			else{
					if(rear == maxSize-1){
						queArray[0] = j; 
						rear = 0;
						nItems++;
					}
					else{ 	
						queArray[rear+1] = j;
						rear += 1; 
						nItems++;
					} 	
			}
		}
//-----------------------------------------------
public void insertLeft(long j)
		{
			if(isFull() == true){
				System.out.println("Sorry but there is no space in the queue");
			}
			else{
					if(front == 0){
						queArray[maxSize-1] = j; 
						front = maxSize-1;
						nItems++;
					}
					else{ 	
						queArray[front-1] = j;
						front -= 1; 
						nItems++;
					} 	
			}
		}
//------------------------------------------------
	public long removeLeft()
		{
		long temp = queArray[front];
		if(front <= rear){
			queArray[front] = 0L;
			front += 1;
			nItems--;
		}
		else{
			if(front == maxSize-1){
				queArray[front] = 0L;
				front = 0;
				nItems--;
			}
			else{
				queArray[front] = 0L;
				front += 1;
				nItems--;
			}
		}
		
		return temp;
		}
//------------------------------------------------
	public long removeRight()
		{
		long temp = queArray[rear];
		if(rear >= front){
			queArray[rear] = 0L;
			rear -= 1;
			nItems--;
		}
		else{
			if(rear == 0){
				queArray[rear] = 0L;
				rear = maxSize-1;
				nItems--;
			}
			else{
				queArray[rear] = 0L;
				rear -= 1;
				nItems--;
			}
		}
		
		return temp;
		}
//------------------------------------------------
	public long peekFront()
		{
			return queArray[front];
		}
//------------------------------------------------
	public boolean isEmpty()
		{
			return (nItems==0);
		}
//------------------------------------------------
	public boolean isFull()
		{
			return (nItems == maxSize);
		}
//------------------------------------------------
	public int size()
		{
			return nItems;
		}
//------------------------------------------------
	public void printQueueOrder(){
		for(int i = 0; i < maxSize; i++){
			if(i == front ){
				System.out.print("|F |");
			}
			else if(i == rear){
				System.out.print("|R |");
			}
			else{
				System.out.print("|  |");
			}
		}
	}
//------------------------------------------------
		public void printQueue(){
			for(int i = 0; i < maxSize; i++){
				if(queArray[i] == 0L){
					System.out.print("|  |");
				}
				else{
					System.out.print("|" + queArray[i] + "|");	
				}
			}
		}
	}
	
class QueueApp
	{
	public static void main(String[] args)
		{
		Queue theQueue = new Queue(10);
		
		theQueue.insertRight(10);
		theQueue.insertRight(20);
		theQueue.insertRight(30);
		theQueue.insertRight(40);
		theQueue.insertRight(50);
		theQueue.insertRight(60);
		theQueue.removeLeft();
		theQueue.removeLeft();
		theQueue.removeRight();
		theQueue.removeRight();
		theQueue.insertLeft(35);
		theQueue.insertLeft(45);
		theQueue.insertLeft(55);
		theQueue.insertLeft(65);
		theQueue.insertLeft(75);
		theQueue.removeRight();
		theQueue.removeLeft();
	
		//theQueue.insertRight(50);
		theQueue.printQueueOrder();
		System.out.println("");
		theQueue.printQueue();
		}
	}
/* 
|  ||  ||R ||  ||  ||  ||  ||  ||F ||  |
|45||35||30||  ||  ||  ||  ||  ||65||55|
*/
