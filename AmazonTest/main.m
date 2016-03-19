//
//  main.m
//  AmazonTest
//
//  Created by Papneja, Brajmohan (ASPL) on 3/19/16.
//  Copyright © 2016 Self. All rights reserved.
//

/*
 [1, 2, 3, 4] - Selected subset: {2, 4}
 [4, 1, 2] - Selected subset: {4, 2}
 [4, 15, 2] - Selected subset: {15}
 */
//Given a list of numbers, write a program to select a subset of numbers whose sum is maximum while not picking any neighbors together


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        
        NSMutableArray *numbers = [[NSMutableArray alloc]init];
        
        [numbers addObject:@"4"];
        [numbers addObject:@"15"];
        [numbers addObject:@"2"];
        
        //10,20,30,40,50,60
        //10,30,50
        //20,40,60
        
        int countOfNumbers=(int)[numbers count];
        
        int sumOfNumbersInEvenPlace=0;
        int sumOfNumbersInOddPlace=0;
        int i=0;
        for (;i<countOfNumbers;i++)
        {
          
            sumOfNumbersInOddPlace+=[[numbers objectAtIndex:i] intValue];
            i++;
            if(i==countOfNumbers)
            break;
            sumOfNumbersInEvenPlace+=[[numbers objectAtIndex:i] intValue];
        
        }

        NSLog(@"%d",sumOfNumbersInOddPlace);

        NSLog(@"%d",sumOfNumbersInEvenPlace);
        
        
        if(sumOfNumbersInOddPlace<sumOfNumbersInEvenPlace)
            NSLog(@"Print maximum sum is %d ",sumOfNumbersInEvenPlace);
        else

            NSLog(@"Print maximum sum is %d ",sumOfNumbersInOddPlace);
    }
    return 0;
}
