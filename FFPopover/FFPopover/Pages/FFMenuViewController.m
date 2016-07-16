//
//  FFMenuViewController.m
//  FFPopover
//
//  Created by 张玲玉 on 16/7/6.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFMenuViewController.h"


@interface FFMenuViewController ()

@property(nonatomic,strong)NSArray *titles;

@end

@implementation FFMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"菜单";
    self.view.backgroundColor=[UIColor orangeColor];
    
    self.titles=@[@"设置",@"清除缓存",@"退出"];

    CGFloat h=self.titles.count*44;
    self.preferredContentSize=CGSizeMake(200, h);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Id=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Id];
    }
    cell.textLabel.text=self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
