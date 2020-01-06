//Created  on 2020/1/4 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




#import "R_Home.h"
#import "VC_TableViewForm.h"
#import <CaamDauObjC/CaamDauObjC.h>
@implementation R_Home
+ (void)tableViewForm{
    UIViewController *vc = [VC_TableViewForm cd_storyboard:@"HomeStoryboard" bundleForm:@"Home"];
    UIViewController *svc = CD_VC;
    [[svc navigationController] pushViewController:vc animated:YES];
}
@end
