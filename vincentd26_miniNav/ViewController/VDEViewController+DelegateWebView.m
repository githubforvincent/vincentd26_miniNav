//
//  VDEViewController+DelegateWebView.m
//  vincentd26_miniNav
//
//  Created by Utilisation on 29/05/2014.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import "VDEViewController+DelegateWebView.h"

@implementation VDEViewController (DelegateWebView)

//--------------------------------------------------------------------------------------------------------
#pragma mark WebViewDelegates
//--------------------------------------------------------------------------------------------------------

-(void)webViewDidFinishLoad:(UIWebView *)webView {
//--------------------------------------------------------------------------------------------------------
  
  [theActivityIndicator stopAnimating];
  [theWebViewBlackOverlay removeFromSuperview];
  
  // backward and forward buttons enabling
  [theBackwardButton  setEnabled:[theWebView canGoBack]];
  [theForwardButton   setEnabled:[theWebView canGoForward]];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
//--------------------------------------------------------------------------------------------------------
  [[self view] addSubview:theWebViewBlackOverlay];
  [theActivityIndicator startAnimating];
  
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  //--------------------------------------------------------------------------------------------------------
  
  
  // Trouvé sur stackoverflow pour reperer une chaine dans une autre
  if (!([error.localizedDescription rangeOfString:@"-999"].location >1000)) {
    // error -999, so the alert view is not displayed
     return;
  }
  
  //error when loading 
  theLoadingErrorAlert = [[UIAlertView alloc] initWithTitle:@"Erreur lors du chargement"
                                                    message:error.localizedDescription
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
  
  [theLoadingErrorAlert setAlertViewStyle:UIAlertViewStyleDefault];
  [theLoadingErrorAlert show];
  
  //remove overlay
  [self webViewDidFinishLoad:theWebView];
  
 
}

//--------------------------------------------------------------------------------------------------------
#pragma mark AlertViewDelegates
//--------------------------------------------------------------------------------------------------------

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  //--------------------------------------------------------------------------------------------------------
  

  
  if ( alertView == theURLInputAlert ) {
    if(buttonIndex == 1) { // OK seleted
      UITextField *theAlertView = [alertView textFieldAtIndex:0];
      NSURL* startURL = [NSURL URLWithString: theAlertView.text];
      theRequestedURL = [NSURLRequest requestWithURL:startURL];
      [theWebView loadRequest:theRequestedURL];
    }
  }
  
  if ( alertView == theURLHomePageEditionAlert ) {
    if(buttonIndex == 1) { // OK seleted
      UITextField *theAlertView = [alertView textFieldAtIndex:0];
      [self.theDataController modifyTheHomePageWith: theAlertView.text];
    }
  }
  
}


@end
