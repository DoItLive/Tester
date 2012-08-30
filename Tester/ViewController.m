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

@synthesize syncButton, dirLabel, arrow;
@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.headingFilter = kCLHeadingFilterNone;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    if (![CLLocationManager headingAvailable] || ![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Error: Heading or location services is not available on this device");
    }
    [locationManager startUpdatingHeading];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    //NSLog(@"%lf",newHeading.headingAccuracy);
    localHeading = newHeading.trueHeading;
    double rotation = (((int) (90 - localHeading)) % 360)/180.0*M_PI;
    arrow.transform = CGAffineTransformMakeRotation(rotation);
    dirLabel.text=[[NSString alloc] initWithFormat:@"%lf",[[locationManager heading] trueHeading]];

}


-(IBAction)syncButtonPressed:(id)sender{
    
    time=0;
    [syncButton setEnabled:FALSE];
    [self checkForPartner];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)checkForPartner{
    
    NSString *postString = [[NSString alloc] initWithFormat:@"UID=BBB&heading=%lf",localHeading];
    [[Connection alloc] initWithSelector:@selector(response:)
                                toTarget:self
                                 withURL:@"http://linus.highpoint.edu/~cweigandt/tester/getPartner.php"
                              withString:postString];
   

    
}

-(void)response:(NSData*)receivedData{
    
    if([receivedData length] > 1){
        NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
        NSArray *chunks = [[NSArray alloc] initWithArray:[responseString componentsSeparatedByString: @" - "]];
    
        NSString* partnerUID = [chunks objectAtIndex:0];
        CLLocationDirection partnerHeading = (CLLocationDirection)[[chunks objectAtIndex:1] doubleValue];
        
        double error = 180 - abs(partnerHeading - localHeading);
        if(error < 12 && error > -12){
            NSLog(@"---------You have connected to user %@", partnerUID);
        }else if(time == 10){
            [syncButton setEnabled:TRUE];
        }else{
        //Maybe make this on timer to slow it down
            time++;
            usleep(300000);
            [self checkForPartner];
        }
    }
    [syncButton setEnabled:TRUE];

}

@end
