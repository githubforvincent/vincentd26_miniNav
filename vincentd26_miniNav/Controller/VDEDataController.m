//
//  VDEDataController.m
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/2014.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import "VDEDataController.h"

@implementation VDEDataController

-(instancetype)initWithHomeURL:(NSString*)theURL {
//----------------------------------------------------------
  self = [super init];
  
  if(self) {
    self.theHomeURL = [[VDEPageURL alloc] init];
    self.theHomeURL.theHomePageURLName = theURL;
  }

  return self;
}

-(NSString*) getTheHomePageURL {
//----------------------------------------------------------

  return self.theHomeURL.theHomePageURLName;
}

-(void) modifyTheHomePageWith:(NSString*)theModifiedHomeURL {
//----------------------------------------------------------

  self.theHomeURL.theHomePageURLName = theModifiedHomeURL;
}

@end
  
