//
//  TopViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/13.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "TopViewController.h"
#import "AreaListViewController.h"
#import "catalogHotelViewController.h"
//#import "UIBarButtonItem+FlatUI.h"
//#import "UIColor+FlatUI.h"
//#import "FUIButton.h"
//#import "UIFont+FlatUI.h"
//#import "UIImage+FlatUI.h"

@interface TopViewController ()

@end

@implementation TopViewController


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
    
    self.title = NSLocalizedString(@"JHotelList", nil);
//    self.navigationItem.title = self.title;
//    self.navigationController.navigationBar.translucent = YES;
    
    
    self.myButtonLabel.text = @"国から選ぶ";
    self.myButton1Label.text = @"一覧から選ぶ";
    
    
    // ボタンの色
    self.myButton.buttonColor = [UIColor peterRiverColor];
    // ボタンのシャドー色
    self.myButton.shadowColor = [UIColor greenSeaColor];
    // ボタンのシャドー高度
    self.myButton.shadowHeight = 3.0f;
    // ボタンの角丸みの半径
    self.myButton.cornerRadius = 6.0f;
    // ボタンの文字ファンド
    self.myButton.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    // 通常状態の文字色
    [self.myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    // ハイライト状態の文字色
    [self.myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    // ボタンの色
    self.myButton1.buttonColor = [UIColor turquoiseColor];
    // ボタンのシャドー色
    self.myButton1.shadowColor = [UIColor wisteriaColor];
    // ボタンのシャドー高度
    self.myButton1.shadowHeight = 3.0f;
    // ボタンの角丸みの半径
    self.myButton1.cornerRadius = 6.0f;
    // ボタンの文字ファンド
    self.myButton1.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    // 通常状態の文字色
    [self.myButton1 setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    // ハイライト状態の文字色
    [self.myButton1 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

    
    
    
    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
                                  highlightedColor:[UIColor belizeHoleColor]
                                      cornerRadius:5
                                   whenContainedIn:[TopViewController class], nil];
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor silverColor]];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)btn:(id)sender {
    
    AreaListViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AreaListViewController"];
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]pushViewController:dvc animated:YES];
    
}

- (IBAction)btn2:(id)sender {
    
    catalogHotelViewController *dvc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"catalogHotelViewController"];
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]pushViewController:dvc2 animated:YES];
}
@end
