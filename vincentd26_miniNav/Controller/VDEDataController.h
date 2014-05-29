//
//  VDEDataController.h
//  vincentd26_miniNav
//
//  Created by Utilisation on 28/05/2014.
//  Copyright (c) 2014 com.striato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDEPageURL.h"

@interface VDEDataController : NSObject

@property (nonatomic, strong)VDEPageURL *theHomeURL;

-(instancetype)initWithHomeURL:(NSString*)theHomeURL;

-(NSString*)  getTheHomePageURL;

-(void)       modifyTheHomePageWith:(NSString*)theModifiedHomeURL;

@end
