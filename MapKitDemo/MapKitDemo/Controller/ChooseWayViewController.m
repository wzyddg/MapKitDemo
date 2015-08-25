//
//  ChooseWayViewController.m
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/22.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "ChooseWayViewController.h"

@implementation ChooseWayViewController{
    AMapNaviPoint *_endPoint;
    
    MAUserLocation *_userLocation;
}

- (IBAction)goToNavi:(id)sender {
    NSLog(@"%@ %@ %@",((UIButton*)sender).titleLabel.text,self.destLocation,self.garageLocation);
    //data Ok
//    NaviViewController* naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NaviVC"];
//    naviVC.destLocation=self.destLocation;
//    naviVC.garageLocation=self.garageLocation;
    if([((UIButton*)sender).titleLabel.text isEqualToString:@"步行导航"]){
//        naviVC.naviType=0;
    }else{
//        naviVC.naviType=1;
    }
//    [self.navigationController pushViewController:naviVC animated:YES];
}

#pragma mark - Life Circle
-(void)viewDidLoad{
    [super viewDidLoad];
    [self initMapView];
    [self initNaviManager];
    [self initNaviViewController];
    
}

#pragma mark - Initalization
- (void)initNaviManager
{
    if (self.naviManager == nil)
    {
        self.naviManager = [[AMapNaviManager alloc] init];
    }
    
    [self.naviManager setDelegate:self];
}

- (void)initNaviViewController
{
    if (self.naviViewController == nil)
    {
        self.naviViewController = [[AMapNaviViewController alloc] initWithMapView:self.mapView delegate:self];
    }
    
    [self.naviViewController setDelegate:self];
}

- (void)initMapView
{
    CGRect innerSize=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _mapView=[[MAMapView alloc] initWithFrame:innerSize];
    self.mapView.delegate = self;
    self.mapView.showsScale= YES;
    self.mapView.showsCompass= YES;
    self.mapView.showTraffic = YES;
    self.mapView.showsUserLocation = YES;
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
}

#pragma mark - MapView Delegate

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if (updatingLocation)
    {
        _userLocation = userLocation;
    }
}

#pragma mark - AMapNaviManager Delegate

- (void)naviManager:(AMapNaviManager *)naviManager error:(NSError *)error
{
    NSLog(@"error:{%@}",error.localizedDescription);
}

- (void)naviManager:(AMapNaviManager *)naviManager didPresentNaviViewController:(UIViewController *)naviViewController
{
    NSLog(@"didPresentNaviViewController");
    
    [self.naviManager startGPSNavi];
}

- (void)naviManager:(AMapNaviManager *)naviManager didDismissNaviViewController:(UIViewController *)naviViewController
{
    NSLog(@"didDismissNaviViewController");
}

- (void)naviManagerOnCalculateRouteSuccess:(AMapNaviManager *)naviManager
{
    NSLog(@"OnCalculateRouteSuccess");
    
    if (self.naviViewController == nil)
    {
        [self initNaviViewController];
    }

    [self.naviManager presentNaviViewController:self.naviViewController animated:YES];
}

- (void)naviManager:(AMapNaviManager *)naviManager onCalculateRouteFailure:(NSError *)error
{
    NSLog(@"onCalculateRouteFailure");
}

- (void)naviManagerNeedRecalculateRouteForYaw:(AMapNaviManager *)naviManager
{
    NSLog(@"NeedReCalculateRouteForYaw");
}

- (void)naviManager:(AMapNaviManager *)naviManager didStartNavi:(AMapNaviMode)naviMode
{
    NSLog(@"didStartNavi");
}

- (void)naviManagerDidEndEmulatorNavi:(AMapNaviManager *)naviManager
{
    NSLog(@"DidEndEmulatorNavi");
    [self.naviManager dismissNaviViewControllerAnimated:YES];
}

- (void)naviManagerOnArrivedDestination:(AMapNaviManager *)naviManager
{
    NSLog(@"到啦哈哈哈");
}

- (void)naviManager:(AMapNaviManager *)naviManager onArrivedWayPoint:(int)wayPointIndex
{
    NSLog(@"onArrivedWayPoint");
}

- (void)naviManager:(AMapNaviManager *)naviManager didUpdateNaviLocation:(AMapNaviLocation *)naviLocation
{
    NSLog(@"didUpdateNaviLocation");
}

- (void)naviManager:(AMapNaviManager *)naviManager didUpdateNaviInfo:(AMapNaviInfo *)naviInfo
{
    NSLog(@"didUpdateNaviInfo");
}

- (BOOL)naviManagerGetSoundPlayState:(AMapNaviManager *)naviManager
{
    return 0;
}

- (void)naviManager:(AMapNaviManager *)naviManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
}

- (void)naviManagerDidUpdateTrafficStatuses:(AMapNaviManager *)naviManager
{
    NSLog(@"DidUpdateTrafficStatuses");
}


#pragma mark - AManNaviViewController Delegate

- (void)naviViewControllerCloseButtonClicked:(AMapNaviViewController *)naviViewController
{
    [self.naviManager stopNavi];
    NSLog(@"after stop before dismiss");
    [self.naviManager dismissNaviViewControllerAnimated:YES];
}



- (void)naviViewControllerMoreButtonClicked:(AMapNaviViewController *)naviViewController
{
    if (self.naviViewController.viewShowMode == AMapNaviViewShowModeCarNorthDirection)
    {
        self.naviViewController.viewShowMode = AMapNaviViewShowModeMapNorthDirection;
    }
    else
    {
        self.naviViewController.viewShowMode = AMapNaviViewShowModeCarNorthDirection;
    }
}

- (void)naviViewControllerTurnIndicatorViewTapped:(AMapNaviViewController *)naviViewController
{
//    [self.naviManager readNaviInfoManual];
}

@end
