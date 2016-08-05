//
//  MainViewController.m
//  ZYSubTitlesView
//
//  Created by Char on 16/8/5.
//  Copyright © 2016年 bogon. All rights reserved.
//

#import "MainViewController.h"
#import "ZYSubTititleView.h"
#import <Masonry/Masonry.h>

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//屏幕高度
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
//屏幕宽
#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZYSubTititleView *itemViews = [ZYSubTititleView zy_createZYSubtitleViewInstance:@[@"1",@"2",@"3",@"4",@"5"]];
    itemViews.fontColor = UIColorFromRGB(0x323232);
    itemViews.backgroundColor = [UIColor whiteColor];
    itemViews.sepratorLineColor = UIColorFromRGB(0xdfe0e0);
    itemViews.fontSize = 12.0f;
    [self.view addSubview:itemViews];
    [itemViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 44));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
