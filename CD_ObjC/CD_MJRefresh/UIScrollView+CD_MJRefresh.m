///Created  on 2018/3/5  by LCD :https://github.com/liucaide .

#import "UIScrollView+CD_MJRefresh.h"

@implementation UIScrollView (CD_MJRefresh)

- (void)setCd_mjRefreshModel:(CD_MJRefreshModel *)cd_mjRefreshModel{
    objc_setAssociatedObject(self, @selector(cd_mjRefreshModel), cd_mjRefreshModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CD_MJRefreshModel *)cd_mjRefreshModel{
    CD_MJRefreshModel * model = objc_getAssociatedObject(self, _cmd);
    if (model == nil){
        model = [CD_MJRefreshModel new];
        [self setCd_mjRefreshModel:model];
    }
    return model;
}

#pragma mark ----- 下拉 -----
- (void)cd_headerAddMJRefresh:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshNormalHeader * refresh = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    [self cd_header:refresh model:self.cd_mjRefreshModel];
    self.mj_header = refresh;
}

- (void)cd_headerAddMJRefreshGif:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshGifHeader * refresh = [MJRefreshGifHeader headerWithRefreshingBlock:block];
    [self cd_headerImages:refresh model:self.cd_mjRefreshModel];
    [self cd_header:refresh model:self.cd_mjRefreshModel];
    self.mj_header = refresh;
}

- (void)cd_headerAddMJRefresh:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshNormalHeader * refresh = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    [self cd_header:refresh model:model];
    self.mj_header = refresh;
}

- (void)cd_headerAddMJRefreshGif:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshGifHeader * refresh = [MJRefreshGifHeader headerWithRefreshingBlock:block];
    [self cd_headerImages:refresh model:self.cd_mjRefreshModel];
    [self cd_header:refresh model:self.cd_mjRefreshModel];
    self.mj_header = refresh;
}

