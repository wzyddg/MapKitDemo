//
//  ContactTableViewController.m
//  MapKitDemo
//
//  Created by Shepard Wang on 15/8/20.
//  Copyright © 2015年 王 泽宇. All rights reserved.
//

#import "ContactTableViewController.h"
#import "ChooseWayViewController.h"

@interface ContactTableViewController ()<UIAlertViewDelegate>{
    NSMutableArray * dataArray;
    MKDModel * mkdModel;
    NSNumber* userID ;
    NSNumber* prevUserID;
}

@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mkdModel = [[MKDModel alloc] initWithDelegate:self];
    mkdModel.listDelegate=self;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    dataArray = [[NSMutableArray alloc]init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    prevUserID=userID;
    userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"MKDUserID"];
    if(prevUserID==userID||[prevUserID isEqualToNumber:userID]){
        return;
    }
    if(userID==nil){
        dataArray = [[NSMutableArray alloc]init];
        [self.tableView reloadData];
        UIAlertView* uiav = [[UIAlertView alloc]initWithTitle:@"请登录" message:@"您尚未登录，请登陆后使用本产品。" delegate:self cancelButtonTitle:@"去登陆" otherButtonTitles:nil];
        [uiav show];
    }else{
        [mkdModel getFriendListWithUserID:userID.intValue];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    dataArray = [[NSMutableArray alloc]init];
    [self.tableView reloadData];
    [self.tabBarController setSelectedIndex:3];
}

//-(void)addData{
//    NSLog(@"add data");
//    [dataArray addObject:@"zth"];
//    [dataArray addObject:@"gyq"];
//    [self.tableView reloadData];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count ;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=[dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* userName = [dataArray objectAtIndex:indexPath.row];
//    NSLog(@"%@",userName);
    [mkdModel getUserLocationWithUserName:userName];
    //block UI with something like MBProgressHUD
}

-(void)dealInfo:(NSString *)info{
    //man's longitude,man's latitude,garage's longitude,garage's latitude
    NSLog(info);
    NSArray* locations = [info componentsSeparatedByString:@","];
    
    CLLocation* dest= [[CLLocation alloc] initWithLatitude:[[locations objectAtIndex:1] floatValue] longitude:[[locations objectAtIndex:0] floatValue]];
    CLLocation* garage= [[CLLocation alloc] initWithLatitude:[[locations objectAtIndex:3] floatValue] longitude:[[locations objectAtIndex:2] floatValue]];
    
    //init navi and push
    ChooseWayViewController* chooseWay = [self.storyboard instantiateViewControllerWithIdentifier:@"ChooseWayVC"];
    chooseWay.destLocation=dest;
    chooseWay.garageLocation=garage;
    
    [self.navigationController pushViewController:chooseWay animated:YES];
}

-(void)getList:(NSString *)info{
    dataArray = [[NSMutableArray alloc]init];
    NSArray * strings = [info componentsSeparatedByString:@","];
    for (NSString* tmp in strings) {
        [dataArray addObject:tmp];
    }
    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
