//
//  MKDModel.m
//  MapKitDemo
//
//  Created by wzy on 15/8/8.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "MKDModel.h"

@implementation MKDModel

-(instancetype)initWithDelegate:(id<InfoDealDelegate>)delegate{
    if((self = [super init])){
        self.delegate=delegate;
    }
    return  self ;
}

-(void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password{
    //send something to the server with AsyncSocket and then call back
    if ([userName isEqualToString:@"qwe"]&&[password isEqualToString:@"asd"]) {
        [self.delegate dealInfo:@"qwe,123"];
    }else{
        [self.delegate dealInfo:@"null,0"];
    }
}

-(void)sendUserLocationWithUserID:(NSInteger)userID AndUserLocation:(CLLocation*)userLocation{
    //send something to the server with AsyncSocket and then call back
    [self.delegate dealInfo:@"sendOK"];//this should be done in a call back
}

-(void)getUserLocationWithUserName:(NSString *)userName{
    //talk to the server
    //man's longitude,man's latitude,garage's longitude,garage's latitude
    [self.delegate dealInfo:@"109.834075,40.68413,109.83348,40.683358"];
}
@end