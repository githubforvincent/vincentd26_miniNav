//
//  VDEViewController.m
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/14.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

//
//  VDEViewController.m
//  vincentd26_imagier
//
//  Created by Utilisation on 22/05/14.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import "VDEViewController.h"


@interface VDEViewController ()



@end

@implementation VDEViewController


- (void)viewDidLoad {
	//--------------------------------------------------------------------------------------------------------
  
  [super viewDidLoad];
  
  // Device type
  self.iPhone = ([[UIDevice currentDevice] userInterfaceIdiom ]== UIUserInterfaceIdiomPhone);
  self.iPad   = !(self.isIPhone);
  
  //Version
  self.iOS6 = ([[[UIDevice currentDevice] systemVersion] characterAtIndex:0]  == '6');
  
  // Initial display
  [self configureSubviews];

  // Initialize the datacontroller
  self.theDataController = [[VDEDataController alloc] initWithHomeURL:@"http://seesparkbox.com"];
  
  // Get the home page
  NSURL* startURL = [NSURL URLWithString: [self.theDataController getTheHomePageURL]];
  theRequestedURL = [NSURLRequest requestWithURL:startURL];
  [theWebView loadRequest:theRequestedURL];
  
  // Display all items
  [self displayTheSubViewsWithOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
  
}

-(BOOL) shouldAutorotate {
	//--------------------------------------------------------------------------------------------------------
  return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)theNewOrientation duration:(NSTimeInterval)d {
  //--------------------------------------------------------------------------------------------------------

  [self displayTheSubViewsWithOrientation:theNewOrientation];
  
}


- (void)didReceiveMemoryWarning {
	//--------------------------------------------------------------------------------------------------------
  [super didReceiveMemoryWarning];
  NSLog(@"Alerte mémoire");
  
}




@end