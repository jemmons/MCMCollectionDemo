#import "MCMZoomDetailTransition.h"

#import "MCMDetailViewController.h"

@implementation MCMZoomDetailTransition

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
  [self insertViewsFromControllersInContext:transitionContext andBlock:^(UICollectionViewController *fromController, MCMDetailViewController *toController) {
    
    UIView *cellView = [self selectedCellOfCollection:[fromController collectionView]];
    CGRect fromFrameActual = [cellView frame];
    CGRect cellFromFrame = [[fromController view] convertRect:fromFrameActual fromView:[cellView superview]];
    CGRect contentFromFrame = [[toController view] convertRect:fromFrameActual fromView:[cellView superview]];

    UIView *contentView = [toController contentView];
    CGRect toFrameActual = [contentView frame];
    CGRect cellToFrame = [[fromController view] convertRect:toFrameActual fromView:[contentView superview]];
    CGRect contentToFrame = [[toController view] convertRect:toFrameActual fromView:[contentView superview]];
    
    UIView *cellSnapshot = [cellView snapshotViewAfterScreenUpdates:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
      [cellView setHidden:YES];
    });
    [cellSnapshot setFrame:cellFromFrame];
    [[fromController view] addSubview:cellSnapshot];

    UIView *contentSnapshot = [contentView snapshotViewAfterScreenUpdates:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
      [contentView setHidden:YES];
    });
    [contentSnapshot setFrame:contentFromFrame];
    [[toController view] addSubview:contentSnapshot];
    
    [[toController view] setAlpha:0.0f];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
      [[toController view] setAlpha:1.0f];
      [cellSnapshot setFrame:cellToFrame];
      [contentSnapshot setFrame:contentToFrame];
    } completion:^(BOOL finished) {
      [cellSnapshot removeFromSuperview];
      [contentSnapshot removeFromSuperview];
      [cellView setHidden:NO];
      [contentView setHidden:NO];
      [transitionContext completeTransition:YES];
    }];
  }];
}


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
  return 2.5f;
}


#pragma mark - UTILITY
-(void)insertViewsFromControllersInContext:(id<UIViewControllerContextTransitioning>)context andBlock:(void (^)(UICollectionViewController *fromController, MCMDetailViewController *toController))someBlock{
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
