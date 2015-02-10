//
//  HomeTableViewCell.m
//  TechSpace
//
//  Created by Kenichi Saito on 2/9/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    _topImageView.layer.masksToBounds = YES;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        // self initiallizer
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
