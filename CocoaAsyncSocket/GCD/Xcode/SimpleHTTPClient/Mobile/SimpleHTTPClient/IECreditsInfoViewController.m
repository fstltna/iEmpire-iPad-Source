//
//  IECreditsInfoViewController.m
//  iEmpire
//
//  Created by Dhaval Karwa on 9/3/13.
//
//

#import "IECreditsInfoViewController.h"

@interface IECreditsInfoViewController ()
-(IBAction)donePressed:(id)sender;
@end

@implementation IECreditsInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (self.urlString) {
        NSURL *url = [NSURL URLWithString:self.urlString];
        NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
        [self.infoWebView loadRequest:urlReq];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)donePressed:(id)sender{

    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
