//
//  RightCell.m
//  LinkTableview_Demo
//
//  Created by admin on 2017/2/14.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import "RightCell.h"

#define kLabelHeight 35
#define kMenuLineWidth 1


@interface RightCell ()
@property(nonatomic,strong)UILabel *totalLabel;//总分
@property(nonatomic,strong)UILabel *chineseLabel;//语文
@property(nonatomic,strong)UILabel *mathLabel;//数学
@property(nonatomic,strong)UILabel *englishLabel;//英语
@property(nonatomic,strong)UILabel *comprehensiveLabel;//综合

@end


@implementation RightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        for(int i=0;i<5;i++){
            UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*100+i*kMenuLineWidth, 0, 100, kLabelHeight)];
            tmpLabel.font = [UIFont systemFontOfSize:14];
            tmpLabel.textColor = [UIColor blackColor];
            tmpLabel.backgroundColor = [UIColor whiteColor];
            tmpLabel.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:tmpLabel];
            
   
            if(i == 0){
                _totalLabel = tmpLabel;
            }else if(i == 1){
                _chineseLabel = tmpLabel;
            }else if(i == 2){
                _mathLabel = tmpLabel;
            }else if(i == 3){
                _englishLabel = tmpLabel;
            }else if(i == 4){
                _comprehensiveLabel = tmpLabel;
            }
        }

    }
    return self;
}

-(void)configModel:(GradeModel *)model{
    self.totalLabel.text = model.totalScore;
    self.chineseLabel.text = model.chineseScore;
    self.englishLabel.text = model.englishScore;
    self.mathLabel.text = model.mathScore;
    self.comprehensiveLabel.text = model.comprehensiveScore;
}

@end
