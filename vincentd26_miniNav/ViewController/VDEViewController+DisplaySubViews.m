//
//  VDEViewController+DisplaySubViews.m
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/14.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import "VDEViewController+DisplaySubViews.h"

@implementation VDEViewController (DisplaySubViews)



-(void) displayTheSubViewsWithOrientation:(UIInterfaceOrientation) currentOrientation {
//---------------------------------------------------------------------------------------------

  // Screen size calculations
  //----------------------------------------------------------------------------------------
  int theViewWidth, theViewHeight;

  if (currentOrientation == UIInterfaceOrientationLandscapeLeft ||currentOrientation==UIInterfaceOrientationLandscapeRight) {
    theViewWidth  = [[UIScreen mainScreen] bounds].size.height;
    theViewHeight = [[UIScreen mainScreen] bounds].size.width;
  } else {
    theViewWidth  = [[UIScreen mainScreen] bounds].size.width;
    theViewHeight = [[UIScreen mainScreen] bounds].size.height;
  }

  // the toolbar
  //----------------------------------------------------------------------------------------
  int theToolBarX       = 0;
  int theToolBarWidth   = theViewWidth;
  int theToolBarHeight;
  if (self.isIPhone){
    theToolBarHeight=44;
  } else {
    theToolBarHeight=60;
  }
  int theToolBarY       = theViewHeight-theToolBarHeight; 
  
  [theToolBar setFrame:CGRectMake(theToolBarX,theToolBarY,theToolBarWidth, theToolBarHeight)];
  

  // the webView
  //----------------------------------------------------------------------------------------
  int theWebViewX       = 0;
  int theWebViewY       = 20;//theToolBarY+theToolBarHeight;
  int theWebViewWidth   = theViewWidth;
  int theWebViewHeight  = theViewHeight-theWebViewY;
  
  [theWebView setFrame:CGRectMake(theWebViewX, theWebViewY,theWebViewWidth, theWebViewHeight)];
  
  [theWebViewBlackOverlay setFrame:CGRectMake(theWebViewX, theWebViewY,theWebViewWidth, theWebViewHeight-theToolBarHeight)];

  //[theWebViewBlackOverlay setFrame:CGRectMake(0, theWebViewY,theViewWidth, theWebViewHeight)];
  
  
  [theWebView setNeedsDisplay];
  

  // the activity indicator
  //----------------------------------------------------------------------------------------
  int theActivityIndicatorWidth   = 50;
  int theActivityIndicatorHeight  = 50;
  int theActivityIndicatorX       = theViewWidth/2-theActivityIndicatorWidth/2;
  int theActivityIndicatorY       = theViewHeight/2-theActivityIndicatorHeight/2;

  [theActivityIndicator setFrame:CGRectMake(theActivityIndicatorX,
                                            theActivityIndicatorY,
                                            theActivityIndicatorWidth,
                                            theActivityIndicatorHeight)];
  
}

@end
