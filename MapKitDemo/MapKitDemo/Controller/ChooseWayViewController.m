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
    NSInteger naviType;
    //0 for drive , 1 for walk
    MAUserLocation *_userLocation;
}

- (IBAction)goToNavi:(id)sender {
    NSLog(@"%@ %@ %@",((UIButton*)sender).titleLabel.text,self.destLocation,self.garageLocation);
    //data Ok
//    NaviViewController* naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NaviVC"];
//    naviVC.destLocation=self.destLocation;
//    naviVC.garageLocation=self.garageLocation;
    if([((UIButton*)sender).titleLabel.text isEqualToString:@"步行导航"]){
        naviType=1;
        _endPoint.latitude=self.destLocation.coordinate.latitude;
        _endPoint.longitude=self.destLocation.coordinate.longitude;
        [self.naviManager calculateWalkRouteWithEndPoints:@[_endPoint]];
    }else{
        naviType=0;
        _endPoint.latitude=self.garageLocation.coordinate.latitude;
        _endPoint.longitude=self.garageLocation.coordinate.longitude;
        [self.naviManager calculateDriveRouteWithEndPoints:@[_endPoint] wayPoints:nil drivingStrategy:0];
    }
//    [self.navigationController pushViewController:naviVC animated:YES];
}

#pragma mark - Life Circle
-(void)viewDidLoad{
    [super viewDidLoad];
    naviType=0;
    [self initMapView];
    [self initNaviManager];
    [self initNaviViewController];
    _endPoint = [[AMapNaviPoint alloc]init];
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
//    self.mapView.showsScale= NO;
//    self.mapView.showsCompass= NO;
//    self.mapView.showTraffic = YES;
//    self.mapView.showsUserLocation = NO;
//    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
}

#pragma mark - MapView Delegate

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if (updatingLocation)
    {
        _userLocation = userLocation;
        NSLog(@"%f %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
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
//    [self.naviManager startEmulatorNavi];
}

- (void)naviManager:(AMapNaviManager *)naviManager didDismissNaviViewController:(UIViewController *)naviViewController
{
    if(naviType==0){
        //take a photo of car
        UIAlertView* uiav = [[UIAlertView alloc]initWithTitle:@"到达车库" message:@"已经到达车库，是否要为您的车拍照便于找车？" delegate:self cancelButtonTitle:@"去拍照" otherButtonTitles:@"不必了", nil];
        [uiav show];
    }
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

//real navi over
- (void)naviManagerOnArrivedDestination:(AMapNaviManager *)naviManager
{
    NSLog(@"到啦哈哈哈");
    [self.naviManager stopNavi];
    [self.naviManager dismissNaviViewControllerAnimated:YES];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [self takePhoto];
    }
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

#pragma mark - Take Picture
- (void)takePhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [[NSUserDefaults standardUserDefaults] setObject:chosenImage forKey:@"MKDCarImage"];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
