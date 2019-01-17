

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
    
    
- (instancetype)initWithViewClass:(Class)cls {
    if (self = [self initWithViewClass:cls viewData:@""]) {
        
    }
    return self;
}

- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData{
    if (self = [self initWithViewClass:cls viewData:viewData size:CGSizeMake(45, 45)]) {
    }
    return self;
}

- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData size:(CGSize)size {
    if (self = [super init]) {
        self.cellClass = cls;
        self.viewData = viewData;
        self.size = size;
    }
    return self;
}
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData frame:(CGRect)frame{
    if (self = [super init]) {
        self.cellClass = cls;
        self.viewData = viewData;
        self.frame = frame;
    }
    return self;
}
- (instancetype)initWithViewClass:(Class)cls viewData:(id)viewData height:(CGFloat)height{
    if (self = [super init]) {
        self.cellClass = cls;
        self.viewData = viewData;
        self.height = height;
    }
    return self;
}
    
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tag = 0;
    }
    return self;
}
    
- (void)updateView:(UIView *)view {
    if ([view respondsToSelector:@selector(row_updateViewData:)]) {
        __weak typeof(self.viewData) weakViewData = self.viewData;
        [view performSelector:@selector(row_updateViewData:) withObject:weakViewData];
    }
    else if ([view respondsToSelector:@selector(row_updateViewData:tag:)])
    {
        __weak typeof(self.viewData) weakViewData = self.viewData;
        [view performSelector:@selector(row_updateViewData:tag:) withObject:weakViewData withObject:@(self.tag)];
    }
}

- (NSString *)identifier {
    return _identifier ? _identifier : NSStringFromClass(self.cellClass);
}
@end
