#import "MCMZoomDetailTransition.h"

#import "MCMDetailViewController.h"

@implementation MCMZoomDetailTransition

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
  [self stuffTransitionContext:transitionContext andBlock:^(UICollectionViewController *fromController, MCMDetailViewController *toController) {
    UICollectionViewCell *cell = [self selectedCellOfCollection:[fromController collectionView]];
    UIView *content = [toController contentView];

    CGRect fromFrameInCollection = [cell frame];
    CGRect fromFrame = [[fromController view] convertRect:fromFrameInCollection fromView:[fromController collectionView]];
    CGRect toFrame = [content frame];
    CGRect toFrameInCollection = [[fromController collectionView] convertRect:toFrame fromView:[fromController view]];
//    CGRect toFrameInCollection = [[fromController view] convertRect:toFrame fromView:[fromController collectionView]];
    
    [[cell superview] bringSubviewToFront:cell];
    [content setFrame:fromFrame];
    [[toController view] setAlpha:0.0f];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
      [cell setFrame:toFrameInCollection];
      [cell layoutIfNeeded];
      [content layoutIfNeeded];
//      [content setFrame:CGRectMake(toFrame.origin.x, toFrame.origin.y + 164.0f, toFrame.size.width, toFrame.size.height)];
      [[toController view] setAlpha:1.0f];
    } completion:^(BOOL finished) {
      [cell setFrame: fromFrameInCollection];
      [transitionContext completeTransition:YES];
    }];
  }];
}


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
  return 2.5f;
}


#pragma mark - UTILITY
-(void)stuffTransitionContext:(id<UIViewControllerContextTransitioning>)context andBlock:(void (^)(UICollectionViewController *fromController, MCMDetailViewController *toController))someBlock{
  NSParameterAssert([[context viewControllerForKey:UITransitionContextFromViewControllerKey] isKindOfClass:[UICollectionViewController class]]);
  NSParameterAssert([[context viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[MCMDetailViewController class]]);
  
  UICollectionViewController *fromController = (UICollectionViewController *)[context viewControllerForKey:UITransitionContextFromViewControllerKey];
  MCMDetailViewController *toController = (MCMDetailViewController *)[context viewControllerForKey:UITransitionContextToViewControllerKey];
  [[context containerView] addSubview:[toController view]];
  
  someBlock(fromController, toController);
}


-(UICollectionViewCell *)selectedCellOfCollection:(UICollectionView *)collectionView{
  UICollectionViewCell *cell = nil;
  NSArray *indices = [collectionView indexPathsForSelectedItems];
  if([indices count]){
    NSIndexPath *index = [indices firstObject];
    cell = [collectionView cellForItemAtIndexPath:index];
  }
  return cell;
}
@end
