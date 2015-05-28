//
//  FirstViewController.h
//  Metro
//
//  Created by Ace on 14/11/18.
//  Copyright (c) 2014年 com.hujao. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreMotion;
@interface FirstViewController : UIViewController<UIScrollViewDelegate>
{
    UILabel *altitudeLabel;
    UILabel *pressureLabel;
    UILabel *timestampLabel;
}

@property (nonatomic, strong) CMAltimeter *altimeter;


@end

