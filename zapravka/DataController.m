//
//  DataController.m
//  zapravka
//
//  Created by Arthur Pertsev on 5/16/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "DataController.h"

@implementation DataController

- (id)init
{
    self = [super init];
    if (self) {
        // Read plist from bundle and get Root Dictionary out of it
        NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
        
        // Your dictionary contains an array of dictionary
        // Now pull an Array out of it.
        gasStations = [NSArray arrayWithArray:[dictRoot objectForKey:@"Gas Stations"]];
        count = 0;
        // Now a loop through Array to fetch single Item from catList which is Dictionary
        [gasStations enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
            ++count;
        }];
        
        company = [NSArray arrayWithArray:[dictRoot objectForKey:@"Company"]];
        // Now a loop through Array to fetch single Item from catList which is Dictionary

        NSLog(@"Count: %d", self->count);

    }
    return self;
}

@end