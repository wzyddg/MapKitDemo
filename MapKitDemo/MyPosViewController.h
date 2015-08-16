//
//  MyPosViewController.h
//  MapKitDemo
//
//  Created by wzy on 15/8/15.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapNaviKit/AMapNaviKit.h>

@interface MyPosViewController : UIViewController<MAMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (nonatomic, strong) MAMapView *mapView;
@end
