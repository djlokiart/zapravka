//
//  ViewController.m
//  zapravka
//
//  Created by Arthur Pertsev on 5/8/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "ViewController.h"
#import "DataController.h"

//@interface ViewController ()

//@end

@implementation ViewController

@synthesize mapV;
@synthesize listV;
@synthesize segmentControl;
DataController *myDataController;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    myDataController = [[DataController alloc] init];
    return myDataController->count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    //preferences cell
    int a = [myDataController->gasStations[indexPath.row][@"Comp_id"] intValue];
    cell.textLabel.text = [[myDataController->company[a][@"Name"] stringByAppendingString: @" - " ]stringByAppendingString: myDataController->gasStations[indexPath.row][@"Address"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
@end
