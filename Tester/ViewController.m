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

@synthesize syncButton, dirLabel;
@synthesize locationManager, localHeading;

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
    NSLog(@"%lf",newHeading.headingAccuracy);
}


-(IBAction)syncButtonPressed:(id)sender{
    
    dirLabel.text=[[NSString alloc] initWithFormat:@"%lf",[[locationManager heading] trueHeading]];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

//t == timer
-(void)checkForPartner{
    
    NSString *postString = [[NSString alloc] initWithFormat:@"UID=AAA&heading=123"];
    [[Connection alloc] initWithSelector:@selector(response:)
                                toTarget:self
                                 withURL:@"http://linus.highpoint.edu/~cweigandt/tester/getPartner.php"
                              withString:postString];
   

    
}

-(void)response:(NSData*)receivedData{
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    NSArray *chunks = [[NSArray alloc] initWithArray:[responseString componentsSeparatedByString: @","]];
    
    NSInteger partnerHeading = (NSInteger)[[chunks objectAtIndex:0] integerValue];
    /*
    if(partnerHeading == localHeading-180){
        //Do GUI stuff
     }else if(time == 10){
        \\Do nothing
     }else{
     //Maybe make this on timer to slow it down
        time++;
        [self checkForPartner];
     }
    */
}

@end
