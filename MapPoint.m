//
//  MapPoint.m
//  zapravka
//
//  Created by Arthur Pertsev on 5/23/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize title;
@synthesize subtitle;
@synthesize coordinate;
@synthesize annotId;


- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)st
{
    self = [super init];
    if (self) {
        coordinate = c;
        title = t;
        subtitle = st;
    }
    
    return self;
}
@end