- (void)cd_headerImages:(MJRefreshGifHeader*)mj model:(CD_MJRefreshModel*)model{
    [mj setImages:model.down_imgIdle forState:MJRefreshStateIdle];
    [mj setImages:model.down_imgPulling forState:MJRefreshStatePulling];
    [mj setImages:model.down_imgWillRefresh forState:MJRefreshStateWillRefresh];
    [mj setImages:model.down_imgRefreshing forState:MJRefreshStateRefreshing];
    [mj setImages:model.down_imgNoMoreData forState:MJRefreshStateNoMoreData];
}
- (void)cd_header:(MJRefreshStateHeader*)mj model:(CD_MJRefreshModel*)model{
    mj.stateLabel.hidden = model.down_txtHidden;
    mj.lastUpdatedTimeLabel.hidden = model.down_timeHidden;
    mj.labelLeftInset = model.down_leftInset;
    if (!model.down_txtHidden) {
        [mj setTitle:model.down_txtIdle forState:MJRefreshStateIdle];
        [mj setTitle:model.down_txtPulling forState:MJRefreshStatePulling];
        [mj setTitle:model.down_txtWillRefresh forState:MJRefreshStateWillRefresh];
        [mj setTitle:model.down_txtRefreshing forState:MJRefreshStateRefreshing];
        [mj setTitle:model.down_txtNoMoreData forState:MJRefreshStateNoMoreData];
        mj.stateLabel.font = model.down_txtFont;
        mj.stateLabel.textColor = model.down_txtColor;
    }
    if (!model.down_timeHidden) {
        mj.lastUpdatedTimeLabel.font = model.down_timeFont;
        mj.lastUpdatedTimeLabel.textColor = model.down_timeColor;
    }
    mj.ignoredScrollViewContentInsetTop = model.ignoredContentInsetTop;
}
#pragma mark ----- 上拉加载 -----
- (void)cd_footerAddMJRefreshAuto:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshAutoNormalFooter * mj = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
    [self cd_footerAuto:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshBack:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshBackNormalFooter * mj = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
    [self cd_footerBack:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshGifAuto:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshAutoGifFooter * mj = [MJRefreshAutoGifFooter footerWithRefreshingBlock:block];
    [self cd_footerImagesAuto:mj model:self.cd_mjRefreshModel];
    [self cd_footerAuto:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshGifBack:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshBackGifFooter * mj = [MJRefreshBackGifFooter footerWithRefreshingBlock:block];
    [self cd_footerImagesBack:mj model:self.cd_mjRefreshModel];
    [self cd_footerBack:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}
- (void)cd_footerAddMJRefreshAuto:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshAutoNormalFooter * mj = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
    [self cd_footerAuto:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}
- (void)cd_footerAddMJRefreshBack:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshBackNormalFooter * mj = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
    [self cd_footerBack:mj model:model];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshGifAuto:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshAutoGifFooter * mj = [MJRefreshAutoGifFooter footerWithRefreshingBlock:block];
    [self cd_footerImagesAuto:mj model:model];
    [self cd_footerAuto:mj model:model];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshGifBack:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshBackGifFooter * mj = [MJRefreshBackGifFooter footerWithRefreshingBlock:block];
    [self cd_footerImagesBack:mj model:model];
    [self cd_footerBack:mj model:model];
    self.mj_footer = mj;
}


- (void)cd_footerImagesBack:(MJRefreshBackGifFooter*)mj model:(CD_MJRefreshModel*)model{
    [mj setImages:model.up_imgIdle forState:MJRefreshStateIdle];
    [mj setImages:model.up_imgPulling forState:MJRefreshStatePulling];
    [mj setImages:model.up_imgWillRefresh forState:MJRefreshStateWillRefresh];
    [mj setImages:model.up_imgRefreshing forState:MJRefreshStateRefreshing];
    [mj setImages:model.up_imgNoMoreData forState:MJRefreshStateNoMoreData];
}
- (void)cd_footerImagesAuto:(MJRefreshAutoGifFooter*)mj model:(CD_MJRefreshModel*)model{
    [mj setImages:model.up_imgIdle forState:MJRefreshStateIdle];
    [mj setImages:model.up_imgPulling forState:MJRefreshStatePulling];
    [mj setImages:model.up_imgWillRefresh forState:MJRefreshStateWillRefresh];
    [mj setImages:model.up_imgRefreshing forState:MJRefreshStateRefreshing];
    [mj setImages:model.up_imgNoMoreData forState:MJRefreshStateNoMoreData];
}

- (void)cd_footerBack:(MJRefreshBackStateFooter*)mj model:(CD_MJRefreshModel*)model{
    
    mj.stateLabel.hidden = model.up_txtHidden;
    mj.labelLeftInset = model.up_leftInset;
    if (!model.up_txtHidden) {
        [mj setTitle:model.up_txtIdle forState:MJRefreshStateIdle];
        [mj setTitle:model.up_txtPulling forState:MJRefreshStatePulling];
        [mj setTitle:model.up_txtWillRefresh forState:MJRefreshStateWillRefresh];
        [mj setTitle:model.up_txtRefreshing forState:MJRefreshStateRefreshing];
        [mj setTitle:model.up_txtNoMoreData forState:MJRefreshStateNoMoreData];
        mj.stateLabel.font = model.up_txtFont;
        mj.stateLabel.textColor = model.up_txtColor;
    }
}
- (void)cd_footerAuto:(MJRefreshAutoStateFooter*)mj model:(CD_MJRefreshModel*)model{
    mj.refreshingTitleHidden = model.up_txtHidden;
    mj.stateLabel.hidden = model.up_txtHidden;
    mj.labelLeftInset = model.up_leftInset;
    if (!model.up_txtHidden) {
        [mj setTitle:model.up_txtIdle forState:MJRefreshStateIdle];
        [mj setTitle:model.up_txtPulling forState:MJRefreshStatePulling];
        [mj setTitle:model.up_txtWillRefresh forState:MJRefreshStateWillRefresh];
        [mj setTitle:model.up_txtRefreshing forState:MJRefreshStateRefreshing];
        [mj setTitle:model.up_txtNoMoreData forState:MJRefreshStateNoMoreData];
        mj.stateLabel.font = model.up_txtFont;
        mj.stateLabel.textColor = model.up_txtColor;
    }
    mj.automaticallyRefresh = model.isAutoRefresh;
    mj.ignoredScrollViewContentInsetBottom = model.ignoredContentInsetBottom;
    mj.triggerAutomaticallyRefreshPercent = model.autoRefreshPercent;
    mj.onlyRefreshPerDrag = model.onlyRefreshPerDrag;
}



#pragma mark ----- Function 其他 -----
- (void)cd_beginRefreshing{
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
    }
    [self.mj_header beginRefreshing];
}
- (void)cd_endRefreshing{
    if (self.mj_header) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer) {
        [self.mj_footer endRefreshing];
    }
}

- (void)cd_endRefreshingWithNoMoreData{
    if (self.mj_header) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
}
- (void)cd_footResetNoMoreData{
    if (self.mj_footer) {
        [self.mj_footer resetNoMoreData];
    }
    
}
- (void)cd_footHidden:(BOOL)hidden{
    if (self.mj_footer) {
        [self.mj_footer setHidden:hidden];
    }
}

- (void)cd_mjRefreshTypes:(NSArray<NSNumber*>*)types{
    for (NSNumber* type in types) {
        switch ([type integerValue]) {
            case CD_MJRefreshTypeBegin:
                [self cd_beginRefreshing];
                break;
            case CD_MJRefreshTypeEnd:
                [self cd_endRefreshing];
                break;
            case CD_MJRefreshTypeNoMoreData:
                [self cd_endRefreshingWithNoMoreData];
                break;
            case CD_MJRefreshTypeReset:
                [self cd_footResetNoMoreData];
                break;
            case CD_MJRefreshTypeHiddenFoot:
                [self cd_footHidden:YES];
                break;
            case CD_MJRefreshTypeShowFoot:
                [self cd_footHidden:NO];
                break;
            default:
                break;
        }
    }
}
@end

