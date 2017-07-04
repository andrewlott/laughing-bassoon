//
//  ViewController.h
//  Photocopy-and-Paste
//
//  Created by Andrew Lott on 7/2/17.
//  Copyright © 2017 Andrew Lott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <TesseractOCR/TesseractOCR.h>

@interface ViewController : UIViewController
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UIPickerViewDataSource,
UIPickerViewDelegate,
UIAlertViewDelegate,
G8TesseractDelegate>

@property BOOL newMedia;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *activityIndicatorBackground;
@property (strong, nonatomic) IBOutlet UIView *scanView;
@property (strong, nonatomic) IBOutlet UIPickerView *languagePicker;

- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;
-(IBAction)recognizeImage:(id)sender;
@end

