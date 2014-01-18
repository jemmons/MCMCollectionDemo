#import "MCMCollectionViewDataSource.h"

static NSString * const kImageCellID = @"ImageCell";


@implementation MCMCollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return 6;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellID forIndexPath:indexPath];
  return cell;
}
@end
