//
//  TopViewController.m
//  JHotelList
//
//  Created by 安倍裕貴 on 2014/08/13.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "TopViewController.h"
#import "AreaListViewController.h"

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
    
    self.title = @"JHotelList";
    
    
    
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
@end
