//
//  XYRNMethodForwordModule.m
//  XYVivaLite_TemplateLibrary
//
//  Created by 夏敏 on 09/02/2018.
//

#import "XYRNMethodForwordModule.h"
#import "RNCacheModules.h"

@implementation XYRNMethodForwordModule

+ (id)moduleWithRootView:(RCTRootView *)rootView {
    id module = [rootView.bridge moduleForName:NSStringFromClass(self)];
    return module;
}

- (void)nativeInvokeReactNativeEvent:(NSString *)eventName body:(NSDictionary *)params {
    [self sendEventWithName:eventName body:params];
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"restorePurchase"];
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(nativeMethod:(NSString *)method params:( NSDictionary *)params){
    
    __block NSDictionary *blockParams = params;
    dispatch_async(dispatch_get_main_queue(), ^{
        id target = [[RNCacheModules shareInstance] moduleWithIdentifier:self.bridge.launchOptions[@"module_id"]];
        
        SEL selector = NSSelectorFromString(method);
        
        if(![target respondsToSelector:selector]){
            return;
        }
        
        NSMethodSignature *signature = [target methodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:target];
        [invocation setSelector:selector];
        if(blockParams){
            //第一个参数是target；第二个是selector；从第三个开始才是真正的方法参数，即index为2
            [invocation setArgument:&blockParams atIndex:2];
        }
        [invocation invoke];
    });
}

@end
