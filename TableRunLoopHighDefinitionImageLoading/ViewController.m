//
//  ViewController.m
//  TableRunLoopHighDefinitionImageLoading
//
//  Created by wangguopeng on 2017/6/23.
//  Copyright © 2017年 joymake. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import <objc/runtime.h>
#import "RunLoopTaskManage.h"

static NSString *IDENTIFIER = @"IDENTIFIER";
static CGFloat CELL_HEIGHT = 135.f;

@interface UITableViewCell (indexPath)
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@end


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[Cell class] forCellReuseIdentifier:IDENTIFIER];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [RunLoopTaskManage shareInstaceManager].maxTasks = 30;
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 399;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.currentIndexPath = indexPath;
    //清除旧图
    [cell setImage:3];
    //单loop加载
    [self runloopCell:cell indexPath:indexPath];
    //全loop加载 卡顿加载
//    [self setCellInfo:cell];
    return cell;
}

- (void)runloopCell:(Cell *)cell indexPath:(NSIndexPath *)indexPath{
    [[RunLoopTaskManage shareInstaceManager] addTask:^BOOL{
        if (![cell.currentIndexPath isEqual:indexPath])
        return NO;
        [self setCellInfo:cell];
        return YES;
    }];
}

- (void)setCellInfo:(Cell *)cell{
//    cell上设置高清图
    [cell setImage:0];
    [cell setImage:1];
    [cell setImage:2];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

@end

@implementation UITableViewCell (indexPath)

@dynamic currentIndexPath;

- (NSIndexPath *)currentIndexPath {
    NSIndexPath *indexPath = objc_getAssociatedObject(self, @selector(currentIndexPath));
    return indexPath;
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    objc_setAssociatedObject(self, @selector(currentIndexPath), currentIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

