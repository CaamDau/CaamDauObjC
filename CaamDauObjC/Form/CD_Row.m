

#import "CD_Row.h"

@interface CD_Row()
@property(nonatomic, copy, readwrite) NSString *identifier;
@end

@implementation CD_Row
- (void)setSize:(CGSize)size{
    self.frame = CGRectMake(0, 0, size.width, size.height);
}
- (CGSize)size{
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}
- (void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(0, 0, 0, height);
}
- (CGFloat)height{
    return self.frame.size.height;
}

- (NSString *)bundleFrom {
    if (!_bundleFrom) {
        _bundleFrom = @"";
    }
    return _bundleFrom;
}

- (instancetype)initWithViewClass:(Class)cls then:(void (^)(__weak CD_Row * _Nonnull obj))then {
    if (self = [super init]) {
        self.viewClass = cls;
        if (then) {
            then(self);
        }
    }
    return self;
}
+ (instancetype)rowWithViewClass:(Class)cls then:(void (^)(__weak CD_Row * _Nonnull obj))then {
    return [[CD_Row alloc] initWithViewClass:cls then:then];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)bindView:(UIView *)view {
    if (![view conformsToProtocol:@protocol(CD_RowDelegate)]) {
        return;
    }
    
    if ([view respondsToSelector:@selector(row_updateConfig:)]) {
        [view performSelector:@selector(row_updateConfig:) withObject:self.config];
    }
    
    if ([view respondsToSelector:@selector(row_updateViewData:)]) {
        [view performSelector:@selector(row_updateViewData:) withObject:self.viewData];
    }
    
    if (self.callback && [view respondsToSelector:@selector(row_callback:)])
    {
        [view performSelector:@selector(row_callback:) withObject:self.callback];
    }
}

- (NSString *)identifier {
    return _identifier ? _identifier : NSStringFromClass(self.viewClass);
}
@end
