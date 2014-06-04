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
#import "MapPoint.h"
#import "MyGlobal.h"

@implementation ViewController

@synthesize mapV;
@synthesize listV;
@synthesize segmentControl;
@synthesize overlay;
@synthesize contentView;

DataController *myDataController;

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(IBAction) valueChange:(UISegmentedControl *)sender{
    self.view.userInteractionEnabled = YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(viewAnimationDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:contentView cache:YES];
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
    [UIView commitAnimations];
}

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
    
    //OSM
    overlay = [[TileOverlay alloc] initOverlay];
    [mapV addOverlay:overlay];
    MKMapRect visibleRect = [mapV mapRectThatFits:overlay.boundingMapRect];
    visibleRect.size.width /= 2;
    visibleRect.size.height /= 2;
    visibleRect.origin.x += visibleRect.size.width / 2;
    visibleRect.origin.y += visibleRect.size.height / 2;
    mapV.visibleMapRect = visibleRect;
    // END OSM
    
    // Remove Legal link
    for (UIView *v in [self.mapV subviews]) {
		if ([NSStringFromClass([v class]) isEqualToString:@"MKAttributionLabel"]) {
			v.hidden = YES;
		}
	}
    // end remove
    //Стиль кнопок (Map, List)
    CGRect frame = CGRectMake(500,500,5000,200);
    segmentControl.frame = frame;
    segmentControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentControl.backgroundColor=[UIColor greenColor];
    [segmentControl setTintColor:[UIColor blueColor]];
    
    [self mapViewPointer:mapV];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
        
    // Координаты точки на карте
    CLLocationCoordinate2D location;
    location.latitude  = 56.3286700;
    location.longitude = 44.0020500;
        
    // Масштаб
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.05;
    span.longitudeDelta = 0.05;
        
    // Регион
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
        
    // Устанавливаем регион
    [mapV setRegion:region animated:animated];
    [mapV selectAnnotation:[mapV.annotations objectAtIndex:0]  animated:YES];
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
    return myDataController->count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    //preferences cell
    int a = [myDataController->gasStations[indexPath.row][@"Comp_id"] intValue];
    
    int tempType = [MyGlobal getGlobalValue];
    NSString *tempStr;
    switch (tempType) {
        case 0:
            tempStr = @"АИ-98: ";
            break;
        case 1:
            tempStr = @"АИ-95: ";
            break;
        case 2:
            tempStr = @"АИ-92: ";
            break;
        case 3:
            tempStr = @"АИ-80: ";
            break;
        case 4:
            tempStr = @"ДТ: ";
            break;
        default:
            tempStr = @"АИ-92: ";
            break;
    }
    
    cell.textLabel.text = [[[myDataController->company[a][@"Name"] stringByAppendingString: @" - " ]stringByAppendingString: tempStr] stringByAppendingString: [myDataController->gasStations[indexPath.row][@"newPrice"][tempType] substringToIndex: 5]];
    cell.detailTextLabel.text = myDataController->gasStations[indexPath.row][@"Address"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    int index = 0;
    if([segue.identifier isEqualToString:@"detailSegue"] || [segue.identifier isEqualToString:@"detailmapSegue"]){
        if([segue.identifier isEqualToString:@"detailSegue"]){
            NSIndexPath *indexpath = nil;
            indexpath = [listV indexPathForSelectedRow];
            index = indexpath.row;
        }
        else{
            index = [sender annotId];
        }
        //date to string
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MM.YYYY"];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
        //Передача аргументов
        int a = [myDataController->gasStations[index][@"Comp_id"] intValue];
        NSString *detName = myDataController->company[a][@"Name"];
        NSString *detImage = myDataController->company[a][@"Logo"];
        NSString *Dateupdate = [formatter stringFromDate:myDataController->gasStations[index][@"Dateupdate"]];
        UIImage * Image = [UIImage imageNamed: detImage];
        [[segue destinationViewController] setNameContent:detName];
        [[segue destinationViewController] setImageContent:Image];
        [[segue destinationViewController] setAddressContent:myDataController->gasStations[index][@"Address"]];
        [[segue destinationViewController] setRatingContent:myDataController->gasStations[index][@"Rating"]];
        [[segue destinationViewController] setPriceContent:myDataController->gasStations[index][@"Price"]];
        [[segue destinationViewController] setFueltypeContent:myDataController->gasStations[index][@"Fueltype"]];
        [[segue destinationViewController] setExtraContent:myDataController->gasStations[index][@"Extra"]];
        [[segue destinationViewController] setWorktimeContent:myDataController->gasStations[index][@"Worktime"]];
        [[segue destinationViewController] setDateupdateContent:Dateupdate];
    }
}

