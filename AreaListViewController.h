//
//  AreaListViewController.h
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/13.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UITableViewCell+FlatUI.h"
#import "FUICellBackgroundView.h"

@interface AreaListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *areaListTable;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
- (IBAction)homebtn:(id)sender;




@end
