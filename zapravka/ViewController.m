//
//  ViewController.m
//  zapravka
//
//  Created by Arthur Pertsev on 5/8/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "ViewController.h"
#import "DataController.h"
#import "DetailViewController.h"

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
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mapV.showsUserLocation=YES;
    [mapV setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailSegue"]){
        NSIndexPath *indexpath = nil;
        indexpath = [listV indexPathForSelectedRow];
        //date to string
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MM.YYYY"];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
        //Передача аргументов
        int a = [myDataController->gasStations[indexpath.row][@"Comp_id"] intValue];
        NSString *detName = myDataController->company[a][@"Name"];
        NSString *detImage = myDataController->company[a][@"Logo"];
        NSString *Dateupdate = [formatter stringFromDate:myDataController->gasStations[indexpath.row][@"Dateupdate"]];
        UIImage * Image = [UIImage imageNamed: detImage];
        NSLog(@" %@",detImage);
        [[segue destinationViewController] setNameContent:detName];
        [[segue destinationViewController] setImageContent:Image];
        [[segue destinationViewController] setAddressContent:myDataController->gasStations[indexpath.row][@"Address"]];
        [[segue destinationViewController] setRatingContent:myDataController->gasStations[indexpath.row][@"Rating"]];
        [[segue destinationViewController] setPriceContent:myDataController->gasStations[indexpath.row][@"Price"]];
        [[segue destinationViewController] setFueltypeContent:myDataController->gasStations[indexpath.row][@"Fueltype"]];
        [[segue destinationViewController] setExtraContent:myDataController->gasStations[indexpath.row][@"Extra"]];
        [[segue destinationViewController] setWorktimeContent:myDataController->gasStations[indexpath.row][@"Worktime"]];
        [[segue destinationViewController] setDateupdateContent:Dateupdate];
        
    }
}
@end
