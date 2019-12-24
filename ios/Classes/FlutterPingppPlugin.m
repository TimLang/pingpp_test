#import "FlutterPingppPlugin.h"
#import "Pingpp.h"

@interface FlutterPingppPlugin ()
@property(nonatomic, retain) FlutterMethodChannel *channel;
@end

@implementation FlutterPingppPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_pingpp"
            binaryMessenger:[registrar messenger]];
  FlutterPingppPlugin* instance = [[FlutterPingppPlugin alloc] init];
  instance.channel = channel;
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options {
  BOOL canHandleURL = [Pingpp handleOpenURL:url withCompletion:nil];
  return canHandleURL;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"createPayment" isEqualToString:call.method]) {
     [self createPayment:call result: result];
  }
}

- (void)createPayment:(FlutterMethodCall*)call result:(FlutterResult)result{
    NSString *data = call.arguments[@"data"];
    [Pingpp createPayment:data appURLScheme:@"O2BRA_APP" withCompletion:^(NSString *result2, PingppError *error) {
        NSLog(@"xxxxxxxxxxxxx");
        if (error == nil) {
            [self.channel invokeMethod:@"paySuccess" arguments:nil];
        } else {
            NSLog(@"PingppError: code=%lu msg=%@", (unsigned  long)error.code, [error getMsg]);
            [self.channel invokeMethod:@"payFailed" arguments:nil];
        }
    }];

    result(nil);
}

@end
