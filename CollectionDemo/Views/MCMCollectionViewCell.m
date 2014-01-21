#import "MCMCollectionViewCell.h"
#import "MCMAsyncImageView.h"

@implementation MCMCollectionViewCell
#pragma mark - INIT/SETUP
-(instancetype)initWithFrame:(CGRect)frame{
  if((self = [super initWithFrame:frame])){
    [self setupConstraints];
    [self setupShadow];
  }
  return self;
}


-(void)awakeFromNib{
  [self setupConstraints];
  [self setupShadow];
}


-(void)setupConstraints{
  NSLayoutConstraint *squareConstraint = [NSLayoutConstraint constraintWithItem:[self imageView] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:[self imageView] attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
  [squareConstraint setPriority:1000];
  [[self imageView] addConstraint:squareConstraint];  
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
