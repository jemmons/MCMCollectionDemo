#import "MCMCollectionViewCell.h"
#import "MCMAsyncImageView.h"

@implementation MCMCollectionViewCell
#pragma mark - INIT/SETUP
-(instancetype)initWithFrame:(CGRect)frame{
  if((self = [super initWithFrame:frame])){
    [self setupShadow];
  }
  return self;
}


-(void)awakeFromNib{
  [self setupShadow];
}


-(void)setupShadow{
  [self setClipsToBounds:NO];
  [[self layer] setShadowPath:[[UIBezierPath bezierPathWithRect:[self bounds]] CGPath]];
  [[self layer] setShadowColor:[[UIColor blackColor] CGColor]];
  [[self layer] setShadowOffset:CGSizeMake(0.0f, 1.0f)];
  [[self layer] setShadowRadius:2.0f];
  [[self layer] setShadowOpacity:0.5f];
}
@end
