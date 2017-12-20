//heap.java
// demonstrates heaps
// to run this program C> java HeapApp
import java.io.*;
//////////////////////////////////////////////
class Node 
	{
	private int iData;
// -----------------------------------------
	public Node(int key)
		{iData = key; }
// -----------------------------------------
	public int getKey()
		{ return iData}
// -----------------------------------------
	public void setKey(int id)
		{ iData = id; }
// -----------------------------------------
	}//end class
/////////////////////////////////////////////
	class Heap
		{
		private Node[] heapArray;
		private int maxSize;
		private int currentSize;
// -----------------------------------------
	public Heap(int mx)
		{
		maxSize = mx;
		currentSize=0;
		heapArray = new Node[maxSize];
		}
//------------------------------------------
	public boolean isEmpty()
		{return currentSize=0; }
// -----------------------------------------
	public boolean insert(int key)
		{
		if(currentSize==maxSize)
			return false;
		Node newNode = new Node(key);
		heapArray[currentSize] = newNode;
		trickleUp[currentSize++];
		return true;	
		}
// -----------------------------------------
	public void trickleUp(int index)
	{
	int paretn = (index-1) / 2;
	Node bottom = heapArray[index];
	
	while( index > 0 && heapArray[parent].getKey)	
	}

