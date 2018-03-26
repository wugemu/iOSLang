//
//  MainCell.m
//  IosLangTest
//
//  Created by jessie on 2018/3/23.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell
@synthesize nameLab;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLab=[[UILabel alloc] init];
        nameLab.frame=CGRectMake(0, 0, 100, 20);
        [self.contentView addSubview: nameLab];
    }
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
