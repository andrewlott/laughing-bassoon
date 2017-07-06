//
//  ViewController.m
//  Photocopy-and-Paste
//
//  Created by Andrew Lott on 7/2/17.
//  Copyright © 2017 Andrew Lott. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic) bool shouldSave;
@property (nonatomic, strong) NSDictionary *languages;
@property (nonatomic) bool enableMultipleLanguages;
@property (nonatomic, strong) UIAlertView *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.shouldSave = NO;
    self.languages = @{@"Afrikaans" :   @"afr",
                       @"Amharic" :   @"amh",
                       @"Arabic" :   @"ara",
                       @"Assamese" :   @"asm",
                       @"Azerbaijani" :   @"aze",
                       @"Azerbaijani - Cyrilic" :   @"aze_cyrl",
                       @"Belarusian" :   @"bel",
                       @"Bengali" :   @"ben",
                       @"Tibetan" :   @"bod",
                       @"Bosnian" :   @"bos",
                       @"Bulgarian" :   @"bul",
                       @"Catalan; Valencian" :   @"cat",
                       @"Cebuano" :   @"ceb",
                       @"Czech" :   @"ces",
                       @"Chinese - Simplified" :   @"chi_sim",
                       @"Chinese - Traditional" :   @"chi_tra",
                       @"Cherokee" :   @"chr",
                       @"Welsh" :   @"cym",
                       @"Danish" :   @"dan",
                       @"German" :   @"deu",
                       @"Dzongkha" :   @"dzo",
                       @"Greek, Modern (1453-)" :   @"ell",
                       @"English" :   @"eng",
                       @"English, Middle (1100-1500)" :   @"enm",
                       @"Esperanto" :   @"epo",
                       @"Estonian" :   @"est",
                       @"Basque" :   @"eus",
                       @"Persian" :   @"fas",
                       @"Finnish" :   @"fin",
                       @"French" :   @"fra",
                       @"Frankish" :   @"frk",
                       @"French, Middle (ca. 1400-1600)" :   @"frm",
                       @"Irish" :   @"gle",
                       @"Galician" :   @"glg",
                       @"Greek, Ancient (-1453)" :   @"grc",
                       @"Gujarati" :   @"guj",
                       @"Haitian; Haitian Creole" :   @"hat",
                       @"Hebrew" :   @"heb",
                       @"Hindi" :   @"hin",
                       @"Croatian" :   @"hrv",
                       @"Hungarian" :   @"hun",
                       @"Inuktitut" :   @"iku",
                       @"Indonesian" :   @"ind",
                       @"Icelandic" :   @"isl",
                       @"Italian" :   @"ita",
                       @"Italian - Old" :   @"ita_old",
                       @"Javanese" :   @"jav",
                       @"Japanese" :   @"jpn",
                       @"Kannada" :   @"kan",
                       @"Georgian" :   @"kat",
                       @"Georgian - Old" :   @"kat_old",
                       @"Kazakh" :   @"kaz",
                       @"Central Khmer" :   @"khm",
                       @"Kirghiz; Kyrgyz" :   @"kir",
                       @"Korean" :   @"kor",
                       @"Kurdish" :   @"kur",
                       @"Lao" :   @"lao",
                       @"Latin" :   @"lat",
                       @"Latvian" :   @"lav",    
                       @"Lithuanian" :   @"lit",    
                       @"Malayalam" :   @"mal",    
                       @"Marathi" :   @"mar",    
                       @"Macedonian" :   @"mkd",    
                       @"Maltese" :   @"mlt",    
                       @"Malay" :   @"msa",    
                       @"Burmese" :   @"mya",    
                       @"Nepali" :   @"nep",    
                       @"Dutch; Flemish" :   @"nld",    
                       @"Norwegian" :   @"nor",    
                       @"Oriya" :   @"ori",    
                       @"Panjabi; Punjabi" :   @"pan",    
                       @"Polish" :   @"pol",    
                       @"Portuguese" :   @"por",    
                       @"Pushto; Pashto" :   @"pus",    
                       @"Romanian; Moldavian; Moldovan" :   @"ron",    
                       @"Russian" :   @"rus",    
                       @"Sanskrit" :   @"san",    
                       @"Sinhala; Sinhalese" :   @"sin",    
                       @"Slovak" :   @"slk",    
                       @"Slovenian" :   @"slv",    
                       @"Spanish; Castilian" :   @"spa",    
                       @"Spanish; Castilian - Old" :   @"spa_old",    
                       @"Albanian" :   @"sqi",    
                       @"Serbian" :   @"srp",    
                       @"Serbian - Latin" :   @"srp_latn",    
                       @"Swahili" :   @"swa",    
                       @"Swedish" :   @"swe",    
                       @"Syriac" :   @"syr",    
                       @"Tamil" :   @"tam",    
                       @"Telugu" :   @"tel",    
                       @"Tajik" :   @"tgk",    
                       @"Tagalog" :   @"tgl",    
                       @"Thai" :   @"tha",    
                       @"Tigrinya" :   @"tir",    
                       @"Turkish" :   @"tur",    
                       @"Uighur; Uyghur" :   @"uig",    
                       @"Ukrainian" :   @"ukr",    
                       @"Urdu" :   @"urd",    
                       @"Uzbek" :   @"uzb",    
                       @"Uzbek - Cyrilic" :   @"uzb_cyrl",    
                       @"Vietnamese" :   @"vie",    
                       @"Yiddish" :   @"yid"};
    
    NSInteger row = [[self.languages.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] indexOfObject:@"English"];

    [self.languagePicker selectRow:row inComponent:0 animated:YES];
    
    self.enableMultipleLanguages = NO;
    
    self.scanView.hidden = !self.enableMultipleLanguages;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.languages.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *key = [self.languages.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)][row];
    NSString *formattedString = @"%@";
    if (![self isLanguageDownloaded:self.languages[key]]) {
        formattedString = @"%@ (requires download)";
    }
    return [NSString stringWithFormat:formattedString, key];
}

