//
//  ViewController.m
//  ExamenCM
//
//  Created by Jose Maciel on 8/27/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Start.h"
#import "WebServices.h"
@interface Start ()

@end
float lat    ;
float lng;
@implementation Start{
    
@private BOOL  mybool;
 }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:20.6741
                                                            longitude:-103.3872
                                                                 zoom:12];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.delegate = self;
    self.view = mapView;
    

}
#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView
didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    
    if (mybool) {
        [mapView clear];
    }
    
    lat                       = coordinate.latitude;
    lng                       = coordinate.longitude;
    NSString *strLat = [NSString stringWithFormat:@"%f", lat];
    NSString *strLng = [NSString stringWithFormat:@"%f", lng];
    
     mjsonGeo = [WebServices getWeatherWithLatitude:strLat AndLongitude:strLng];
    print(NSLog(@"mjsonGeo =%@",mjsonGeo));
       ObjectResponse *object          = [Parser parseGeoObject];
        Pais *paisObject              =     object.pais;
        NSString *stName                = object.name;
        NSString *stCountry             = paisObject.country;

   
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker.title = stName;
    marker.snippet = stCountry;
    marker.map = mapView;
    mybool = YES;
    
    
}




@end
