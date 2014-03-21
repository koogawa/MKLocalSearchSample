//
//  ViewController.m
//  MKLocalSearchSample
//
//  Created by koogawa on 2014/03/21.
//  Copyright (c) 2014年 Kosuke Ogawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_mapItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UISearchBar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // キーボード閉じる
	[searchBar resignFirstResponder];

    // 検索準備
	MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
	request.naturalLanguageQuery = searchBar.text;
	request.region = _mapView.region;
	MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];

    // 検索実行
	[search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error)
     {
         [_mapItems removeAllObjects];
         [_mapView removeAnnotations:[_mapView annotations]];

         for (MKMapItem *item in response.mapItems)
         {
             MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
             point.coordinate = item.placemark.coordinate;
             point.title = item.placemark.name;
             point.subtitle = item.placemark.title;

             [_mapView addAnnotation:point];
             [_mapItems addObject:item];
         }

         [_mapView showAnnotations:[_mapView annotations] animated:YES];
     }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
	[searchBar setShowsCancelButton:YES animated:YES];
	return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
	[searchBar setShowsCancelButton:NO animated:YES];
	return YES;
}

@end
