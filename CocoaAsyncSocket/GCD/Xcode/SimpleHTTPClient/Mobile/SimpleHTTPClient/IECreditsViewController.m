//
//  IECreditsViewController.m
//  iEmpire
//
//  Created by Dhaval Karwa on 9/3/13.
//
//

#define SEGUE_IEMPIRE @"iEmpireClient"
#define SEGUE_VEDRAN @"VedranLinkedIn"
#define SEGUE_MARISA @"MarisaLinkedIn"
#define SEGUE_DHAVAL @"DhavalLinkedIn"

#define SEGUE_IEMPIRE_LINK @"http://hungrylucy.com"
#define SEGUE_VEDRAN_LINK @"http://www.freelancer.com/u/the1337code.html"
#define SEGUE_MARISA_LINK @"http://www.linkedin.com/in/marisagiancarla"
#define SEGUE_DHAVAL_LINK @"http://www.linkedin.com/in/marisagiancarla"


#import "IECreditsViewController.h"
#import "IECreditsInfoViewController.h"

@interface IECreditsViewController ()

@end

@implementation IECreditsViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

//    NSString *strToUse;
    if ([segue.identifier isEqualToString:SEGUE_IEMPIRE]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:SEGUE_IEMPIRE_LINK]];
    }
    else if ([segue.identifier isEqualToString:SEGUE_MARISA]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:SEGUE_MARISA_LINK]];
    }
    else if ([segue.identifier isEqualToString:SEGUE_VEDRAN]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:SEGUE_VEDRAN_LINK]];
    }
    else if ([segue.identifier isEqualToString:SEGUE_DHAVAL]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:SEGUE_DHAVAL_LINK]];
    }
//   [(IECreditsInfoViewController *)[segue destinationViewController] setUrlString:[strToUse copy]];
//   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.google.com"]];
}

@end
