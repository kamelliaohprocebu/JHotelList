//
//  HotelListViewController.h
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/19.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TableViewConst.h"

@class Area;
@class Country;


@interface HotelListViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic,strong)Area *area;
@property (nonatomic,strong)Country *country;
@property (weak, nonatomic) IBOutlet UITableView *hotelListTable;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
- (IBAction)homeBtn:(id)sender;



@end
