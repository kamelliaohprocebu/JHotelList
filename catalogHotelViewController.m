//
//  catalogHotelViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/28.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "catalogHotelViewController.h"
#import "hotelListTableViewCell.h"
#import "HotelDetailViewController.h"


@interface catalogHotelViewController ()
{
    NSArray *_countryArray;
    NSArray *_hotelArray;
    NSArray *sectionList;
}

@end

@implementation catalogHotelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.catalogTable.dataSource = self;
    self.catalogTable.delegate = self;
    [self fetchedResultsController];
    
    _hotelArray = _fetchedResultController.fetchedObjects;
    _countryArray = _fetchedResultController.fetchedObjects;
    
    NSSet *countries = self.arrea.country;
    _countryArray = [countries allObjects];
    
    NSLog(@"じじ%@",_countryArray);
    
    NSLog(@"%@",_hotelArray);
    
    UINib *nib = [UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil];
    [self.catalogTable registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    //sectionList = [NSArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",nil];
    
    
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 8;
//
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [sectionList objectAtIndex:section];
//    
//    
//    NSString *result = [[NSString alloc] init];
//    
//    switch (section) {
//        case 0:
//            //アジア28項目(1-28)
//            result = @"アジア";
//            break;
//        case 1:
//            //アフリカ7項目(29-35)
//            result = @"アフリカ";
//            break;
//        case 2:
//            //北米25項目(36-60)
//            result = @"北米";
//            break;
//        case 3:
//            //ヨーロッパ39項目(60-99)
//            result = @"ヨーロッパ";
//            break;
//        case 4:
//            //中東2項目(100-101)
//            result = @"中東";
//            break;
//        case 5:
//            //南米4項目(102-105)
//            result = @"南米";
//            break;
//        case 6:
//            //オセアニア12項目(106-117)
//            result = @"オセアニア";
//            break;
//        case 7:
//            //中米9項目(118-126)
//            result = @"中米";
//            break;
//        default:
//            break;
//    }
//    
//    return result;
//
//    
//
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
  //
    
//
//    NSInteger result = 0;
//    
//    switch (section) {
//        case 0:
//            //アジア28項目(1-28)
//            result = 28;
//            break;
//        case 1:
//            //アフリカ7項目(29-35)
//            result = 7;
//            break;
//        case 2:
//            //北米25項目(36-60)
//            result = 25;
//            break;
//        case 3:
//            //ヨーロッパ39項目(60-99)
//            result = 39;
//            break;
//        case 4:
//            //中東2項目(100-101)
//            result = 2;
//            break;
//        case 5:
//            //南米4項目(102-105)
//            result = 4;
//            break;
//        case 6:
//            //オセアニア12項目(106-117)
//            result = 12;
//            break;
//        case 7:
//            //中米9項目(118-126)
//            result = 9;
//            break;
//        default:
//            break;
//    }
//
//    return result;
//    
//}


- (void)loadView
{
    [super loadView];
    self.managedObjectContext = ((AppDelegate *)[[UIApplication sharedApplication]delegate]).managedObjectContext;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultController != nil) {
        return _fetchedResultController;
    }
    
    // NSEntityDescription:エンティティの定義を管理するクラス
    // ここでは、Placeテーブルを参照する旨を指定している
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Hotel" inManagedObjectContext:_managedObjectContext];
    
    
    // NSFetchRequest:データの検索条件を管理するクラス
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    [fetchRequest setEntity:entityDescription]; // エンティティの情報を指定している
    //    [fetchRequest setFetchBatchSize:0];         // 一度に取得するデータ件数を指定している（０は無限）
    [fetchRequest setSortDescriptors:
     [[NSArray alloc] initWithObjects:[[NSSortDescriptor alloc] initWithKey:@"no" ascending:YES], nil]];    // 順序の指定をしている
    
    NSFetchedResultsController *localFetchedResultController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:_managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:NSStringFromClass([catalogHotelViewController class])];
    
    localFetchedResultController.delegate = self;
    _fetchedResultController = localFetchedResultController;
    
    NSError *error = nil;
    if (![localFetchedResultController performFetch:&error]) {
        NSLog(@"Fetche ERROR");
        abort();
    }
    
    return localFetchedResultController;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [self tableView:self.catalogTable cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSInteger result;
//    switch (indexPath.section) {
//        case 0:
//            //アジア28項目(1-28)
//            result = 0;
//            break;
//        case 1:
//            //アフリカ7項目(29-35)
//            result = 28;
//            break;
//        case 2:
//            //北米25項目(36-60)
//            result = 35;
//            break;
//        case 3:
//            //ヨーロッパ39項目(60-99)
//            result = 59;
//            break;
//        case 4:
//            //中東2項目(100-101)
//            result = 99;
//            break;
//        case 5:
//            //南米4項目(102-105)
//            result = 101;
//            break;
//        case 6:
//            //オセアニア12項目(106-117)
//            result = 105;
//            break;
//        case 7:
//            //中米9項目(118-126)
//            result = 117;
//            break;
//        default:
//            break;
//    }
//
    
    
    static NSString *CellIdentifier = @"Cell";
    catalogHotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Hotel *hotel = _hotelArray[indexPath.row];
    cell.hotelmei.text = hotel.name;
    cell.hotelmei.adjustsFontSizeToFitWidth = YES;
    cell.hotelmei.numberOfLines = 0;
    
    cell.areamei.text = hotel.zipcode;
    cell.areamei.adjustsFontSizeToFitWidth = YES;
    cell.areamei.numberOfLines = 0;
    
    //Country *country =  _countryArray[indexPath.row];
    cell.kunimei.text = hotel.country.name;
    cell.kunimei.adjustsFontSizeToFitWidth = YES;
    cell.kunimei.numberOfLines = 0;
    
    NSLog(@"中身%@",_countryArray);
    
    return cell;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hotelArray.count;
    //    return [_fetchedResultController.fetchedObjects count];
    //NSString *sectionName = [sectionList objectAtIndex:section];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotelDetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"HotelDetailViewController"];
    [dvc setHotel:_hotelArray[indexPath.row]];
    
    dvc.hotelindex = indexPath.row;
    
    [[self navigationController]pushViewController:dvc animated:YES];

    
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row%2 == 0) {
        UIColor *altCellColor = [UIColor colorWithWhite:0.7 alpha:0.1];
        cell.backgroundColor = altCellColor;
    }
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end

