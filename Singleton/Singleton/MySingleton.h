//
//  MySingleton.h
//  Singleton
//
//  Created by Maria Merino on 8/9/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

+ (MySingleton *)sharedInstance;
- (void) describe;

@end
