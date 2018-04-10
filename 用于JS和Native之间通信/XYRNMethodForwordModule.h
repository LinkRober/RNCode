//
//  XYRNMethodForwordModule.h
//  XYVivaLite_TemplateLibrary
//
//  Created by 夏敏 on 09/02/2018.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTRootView.h>

@interface XYRNMethodForwordModule : RCTEventEmitter<RCTBridgeModule>

+ (id)moduleWithRootView:(RCTRootView *)rootView;

- (void)nativeInvokeReactNativeEvent:(NSString *)eventName body:(NSDictionary *)params;

@end
