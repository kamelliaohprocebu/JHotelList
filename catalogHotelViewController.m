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
    
    
    NSLog(@"%@",_hotelArray);
    
    UINib *nib = [UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil];
    [self.catalogTable registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
    
}

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
     [[NSArray alloc] initWithObjects:[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES], nil]];    // 順序の指定をしている
    
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
    static NSString *CellIdentifier = @"Cell";
    catalogHotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Hotel *hotel = _hotelArray[indexPath.row];
    cell.hotelmei.text = hotel.name;
    cell.hotelmei.adjustsFontSizeToFitWidth = YES;
    cell.hotelmei.numberOfLines = 0;
    

    cell.kunimei.text = hotel.zipcode;
    cell.kunimei.adjustsFontSizeToFitWidth = YES;
    cell.kunimei.numberOfLines = 0;
    
    return cell;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hotelArray.count;
    //    return [_fetchedResultController.fetchedObjects count];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    catalogHotelViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"HotelDetailViewController"];

    
    [[self navigationController]pushViewController:dvc animated:YES];

    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

