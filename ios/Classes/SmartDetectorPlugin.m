#import "SmartDetectorPlugin.h"
#if __has_include(<smart_detector/smart_detector-Swift.h>)
#import <smart_detector/smart_detector-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "smart_detector-Swift.h"
#endif

@implementation SmartDetectorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSmartDetectorPlugin registerWithRegistrar:registrar];
}
@end
