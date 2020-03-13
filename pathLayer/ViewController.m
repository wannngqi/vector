//
//  ViewController.m
//  pathLayer
//
//  Created by wangqi on 2020/3/12.
//  Copyright © 2020 王琪. All rights reserved.
//

#import "ViewController.h"
#import "HZView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HZView *v = [[HZView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:v];
}


@end
