//
//  ViewController.m
//  zapravka
//
//  Created by Arthur Pertsev on 5/8/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "ViewController.h"

//@interface ViewController ()

//@end

@implementation ViewController

@synthesize mapV;
@synthesize listV;
@synthesize segmentControl;
-(IBAction) valueChange:(UISegmentedControl *)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapV.hidden=NO;
            self.listV.hidden=YES;
            break;
        case 1:
            self.mapV.hidden=YES;
            self.listV.hidden=NO;
            break;
        default:
            break;
    }
}

/*- (void)dealloc
{
    //[super dealloc];
    self.mapV=nil;
    

}*/

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.mapV=nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mapV.showsUserLocation=YES;
    [mapV setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
