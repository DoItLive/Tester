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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(IBAction)syncButtonPressed:(id)sender{
    
    
    //Here you go thomas!!
    
    dirLabel.text=[[NSString alloc] initWithFormat:@""];
    time=0;
    [self checkForPartner];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

//t == timer
-(void)checkForPartner{
    
    NSString *postString = [[NSString alloc] initWithFormat:@"UID=AAA&heading=333"];
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
        /*
        if(partnerHeading == (localHeading-180){
            NSLog(@"You have connected to user %@", partnerUID);
        }else if(time == 10){
            \\Do nothing
        }else{
        //Maybe make this on timer to slow it down
            time++;
            [self checkForPartner];
        }
        */
    }
}

@end
