//
//  MXLInstallTracker
//
//  Created by Kiran Panesar on 02/07/2014.
//  Copyright (c) 2014 MobileX Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXLInstallTracker : NSObject

@property (strong, nonatomic, readonly) NSString *apiKey;
@property (strong, nonatomic, readonly) NSString *apiSecret;
@property (strong, nonatomic, readonly) NSString *build;
@property (strong, nonatomic, readonly) NSString *adwordsConversionID;
@property (strong, nonatomic, readonly) NSString *adwordsLabel;

+(MXLInstallTracker *)sharedManager;

-(void)setUpWithGAKey:(NSString *)key GAsecret:(NSString *)secret GAbuild:(NSString *)build MATAdID:(NSString *)adID MATConversionKey:(NSString *)conversionKey AWConversionID:(NSString *)awConversion AWLabel:(NSString *)awLabel;
-(void)appBecameActive;

@end
