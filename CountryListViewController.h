//
//  CountryListViewController.h
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/14.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class Area;


@interface CountryListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic,strong)Area *area;
@property (weak, nonatomic) IBOutlet UITableView *CountryTable;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;



@end
