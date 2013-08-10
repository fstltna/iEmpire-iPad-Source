//
//  IEGamePlayScreenViewController.m
//  iEmpire
//
//  Created by Dhaval Karwa on 4/9/13.
//
//

#import "IEGamePlayScreenViewController.h"

@interface IEGamePlayScreenViewController ()

@property (nonatomic, strong) NSNumber *bytesRead ;

@end

@implementation IEGamePlayScreenViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"In GamePlay Screen, calling network connection");
    [self initNetworkCommunication];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"empiredirectory.net", 6665, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];
    [outputStream open];
    
    
    //NSString *requestStrFrmt = @"Country:1 Password:1";
}

#pragma mark NSSTream Delegate methods

-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{

    NSMutableData *_data;

    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            NSLog(@"Connection has opened successfully");
            break;
        case NSStreamEventHasBytesAvailable:
            NSLog(@"Connection has bytes coming in");

            
            if(!_data) {
                _data = [NSMutableData data];
            }
            uint8_t buf[1024];
            unsigned int len = 0;
            len = [(NSInputStream *)aStream read:buf maxLength:1024];
            if(len) {
                [_data appendBytes:(const void *)buf length:len];
             //   NSLog(@"data is %@", [NSString stringWithUTF8String:[_data bytes]]);
                
                NSString *newText = [_chatTextView.text stringByAppendingString:[NSString stringWithFormat:@"/n Resp:%@",[NSString stringWithUTF8String:[_data bytes]]]];
                
                [_chatTextView setText:newText];
                
            } else {
                NSLog(@"no data!");
            }
            break;

        case NSStreamEventEndEncountered:
            NSLog(@"Connection has closed");
            break;
        case NSStreamEventErrorOccurred:
            //TODO: Handle this case and bring in proper error message
           // NSLog(@"Error %d happened while trying to make a connection %@",aStream.streamStatus,[aStream.streamError description]);
            [self showAlretWithMessage:[aStream.streamError description]];
            break;
        default:
            //TODO: Handle this case and bring in proper error message
            NSLog(@"Unknown State");
            //[self showAlretWithMessage:@"Unknown State!"];
            break;
    }
}

#pragma mark -

#pragma mark error handler

-(void)showAlretWithMessage:(NSString *)message{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Something went wrong!"
                                                   message:message
                                                  delegate:self
                                         cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

@end
