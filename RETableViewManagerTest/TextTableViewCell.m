//
//  TextTableViewCell.m
//  RETableViewManagerTest
//
//  Created by 业乔集团 on 2018/12/29.
//  Copyright © 2018年 业乔集团. All rights reserved.
//

#import "TextTableViewCell.h"
#import "ItemTest.h"
#import "Model.h"

@interface TextTableViewCell ()

@property (nonatomic, strong) UIImageView *imageViewYY;
@property (nonatomic, strong) UILabel *labelYY;


@end

@implementation TextTableViewCell

+(CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return 100;
}


-(void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self qwe];
}

- (void)qwe
{
    self.imageViewYY = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    self.imageViewYY.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.imageViewYY];
    
    self.labelYY = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 30)];
    self.labelYY.backgroundColor = [UIColor purpleColor];
    self.labelYY.text = @"liu666";
    [self.contentView addSubview:self.labelYY];
}

//d赋值
-(void)cellWillAppear
{
    [super cellWillAppear];
    
    ItemTest *item = (ItemTest *)self.item;
    Model *mode = item.modelFFF;
    
    self.labelYY.text = mode.name;
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
