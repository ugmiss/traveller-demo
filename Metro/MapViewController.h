//
//  MapViewController.h
//  Metro
//
//  Created by Ace on 14/12/5.
//  Copyright (c) 2014年 com.hujao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *map;
}

@end
