#import "MCMNavigationControllerDelegate.h"
#import "MCMZoomDetailTransition.h"
#import "MCMZoomMasterTransition.h"

@interface MCMNavigationControllerDelegate ()
@property MCMZoomDetailTransition *zoomTransition;
@property MCMZoomMasterTransition *zoomOutTransition;
@end


@implementation MCMNavigationControllerDelegate
#pragma mark - INIT/SETUP
-(id)init{
  if((self = [super init])){
    [self setupTransitions];
  }
  return self;
}


-(void)awakeFromNib{
  [self setupTransitions];
}


-(void)setupTransitions{
  [self setZoomTransition:[MCMZoomDetailTransition new]];
  [self setZoomOutTransition:[MCMZoomMasterTransition new]];
}


#pragma mark - NAVIGATION DELEGATE
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
  if(UINavigationControllerOperationPush == operation){
    return [self zoomTransition];
  } else{
    return [self zoomOutTransition];
  }
  return nil;
}
@end
