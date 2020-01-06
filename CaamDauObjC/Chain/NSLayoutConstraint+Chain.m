

#import "NSLayoutConstraint+Chain.h"

@implementation NSLayoutConstraint (Chain)
- (NSLayoutConstraint * (^)(CGFloat ))cd_constant{
    return ^(CGFloat a){
        self.constant = a;
        return self;
    };
}
@end
