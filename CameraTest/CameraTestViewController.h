//
//  CameraTestViewController.h
//  CameraTest
//
//  Created by moriiimo on 2013/01/05.
//  Copyright (c) 2013年 moriiimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraConfirmTestViewController.h"

@interface CameraTestViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UIImageView*   _imageView;

}

// アクション
- (IBAction)imagePick;

@end
