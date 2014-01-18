#import "MCMCollectionViewCell.h"


@implementation MCMCollectionViewCell
#pragma mark - INIT/SETUP
-(instancetype)initWithFrame:(CGRect)frame{
  if((self = [super initWithFrame:frame])){
    [self setup];
  }
  return self;
}


-(void)awakeFromNib{
  [self setup];
}


-(void)setup{
  NSLayoutConstraint *squareConstraint = [NSLayoutConstraint constraintWithItem:[self imageView] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:[self imageView] attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
  [squareConstraint setPriority:1000];
  [[self imageView] addConstraint:squareConstraint];
}
@end
