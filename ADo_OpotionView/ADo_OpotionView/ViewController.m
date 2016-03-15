//
//  ViewController.m
//  ADo_OpotionView
//
//  Created by liguofu on 16/3/4.
//  Copyright © 2016年 appcan. All rights reserved.
//

#import "ViewController.h"
#import "ADo_OptionView.h"
#import "ADo_OptionViewModel.h"
#import "UIView+Tool.h"

/**
 * 获取屏幕 宽度 高度
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/**
 * 判断6p
 */
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 * 获取随机颜色
 */
#define kRandomColor (UIColor colorWithRed:arc4random_uniform(256)/255.0 blue:arc4andom_uniform(256)/255.0 alpha:1.0f])

#define spaceH 20
/**
 * cell 重用
 */
static NSString *reuseID = @"opotion";


@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *opotionArray;

@property (nonatomic, strong) NSIndexPath *selectedPath;

@property (nonatomic, weak) UITableView *listView;

@property (nonatomic, assign) CGFloat keboardH;

@property (nonatomic, assign) CGFloat offsetY;

@end

@implementation ViewController

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}



-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellTextChange:) name:@"textChange" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 * 键盘弹出
 */
- (void)keyboardWillShow:(NSNotification *)note {
    
    CGRect tempFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //键盘高度
    CGFloat keyboardHeight = tempFrame.size.height;
    
    self.keboardH = keyboardHeight;
    
}

/**
 * 键盘收起
 */
- (void)keyboardWillHide:(NSNotification *)note {
    
    if (!self.listView.tracking) {
        
        [self.listView setContentOffset:CGPointMake(0, self.offsetY)];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   [self createList];
   [self initializeData];
}

- (void)createList {
    
    UITableView *listView = [[UITableView alloc] init];
    listView.separatorStyle = UITableViewCellSeparatorStyleNone;
    listView.tableFooterView = [[UIView alloc] init];
    [listView registerClass:[ADo_OptionView class] forCellReuseIdentifier:reuseID];
    listView.delegate = self;
    listView.dataSource = self;
    listView.X = 0;
    listView.Y = 0;
    listView.width = SCREEN_WIDTH;
    listView.height = SCREEN_HEIGHT - 40;
    [self.view addSubview:listView];
    self.listView = listView;

}

- (NSMutableArray *) opotionArray {
    if (!_opotionArray) {
        self.opotionArray = [NSMutableArray array];
    }
    return _opotionArray;
}

- (void)initializeData {

    ADo_OptionViewModel *model1 = [[ADo_OptionViewModel alloc] initWithIcon:@"1" summary:@"aaa" detail:@"AAA" opotionType:OptionType_default];
    ADo_OptionViewModel *model2 = [[ADo_OptionViewModel alloc] initWithIcon:@"2" summary:@"bbb" detail:@"BBB" opotionType:OptionType_Input];
    ADo_OptionViewModel *model3 = [[ADo_OptionViewModel alloc] initWithIcon:@"3" summary:@"ccc" detail:@"CCC" opotionType:OptionType_default];
    ADo_OptionViewModel *model4 = [[ADo_OptionViewModel alloc] initWithIcon:@"4" summary:@"ddd" detail:@"DDD" opotionType:OptionType_Input];
    ADo_OptionViewModel *model5 =[[ADo_OptionViewModel alloc] initWithIcon:@"1" summary:@"eee" detail:@"EEE" opotionType:OptionType_default];
    ADo_OptionViewModel *model6 =[[ADo_OptionViewModel alloc] initWithIcon:@"2" summary:@"fff" detail:@"FFF" opotionType:OptionType_Input];
    ADo_OptionViewModel *model7 =[[ADo_OptionViewModel alloc] initWithIcon:@"3" summary:@"ggg" detail:@"GGG" opotionType:OptionType_default];
    ADo_OptionViewModel *model8 =[[ADo_OptionViewModel alloc] initWithIcon:@"4" summary:@"hhh" detail:@"" opotionType:OptionType_Input];
    [self.opotionArray addObject:model1];
    [self.opotionArray addObject:model2];
    [self.opotionArray addObject:model3];
    [self.opotionArray addObject:model4];
    [self.opotionArray addObject:model5];
    [self.opotionArray addObject:model6];
    [self.opotionArray addObject:model7];
    [self.opotionArray addObject:model8];
    
}

#pragma mark - table 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.opotionArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ADo_OptionView *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    cell.model = self.opotionArray[indexPath.row];
    return  cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ADo_OptionViewModel *model = self.opotionArray[indexPath.row];
    if (model.action) {
        model.action();
        return;
    }
    ADo_OptionView *cell  = (ADo_OptionView *)[tableView cellForRowAtIndexPath:indexPath];
    cell.cellIndexPath = indexPath;
    
    if ((model.type == OptionType_Input)) {
        [cell canInpute];
        CGFloat offsetY = self.listView.contentOffset.y;
        CGFloat trueCellMaxY = CGRectGetMaxY(cell.frame) - offsetY;
        
        CGFloat keyboardMinY = SCREEN_HEIGHT - self.keboardH;
        if (trueCellMaxY > keyboardMinY) {
            CGFloat deltaY = trueCellMaxY - keyboardMinY;
            [self.listView setContentOffset:CGPointMake(0, offsetY + deltaY + spaceH)];
        }
    } else {
        
        [self.view endEditing:YES];
    }
    
}

#pragma mark - 通知

- (void)cellTextChange:(NSNotification *)note {
    
    NSIndexPath *changedPath = note.userInfo[@"indexPath"];
    NSInteger row = changedPath.row;
    ADo_OptionViewModel *changeModel = self.opotionArray[row];
    changeModel.detail = note.userInfo[@"text"];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
