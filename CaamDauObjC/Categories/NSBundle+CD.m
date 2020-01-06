

#import "NSBundle+CD.h"



@implementation NSBundle (CD)

+ (instancetype _Nullable )cd_bundleWithClass:(Class _Nonnull )cls forResource:(nullable NSString*)name{
    NSBundle *bundle = [NSBundle bundleForClass:cls];
    NSURL *url = [bundle URLForResource:name withExtension:@"bundle"];
    if (url) {
        return [NSBundle bundleWithURL:url];
    }
    return NULL;
}

+ (instancetype _Nullable )cd_bundleWithClass:(Class _Nonnull )cls{
    return [NSBundle cd_bundleWithClass:cls forResource:NULL];
}

@end
