#import "MqchatPlugin.h"

#import <MeiQiaSDK/MQManager.h>
#import "MQChatViewManager.h"

@implementation MqchatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"mqchat"
            binaryMessenger:[registrar messenger]];
  MqchatPlugin* instance = [[MqchatPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"init" isEqualToString:call.method]) {
        [MQManager initWithAppkey:call.arguments completion:^(NSString *clientId, NSError *error) {
            if (!error) {
                NSLog(@"美洽 SDK：初始化成功");
            } else {
                NSLog(@"error:%@",error);
            }
        }];
    } else if ([@"chat" isEqualToString:call.method]) {
        UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
        NSDictionary *argsMap = call.arguments;
        [chatViewManager setClientInfo:argsMap override:YES];
        [chatViewManager pushMQChatViewControllerInViewController:viewController];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
