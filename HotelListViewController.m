//
//  HotelListViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/19.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "HotelListViewController.h"
#import "Hotel.h"
#import "Country.h"
#import <CoreData/CoreData.h>
#import "Area.h"
#import "HotelDetailViewController.h"
#import "hotelListTableViewCell.h"
#import "TableViewConst.h"

@interface HotelListViewController ()
{

    NSArray *_hotelArray;

}

@end

@interface Book : NSObject{

    NSNumber *no;
}

@end


@implementation HotelListViewController

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
    
    self.hotelListTable.dataSource = self;
    self.hotelListTable.delegate = self;
    [self fetchedResultsController];
    
    NSSet *hotels = self.country.hotel;
    _hotelArray = [hotels allObjects];
    
    NSLog(@"%@",_hotelArray);
    
    for (Hotel *c in _hotelArray) {
        NSLog(@"順々%@", c.name);
    }
    
    NSArray *hootels = [_hotelArray sortedArrayUsingSelector:@selector(compareNo:)];
    
    for (Hotel *c in hotels) {
        NSLog(@"順番%@", c.name);
    }
    
    _hotelArray = hootels;
    
    
    
    UINib *nib = [UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil];
    [self.hotelListTable registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
}

- (void)loadView
{
    [super loadView];
    self.managedObjectContext = ((AppDelegate *)[[UIApplication sharedApplication]delegate]).managedObjectContext;
}

- (NSFetchedResultsController *)fetchedResultsController {
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
     [[NSArray alloc] initWithObjects:[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES], nil]];    // 順序の指定をしている
    
    NSFetchedResultsController *localFetchedResultController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:_managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:NSStringFromClass([HotelListViewController class])];
    
    localFetchedResultController.delegate = self;
    _fetchedResultController = localFetchedResultController;
    
    NSError *error = nil;
    if (![localFetchedResultController performFetch:&error]) {
        NSLog(@"Fetche ERROR");
        abort();
    }
    
    return localFetchedResultController;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    hotelListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    Hotel *hotel = _hotelArray[indexPath.row];
    cell.name.text = hotel.name;
    cell.name.adjustsFontSizeToFitWidth = YES;
    cell.name.numberOfLines = 0;

    cell.city.text = hotel.zipcode;
    cell.city.adjustsFontSizeToFitWidth = YES;
    
    
    return cell;
    
}



    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hotelArray.count;
    //    return [_fetchedResultController.fetchedObjects count];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotelDetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"HotelDetailViewController"];
    [dvc setHotel:_hotelArray[indexPath.row]];

    dvc.hotelindex = indexPath.row;
    [[self navigationController]pushViewController:dvc animated:YES];
    
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
