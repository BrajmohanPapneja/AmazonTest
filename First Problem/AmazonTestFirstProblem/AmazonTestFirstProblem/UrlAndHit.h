//
//  UrlAndHit.h
//  AmazonTestFirstProblem
//
//  Created by Papneja, Brajmohan (ASPL) on 3/19/16.
//  Copyright © 2016 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

//This class is created to keep account of the PageUrl and its Respective Hits
@interface UrlAndHit : NSObject

@property (nonatomic,strong) NSString *pageUrl;
@property (nonatomic,assign) int hit;
@end
