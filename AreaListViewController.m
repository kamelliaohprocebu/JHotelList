//
//  AreaListViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/13.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "AreaListViewController.h"
#import "Area.h"
#import "CountryListViewController.h"
#import "UITableViewCell+FlatUI.h"
#import "FUICellBackgroundView.h"
#import <objc/runtime.h>
#import "UIBarButtonItem+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "UIImage+FlatUI.h"
#import "UITableViewCell+FlatUI.h"
#import "FUICellBackgroundView.h"


@interface AreaListViewController ()

@end

@implementation AreaListViewController

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
    
    self.areaListTable.dataSource = self;
    self.areaListTable.delegate = self;
    [self fetchedResultsController];
    
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
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Area" inManagedObjectContext:_managedObjectContext];
    
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
                                                   cacheName:NSStringFromClass([AreaListViewController class])];
    
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
    

    Area *area = [_fetchedResultController objectAtIndexPath:indexPath];
    cell.textLabel.text = area.name;
    
    return cell;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)[[[self.fetchedResultController sections] objectAtIndex:section] numberOfObjects]);
    return [[[_fetchedResultController sections] objectAtIndex:section] numberOfObjects];
    //    return [_fetchedResultController.fetchedObjects count];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Tap:%ld",(long)indexPath.row);
    
    CountryListViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CountryListViewController"];
    
    [dvc setArea:[self.fetchedResultController objectAtIndexPath:[self.areaListTable indexPathForSelectedRow]]];
    
    Area *area = [_fetchedResultController objectAtIndexPath:indexPath];
    NSLog(@"countrys = %@", area.country);

    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]pushViewController:dvc animated:YES];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 0 || indexPath.row%2 == 0) {
//        UIColor *altCellColor = [UIColor colorWithWhite:0.7 alpha:0.1];
//        cell.backgroundColor = altCellColor;
//    }
//    [cell configureFlatCellWithColor:[UIColor greenSeaColor]
//                       selectedColor:[UIColor cloudsColor]];
//    
//    cell.cornerRadius = 5.0f; // optional
//    cell.separatorHeight = 2.0f; // optional
    
    
     
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

- (IBAction)homebtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    
}
@end
