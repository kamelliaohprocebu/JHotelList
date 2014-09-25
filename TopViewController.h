//
//  TopViewController.h
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/13.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "UIImage+FlatUI.h"
#import "FlatUIKit.h"

@interface TopViewController : UIViewController

- (IBAction)btn:(id)sender;
- (IBAction)btn2:(id)sender;
@property (weak, nonatomic) IBOutlet FUIButton *myButton;
@property (weak, nonatomic) IBOutlet FUIButton *myButton1;
@property (weak, nonatomic) IBOutlet UILabel *myButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *myButton1Label;

@end
