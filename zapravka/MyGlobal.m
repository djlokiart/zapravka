//
//  MyGlobal.m
//  zapravka
//
//  Created by Admin on 01.06.14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "MyGlobal.h"

int globalValue = 2;

@implementation MyGlobal

+ (void) setGlobalValue:(int) value{
    
    if(value != globalValue){
        globalValue = value;
        
    }
    
}
+ (int) getGlobalValue{
    
    return globalValue;
    
}


@end
