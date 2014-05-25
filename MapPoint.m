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
@synthesize subTitle;
@synthesize coordinate;


- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subTitle:(NSString *)st
{
    self = [super init];
    if (self) {
        coordinate = c;
        title = t;
        subTitle = st;
    }
    
    return self;
}
@end
