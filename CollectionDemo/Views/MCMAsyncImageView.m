#import "MCMAsyncImageView.h"


@implementation MCMAsyncImageView
-(void)setURL:(NSURL *)url{
  UIImage *placeholder = [UIImage imageNamed:@"silhouette"];
  [self setImage:placeholder];

  NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
  NSURLRequest *req = [NSURLRequest requestWithURL:url];
  NSURLSessionDataTask *task = [session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    UIImage *image = [UIImage imageWithData:data];
    [self setImage:image];
  }];
  [task resume];
}
@end
