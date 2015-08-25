//
//  ChooseWayViewController.h
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/22.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapNaviKit/MAMapKit.h>
#import "NaviViewController.h"

@interface ChooseWayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *byCar;
@property (weak, nonatomic) IBOutlet UIButton *onFoot;

@property (nonatomic,strong) CLLocation* garageLocation;
@property (nonatomic,strong) CLLocation* destLocation;

@end