- (bool)isLanguageDownloaded:(NSString *)lang {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self formattedLanguageFileWithPrefix:lang]];
}

- (NSString *)formattedLanguageFileWithPrefix: (NSString *)lang {
    return [NSString stringWithFormat:@"tessdata/%@", [self formattedLanguageFile:lang]];
}

- (NSString *)formattedLanguageFile: (NSString *)lang {
    return [NSString stringWithFormat:@"%@.traineddata", lang];
}

- (void)downloadLanguage:(NSString *)lang responseHandler:(void (^)(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError)) handler {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/tesseract-ocr/tessdata/blob/3.04.00/%@", [self formattedLanguageFile:lang]]]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:handler];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        if(!image) {
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
        _imageView.image = image;
        if (_newMedia && self.shouldSave)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void) useCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = YES;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) useCameraRoll:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = NO;
    }
}

-(void)recognizeImageWithTesseract {
    [self recognizeImageWithTesseract:self.imageView.image language:self.languages[@"English"]];
}

-(void)recognizeImageWithTesseract:(UIImage *)image language:(NSString *)lang
{
    [self startLoadingAnimation];

    // Create a new `G8RecognitionOperation` to perform the OCR asynchronously
    // It is assumed that there is a .traineddata file for the language pack
    // you want Tesseract to use in the "tessdata" folder in the root of the
    // project AND that the "tessdata" folder is a referenced folder and NOT
    // a symbolic group in your project
    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:lang];
    
    // Use the original Tesseract engine mode in performing the recognition
    // (see G8Constants.h) for other engine mode options
    operation.tesseract.engineMode = G8OCREngineModeTesseractCubeCombined;
    
    // Let Tesseract automatically segment the page into blocks of text
    // based on its analysis (see G8Constants.h) for other page segmentation
    // mode options
    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAuto;
    
    // Optionally limit the time Tesseract should spend performing the
    // recognition
    //operation.tesseract.maximumRecognitionTime = 1.0;
    
    // Set the delegate for the recognition to be this class
    // (see `progressImageRecognitionForTesseract` and
    // `shouldCancelImageRecognitionForTesseract` methods below)
    operation.delegate = self;
    
    // Optionally limit Tesseract's recognition to the following whitelist
    // and blacklist of characters
    //operation.tesseract.charWhitelist = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`-=[]\\;',./!@#$%^&*()~_+{}|:\"<>?";
    //operation.tesseract.charBlacklist = @"56789";
    
    // Set the image on which Tesseract should perform recognition
    operation.tesseract.image = [image g8_blackAndWhite];
    // Optionally limit the region in the image on which Tesseract should
    // perform recognition to a rectangle
    //operation.tesseract.rect = CGRectMake(20, 20, 100, 100);
    
    // Specify the function block that should be executed when Tesseract
    // finishes performing recognition on the image
    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
        [self stopLoadingAnimation];
        // Fetch the recognized text
        NSString *recognizedText = [tesseract.recognizedText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"%@", recognizedText);
        if (recognizedText.length == 0) {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"Scan Failed"
                                  message: @"Failed to find text"
                                  delegate: nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
        } else {
            // Spawn an alert with the recognized text
            self.alertView = [[UIAlertView alloc] initWithTitle:@""
                                                        message:recognizedText
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Copy to Clipboard", nil];
            // UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            // pasteboard.string = @"paste me somewhere";
            [self.alertView show];
        }
    };
    
    // Display the image to be recognized in the view
    //self.imageView.image = operation.tesseract.thresholdedImage;
    
    // Finally, add the recognition operation to the queue
    [self.operationQueue addOperation:operation];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (![alertView isEqual:self.alertView]) {
        return;
    }
    
    if (buttonIndex == 1) {
        [self copyToClipboard:self.alertView.message];
    }
}

