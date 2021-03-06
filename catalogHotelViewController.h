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
#import "FlatUIKit.h"

@class Area;
@class Country;
@class Hotel;


@interface catalogHotelViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate, NSFetchedResultsControllerDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UITableView *catalogTable;
@property (nonatomic,strong)Area *arrea;
@property (nonatomic,strong)Country *coountry;
@property (nonatomic,strong)Hotel *hootel;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
- (IBAction)homeBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;




@end
