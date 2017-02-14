//
//  LeftHeadView.m
//  LinkTableview_Demo
//
//  Created by admin on 2017/2/14.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import "LeftHeadView.h"

#define kMenuLineWidth 1
#define kLabelHeight 35
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]


@implementation LeftHeadView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        _leftHeadViewHeight = kLabelHeight + kMenuLineWidth*2;
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kMenuLineWidth, 100, kLabelHeight)];
        tmpLabel.text = @"排名";
        tmpLabel.backgroundColor = HexRGB(0xEAEAEA);
        tmpLabel.textColor = [UIColor blackColor];
        tmpLabel.textAlignment = NSTextAlignmentCenter;
        [tmpLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [self addSubview:tmpLabel];

    }
    return self;
}

@end
