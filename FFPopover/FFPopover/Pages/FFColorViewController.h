//
//  FFColorViewController.h
//  FFPopover
//
//  Created by 张玲玉 on 16/7/6.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FFColorViewController;

@protocol FFColorViewControllerDelegate <NSObject>

@optional

- (void)colorViewController:(FFColorViewController *)vc didSelectColor:(UIColor *)color;

@end

@interface FFColorViewController : UITableViewController

@property (nonatomic,weak)id <FFColorViewControllerDelegate> delegate;

@end
