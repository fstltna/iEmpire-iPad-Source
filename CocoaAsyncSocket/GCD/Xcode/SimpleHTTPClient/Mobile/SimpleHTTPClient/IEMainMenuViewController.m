//
//  IEMainMenuViewController.m
//  iEmpire
//
//  Created by Dhaval Karwa on 4/9/13.
//
//

#import "IEMainMenuViewController.h"
#import <Twitter/Twitter.h>
#import "GlobalsHeader.h"

@interface IEMainMenuViewController ()

@property (weak, nonatomic) IBOutlet UITextView *newsLabel;

-(IBAction)tweetTapped:(id)sender;
@end

@implementation IEMainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"In MainMenu");
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    WantNews = [userDefaults boolForKey:@"news_preference"];
    
    NSString * theiEmpireString = @"(c) Copyright 2013 - Pocketfiction.com";
    if(WantNews)
    {
        // Get  latest news
        NSString *FeedURL=@"http://empiredirectory.net/iempirenews.txt";
        NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:FeedURL]];
        NSURLResponse *resp = nil;
        NSError *err = nil;
        NSData *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &err];
        theiEmpireString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        NSLog(@"retrieved response: %@", theiEmpireString);
    }
    
    // Put Label Update Code Here
    [_newsLabel setText:theiEmpireString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark View Appear/Disapper methods

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
    
}
#pragma mark-

#pragma mark Twitter Button
-(IBAction)tweetTapped:(id)sender{
    
    NSString *tweetStr = @"I love playing Empire using iEmpire - Give it a try! http://empiredirectory.net/iempire";
    NSString *errorMessage = @"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup";
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:tweetStr];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:errorMessage
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }    
}

#pragma mark -

@end
