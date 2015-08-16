//
//  MyPosViewController.m
//  MapKitDemo
//
//  Created by wzy on 15/8/15.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "MyPosViewController.h"

@interface MyPosViewController ()

@end

@implementation MyPosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect innerSize=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [MAMapServices sharedServices].apiKey =@"4c3ea31ceed40f9da1e2362e74b12346";
    self.mapView=[[MAMapView alloc] initWithFrame:innerSize];
    self.mapView.delegate = self;
    self.mapView.showsScale= NO;
    self.mapView.showsCompass= YES;
    self.mapView.showsUserLocation = YES;
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.sendButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPos:(id)sender {
    NSLog(@"sendButton pressed");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
