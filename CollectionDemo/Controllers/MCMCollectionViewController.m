#import "MCMCollectionViewController.h"

#import "MCMCollectionViewDataSource.h"
#import "MCMCollectionViewDelegate.h"

@interface MCMCollectionViewController ()
@property MCMCollectionViewDataSource *dataSource;
@property MCMCollectionViewDelegate *delegate;
@end


@implementation MCMCollectionViewController

-(void)viewDidLoad{
  [self setDataSource:[MCMCollectionViewDataSource new]];
  [self setDelegate:[MCMCollectionViewDelegate new]];
  [[self collectionView] setDataSource:[self dataSource]];
  [[self collectionView] setDelegate:[self delegate]];
  [self fetchNames];
}


#pragma mark - NETWORKING
-(void)fetchNames{
  NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
  [conf setHTTPAdditionalHeaders:@{@"Accept-Encoding":@"gzip"}];
  
  NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
  
  NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.stackexchange.com/2.1/users?page=1&pagesize=23&order=asc&sort=modified&site=stackoverflow&filter=!23IiyY_G_aI0SG9NnPGBm"]];
  
  NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    if(dict){
      [[self dataSource] setUsers:dict[@"items"]];
      [[self collectionView] reloadData];
    }
  }];
  
  [dataTask resume];
}


@end
