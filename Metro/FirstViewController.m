//
//  FirstViewController.m
//  Metro
//
//  Created by Ace on 14/11/18.
//  Copyright (c) 2014年 com.hujao. All rights reserved.
//


// 当前设备的屏幕宽度
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
// 当前设备的屏幕高度
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
//Color
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 栅格数
#define boxSumWidth SCREEN_WIDTH
// 边距
#define boxMargin 6
// 栅格数
#define boxMaxGridCount 4
// 最小宽度
#define boxMinWidth ((boxSumWidth-boxMargin*(boxMaxGridCount+1))/boxMaxGridCount)
// 宽度
#define boxWidth(N) (boxMinWidth*N+boxMargin*(N-1))// box中心
#define boxCenter(x,y,w,h) CGPointMake(((x+1)*boxMargin+x*boxWidth(w)+boxWidth(w)/2),((y+1)*boxMargin+y*boxWidth(h)+boxWidth(h)/2));
// box视图
#define boxView(x,y,w,h) [[UIView alloc] initWithFrame:CGRectMake((x+1)*boxMargin+x*boxWidth(1), (y+1)*boxMargin+y*boxWidth(1), boxWidth(w), boxWidth(h))]

#import "FirstViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "MapViewController.h"
#import "ScreenViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    self.tabBarController.tabBar.hidden=YES;
    [super viewDidLoad];
    [self setTitle:@"登山者"];
    [self initView];
    if ([CMAltimeter isRelativeAltitudeAvailable]) {
        self.altimeter = [[CMAltimeter alloc] init];
    }

}

-(void)initView{
    UIScrollView *contextView=[[UIScrollView alloc] initWithFrame:CGRectMake(0,16,SCREEN_WIDTH,SCREEN_HEIGHT-24)];
    contextView.scrollEnabled=YES;
    [contextView setBounces:YES];
    contextView.clipsToBounds=NO;
    [contextView setContentSize:CGSizeMake(SCREEN_WIDTH,SCREEN_HEIGHT-23)];
    contextView.showsHorizontalScrollIndicator=NO;
    contextView.delegate=self;
    [self.view addSubview:contextView];
    {
        UIView *view=boxView(0,0,2,2);
        view.backgroundColor=UIColorFromRGB(0xe6536f);
        view.tag=101;
        view.userInteractionEnabled=YES;
        altitudeLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [view addSubview:altitudeLabel];
        altitudeLabel.textColor=cWhite;
        altitudeLabel.textAlignment=NSTextAlignmentCenter;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(2,0,1,1);
        view.backgroundColor=UIColorFromRGB(0x7175e0);
        view.tag=102;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(3,0,1,1);
        view.backgroundColor=UIColorFromRGB(0x8573e1);
        view.tag=103;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(0,2,2,1);
        view.backgroundColor=UIColorFromRGB(0xf27638);
        view.tag=104;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(2,1,2,2);
        view.backgroundColor=UIColorFromRGB(0x5d97e8);
        view.tag=105;
        pressureLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [view addSubview:pressureLabel];
        pressureLabel.textColor=cWhite;
        pressureLabel.textAlignment=NSTextAlignmentCenter;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(0,3,1,1);
        view.backgroundColor=UIColorFromRGB(0xeba62f);
        view.tag=107;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(1,3,1,1);
        view.backgroundColor=UIColorFromRGB(0xeba62f);
        view.tag=108;
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitle:@"Map" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(showMap) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.center=CGPointMake(view.frame.size.width/2,view.frame.size.height/2);
        [contextView addSubview:view];
       // [btn setCenter:view.center];
    }
    {
        UIView *view=boxView(2,3,2,1);
        view.backgroundColor=UIColorFromRGB(0x3aace0);
        view.tag=109;
        timestampLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [view addSubview:timestampLabel];
        timestampLabel.textColor=cWhite;
        timestampLabel.textAlignment=NSTextAlignmentCenter;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(0,4,1,1);
        view.backgroundColor=UIColorFromRGB(0xbac731);
        view.tag=110;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(1,4,1,1);
        view.backgroundColor=UIColorFromRGB(0xbac731);
        view.tag=111;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(2,4,1,1);
        view.backgroundColor=UIColorFromRGB(0x31c6cc);
        view.tag=112;
        [contextView addSubview:view];
    }
    {
        UIView *view=boxView(3,4,1,1);
        view.backgroundColor=UIColorFromRGB(0x33b6d2);
        view.tag=113;
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitle:@"Screen" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(showScreen) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.center=CGPointMake(view.frame.size.width/2,view.frame.size.height/2);
        [contextView addSubview:view];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue]
                                            withHandler:
     ^(CMAltitudeData *altitudeData, NSError *error) {
         NSLog(@"altitudeData:%@, error:%@", altitudeData, error);
         if (error) {
         }
         else {
             if(altitudeData.relativeAltitude.floatValue<0)
                 altitudeLabel.text = [NSString stringWithFormat:@"下降:%.02f米", -altitudeData.relativeAltitude.floatValue];
             else if(altitudeData.relativeAltitude.floatValue>0)
                 altitudeLabel.text = [NSString stringWithFormat:@"上升:%.02f米", altitudeData.relativeAltitude.floatValue];
             else
                 altitudeLabel.text =@"0米";
             pressureLabel.text = [NSString stringWithFormat:@"大气压:%.02f帕", altitudeData.pressure.floatValue];
             timestampLabel.text = [NSString stringWithFormat:@"%f", altitudeData.timestamp];
         }
     }];
}
-(void)showMap{
    MapViewController *control=[[MapViewController alloc]init];
    //id x= self.navigationController;
    [self.navigationController pushViewController:control animated:YES];
}
-(void)showScreen{
    ScreenViewController *control=[[ScreenViewController alloc]init];
    //id x= self.navigationController;
    [self.navigationController pushViewController:control animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.altimeter stopRelativeAltitudeUpdates];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
