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
    [mj setImages:model.imagesIdleDown forState:MJRefreshStateIdle];
    [mj setImages:model.imagesPullingDown forState:MJRefreshStatePulling];
    [mj setImages:model.imagesRefreshingDown forState:MJRefreshStateRefreshing];
    [mj setImages:model.imagesNoMoreDataDown forState:MJRefreshStateNoMoreData];
}
- (void)cd_header:(MJRefreshStateHeader*)mj model:(CD_MJRefreshModel*)model{
    mj.stateLabel.hidden = model.labelHiddenDown;
    mj.lastUpdatedTimeLabel.hidden = model.timeLabelHidden;
    if (!model.labelHiddenDown) {
        [mj setTitle:model.titleIdleDown forState:MJRefreshStateIdle];
        [mj setTitle:model.titlePullingDown forState:MJRefreshStatePulling];
        [mj setTitle:model.titleRefreshingDown forState:MJRefreshStateRefreshing];
        [mj setTitle:model.titleNoMoreDataDown forState:MJRefreshStateNoMoreData];
        mj.stateLabel.font = model.labelFont;
        mj.stateLabel.textColor = model.labelColor;
    }
    if (!model.timeLabelHidden) {
        mj.lastUpdatedTimeLabel.font = model.labelFont;
        mj.lastUpdatedTimeLabel.textColor = model.labelColor;
    }
    mj.labelLeftInset = model.labelLeftInset;
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
    CD_MJRefreshModel * manage = self.cd_mjRefreshModel;
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
    [self cd_footerBack:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshGifAuto:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshAutoGifFooter * mj = [MJRefreshAutoGifFooter footerWithRefreshingBlock:block];
    CD_MJRefreshModel * manage = self.cd_mjRefreshModel;
    [self cd_footerImagesAuto:mj model:self.cd_mjRefreshModel];
    [self cd_footerAuto:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}

- (void)cd_footerAddMJRefreshGifBack:(CD_MJRefreshModel*)model block:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshBackGifFooter * mj = [MJRefreshBackGifFooter footerWithRefreshingBlock:block];
    [self cd_footerImagesBack:mj model:self.cd_mjRefreshModel];
    [self cd_footerBack:mj model:self.cd_mjRefreshModel];
    self.mj_footer = mj;
}


- (void)cd_footerImagesBack:(MJRefreshBackGifFooter*)mj model:(CD_MJRefreshModel*)model{
    [mj setImages:model.imagesIdleUp forState:MJRefreshStateIdle];
    [mj setImages:model.imagesPullingUp forState:MJRefreshStatePulling];
    [mj setImages:model.imagesRefreshingUp forState:MJRefreshStateRefreshing];
    [mj setImages:model.imagesNoMoreDataUp forState:MJRefreshStateNoMoreData];
}
- (void)cd_footerImagesAuto:(MJRefreshAutoGifFooter*)mj model:(CD_MJRefreshModel*)model{
    [mj setImages:model.imagesIdleUp forState:MJRefreshStateIdle];
    [mj setImages:model.imagesPullingUp forState:MJRefreshStatePulling];
    [mj setImages:model.imagesRefreshingUp forState:MJRefreshStateRefreshing];
    [mj setImages:model.imagesNoMoreDataUp forState:MJRefreshStateNoMoreData];
}

- (void)cd_footerBack:(MJRefreshBackStateFooter*)mj model:(CD_MJRefreshModel*)model{
    CD_MJRefreshModel * manage = self.cd_mjRefreshModel;
    mj.stateLabel.hidden = manage.labelHiddenUp;
    if (!manage.labelHiddenUp) {
        [mj setTitle:manage.titleIdleUp forState:MJRefreshStateIdle];
        [mj setTitle:manage.titlePullingUp forState:MJRefreshStatePulling];
        [mj setTitle:manage.titleRefreshingUp forState:MJRefreshStateRefreshing];
        [mj setTitle:manage.titleNoMoreDataUp forState:MJRefreshStateNoMoreData];
        mj.stateLabel.font = manage.labelFont;
        mj.stateLabel.textColor = manage.labelColor;
    }
    mj.labelLeftInset = manage.labelLeftInset;
}
- (void)cd_footerAuto:(MJRefreshAutoStateFooter*)mj model:(CD_MJRefreshModel*)model{
    
    mj.stateLabel.hidden = model.labelHiddenUp;
    if (!model.labelHiddenUp) {
        [mj setTitle:model.titleIdleUp forState:MJRefreshStateIdle];
        [mj setTitle:model.titlePullingUp forState:MJRefreshStatePulling];
        [mj setTitle:model.titleRefreshingUp forState:MJRefreshStateRefreshing];
        [mj setTitle:model.titleNoMoreDataUp forState:MJRefreshStateNoMoreData];
        mj.stateLabel.font = model.labelFont;
        mj.stateLabel.textColor = model.labelColor;
    }
    mj.labelLeftInset = model.labelLeftInset;
    mj.automaticallyRefresh = model.automaticallyRefresh;
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

