/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sorting;
import java.util.Random;

/**
 *
 * @author jkort
 */
public class BubbleSort {
    public static void bubbleSort(int[] array)
    {
        //we skip the last element because it is already in place.
        for(int i = 1; i <= array.length - 1; i++)
        {
            for(int j = array.length - 1; j >= i+1; j--)
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
            testArray[i]= rand.nextInt(range);
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
