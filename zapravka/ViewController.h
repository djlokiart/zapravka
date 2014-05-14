//
//  ViewController.h
//  zapravka
//
//  Created by Arthur Pertsev on 5/8/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController
{

IBOutlet UISegmentedControl* segmentController;

}

-(IBAction) segmentControl:(id) sender;

@property (nonatomic, retain) IBOutlet MKMapView *map;


@end