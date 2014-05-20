//
//  DetailViewController.h
//  zapravka
//
//  Created by Arthur Pertsev on 5/20/14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UILabel *dName;
@property (weak, nonatomic) IBOutlet UIImageView *dImage;
@property (weak, nonatomic) IBOutlet UILabel *dAddress;
@property (weak, nonatomic) IBOutlet UILabel *dPrice;
@property (weak, nonatomic) IBOutlet UILabel *dFueltype;
@property (weak, nonatomic) IBOutlet UILabel *dWorktime;
@property (weak, nonatomic) IBOutlet UILabel *dRating;
@property (weak, nonatomic) IBOutlet UILabel *dExtra;
@property (weak, nonatomic) IBOutlet UILabel *dDateupdate;

@property (strong, nonatomic) NSString *nameContent;
@property (strong, nonatomic) NSString *addressContent;
@property (strong, nonatomic) NSNumber *priceContent;
@property (strong, nonatomic) NSNumber *ratingContent;
@property (strong, nonatomic) UIImage *imageContent;
@property (strong, nonatomic) NSString *extraContent;
@property (strong, nonatomic) NSString *fueltypeContent;
@property (strong, nonatomic) NSString *worktimeContent;
@property (strong, nonatomic) NSString *dateupdateContent;

@end
