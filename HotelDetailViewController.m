//
//  HotelDetailViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/26.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "HotelDetailViewController.h"
#import "Hotel.h"
#import <CoreData/CoreData.h>
#import "Country.h"


@interface HotelDetailViewController()
{
    NSArray *_hotelArray;
}

@end

@implementation HotelDetailViewController

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
    [self fetchedResultsController];

    
    NSSet *hotels = self.country.hotel;
    _hotelArray = [hotels allObjects];
    Hotel *selecthotel = self.hotel;
    
    self.toshimei.text = selecthotel.zipcode;
    
    self.hotelmei.text = selecthotel.name;
    self.hotelmei.adjustsFontSizeToFitWidth = YES;
    self.hotelmei.numberOfLines = 0;
    
    self.detail.text = selecthotel.detail;
//    self.detail.adjustsFontSizeToFitWidth = YES;
//    self.detail.numberOfLines = 0;
    
    self.URL.text = selecthotel.url;
    self.URL.adjustsFontSizeToFitWidth = YES;
    self.URL.numberOfLines = 0;
    self.URL.userInteractionEnabled = YES;
    self.URL.tag = 10;

    self.mail.text = selecthotel.mail;
    self.mail.adjustsFontSizeToFitWidth = YES;
    self.mail.numberOfLines = 0;
    
    NSLog(@"%@",self.hotel);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [[event allTouches] anyObject];
    if (touch.view.tag == self.URL.tag) {
        [self tapLabel:self.URL];
    }

}

- (IBAction)tapLabel:(id)sender{

    //UILabel *label = (UILabel *)sender;
    NSURL *url = [NSURL URLWithString:self.URL.text];
    [[UIApplication sharedApplication] openURL:url];

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
                                                   cacheName:NSStringFromClass([HotelDetailViewController class])];
    
    localFetchedResultController.delegate = self;
    _fetchedResultController = localFetchedResultController;
    
    NSError *error = nil;
    if (![localFetchedResultController performFetch:&error]) {
        NSLog(@"Fetche ERROR");
        abort();
    }
    
    return localFetchedResultController;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)homeBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
