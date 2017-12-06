//hash.java
//demonstrates hash table with linear probing
//to run this program: C:> java HashTableApp
import java.io.*;
//////////////////////////////////////////
class DataItem
	{
	private int iData;
//-------------------------------------------
	public DataItem(int ii)				//constructor
		{ iData = ii; }
//-------------------------------------------
	public int getKey()
		{ return iData; }
//-------------------------------------------
	} //end class
//////////////////////////////////////////
class HashTable
	{
	private DataItem[] hashArray;		//array holds hash table 
	private int arraySize;
	private DataItem nonItem; 			//for deleted items
//-------------------------------------------
	public HashTable(int size)
	{
		arraySize = size;
		hashArray = new DataItem[arraySize];
		nonItem = new DataItem(-1);		// deleted item key is -1 
	}
//-------------------------------------------
	public void displayTable()
	{
	System.out.print("Table: ");
	for(int j=0; j < arraySize; j++)
		{
		if(hashArray[j] != null)
			System.out.print(hashArray[j].getKey() + " ");
		else
			System.out.print("** ");
		}
	System.out.println("");
	}
//-------------------------------------------
	public int hashFunc(int key)
	{
	return key % arraySize; 			//hash function
	}
//-------------------------------------------
	public void insert(DataItem item)	//insert a DataItem
	// (assumes table not full)
		{
		int key = item.getKey();		//extract key
		int hashVal = hashFunc(key); 
		System.out.println("HASH VALUE BEFORE WHILE LOOP "+ hashVal);	
		int hashValSquared = 0;
		int flip = 0;

		while(hashArray[hashVal] != null && hashArray[hashVal].getKey() != -1)
		{
			++hashVal;
			hashValSquared = hashVal*hashVal;
			System.out.println("HASH VALUE SQUARED IN LOOP " + hashValSquared);
			hashVal %= arraySize;			//wraparound if necessary	
			flip = 1;
		}
		if(flip == 0){
			hashValSquared = hashVal*hashVal;
		}
		System.out.println("HASH VALUE SQUARED " + hashValSquared);
		hashArray[hashValSquared] = item;
		} //end insert
//-------------------------------------------
	public DataItem delete(int key)
		{
		int hashVal = hashFunc(key);
		while(hashArray[hashVal] != null)
			{
			if(hashArray[hashVal].getKey() == key)
				{
				DataItem temp = hashArray[hashVal];
				hashArray[hashVal] = nonItem;
				return temp;	
				}
			++hashVal;
			hashVal %= arraySize;
			}
		return null;
		} //end delete()
//-------------------------------------------
	public DataItem find(int key)
	{
	int hashVal = hashFunc(key);

	while(hashArray[hashVal] != null)
	{
	if(hashArray[hashVal] != null)
		return hashArray[hashVal];
	++hashVal;
	hashVal %= arraySize;
	}
	return null;
	}
//-------------------------------------------
}
/////////////////////////////////////////////
class HashTableApp
{
	public static void main(String[] args) throws IOException
		{
		DataItem aDataItem;
		int aKey, size, n, keysPerCell;

		System.out.print("Enter size of hash table: ");
		size = getInt();
		System.out.print("Enter intital number of items: ");
		n = getInt();
		keysPerCell = 10;

		HashTable theHashTable = new HashTable(size);

		for(int j=0; j<n; j++)
			{
			aKey = (int)(java.lang.Math.random() * keysPerCell * size);
			aDataItem = new DataItem(aKey);
			theHashTable.insert(aDataItem);
			}
	while(true)
		{
		System.out.print("Enter first letter of ");
		System.out.print("show, insert, delete, or find: ");
		char choice = getChar();
		switch(choice)
			{
			case 's': 
				theHashTable.displayTable();
				break;
			case 'i':
			System.out.print("Enter key value to insert: ");
				aKey = getInt();
				aDataItem = new DataItem(aKey);
				theHashTable.insert(aDataItem);
				break;
			case 'd':
				System.out.print("Enter key value to delete: ");
				aKey = getInt();
				theHashTable.delete(aKey);
				break;
			case 'f':
				System.out.print("Enter key value to find: ");
				aKey = getInt();
					aDataItem = theHashTable.find(aKey);
					if(aDataItem != null)
						{
							System.out.println("Found " + aKey);
						}
					else
						System.out.println("Could not find" + aKey);
				break;
			default:
				System.out.print("Invalid entry/n");
			}
		}
	}
//-------------------------------------------
	public static String getString() throws IOException
	{
	InputStreamReader isr = new InputStreamReader(System.in);
	BufferedReader br = new BufferedReader(isr);
	String s = br.readLine();
	return s;
	}
//-------------------------------------------
	public static char getChar() throws IOException
		{
		String s = getString();
		return s.charAt(0);
		}
//-------------------------------------------
	public static int getInt() throws IOException
		{
		String s = getString();
		return Integer.parseInt(s);
		}
//-------------------------------------------
} //end class HashTableApp
