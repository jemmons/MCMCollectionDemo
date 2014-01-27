#import "MCMAsyncImageView.h"
#import "UIView+Constraints.h"


@implementation MCMAsyncImageView
-(instancetype)initWithImage:(UIImage *)image{
  if(self =[super initWithImage:image]){
    [self setupSquareConstraints];
  }
  return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
  if((self = [super initWithCoder:aDecoder])){
    [self setupSquareConstraints];
  }
  return self;
}


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
