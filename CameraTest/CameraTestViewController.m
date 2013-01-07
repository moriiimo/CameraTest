//
//  CameraTestViewController.m
//  CameraTest
//
//  Created by moriiimo on 2013/01/05.
//  Copyright (c) 2013年 moriiimo. All rights reserved.
//

#import "CameraTestViewController.h"

@interface CameraTestViewController ()

@end

@implementation CameraTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// カメラボタンを押されたときのアクション
- (void)imagePick
{
    [self dismissViewControllerAnimated:YES completion:nil];

    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypeCamera;
    
    // 使用可能かどうかチェックする
    if (![UIImagePickerController isSourceTypeAvailable:type]) {
        return;
    }
    
    // イメージピッカーを作る
    UIImagePickerController* imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    // [imagePicker autorelease]; arc使用時はいらない
    imagePicker.sourceType = type;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    
    // イメージピッカーを表示する
    [self presentViewController: imagePicker animated:YES completion: nil];
    // [self presentModalViewController:imagePicker animated:YES ]; // iOS6になってから非推奨
    
}

// なんらかの画像が取得できた場合に呼ばれるメソッド
- (void)imagePickerController:(UIImagePickerController*)picker
        didFinishPickingImage:(UIImage*)image
                  editingInfo:(NSDictionary*)editingInfo
{
    NSLog(@"画像取得できた");
    
    // イメージピッカーを隠す
    [self dismissViewControllerAnimated:YES completion:nil]; 
    
    // オリジナル画像を取得する
    UIImage*    originalImage;
    originalImage = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    
    // グラフィックスコンテキストを作る
    CGSize  size = { 300, 400 };
    UIGraphicsBeginImageContext(size);
    
    // 画像を縮小して描画する
    CGRect  rect;
    rect.origin = CGPointZero;
    rect.size = size;
    [originalImage drawInRect:rect];
    
    // 描画した画像を取得する
    UIImage*    shrinkedImage;
    shrinkedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 画像を表示する　IBOutletで紐付けたところに表示する。
    _imageView.image = shrinkedImage;
    
    // 渡されてきた画像をフォトアルバムに保存する
    UIImageWriteToSavedPhotosAlbum(
                                   image, self, @selector(targetImage:didFinishSavingWithError:contextInfo:),
                                   NULL);
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    NSLog(@"画像取得できなかった");
    // イメージピッカーを隠す
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)targetImage:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)context
{
    
    if(error){
        // 保存失敗時
        NSLog(@"保存失敗");
    }else{
        // 保存成功時
        NSLog(@"保存成功");
    }
    
}

@end
