//
//  ViewController.m
//  Tester
//
//  Created by Thomas Langford on 8/28/12.
//  Copyright (c) 2012 DoItLive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    if (![CLLocationManager headingAvailable]) {
        NSLog(@"Error: Heading is not available on this device");
    }
    [locationManager startUpdatingHeading];
    NSLog(@"Heading: %lf",[[locationManager heading] trueHeading]);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
