@import UIKit;
@class MCMAsyncImageView;

@interface MCMCollectionViewCell : UICollectionViewCell
@property (weak) IBOutlet MCMAsyncImageView *imageView;
@property (weak) IBOutlet UILabel *label;
@end
