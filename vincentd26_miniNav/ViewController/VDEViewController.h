//
//  VDEViewController.h
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/14.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDEDataController.h"

@interface VDEViewController : UIViewController <UIWebViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate> {
//----------------------------------------------------------------------------

  UIToolbar       *theToolBar;
  
  UIBarButtonItem *theReloadHomePageButton;
  UIBarButtonItem *theBackwardButton;
  UIBarButtonItem *theForwardButton;
  UIBarButtonItem *theUrlSelectionButton;
  UIBarButtonItem *thePreferencesButton;
  UIBarButtonItem *theFlexibleSpaceBar;
  UIBarButtonItem *theFixedSpaceBar;
  

  
  UIAlertView     *theURLInputAlert;
  UIAlertView     *theURLHomePageEditionAlert;
  UIAlertView     *theLoadingErrorAlert;
  
  UIWebView       *theWebView;
  UIView          *theWebViewBlackOverlay;
  
  UIActivityIndicatorView *theActivityIndicator;
  
  NSURLRequest    *theRequestedURL;
  
  NSString  * test;
  
}

@property (nonatomic, strong)  VDEDataController *theDataController;
@property (getter = isIPad)    BOOL iPad;
@property (getter = isIPhone)  BOOL iPhone;
@property (getter = isIOS6)    BOOL iOS6;

@end


//----------------------------------------------------------------------------------------
// CATEGORIES
//----------------------------------------------------------------------------------------

@interface VDEViewController (ConfigureSubViews)
//----------------------------------------------------------------------------

-(void) configureSubviews;

@end

@interface VDEViewController (DisplaySubView)
//----------------------------------------------------------------------------

-(void) displayTheSubViewsWithOrientation:(UIInterfaceOrientation) o;

@end


@interface VDEViewController (handleSubViewsActions)
//----------------------------------------------------------------------------

-(void) goToHomePage;

-(void) goBackPage;

-(void) goNextPage;

-(void) selectNewURL;

-(void) editHomePage;

-(void) stopLoadingAndRemoveOverlay;

@end



