//
//  CountryListViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/14.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "CountryListViewController.h"
#import "Country.h"
#import "Area.h"
#import <CoreData/CoreData.h>
#import "HotelListViewController.h"

@interface CountryListViewController ()
{
    NSArray *_countryArray;

}

@end

@implementation CountryListViewController

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
    
    self.CountryTable.dataSource = self;
    self.CountryTable.delegate = self;
    [self fetchedResultsController];
    
    NSSet *countries = self.area.country;
    _countryArray = [countries allObjects];
    
    
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
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Country" inManagedObjectContext:_managedObjectContext];
    

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
                                                   cacheName:NSStringFromClass([CountryListViewController class])];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Country *country = _countryArray[indexPath.row];
    cell.textLabel.text = country.name;
    
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
//    NSArray *sortedArray = [_countryArray sortedArrayUsingDescriptors:@[sortDescriptor]];
//    
//    NSLog(@"%@",sortedArray);
    
    return cell;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _countryArray.count;
    //    return [_fetchedResultController.fetchedObjects count];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    HotelListViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"HotelListViewController"];
    
    [dvc setCountry:_countryArray[indexPath.row]];
    NSLog(@"%@",[self.fetchedResultController objectAtIndexPath:[self.CountryTable indexPathForSelectedRow]]);
    Country *country = _countryArray[indexPath.row];
    NSLog(@"hotels = %@", country.hotel);

    
    [[self navigationController]pushViewController:dvc animated:YES];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
