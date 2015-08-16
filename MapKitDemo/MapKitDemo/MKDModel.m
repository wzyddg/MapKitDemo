//
//  MKDModel.m
//  MapKitDemo
//
//  Created by wzy on 15/8/8.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "MKDModel.h"

@implementation MKDModel

-(id)initWithDelegate:(id<InfoDealDelegate>)delegate{
    if((self = [super init])){
        self.delegate=delegate;
    }
    return  self ;
}

-(void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password{
    //return user's id
    
}

-(void)sendUserLocationWithUserID:(NSInteger)userID AndUserLocation:(MAUserLocation*)userLocation{
    //send something to the server with AsyncSocket and then call back
    [self.delegate dealInfo:@"sendOK"];//this should be done in a call back
}

@end
