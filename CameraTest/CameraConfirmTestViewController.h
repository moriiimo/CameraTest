//
//  CameraConfirmTestViewController.h
//  CameraTest
//
//  Created by moriiimo on 2013/01/06.
//  Copyright (c) 2013年 moriiimo. All rights reserved.
//  http://supportdoc.net/support-iphone/send_data_1_1.html

#import <UIKit/UIKit.h>

@interface CameraConfirmTestViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImageView* confirmImageView;
}

- (IBAction)imageSave;

- (IBAction)imageCancel;

@end
