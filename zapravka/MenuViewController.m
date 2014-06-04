//
//  MenuViewController.m
//  zapravka
//
//  Created by Admin on 01.06.14.
//  Copyright (c) 2014 Arthur Pertsev. All rights reserved.
//

#import "MenuViewController.h"
#import "MyGlobal.h"
@interface MenuViewController()


@end

@implementation MenuViewController


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
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"основной_фон.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    //UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    //[button setImage:[UIImage imageNamed:@"button1.png"] forState:UIControlStateNormal];
    //[button setBackgroundImage:[UIImage imageNamed:@"button1.png"] forState:UIControlStateNormal];
    
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)Push98:(id)sender {
    
        
    type.text = @"АИ-98";
    [MyGlobal setGlobalValue:0];
    
    
    
}
- (IBAction)Push95:(id)sender {
    type.text = @"АИ-95";
    [MyGlobal setGlobalValue:1];
}

- (IBAction)Push92:(id)sender {
    type.text = @"АИ-92";
    [MyGlobal setGlobalValue:2];
}
- (IBAction)Push80:(id)sender {
    type.text = @"АИ-80";
    [MyGlobal setGlobalValue:3];
}
- (IBAction)PushDT:(id)sender {
     type.text = @"ДТ";
    [MyGlobal setGlobalValue:4];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
