//
//  RightHeadView.m
//  LinkTableview_Demo
//
//  Created by admin on 2017/2/14.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import "RightHeadView.h"


#define kMenuLineWidth 1
#define kLabelHeight 35
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]



@implementation RightHeadView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        _rightHeadViewHeight = kLabelHeight + kMenuLineWidth*2;
        

        for(int i = 0; i < 5; i++){
            UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*100+i*kMenuLineWidth,kMenuLineWidth , 100, kLabelHeight)];
            tmpLabel.backgroundColor = HexRGB(0xEAEAEA);
            tmpLabel.textColor = [UIColor blackColor];
            tmpLabel.textAlignment = NSTextAlignmentCenter;
            [tmpLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
            [self addSubview:tmpLabel];
            
            if(i == 0){
                tmpLabel.text = @"总分";
            }else if(i == 1){
                tmpLabel.text = @"语文";
            }else if(i == 2){
                tmpLabel.text = @"数学";
            }else if(i == 3){
                tmpLabel.text = @"英语";
            }else if(i == 4){
                tmpLabel.text = @"理综";
            }
        }

    }
    return self;
}
@end