-(IBAction)recognizeImage:(id)sender {
    NSInteger row = [self.languagePicker selectedRowInComponent:0];
    NSString *key = [self.languages.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)][row];
    NSString *lang = self.languages[key];
    NSLog(@"Scanning...");
/*
    if ([self isLanguageDownloaded:lang]) {
 */
    [self startLoadingAnimation];
    [self performSelector:@selector(recognizeImageWithTesseract) withObject:nil afterDelay:0.0f];
//        [self recognizeImageWithTesseract:self.imageView.image language:lang];
/*
    } else {
        [self startLoadingAnimation];
        [self downloadLanguage:lang responseHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            [self stopLoadingAnimation];
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle: @"Download failed"
                                      message: error.description
                                      delegate: nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
                [alert show];
            }
            if (data) {
                NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
                NSString *filePath = [documentDir stringByAppendingPathComponent:[self formattedLanguageFileWithPrefix:lang]];
                [data writeToFile:filePath atomically:YES];
                NSLog(@"File is saved to %@",filePath);
                [self.languagePicker reloadAllComponents];
                [self.languagePicker selectRow:row inComponent:0 animated:NO];
                [self recognizeImageWithTesseract:self.imageView.image language:lang];
            }
        }];
    }
 */
}

-(void) highlightText:(NSString *)srcTxt inTextView:(UITextView *)txtView {
    int srcTxtLen = srcTxt.length;
    int idx = 0;
    while (idx<=(txtView.text.length-srcTxtLen)) {
        NSRange srcRange = NSMakeRange(idx, srcTxtLen);
        if ([[txtView.text substringWithRange:srcRange] isEqualToString:srcTxt]) {
            NSMutableAttributedString *tmpAttrTxt = [[NSMutableAttributedString alloc] initWithAttributedString:txtView.attributedText];
            [tmpAttrTxt addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:srcRange];
            txtView.attributedText = tmpAttrTxt;
            idx += srcTxtLen;
        } else {
            idx++;
        }
    }
}

- (void)copyToClipboard:(NSString *)s {
    [UIPasteboard generalPasteboard].string = s;
}

- (void)startLoadingAnimation {
    self.activityIndicatorBackground.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)stopLoadingAnimation {
    [self.activityIndicator stopAnimating];
    self.activityIndicatorBackground.hidden = YES;
}
@end
