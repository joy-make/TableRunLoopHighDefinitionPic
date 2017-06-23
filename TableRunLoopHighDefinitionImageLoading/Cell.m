//
//  Cell.m
//  RunLoopWorkDistribution
//
//  Created by wangguopeng on 2017/6/23.
//  Copyright © 2017年 Di Wu. All rights reserved.
//

#import "Cell.h"

@interface Cell ()
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UIImageView *imageView1;
@property (nonatomic,strong)UIImageView *imageView2;
@property (nonatomic,strong)UIImageView *imageView3;
@property (nonatomic,strong)UILabel *label2;
@end

@implementation Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubViews];
    }
    return self;
}

-(UILabel *)label1{
    if (!_label1) {
        _label1 =[[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
        _label1.backgroundColor = [UIColor clearColor];
        _label1.textColor = [UIColor redColor];
        _label1.text = [NSString stringWithFormat:@" - Drawing index is top priority"];
        _label1.font = [UIFont boldSystemFontOfSize:13];
    }
    return _label1;
}

-(UILabel *)label2{
    if (!_label2) {
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
    _label2.lineBreakMode = NSLineBreakByWordWrapping;
    _label2.numberOfLines = 0;
    _label2.backgroundColor = [UIColor clearColor];
    _label2.textColor = [UIColor colorWithRed:0 green:100.f/255.f blue:0 alpha:1];
    _label2.text = [NSString stringWithFormat:@" - Drawing large image is low priority. Should be distributed into different run loop passes."];
    _label2.font = [UIFont boldSystemFontOfSize:13];
    }
    return _label2;
}

-(UIImageView *)imageView1{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
        _imageView1.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView1;
}

-(UIImageView *)imageView2{
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
        _imageView2.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView2;
    
}

-(UIImageView *)imageView3{
    if (!_imageView3) {
        _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
        _imageView3.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView3;
    
}
- (void)addSubViews{
    [self.contentView addSubview:self.label1];
    [self.contentView addSubview:self.label2];
    [self.contentView addSubview:self.imageView1];
    [self.contentView addSubview:self.imageView2];
    [self.contentView addSubview:self.imageView3];
}

- (void)setImage:(NSInteger)iamgeIndex{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
    if (iamgeIndex ==0) {
        self.imageView1.image = [UIImage imageWithContentsOfFile:path];
    }
    if (iamgeIndex ==1) {
        self.imageView2.image = [UIImage imageWithContentsOfFile:path];
    }
    if (iamgeIndex ==2) {
        self.imageView3.image = [UIImage imageWithContentsOfFile:path];
    }
    if (iamgeIndex ==3) {
        self.imageView1.image = nil;
        self.imageView2.image = nil;
        self.imageView3.image = nil;
    }
    
    
}

@end

