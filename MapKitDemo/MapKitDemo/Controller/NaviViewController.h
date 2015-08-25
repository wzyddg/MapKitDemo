//
//  NaviViewController.h
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/25.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapNaviKit/MAMapKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface NaviViewController : UIViewController

@property NSInteger naviType; //0 for walk , 1 for drive
@property (nonatomic,strong) CLLocation* garageLocation;
@property (nonatomic,strong) CLLocation* destLocation;

@end
