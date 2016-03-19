//
//  main.m
//  AmazonTestFirstProblem
//
//  Created by Papneja, Brajmohan (ASPL) on 3/19/16.
//  Copyright © 2016 Self. All rights reserved.
//

/*
 
 Imagine you are looking to analyze which pages of your website are most popular. Your website has millions of pages each with different URL. Implement a data structure that exposes two APIs:
 
 void reportPageAccess(String pageUrl)
 List <String> getTopNPages(int n)
 
 The reportPageAccess API is invoked from the web server whenever a particular page is requested. The corresponding page URL is passed as a parameter. 
 
 
 The getTopNPages API is invoked when an administrator likes to view top N pages. Please note it may be called with a variable n to view top n pages. Here is how your class would look like (in Java):
 */


#import <Foundation/Foundation.h>
#import "WebsiteAnalyzer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        
        WebsiteAnalyzer *webSiteAnalyzer= [[WebsiteAnalyzer alloc]init];
        //[webSiteAnalyzer resetAllUrlsAndHits];
        
        
        [webSiteAnalyzer reportPageAccess:@"www.google.com"];
        [webSiteAnalyzer reportPageAccess:@"www.google.com"];
        [webSiteAnalyzer reportPageAccess:@"www.google.com"];
        
        [webSiteAnalyzer reportPageAccess:@"www.apple.com"];

        
        NSMutableArray *topPages=[webSiteAnalyzer getTopNPages:2];
        
        
        for (UrlAndHit *urlAndHit in topPages) {
            NSLog(@"pageUrl=%@ and Hit=%d" ,urlAndHit.pageUrl,urlAndHit.hit);
        }
        
    }
    return 0;
}
