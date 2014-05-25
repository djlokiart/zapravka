//
//  DataController.h
//  zapravka
//
//  Created by Arthur Pertsev on 5/16/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject
{
    @public
    NSArray *gasStations;
    NSArray *company;
    int count;
    int countCompany;
}
- (id)init;
@end
