//
//  ViewController.h
//  Tester
//
//  Created by Thomas Langford on 8/28/12.
//  Copyright (c) 2012 DoItLive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Connection.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;

    UIButton *syncButton;
    UILabel *dirLabel;
    UILabel *errorLabel;
    UIImageView *arrow;
    
    NSInteger time;
    
    
    CLLocationDirection localHeading;
}
-(void)response:(NSData*)receivedData;
-(void)checkForPartner;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) IBOutlet UIButton *syncButton;
@property (nonatomic) IBOutlet UILabel *dirLabel;
@property (nonatomic) IBOutlet UILabel *errorLabel;
@property (nonatomic) IBOutlet UIImageView *arrow;

-(IBAction)syncButtonPressed:(id)sender;

@end

