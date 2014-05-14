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

@synthesize map;

-(IBAction) segmentControl:(id) sender
{
}
/*- (void)dealloc
{
    //[super dealloc];
    self.map=nil;
    

}*/

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.map=nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    map.showsUserLocation=YES;
    [map setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
