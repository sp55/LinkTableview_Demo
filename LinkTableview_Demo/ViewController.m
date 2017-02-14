//
//  ViewController.m
//  LinkTableview_Demo
//
//  Created by admin on 2017/2/14.
//  Copyright © 2017年 AlezJi. All rights reserved.
//联动效果TableView

#import "ViewController.h"

#import "GradeModel.h"

#import "LeftHeadView.h"
#import "RightHeadView.h"

#import "RightCell.h"

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) /255.0) alpha:1.0]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]


#define kMenuLineWidth 1
#define kLabelHeight 35


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,strong)UITableView *leftTbView;//左边的TableView
@property(nonatomic,strong)UITableView *rightTbView;//右边的TableView
@property(nonatomic,strong)UIScrollView *bottomScrollView;//底层ScrollView

@property(nonatomic,strong)NSMutableArray *dataArr;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataArr = [NSMutableArray array];
    
    
    for (NSInteger i=0; i<80; i++) {
        
        GradeModel *model = [[GradeModel alloc] init];
        model.totalScore = [NSString stringWithFormat:@"%ld分",740-i*4];
        model.chineseScore = [NSString stringWithFormat:@"%ld分",142-i];
        model.mathScore = [NSString stringWithFormat:@"%ld分",150-i];
        model.englishScore = [NSString stringWithFormat:@"%ld分",148-i];
        model.comprehensiveScore = [NSString stringWithFormat:@"%ld分",300-i];

        [self.dataArr addObject:model];
    }

    [self initUI];
}

//设置分割线顶格
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [_leftTbView setLayoutMargins:UIEdgeInsetsZero];
    [_rightTbView setLayoutMargins:UIEdgeInsetsZero];
}

-(void)initUI{
    [self initBaseView];
    [self initLeftTbView];
    [self initRightTbView];
}

#pragma mark 基础UI
-(void)initBaseView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    _mainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainView];
}

-(void)initLeftTbView{
    _leftTbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 102, kScreenHeight-64) style:UITableViewStylePlain];
    _leftTbView.delegate = self;
    _leftTbView.dataSource = self;
    _leftTbView.showsVerticalScrollIndicator = NO;
    _leftTbView.separatorStyle = UITableViewCellSelectionStyleNone;
    _leftTbView.allowsSelection = NO;
    _leftTbView.backgroundColor = RGB(241, 241, 246);
    [_mainView addSubview:_leftTbView];
}
-(void)initRightTbView{
    _rightTbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, (6*100+7), kScreenHeight-64) style:UITableViewStylePlain];
    _rightTbView.delegate = self;
    _rightTbView.dataSource = self;
    _rightTbView.showsVerticalScrollIndicator = NO;
    _rightTbView.backgroundColor = [UIColor clearColor];
    _rightTbView.separatorStyle = UITableViewCellSelectionStyleNone;
    _rightTbView.allowsSelection = NO;

    
    _bottomScrollView = [[UIScrollView alloc]init];
    _bottomScrollView.contentSize = CGSizeMake(_rightTbView.frame.size.width, 0);
    _bottomScrollView.backgroundColor = [UIColor whiteColor];
    _bottomScrollView.bounces = NO;
    _bottomScrollView.showsHorizontalScrollIndicator = NO;
    _bottomScrollView.backgroundColor = [UIColor clearColor];
    [_bottomScrollView addSubview:_rightTbView];
    [_mainView addSubview:_bottomScrollView];
    _bottomScrollView.frame = CGRectMake(102, 0,_mainView.frame.size.width , kScreenHeight);
}

#pragma mark - DataSource&Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(tableView == _leftTbView){
        return 1;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == _leftTbView){
        return _dataArr.count;
    }else{
        return _dataArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 36;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(tableView == _leftTbView){
        LeftHeadView *tHView = [[LeftHeadView alloc]init];
        return tHView;
    }else{
        RightHeadView *tHView = [[RightHeadView alloc]init];
        return tHView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(tableView == _leftTbView){
        return kLabelHeight + kMenuLineWidth*2;
    }else{
        return kLabelHeight + kMenuLineWidth*2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == _leftTbView){
        static NSString *strCell = @"LeftCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        }
        cell.backgroundColor = HexRGB(0xEAEAEA);
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld名",indexPath.row];
        return cell;
    }else{
        static NSString *strCell = @"RightCell";
        RightCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        if(!cell){
            cell = [[RightCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        }
        [cell configModel:self.dataArr[indexPath.row]];
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    [_leftTbView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [_rightTbView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}
#pragma mark - 两个tableView联动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _leftTbView) {
        [self tableView:_rightTbView scrollFollowTheOther:_leftTbView];
    }else{
        [self tableView:_leftTbView scrollFollowTheOther:_rightTbView];
    }
}

- (void)tableView:(UITableView *)tableView scrollFollowTheOther:(UITableView *)other{
    CGFloat offsetY= other.contentOffset.y;
    CGPoint offset=tableView.contentOffset;
    offset.y=offsetY;
    tableView.contentOffset=offset;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}


@end
