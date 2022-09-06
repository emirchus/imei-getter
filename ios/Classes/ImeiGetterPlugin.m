#import "ImeiGetterPlugin.h"
#if __has_include(<imei_getter/imei_getter-Swift.h>)
#import <imei_getter/imei_getter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "imei_getter-Swift.h"
#endif

@implementation ImeiGetterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImeiGetterPlugin registerWithRegistrar:registrar];
}
@end
