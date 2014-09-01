//
//  catalogHotelViewController.h
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/28.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Area.h"
#import "Country.h"
#import "Hotel.h"
#import "TableViewICatalogConst.h"
#import "catalogHotelTableViewCell.h"

@class Area;
@class Country;
@class Hotel;


@interface catalogHotelViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *catalogTable;
@property (nonatomic,strong)Area *area;
@property (nonatomic,strong)Country *country;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;



@end
