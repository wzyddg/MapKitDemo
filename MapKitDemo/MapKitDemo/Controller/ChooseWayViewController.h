//
//  ChooseWayViewController.h
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/22.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AMapNaviKit/MAMapKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "MKDModel.h"

#import "APIKey.h"

@interface ChooseWayViewController : UIViewController<MAMapViewDelegate,AMapNaviManagerDelegate,AMapNaviViewControllerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *byCar;
@property (weak, nonatomic) IBOutlet UIButton *onFoot;

@property (nonatomic,strong) CLLocation* garageLocation;
@property (nonatomic,strong) CLLocation* destLocation;

@property (nonatomic, strong) AMapNaviManager *naviManager;
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapNaviViewController *naviViewController;

@end
