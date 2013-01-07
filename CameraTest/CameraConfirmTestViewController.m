//
//  CameraConfirmTestViewController.m
//  CameraTest
//
//  Created by 守本 綾子 on 2013/01/06.
//  Copyright (c) 2013年 守本 綾子. All rights reserved.
//

#import "CameraConfirmTestViewController.h"

@interface CameraConfirmTestViewController ()

@end

@implementation CameraConfirmTestViewController

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
	NSLog(@"aaa");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)imageSave
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)imageCancel
{

}
@end
