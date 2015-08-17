//
//  MKDModel.h
//  MapKitDemo
//
//  Created by wzy on 15/8/8.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMapNaviKit/AMapNaviKit.h>

@protocol InfoDealDelegate <NSObject>
-(void)dealInfo:(NSString*)info;
@end

@interface MKDModel : NSObject

@property(nonatomic,weak) id<InfoDealDelegate> delegate;
-(instancetype)initWithDelegate:(id<InfoDealDelegate>) delegate;
-(void)loginWithUserName:(NSString*)userName andPassword:(NSString*)password;
-(void)sendUserLocationWithUserID:(NSInteger)userID AndUserLocation:(MAUserLocation*)userLocation;


@end
