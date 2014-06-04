//
//  DetailViewController.m
//  zapravka
//
//  Created by Arthur Pertsev on 5/20/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize nameContent;
@synthesize priceContent;
@synthesize addressContent;
@synthesize imageContent;
@synthesize extraContent;
@synthesize fueltypeContent;
@synthesize worktimeContent;
@synthesize dateupdateContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.dName.text = self.nameContent;
    self.dPrice.text = (NSString *)self.priceContent;
    self.dAddress.text = self.addressContent;
    [self.dImage setImage:imageContent];
    self.dExtra.text = self.extraContent;
    self.dRating.text = [self.ratingContent stringValue];
    self.dFueltype.text = self.fueltypeContent;
    self.dWorktime.text = self.worktimeContent;
    self.dDateupdate.text = self.dateupdateContent;
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"fon2.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
