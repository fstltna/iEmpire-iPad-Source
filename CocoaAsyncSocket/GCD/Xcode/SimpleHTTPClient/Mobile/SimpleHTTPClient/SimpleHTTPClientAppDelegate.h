#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "MediaPlayer/MediaPlayer.h"
#import <AVFoundation/AVFoundation.h>

@class SimpleHTTPClientViewController;
@class GCDAsyncSocket;


@interface SimpleHTTPClientAppDelegate : NSObject <UIApplicationDelegate, AVAudioPlayerDelegate>
{
	GCDAsyncSocket *asyncSocket;
    AVAudioPlayer *audioPlayer;
}

@property (nonatomic) IBOutlet UIWindow *window;
@property (nonatomic) IBOutlet SimpleHTTPClientViewController *viewController;

@end
