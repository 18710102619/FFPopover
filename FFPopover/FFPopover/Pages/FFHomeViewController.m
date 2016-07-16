//
//  FFHomeViewController.m
//  FFPopover
//
//  Created by 张玲玉 on 16/7/6.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFHomeViewController.h"
#import "FFMenuViewController.h"
#import "FFColorViewController.h"
#import "FFSecondViewController.h"

@interface FFHomeViewController ()<FFColorViewControllerDelegate,UIPopoverControllerDelegate>

@property(nonatomic,strong)UIPopoverController *popover;

@property (weak, nonatomic) IBOutlet UIButton *btnColor;
@property (weak, nonatomic) IBOutlet UIButton *btnModal;

@end

@implementation FFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)popMenu:(UIBarButtonItem *)item {
    
    FFMenuViewController *menu=[[FFMenuViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:menu];
    
    _popover=[[UIPopoverController alloc] initWithContentViewController:nav];
    _popover.delegate=self;
    
    [_popover presentPopoverFromBarButtonItem:item permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)colorButtonClicked:(UIButton *)btn {
    
    FFColorViewController *color=[[FFColorViewController alloc]init];
    color.delegate=self;
    
    _popover=[[UIPopoverController alloc]initWithContentViewController:color];
    _popover.delegate=self;
    _popover.passthroughViews=@[_btnModal];
    
    [_popover presentPopoverFromRect:_btnModal.bounds inView:btn permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

- (IBAction)modalButtonClicked:(UIButton *)btn {
    
    FFSecondViewController *setup=[[FFSecondViewController alloc]init];
    setup.view.backgroundColor=[UIColor yellowColor];
    
    setup.modalPresentationStyle=UIModalPresentationFormSheet;

    setup.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:setup animated:YES completion:nil];
}

#pragma mark - FFColorViewControllerDelegate

- (void)colorViewController:(FFColorViewController *)vc didSelectColor:(UIColor *)color {
    
    _btnColor.backgroundColor=color;
    
    [_popover dismissPopoverAnimated:YES];
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
    NSLog(@"popover dismiss");
}

@end
