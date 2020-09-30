/*
 * Joshua Kortje and Isaiah Higgins
 * Advanced Computer Architecture Project 2
 * Bubble Sort Code
 * September 29th, 2020
 */
package sorting;
import java.util.Random;

public class BubbleSort {
    public static void bubbleSort(int[] array)
    {
        //we skip the last element because it is already in place.
        for(int i = 0; i <= array.length - 1; i++)
        {
            for(int j = array.length - 1; j > i; j--)
            {
                if(array[j] < array[j-1])
                {
                    //swap
                   int temp = array[j];
                   array[j] = array[j-1];
                   array[j-1] = temp;
                }
            }
        }
    }
    
    public static void main(String args[])
    {
        //generate array of random \
        int range = 10;
        Random rand = new Random();
        int[] testArray = new int[range];
        
        for (int i = 0; i < testArray.length; i++)
        {
            testArray[i]= rand.nextInt(range*10);
        }
        
        //sort array with bubbleSort
        bubbleSort(testArray);
        
        //print results
        for (int i = 0; i < testArray.length; i++)
        {
            System.out.println(testArray[i] + ", ");
        }
    }
}
