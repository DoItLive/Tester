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


-(IBAction)syncButtonPressed:(id)sender{
    
    
    //Here you go thomas!!
    
    dirLabel.text=[[NSString alloc] initWithFormat:@""];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

-(void)checkForPartner{
    
    NSString *postString = [[NSString alloc] initWithFormat:@"UID=AAA&heading=123"];
    Connection *junk = [[Connection alloc] initWithSelector:@selector(response:)
                                toTarget:self
                                 withURL:@"http://linus.highpoint.edu/~cweigandt/tester/getPartner.php"
                              withString:postString];
   

    
}

-(void)response:(NSData*)receivedData{
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    NSArray *chunks = [[NSArray alloc] initWithArray:[responseString componentsSeparatedByString: @","]];
    
    NSInteger partnerHeading = (NSInteger)[[chunks objectAtIndex:0] integerValue];
    //Compare partnerHeading with local heading
    
}

@end
