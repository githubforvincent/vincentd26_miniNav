//
//  VDEViewController+HandleSubViewsActions.m
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/14.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import "VDEViewController+HandleSubViewsActions.h"

@implementation VDEViewController (HandleSubViewsActions)



-(void) goToHomePage {
//--------------------------------------------------------------------------------------------------------
  
  [self stopLoadingAndRemoveOverlay];
  
  NSURL* startURL = [NSURL URLWithString: [self.theDataController getTheHomePageURL]];
  theRequestedURL = [NSURLRequest requestWithURL:startURL];
  [theWebView loadRequest:theRequestedURL];
}

-(void) goBackPage {
//--------------------------------------------------------------------------------------------------------

  [self stopLoadingAndRemoveOverlay];
  
  if ([theWebView canGoBack]) {
        [theWebView goBack];
      }
}

-(void) goNextPage {
//--------------------------------------------------------------------------------------------------------
  
  [self stopLoadingAndRemoveOverlay];
  
  if ([theWebView canGoForward]) {
    [theWebView goForward];
  }
}

-(void) selectNewURL {
//--------------------------------------------------------------------------------------------------------
  
  [self stopLoadingAndRemoveOverlay];
  
  UITextField *theAlertViewPlaceHolder = [theURLInputAlert textFieldAtIndex:0];
  theAlertViewPlaceHolder.text = @"http://";
  [theURLInputAlert show];
}

-(void) editHomePage {
//--------------------------------------------------------------------------------------------------------

  [self stopLoadingAndRemoveOverlay];
  
  NSString * theCurrentHometPage = [self.theDataController getTheHomePageURL];
  UITextField *theAlertViewPlaceHolder = [theURLHomePageEditionAlert textFieldAtIndex:0];
  theAlertViewPlaceHolder.text =theCurrentHometPage;
  [theURLHomePageEditionAlert show];
  
}

-(void ) stopLoadingAndRemoveOverlay {
//--------------------------------------------------------------------------------------------------------
  if(theWebView.isLoading) {
    [theWebView stopLoading];
    [theActivityIndicator stopAnimating];
    [theWebViewBlackOverlay removeFromSuperview];
  }
}

@end
