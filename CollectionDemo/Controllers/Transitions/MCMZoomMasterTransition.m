#import "MCMZoomMasterTransition.h"

@implementation MCMZoomMasterTransition
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
  UICollectionViewController *fromController = (UICollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  [[transitionContext containerView] addSubview:[toController view]];
  
 
  
  [transitionContext completeTransition:YES];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
  return 0.5f;
}
@end
