//
//  ViewController.h
//  zapravka
//
//  Created by Arthur Pertsev on 5/8/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DataController.h"
#import "TileOverlay.h"
#import "TileOverlayView.h"


@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *listV;
@property (strong, nonatomic) IBOutlet MKMapView *mapV;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

//maps
@property (strong, nonatomic) TileOverlay *overlay;

- (IBAction)valueChange:(UISegmentedControl*)sender;
@end