//
//  HotelDetailViewController.h
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/26.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@class Area;
@class Country;
@class Hotel;

@interface HotelDetailViewController : UIViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic,strong)Area *area;
@property (nonatomic,strong)Country *country;
@property (nonatomic,strong)Hotel *hotel;
@property (nonatomic,assign)NSInteger hotelindex;


@property (weak, nonatomic) IBOutlet UILabel *toshimei;
@property (weak, nonatomic) IBOutlet UILabel *hotelmei;
@property (weak, nonatomic) IBOutlet UITextView *detail;
@property (weak, nonatomic) IBOutlet UILabel *mail;
@property (weak, nonatomic) IBOutlet UILabel *URL;
- (IBAction)homeBtn:(id)sender;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


@end
