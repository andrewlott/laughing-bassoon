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
G8TesseractDelegate>

@property BOOL newMedia;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;
@end

