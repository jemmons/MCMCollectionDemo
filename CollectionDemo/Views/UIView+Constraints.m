#import "UIView+Constraints.h"


@implementation UIView (Constraints)
-(void)setupSquareConstraints{
  NSLayoutConstraint *squareConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
  [squareConstraint setPriority:1000];
  [self addConstraint:squareConstraint];
}
@end
