//
//  RunLoopTaskManage.h
//  TableRunLoopHighDefinitionImageLoading
//
//  Created by wangguopeng on 2017/6/23.
//  Copyright © 2017年 joymake. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef BOOL(^TaskBlock)(void);

@interface RunLoopTaskManage : NSObject
@property (nonatomic,assign)NSInteger maxTasks;

+(instancetype)shareInstaceManager;

- (void)addTask:(TaskBlock)task;

- (void)removeAllTasks;

@end
