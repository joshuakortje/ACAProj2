/*
 * Joshua Kortje and Isaiah Higgins
 * Advanced Computer Architecture Project 2
 * Quick Sort Code
 * September 29th, 2020
 */
package sorting;
import java.util.Random;

public class QuickSort {
    
    //Quicksort Algorithm
    public static void quicksort(int[] A, int p, int r)
    {
        if(p < r)
        {
            int q = partition(A, p, r);
            quicksort(A, p, q-1);
            quicksort(A, q+1, r);
        }
    }
    
    //partition algorithm
    private static int partition(int[] A, int p, int r)
    {
        int x = A[r]; //pivot element
        int i = p;
        
        for(int j = p; j < r; j++)
        {
            if (A[j] <= x)
            {
                swap(A, i, j);
                i = i+1;
            }
        }
        swap(A, i, r);
        return i;
    }
    
    //swap function
    private static void swap(int[] A, int a, int b)
    {
        int temp = A[a];
        A[a] = A[b];
        A[b] = temp;
    }
    
    //main for testing purposes
    public static void main(String[] args)
    {
        //make a bunch of random numbers
        Random rand = new Random(System.nanoTime());
        int[] testArray = new int[10];
        for(int i = 0; i < testArray.length; i++)
        {
            testArray[i] = rand.nextInt(100);
        }
        
        //Print unsorted array
        for(int i = 0; i < testArray.length; i++)
        {
            System.out.println(testArray[i]);
        }
        
        System.out.println("Sorted numbers:");
        //Sort
        quicksort(testArray, 0, testArray.length-1);
        
        
        //Print sorted array
        for(int i = 0; i < testArray.length; i++)
        {
            System.out.println(testArray[i]);
        }
    }
}
