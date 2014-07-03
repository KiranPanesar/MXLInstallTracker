//
//  MXLInstallTracker
//
//  Created by Kiran Panesar on 02/07/2014.
//  Copyright (c) 2014 MobileX Labs. All rights reserved.
//

#import "MXLInstallTracker.h"

#import <GA-iOS-SDK/GameAnalytics.h>
#import <MobileAppTracker/MobileAppTracker.h>
#import <AdSupport/AdSupport.h>
#import "ACTReporter.h"

@interface MXLInstallTracker ()

@property (strong, nonatomic, readwrite) NSString *apiKey;
@property (strong, nonatomic, readwrite) NSString *apiSecret;
@property (strong, nonatomic, readwrite) NSString *build;
@property (strong, nonatomic, readwrite) NSString *adwordsConversionID;
@property (strong, nonatomic, readwrite) NSString *adwordsLabel;

@end

@implementation MXLInstallTracker

+(MXLInstallTracker *)sharedManager {
    static MXLInstallTracker *sharedManager = nil;
    if (!sharedManager) {
        sharedManager = [[super allocWithZone:nil] init];
    }
    return sharedManager;
}

+(id)allocWithZone:(NSZone *)zone {
    return [self sharedManager];
}

-(void)setUpWithGAKey:(NSString *)key GAsecret:(NSString *)secret GAbuild:(NSString *)build MATAdID:(NSString *)adID MATConversionKey:(NSString *)conversionKey AWConversionID:(NSString *)awConversion AWLabel:(NSString *)awLabel{
    _apiKey              = key;
    _apiSecret           = secret;
    _build               = build;
    _adwordsConversionID = awConversion;
    _adwordsLabel        = awLabel;
    
    [GameAnalytics setGameKey:_apiKey
                    secretKey:_apiSecret
                        build:_build];
    
    [GameAnalytics updateSessionID];
    
    [MobileAppTracker initializeWithMATAdvertiserId:adID
                                   MATConversionKey:conversionKey];
    
    [MobileAppTracker setAppleAdvertisingIdentifier:[[ASIdentifierManager sharedManager] advertisingIdentifier]
                         advertisingTrackingEnabled:[[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]];
    
#if !RELEASE
    [MobileAppTracker setDebugMode:YES];
#endif
    
    [MobileAppTracker setUserId:[GameAnalytics getUserID]];
    [MobileAppTracker measureSession];
    
    
    [ACTConversionReporter reportWithConversionID:_adwordsConversionID
                                            label:_adwordsLabel
                                            value:@"0.000000"
                                     isRepeatable:NO];
}

-(void)appBecameActive {
    [MobileAppTracker measureSession];
}

@end
