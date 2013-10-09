//
//  ViewController.m
//  BackgroundDownloadDemo
//
//  Created by ben on 10/9/13.
//  Copyright (c) 2013 Fickle Bits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (IBAction)downloadImageTapped:(id)sender {
    self.progressView.hidden = NO;
    self.progressView.progress = 0;
    self.imageView.image = nil;
    
    NSURL *imageUrl = [NSURL URLWithString:@"http://wallpaperstock.net/os-x-mavericks-wave_wallpapers_37109_320x480.jpg"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:imageUrl
                                                     completionHandler:^(NSURL *location,
                                                                         NSURLResponse *response,
                                                                         NSError *error) {
                                                         if (error) {
                                                             NSLog(@"ERROR: %@", error);
                                                         } else {
                                                             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                             if (httpResponse.statusCode == 200) {
                                                                 NSData *imageData = [NSData dataWithContentsOfURL:location];
                                                                 UIImage *image = [UIImage imageWithData:imageData];

                                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                                     self.imageView.image = image;
                                                                 });

                                                             } else {
                                                                 NSLog(@"Got a %d from the server", httpResponse.statusCode);
                                                             }
                                                         }
                                                     }];
    [task resume];
}


























#pragma mark - Session download delegate

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    

    // TODO
}

/* Sent periodically to notify the delegate of download progress. */
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    // TODO
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes {
}


@end
