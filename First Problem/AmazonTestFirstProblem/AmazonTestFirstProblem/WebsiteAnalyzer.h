//
//  WebsiteAnalyzer.h
//  AmazonTestFirstProblem
//
//  Created by Papneja, Brajmohan (ASPL) on 3/19/16.
//  Copyright © 2016 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UrlAndHit.h"

@interface WebsiteAnalyzer : NSObject

@property(nonatomic,strong) NSMutableDictionary *UrlsAndHits;

@property (nonatomic,strong) NSMutableArray <UrlAndHit*> *statistics;



-(void)reportPageAccess:(NSString *)pageUrl ;

// the size of the list returned must be n
-(NSMutableArray *)getTopNPages:(int)n;



-(void)resetAllUrlsAndHits;

@end
