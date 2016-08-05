//
//  ZYSubTititleView.m
//  ZYSubTitlesView
//
//  Created by Char on 16/8/5.
//  Copyright © 2016年 bogon. All rights reserved.
//

#import "ZYSubTititleView.h"
#import <Masonry/Masonry.h>

const static CGFloat sepretLineHeight = 1.0f;

@interface ZYSubTititleView ()
{

    NSArray *valuesArray;
}
@end


@implementation ZYSubTititleView

//绘制视图中的元素
-(void)drawRect:(CGRect)rect{

    NSLog(@"drawRect");
}

-(void)layoutSubviews{

    NSLog(@"layoutSubviews");
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    NSInteger titleCount = [valuesArray count];

    CGFloat titleLabelWidth = (self.frame.size.width - (sepretLineHeight*(titleCount-1)))/titleCount;

    [valuesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *titleLabel = [UILabel new];
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLabelWidth*idx+idx*sepretLineHeight);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(titleLabelWidth, height-1));
        }];
        if (_fontColor == nil) {
            _fontColor = [UIColor lightGrayColor];
        }
        titleLabel.textColor = _fontColor;
        titleLabel.font = [UIFont systemFontOfSize:_fontSize];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = obj;

        UIView *sepratorLineView = [UIView new];
        sepratorLineView.backgroundColor = _sepratorLineColor;
        [self addSubview:sepratorLineView];
        [sepratorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLabel.mas_right);
            make.top.mas_equalTo(titleLabel.mas_top);
            make.size.mas_equalTo(CGSizeMake(1, height-1));
        }];

    }];
    UIView *bottomSepratorLineView = [UIView new];
    bottomSepratorLineView.backgroundColor = _sepratorLineColor;
    [self addSubview:bottomSepratorLineView];
    [bottomSepratorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-1);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(width, 1));
    }];

}

+(id)zy_createZYSubtitleViewInstance:(NSArray *)titlesArray{
    ZYSubTititleView *subTitleView = [ZYSubTititleView new];
    [subTitleView setValuesArray:titlesArray];
    return subTitleView;
}

-(void)setValuesArray:(NSArray *)titleArray{

    valuesArray = titleArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
