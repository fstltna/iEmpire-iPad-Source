//
//  IECreditsInfoViewController.m
//  iEmpire
//
//  Created by Dhaval Karwa on 9/3/13.
//
//


#import "IECreditsInfoViewController.h"

@interface IECreditsInfoViewController () <UIActionSheetDelegate>

@property (nonatomic, weak) UIActionSheet *actionSheet;
-(IBAction)donePressed:(id)sender;
-(IBAction)actionPressed:(id)sender;

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

    [self.actionSheet removeFromSuperview];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

-(IBAction)actionPressed:(id)sender{

    if (!self.actionSheet) {

        UIActionSheet *alertSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:(self) cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Cancel" otherButtonTitles:@"Open link In Safari", nil];
        [alertSheet setTag:0];
        [alertSheet setDelegate:self];
        [alertSheet showFromBarButtonItem:self.actionBarButton
                                 animated:YES];
        
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString]];
    }
    else
        [self.actionSheet removeFromSuperview];

}

@end
