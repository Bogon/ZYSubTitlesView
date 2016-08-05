//
//  ZYSubTititleView.h
//  ZYSubTitlesView
//
//  Created by Char on 16/8/5.
//  Copyright © 2016年 bogon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYSubTititleView : UIView
@property (assign,nonatomic) CGFloat fontSize;
@property (nonatomic,strong) UIColor *fontColor;
@property (nonatomic,strong) UIColor *sepratorLineColor;
+(id)zy_createZYSubtitleViewInstance:(NSArray *)titlesArray;

@end