//GoogleMaps
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)ovl
{
    TileOverlayView *view = [[TileOverlayView alloc] initWithOverlay:ovl];
    return view;
}

- (void)mapViewPointer:(MKMapView *)mapView
{
    myDataController = [[DataController alloc] init];
    for(int i = 0; i<myDataController->count ;i++)
    {
        int a = [myDataController->gasStations[i][@"Comp_id"] intValue];
        CLLocationCoordinate2D newCoord = { [myDataController->gasStations[i][@"Coordinate-d"] doubleValue], [myDataController->gasStations[i][@"Coordinate-s"] doubleValue] };
        int tempType = [MyGlobal getGlobalValue];
        NSString *tempStr;
        switch (tempType) {
            case 0:
                tempStr = @"АИ-98 ";
                break;
            case 1:
                tempStr = @"АИ-95 ";
                break;
            case 2:
                tempStr = @"АИ-92 ";
                break;
            case 3:
                tempStr = @"АИ-80 ";
                break;
            case 4:
                tempStr = @"ДТ ";
                break;
            default:
                tempStr = @"АИ-92 ";
                break;
        }
        
        MapPoint *mapPoint = [[MapPoint alloc] initWithCoordinate:newCoord title:myDataController->company[a][@"Name"] subtitle:[tempStr stringByAppendingString: [myDataController->gasStations[i][@"newPrice"][tempType] substringToIndex:5]]];
        mapPoint.annotId = i;
        [mapView addAnnotation:mapPoint];
        
        
    }
}
//Изменяем аннотацию
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;
{
    if(annotation == mapView.userLocation){
        return nil;
    }
    int i;
    for(i=0; i<myDataController->countCompany; i++){
        if([myDataController->company[i][@"Name"] isEqual: [annotation title]])
            break;
    }
    //NSLog(@" AnnotSubtitle: %@", [annotation subtitle]);
    NSString *annotationIdentifier = [annotation title];
    MKPinAnnotationView *mapAnnotation= (MKPinAnnotationView *) [mapView
                                                            dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    mapAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    UIImageView *annotationIcon;
    UIImage *marker = [UIImage imageNamed:myDataController->company[i][@"Logo"]];
    if (myDataController->company[i][@"Logo"] != nil)
    {
        annotationIcon = [[UIImageView alloc] initWithImage:marker];
    }
    else
    {
        annotationIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zapravka.png"]];
    }
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButton setBackgroundColor:[UIColor clearColor]];
    [rightButton setImage:[UIImage imageNamed:@"detailButton.png"] forState:UIControlStateNormal];
    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    mapAnnotation.rightCalloutAccessoryView = rightButton;
    [annotationIcon setFrame:CGRectMake(0, 0, 30, 30)];
    marker = [self imageWithImage:marker scaledToSize:CGSizeMake(30, 30)];
    mapAnnotation.leftCalloutAccessoryView = annotationIcon;
    mapAnnotation.CanShowCallout = YES;
    mapAnnotation.Opaque = true;
    mapAnnotation.image = marker;
    return mapAnnotation;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    [self performSegueWithIdentifier:@"detailmapSegue" sender:view.annotation];
}

@end
