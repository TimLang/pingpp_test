#import "FlutterPingppPlugin.h"
#import "Pingpp.h"

@implementation FlutterPingppPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_pingpp"
            binaryMessenger:[registrar messenger]];
  FlutterPingppPlugin* instance = [[FlutterPingppPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
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
            NSLog(@">????????????");
        } else {
            NSLog(@"PingppError: code=%lu msg=%@", (unsigned  long)error.code, [error getMsg]);
        }
    }];

    result(data);
}

@end
