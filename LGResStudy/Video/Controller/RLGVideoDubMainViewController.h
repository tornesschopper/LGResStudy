//
//  RLGVideoDubMainViewController.h
//  LGResStudyDemo
//
//  Created by 刘亚军 on 2018/4/28.
//  Copyright © 2018年 刘亚军. All rights reserved.
//

#import "RLGBaseViewController.h"
#import "RLGViewTransferProtocol.h"
@class RLGResModel;
@interface RLGVideoDubMainViewController : RLGBaseViewController
@property (nonatomic,weak) UIViewController<RLGViewTransferProtocol> *ownController;
- (instancetype)initWithResModel:(RLGResModel *) resModel;
- (void)stopRecordPlay;
@end
