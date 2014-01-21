#import "MCMCollectionViewDataSource.h"
#import "MCMCollectionViewCell.h"
#import "MCMAsyncImageView.h"

static NSString * const kImageCellID = @"ImageCell";
static NSString * const kNameKey = @"display_name";
static NSString * const kImageURLKey = @"profile_image";

@implementation MCMCollectionViewDataSource
#pragma mark - DATA SOURCE
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return [[self users] count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  NSDictionary *user = [self users][[indexPath item]];
  MCMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellID forIndexPath:indexPath];
  [[cell label] setText:user[kNameKey]];
  [[cell imageView] setURL:[NSURL URLWithString:user[kImageURLKey]]];
  return cell;
}
@end
