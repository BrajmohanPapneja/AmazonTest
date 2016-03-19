//
//  WebsiteAnalyzer.m
//  AmazonTestFirstProblem
//
//  Created by Papneja, Brajmohan (ASPL) on 3/19/16.
//  Copyright © 2016 Self. All rights reserved.
//



#import "WebsiteAnalyzer.h"

@implementation WebsiteAnalyzer

//Initialization method

-(id)init
{
    self=[super init];
    if(self)
    {
        self.UrlsAndHits=nil;
        
    }
    return self;
}


//reset all page Urls Count to 0
-(void)resetAllUrlsAndHits
{

    self.UrlsAndHits=[[NSMutableDictionary alloc]initWithObjectsAndKeys:
                      [NSNumber numberWithInt:0],@"www.google.com",
                      [NSNumber numberWithInt:0],@"www.facebook.com",
                     [NSNumber numberWithInt:0],@"www.amazon.com",
                    [NSNumber numberWithInt:0], @"www.apple.com",nil];
    
}

//Accessing any specific page and increasing its hit count by 1
/*Here, Dictionary is chosen because finding any page in Dictionary is compartively faster in array and if that page is accessed by user, its hit count is increased by 1*/
-(void)reportPageAccess:(NSString *)pageUrl
{

    int hit=0;
    if([self.UrlsAndHits objectForKey:pageUrl])
    {
        hit=[[self.UrlsAndHits valueForKey:pageUrl] intValue];
        hit+=1;
        [self.UrlsAndHits setValue:[NSNumber numberWithInt:hit] forKey:pageUrl];
    
    }
    
}

// the size of the list returned must be n
-(NSMutableArray *)getTopNPages:(int)n
{

    
    /*Here, first all pages hits count is added to Array, because now we need to sort the array based on hit counts.
     */
    self.statisticsOfAllPageUrls = [[NSMutableArray alloc]init];
    
    for(id key in self.UrlsAndHits)
    {
       
        UrlAndHit *urlAndHit = [[UrlAndHit alloc]init];
        urlAndHit.pageUrl=key;
        urlAndHit.hit=[[self.UrlsAndHits valueForKey:key] intValue];
        [self.statisticsOfAllPageUrls addObject:urlAndHit];

    }
    
    //all page count is sorted based on hit on descending order
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"hit" ascending: NO];
    self.statisticsOfAllPageUrls= (NSMutableArray*)[self.statisticsOfAllPageUrls sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    
    
    //Finally, We need to return the user first n top pages
    self.topPagesAndHits=[[NSMutableArray alloc]init];
    
    if ([self.statisticsOfAllPageUrls count]<n) {
        n=(int)[self.statisticsOfAllPageUrls count];
    }
    
    for(int i=0;i<n;i++)
        
    {
    
        [self.topPagesAndHits addObject:[self.statisticsOfAllPageUrls objectAtIndex:i]];
    
    }
    
    return self.topPagesAndHits;
    
    
}
@end
