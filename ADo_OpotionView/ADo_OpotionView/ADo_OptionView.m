//
//  ADo_OptionView.m
//  ADo_OpotionView
//
//  Created by liguofu on 16/3/8.
//  Copyright © 2016年 appcan. All rights reserved.
//

#import "ADo_OptionView.h"

/**
 获取随机色
 */
#define kRandomColor ([UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0f])


#define MAS_SHORTHEND
#define MAS_SHORTHEND_GLOBALS
#import "Masonry.h"
#define  paddingW 5
#define arrowW 20
#define labelH 30
#define textfiledH 45

@interface ADo_OptionView () <UITextFieldDelegate>
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *summaryLabel;
@property (nonatomic, assign) BOOL isEditing;

@end

@implementation ADo_OptionView

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return  self;
}

- (void)initializeSubviews {
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = kRandomColor;
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    UILabel *summaryLabel = [[UILabel alloc]init];
    summaryLabel.font = [UIFont systemFontOfSize:22];
    summaryLabel.backgroundColor = kRandomColor;
    [self.contentView addSubview:summaryLabel];
    self.summaryLabel = summaryLabel;
    
    UITextField * detailField = [[UITextField alloc] init];
    detailField.userInteractionEnabled = NO;
    detailField.delegate = self;
    [self.contentView addSubview:detailField];
    self.detailFiled = detailField;
}
#if 0

#endif

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
