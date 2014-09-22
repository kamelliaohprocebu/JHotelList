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
#import "UIBarButtonItem+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "UIImage+FlatUI.h"


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
    self.navigationItem.title = self.title;
    self.navigationController.navigationBar.translucent = YES;
    
    // ボタンの色
    self.myButton.buttonColor = [UIColor turquoiseColor];
    // ボタンのシャドー色
    self.myButton.shadowColor = [UIColor greenSeaColor];
    // ボタンのシャドー高度
    self.myButton.shadowHeight = 3.0f;
    // ボタンの角丸みの半径
    self.myButton.cornerRadius = 6.0f;
    // ボタンの文字ファンド
    self.myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    // 通常状態の文字色
    [self.myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    // ハイライト状態の文字色
    [self.myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
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
