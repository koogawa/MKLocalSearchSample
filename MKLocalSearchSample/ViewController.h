//
//  ViewController.h
//  MKLocalSearchSample
//
//  Created by koogawa on 2014/03/21.
//  Copyright (c) 2014年 Kosuke Ogawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
