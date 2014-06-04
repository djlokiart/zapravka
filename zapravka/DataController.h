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
    NSArray *gastype;
    int count;
    int countCompany;
    int countGas;
}
- (id)init;
@end
