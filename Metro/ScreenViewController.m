//
//  ScreenViewController.m
//  Metro
//
//  Created by Ace on 14/12/10.
//  Copyright (c) 2014年 com.hujao. All rights reserved.
//

#import "ScreenViewController.h"
#import "ScreenView.h"
@interface ScreenViewController ()

@end

@implementation ScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    ScreenView *sv=[[ScreenView alloc]iR(0,0,SCREEN_WIDTH,self.view.frame.size.height)];
    [self.view addSubview:sv];
    UILabel *label=[[UILabel alloc]init];
    label.text=StringCat3(StringF(SCREEN_WIDTH),@" ",StringF(SCREEN_HEIGHT));
    [self.view addSubview:label];
    [label sizeToFit];
    label.center=self.view.center;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
