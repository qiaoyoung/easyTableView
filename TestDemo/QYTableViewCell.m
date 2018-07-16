//
//  QYTableViewCell.m
//  TestDemo
//
//  Created by Joeyoung on 2018/7/16.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "QYTableViewCell.h"
 
@interface QYTableViewCell ()

/** label */
@property (nonatomic, strong) UILabel *label;

@end

@implementation QYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = CGRectMake(20, 0, 100, 44);
        self.label = [[UILabel alloc] initWithFrame:rect];
        self.label.backgroundColor = [UIColor whiteColor];
        self.label.layer.cornerRadius = YES;
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)refreshCellWithModel:(id)model {
    self.label.text = (NSString *)model;
}

@end
