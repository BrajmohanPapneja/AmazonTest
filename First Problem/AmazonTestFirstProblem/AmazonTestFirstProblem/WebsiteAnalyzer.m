//
//  WebsiteAnalyzer.m
//  AmazonTestFirstProblem
//
//  Created by Papneja, Brajmohan (ASPL) on 3/19/16.
//  Copyright © 2016 Self. All rights reserved.
//



#import "WebsiteAnalyzer.h"

@implementation WebsiteAnalyzer

-(id)init
{
    self=[super init];
    if(self)
    {
        self.UrlsAndHits=nil;
        
    }
    return self;
}


-(void)resetAllUrlsAndHits
{

    self.UrlsAndHits=[[NSMutableDictionary alloc]initWithObjectsAndKeys:
                      [NSNumber numberWithInt:0],@"www.google.com",
                      [NSNumber numberWithInt:0],@"www.facebook.com",
                     [NSNumber numberWithInt:0],@"www.amazon.com",
                    [NSNumber numberWithInt:0], @"www.apple.com",nil];
    
}

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

    self.statistics = [[NSMutableArray alloc]init];
    
    
    for(id key in self.UrlsAndHits)
    {
       
        UrlAndHit *urlAndHit = [[UrlAndHit alloc]init];
        urlAndHit.pageUrl=key;
        urlAndHit.hit=[[self.UrlsAndHits valueForKey:key] intValue];
        [self.statistics addObject:urlAndHit];

    }
    
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"hit"
                                                                ascending: NO];
    self.statistics= (NSMutableArray*)[self.statistics sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    self.topPagesAndHits=[[NSMutableArray alloc]init];
    
    for(int i=0;i<n;i++)
        
    {
    
        [self.topPagesAndHits addObject:[self.statistics objectAtIndex:i]];
    
    }
    
    return self.topPagesAndHits;
    
    
}
@end
