//
//  FFColorViewController.m
//  FFPopover
//
//  Created by 张玲玉 on 16/7/6.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFColorViewController.h"

@interface FFColorViewController ()

@end

@implementation FFColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor orangeColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    self.preferredContentSize=CGSizeMake(100, 300);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Id=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Id];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(colorViewController:didSelectColor:)]) {
        UIColor *color=[tableView cellForRowAtIndexPath:indexPath].backgroundColor;
        [self.delegate colorViewController:self didSelectColor:color];
    }
}

@end
