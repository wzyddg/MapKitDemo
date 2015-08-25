//
//  ChooseWayViewController.m
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/22.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "ChooseWayViewController.h"

@implementation ChooseWayViewController
- (IBAction)goToNavi:(id)sender {
    NSLog(@"%@ %@ %@",((UIButton*)sender).titleLabel.text,self.destLocation,self.garageLocation);
    //data Ok
    NaviViewController* naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NaviVC"];
    naviVC.destLocation=self.destLocation;
    naviVC.garageLocation=self.garageLocation;
    if([((UIButton*)sender).titleLabel.text isEqualToString:@"步行导航"]){
        naviVC.naviType=0;
    }else{
        naviVC.naviType=1;
    }
    [self.navigationController pushViewController:naviVC animated:YES];
}

@end
