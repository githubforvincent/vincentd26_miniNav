//
//  VDEViewController+ConfigureSubviews.m
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/14.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import "VDEViewController+ConfigureSubviews.h"

@implementation VDEViewController (ConfigureSubviews)

-(void) configureSubviews {
//--------------------------------------------------------------------------------------------------------

#pragma mark Buttons
  
  // the buttons
  //--------------------------------------------------------------------------------------------------------
  theReloadHomePageButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                         target:self
                                                                         action:@selector(goToHomePage)];
  
  theBackwardButton       = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                         target:self
                                                                         action:@selector(goBackPage)];
  [theBackwardButton setEnabled:NO];
  
  theForwardButton        = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                         target:self
                                                                        action:@selector(goNextPage)];
  
  [theForwardButton setEnabled:NO];
  
  theUrlSelectionButton   = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                        target:self
                                                                        action:@selector(selectNewURL)];
  
  thePreferencesButton    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                        target:self
                                                                        action:@selector(editHomePage)];
  
  theFlexibleSpaceBar     = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:@selector(alloc)];
  
  theFixedSpaceBar        = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                          target:nil
                                                                          action:@selector(alloc)];
  [theFixedSpaceBar setWidth:20];
  
  NSArray *theTools =@[theReloadHomePageButton,
                       theFlexibleSpaceBar,
                       theBackwardButton,
                       theFixedSpaceBar,
                       theUrlSelectionButton,
                       theFixedSpaceBar,
                       theForwardButton,
                       theFlexibleSpaceBar,
                       thePreferencesButton];
  
  
#pragma mark WebView
//--------------------------------------------------------------------------------------------------------
  theWebView = [[UIWebView alloc] init];
  [theWebView setDelegate:self];
  [theWebView setScalesPageToFit:YES];
  
  [[self view] addSubview:theWebView];
  
  // blackScreen when loading a page, display/remove done by the webView delegates
  theWebViewBlackOverlay = [[UIView alloc]init];
  [theWebViewBlackOverlay setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.6]];
  

#pragma mark Toolbar
//--------------------------------------------------------------------------------------------------------
  // The toolbar on second position in order to have it on top of the webview
  theToolBar = [[UIToolbar alloc] init];
  [theToolBar setItems:theTools];
  [theToolBar setBarStyle:UIBarStyleBlackTranslucent];
  //[theToolBar setBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0]];
  [[self view] addSubview:theToolBar];

#pragma mark Activity
//--------------------------------------------------------------------------------------------------------

  theActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  [theActivityIndicator setHidesWhenStopped:YES];
  [theWebViewBlackOverlay addSubview:theActivityIndicator];
  
#pragma mark AlertView
//--------------------------------------------------------------------------------------------------------

  // Home page modification
  theURLHomePageEditionAlert = [[UIAlertView alloc] initWithTitle:@"Changer la page d'accueil"
                                                          message:nil delegate:self
                                                cancelButtonTitle:@"Annuler"
                                                otherButtonTitles:@"OK", nil];
  [theURLHomePageEditionAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];

  
  // Init alert for entering url
  theURLInputAlert = [[UIAlertView alloc] initWithTitle:@"Choisir une page Web"
                                                message:nil
                                               delegate:self
                                      cancelButtonTitle:@"Annuler"
                                      otherButtonTitles:@"OK", nil];
  [theURLInputAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];


  
}

@end
