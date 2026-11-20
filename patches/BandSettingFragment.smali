.class public Lcom/crrepa/band/my/home/device/BandSettingFragment;
.super Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;
.source "SourceFile"

# interfaces
.implements Lo3/a;
.implements Lo3/b;
.implements Lcom/chad/library/adapter/base/listener/OnItemClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/chad/library/adapter/base/listener/OnItemChildClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment<",
        "Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;",
        ">;",
        "Lo3/a;",
        "Lo3/b;",
        "Lcom/chad/library/adapter/base/listener/OnItemClickListener;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/chad/library/adapter/base/listener/OnItemChildClickListener;"
    }
.end annotation


# static fields
.field private static final HEADER_WATCH_FACE_INDEX:I = 0x1

.field private static final MAX_DEVICE_BATTERY:I = 0x64

.field private static final WATCH_FACE_DELETE_CODE:I = 0x12

.field private static final WATCH_FACE_EDIT_CODE:I = 0x10

.field private static final WATCH_FACE_STORE_CODE:I = 0x11


# instance fields
.field private final bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

.field private batteryWidthSacle:F

.field private cancelRecover:Z

.field private ivBandBattery:Landroid/widget/ImageView;

.field private ivBandScreenshot:Landroid/widget/ImageView;

.field private newBandFirmwareModel:Lcom/crrepa/band/my/model/BandFirmwareModel;

.field private noDoubleClickHelper:Lcom/moyoung/dafit/module/common/utils/b0;

.field private final presenter:Lcom/crrepa/band/my/home/device/presenter/d;

.field private rcvWatchFaceList:Landroidx/recyclerview/widget/RecyclerView;

.field private rlBandBattery:Landroid/widget/RelativeLayout;

.field private tvBandAddress:Landroid/widget/TextView;

.field private tvBandBattery:Landroid/widget/TextView;

.field private tvBandConnectState:Landroid/widget/TextView;

.field private tvBandName:Landroid/widget/TextView;

.field private tvDownloadWatchFaceEdit:Landroid/widget/TextView;

.field private upgradeDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

.field private watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

.field private watchFaceListView:Landroid/view/View;

.field private final watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 10
    .line 11
    new-instance v0, Lcom/crrepa/band/my/home/device/presenter/d;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/crrepa/band/my/home/device/presenter/d;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 17
    .line 18
    new-instance v0, Lcom/crrepa/band/my/home/device/presenter/f;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/crrepa/band/my/home/device/presenter/f;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->batteryWidthSacle:F

    .line 27
    .line 28
    new-instance v0, Lcom/moyoung/dafit/module/common/utils/b0;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/moyoung/dafit/module/common/utils/b0;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->noDoubleClickHelper:Lcom/moyoung/dafit/module/common/utils/b0;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->cancelRecover:Z

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->lambda$showUpgradeDialog$2(Ljava/lang/String;Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    return-void
.end method

.method static synthetic access$000(Lcom/crrepa/band/my/home/device/BandSettingFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->removeBand()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$100(Lcom/crrepa/band/my/home/device/BandSettingFragment;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showRemoveBandDialog(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$200(Lcom/crrepa/band/my/home/device/BandSettingFragment;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$302(Lcom/crrepa/band/my/home/device/BandSettingFragment;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->batteryWidthSacle:F

    .line 2
    .line 3
    return p1
.end method

.method static synthetic access$400(Lcom/crrepa/band/my/home/device/BandSettingFragment;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->setBandBatteryWidth(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->lambda$showUpgradeDialog$1(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    return-void
.end method

.method public static synthetic c(Lcom/crrepa/band/my/home/device/BandSettingFragment;Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->lambda$showUpgradeDialog$0(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    return-void
.end method

.method public static getInstance()Lcom/crrepa/band/my/home/device/BandSettingFragment;
    .locals 1

    .line 1
    new-instance v0, Lcom/crrepa/band/my/home/device/BandSettingFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private hideForcedUpgradeDialog()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->upgradeDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private initSettingList()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->binding:Landroidx/viewbinding/ViewBinding;

    .line 11
    .line 12
    check-cast v1, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;->rcvBandSettingList:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/listener/OnItemClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->binding:Landroidx/viewbinding/ViewBinding;

    .line 25
    .line 26
    check-cast v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;->rcvBandSettingList:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private synthetic lambda$showUpgradeDialog$0(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->startUpgrade()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static synthetic lambda$showUpgradeDialog$1(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static synthetic lambda$showUpgradeDialog$2(Ljava/lang/String;Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/crrepa/band/my/model/band/provider/BandInfoManager;->saveIgnoreFirmwareVersion(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private removeBand()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->resetNewBandFirmwareModel()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/crrepa/band/my/home/device/presenter/d;->removeBand(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->resetWatchFaceProvider()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private resetNewBandFirmwareModel()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->newBandFirmwareModel:Lcom/crrepa/band/my/model/BandFirmwareModel;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Lcom/crrepa/band/my/home/device/presenter/d;->hasNewVersion:Z

    .line 8
    .line 9
    return-void
.end method

.method private sendDisplayWatchFaceIndex(Lcom/chad/library/adapter/base/BaseQuickAdapter;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/crrepa/band/my/model/WatchFaceModel;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getWatchFaceType()Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v0, Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;->WATCH_FACE_AI:Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 16
    .line 17
    if-ne p2, v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/moyoung/dafit/module/common/network/provider/g;->getInstance()Lcom/moyoung/dafit/module/common/network/provider/g;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v0, "sent_ai_picture_path"

    .line 24
    .line 25
    const-string v1, ""

    .line 26
    .line 27
    invoke-virtual {p2, v0, v1}, Lcom/moyoung/dafit/module/common/network/provider/g;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/crrepa/band/my/device/ai/picture/AIPictureActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->isChecked()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-nez p2, :cond_2

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getWatchFaceId()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    invoke-static {p2}, Lcom/crrepa/band/my/model/band/provider/watchface/DefaultWatchFaceProvider;->isEmptyWatchFace(I)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getIndex()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object p2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 75
    .line 76
    invoke-virtual {p2, p1}, Lcom/crrepa/band/my/home/device/presenter/f;->sendDisplayWatchFaceIndex(I)V

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_0
    return-void
.end method

.method private setBandBatteryWidth(I)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-gez p1, :cond_1

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    goto :goto_0

    .line 8
    :cond_1
    const/16 v2, 0x64

    .line 9
    .line 10
    if-ge v2, p1, :cond_0

    .line 11
    .line 12
    const/16 p1, 0x64

    .line 13
    .line 14
    :goto_0
    invoke-static {}, Lcom/crrepa/band/my/ble/band/connect/f;->getInstance()Lcom/crrepa/band/my/ble/band/connect/f;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/crrepa/band/my/ble/band/connect/f;->isConnected()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/16 v3, 0x8

    .line 23
    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    iget-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rlBandBattery:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    const v4, 0x7f0801c0

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 37
    .line 38
    const v1, 0x7f0801c2

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandBattery:Landroid/widget/TextView;

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 51
    .line 52
    const v2, 0x7f0801c1

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandBattery:Landroid/widget/TextView;

    .line 59
    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const v3, 0x7f1307ed

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandBattery:Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rlBandBattery:Landroid/widget/RelativeLayout;

    .line 92
    .line 93
    const v1, 0x7f0801c3

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 100
    .line 101
    const v1, 0x7f0801c4

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandBattery:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    :goto_1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 113
    .line 114
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->batteryWidthSacle:F

    .line 119
    .line 120
    int-to-float p1, p1

    .line 121
    mul-float v1, v1, p1

    .line 122
    .line 123
    float-to-int p1, v1

    .line 124
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 125
    .line 126
    iget-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method private showNormalUpgrade(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_2

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/crrepa/band/my/model/BandSettingItemModel;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/crrepa/band/my/model/BandSettingItemModel;->getType()Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget-object v4, Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;->FIRMWARE_UPGRADE:Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 28
    .line 29
    if-ne v3, v4, :cond_1

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Lcom/crrepa/band/my/model/BandSettingItemModel;->setNewVersion(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    iget-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setNewData(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private showRemoveBandDialog(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const p1, 0x7f1308ae

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->title(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const v0, 0x7f1308ad

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Lcom/crrepa/band/my/home/device/BandSettingFragment$a;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment$a;-><init>(Lcom/crrepa/band/my/home/device/BandSettingFragment;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog$l;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const v0, 0x7f13019c

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->show()Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private showRestoreDialog(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const v1, 0x7f13051a

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->title(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x7f130519

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->content(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->cancelable(Z)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const v1, 0x7f1309d2

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Lcom/crrepa/band/my/home/device/BandSettingFragment$c;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment$c;-><init>(Lcom/crrepa/band/my/home/device/BandSettingFragment;Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog$l;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const v1, 0x7f13019c

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Lcom/crrepa/band/my/home/device/BandSettingFragment$b;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment$b;-><init>(Lcom/crrepa/band/my/home/device/BandSettingFragment;Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog$l;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->show()Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private showUpgradeDialog(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->upgradeDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p3}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    const v0, 0x7f130b83

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    new-instance v0, Lcom/crrepa/band/my/home/device/a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/crrepa/band/my/home/device/a;-><init>(Lcom/crrepa/band/my/home/device/BandSettingFragment;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog$l;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p3, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->cancelable(Z)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p3, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->canceledOnTouchOutside(Z)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    const p1, 0x7f13019c

    .line 57
    .line 58
    .line 59
    invoke-virtual {p3, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Lcom/crrepa/band/my/home/device/b;

    .line 64
    .line 65
    invoke-direct {v0}, Lcom/crrepa/band/my/home/device/b;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog$l;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const v0, 0x7f1307a4

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->neutralText(I)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v0, Lcom/crrepa/band/my/home/device/c;

    .line 80
    .line 81
    invoke-direct {v0, p2}, Lcom/crrepa/band/my/home/device/c;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog$l;)Lcom/afollestad/materialdialogs/MaterialDialog$e;

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-virtual {p3}, Lcom/afollestad/materialdialogs/MaterialDialog$e;->show()Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->upgradeDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 92
    .line 93
    return-void
.end method

.method private startUpgrade()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/crrepa/band/my/home/device/presenter/d;->startForcedUpgrade(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public hideAdView()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->binding:Landroidx/viewbinding/ViewBinding;

    .line 2
    .line 3
    check-cast v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;->ivAdPreview:Landroid/widget/ImageView;

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public hideWatchFaceList()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceListView:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->removeHeaderView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceListView:Landroid/view/View;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public initBinding()V
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->initBinding()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/crrepa/band/my/home/device/presenter/d;->setView(Lo3/a;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/crrepa/band/my/home/device/presenter/f;->setView(Lo3/b;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->initSettingList()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/d;->getHeadView()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onActivityResult requestCode: "

    .line 10
    .line 11
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, ", resultCode: "

    .line 18
    .line 19
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-static {p3}, Lcom/orhanobut/logger/f;->d(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    packed-switch p1, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :pswitch_0
    const/4 p1, -0x1

    .line 37
    if-ne p2, p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/crrepa/band/my/home/device/presenter/f;->getAllWatchFaces()V

    .line 42
    .line 43
    .line 44
    :cond_0
    :goto_0
    return-void

    .line 45
    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const v1, 0x7f0a0132

    .line 13
    .line 14
    .line 15
    if-eq p1, v1, :cond_4

    .line 16
    .line 17
    const v1, 0x7f0a014c

    .line 18
    .line 19
    .line 20
    if-eq p1, v1, :cond_2

    .line 21
    .line 22
    const v1, 0x7f0a0956

    .line 23
    .line 24
    .line 25
    if-eq p1, v1, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-static {v0}, Lcom/crrepa/band/my/device/watchface/DownloadWatchFaceEditActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/16 v0, 0x12

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    iget-boolean p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->cancelRecover:Z

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    new-instance p1, Lcom/crrepa/band/my/model/db/proxy/RecoverDaoProxy;

    .line 43
    .line 44
    invoke-direct {p1}, Lcom/crrepa/band/my/model/db/proxy/RecoverDaoProxy;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/db/proxy/RecoverDaoProxy;->hasRecoverBand()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->cancelRecover:Z

    .line 55
    .line 56
    invoke-direct {p0, v0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showRestoreDialog(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    invoke-direct {p0, v0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showRemoveBandDialog(Landroid/content/Context;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    const-string/jumbo p1, "\u70b9\u51fb\u79fb\u9664\u8bbe\u5907"

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Lcom/moyoung/dafit/module/common/utils/s0;->logEvent(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    const/4 p1, 0x0

    .line 71
    invoke-static {v0, p1}, Lcom/crrepa/band/my/device/scan/BandScanActivity;->getCallingIntent(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 76
    .line 77
    .line 78
    const-string/jumbo p1, "\u70b9\u51fb\u8bbe\u5907\u9875\u6dfb\u52a0\u8bbe\u5907"

    .line 79
    .line 80
    .line 81
    invoke-static {p1}, Lcom/moyoung/dafit/module/common/utils/s0;->logEvent(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/moyoung/dafit/module/common/baseui/BaseFragement;->onDestroyView()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->hideForcedUpgradeDialog()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/d;->destroy()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->destroy()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onItemChildClick(Lcom/chad/library/adapter/base/BaseQuickAdapter;Landroid/view/View;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->sendDisplayWatchFaceIndex(Lcom/chad/library/adapter/base/BaseQuickAdapter;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/crrepa/band/my/model/WatchFaceModel;

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    const v0, 0x7f0a0164

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/16 v2, 0x11

    .line 23
    .line 24
    if-eq p2, v0, :cond_1

    .line 25
    .line 26
    const p1, 0x7f0a0356

    .line 27
    .line 28
    .line 29
    if-eq p2, p1, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Lcom/crrepa/band/my/device/watchface/StoreWatchFaceMainActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getWatchFaceType()Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    sget-object v0, Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;->WATCH_FACE_STORE:Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 47
    .line 48
    if-ne p2, v0, :cond_2

    .line 49
    .line 50
    invoke-static {p0}, Lcom/boultcustom/BoultHook;->showFaceGallerySheet(Landroidx/fragment/app/Fragment;)V

    return-void

    .line 59
    :cond_2
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getWatchFaceType()Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    sget-object v0, Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;->WATCH_FACE_VIDEO:Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 64
    .line 65
    if-ne p2, v0, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getUrl()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p2, p1}, Lcom/crrepa/band/my/device/watchfacenew/video/VideoWatchFaceMainActivity;->getCallingIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getWatchFaceType()Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    sget-object v0, Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;->WATCH_FACE_AI:Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 85
    .line 86
    if-ne p2, v0, :cond_4

    .line 87
    .line 88
    invoke-static {}, Lcom/moyoung/dafit/module/common/network/provider/g;->getInstance()Lcom/moyoung/dafit/module/common/network/provider/g;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string p2, "sent_ai_picture_path"

    .line 93
    .line 94
    const-string p3, ""

    .line 95
    .line 96
    invoke-virtual {p1, p2, p3}, Lcom/moyoung/dafit/module/common/network/provider/g;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Lcom/moyoung/dafit/module/common/utils/x0;->isNotEmpty(Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_6

    .line 105
    .line 106
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p1}, Lcom/crrepa/band/my/device/ai/picture/AIPictureActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    goto :goto_0

    .line 115
    :cond_4
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getWatchFaceType()Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    sget-object v0, Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;->WATCH_FACE_PHOTO:Lcom/crrepa/band/my/model/WatchFaceModel$WatchFaceType;

    .line 120
    .line 121
    if-ne p2, v0, :cond_5

    .line 122
    .line 123
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/WatchFaceModel;->getUrl()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {p2, p1}, Lcom/crrepa/band/my/device/watchfacenew/photo/NewCustomWatchFaceActivity;->getCallingIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    goto :goto_0

    .line 136
    :cond_5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {p1, p3}, Lcom/crrepa/band/my/device/watchface/WatchFaceEditActivity;->getCallingIntent(Landroid/content/Context;I)Landroid/content/Intent;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const/16 v2, 0x10

    .line 145
    .line 146
    :cond_6
    :goto_0
    if-eqz v1, :cond_7

    .line 147
    .line 148
    invoke-virtual {p0, v1, v2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 149
    .line 150
    .line 151
    :cond_7
    return-void
.end method

.method public onItemClick(Lcom/chad/library/adapter/base/BaseQuickAdapter;Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->noDoubleClickHelper:Lcom/moyoung/dafit/module/common/utils/b0;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/moyoung/dafit/module/common/utils/b0;->isDoubleClick()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    instance-of p2, p1, Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 11
    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/crrepa/band/my/model/BandSettingItemModel;

    .line 23
    .line 24
    sget-object p2, Lcom/crrepa/band/my/home/device/BandSettingFragment$f;->$SwitchMap$com$crrepa$band$my$model$BandSettingItemModel$SettingType:[I

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/BandSettingItemModel;->getType()Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    aget p2, p2, p3

    .line 35
    .line 36
    packed-switch p2, :pswitch_data_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p2}, Lcom/crrepa/band/my/device/cricket/CricketActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :pswitch_1
    invoke-static {}, Lcom/crrepa/band/my/model/band/provider/BandCalendarEventProvider;->getCalendarEventState()Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p2}, Lcom/crrepa/band/my/device/calendar/CalendarEventActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {p2}, Lcom/crrepa/band/my/device/calendar/CalendarSyncActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    goto/16 :goto_0

    .line 75
    .line 76
    :pswitch_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-static {p2}, Lcom/crrepa/band/my/device/ecard/ECardActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :pswitch_3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-static {p2}, Lcom/crrepa/band/my/device/pillreminder/PillReminderActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :pswitch_4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-static {p2}, Lcom/crrepa/band/my/device/contact/QuickContactActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    goto/16 :goto_0

    .line 105
    .line 106
    :pswitch_5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    iget-object p3, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->newBandFirmwareModel:Lcom/crrepa/band/my/model/BandFirmwareModel;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    invoke-static {p2, p3, v0}, Lcom/crrepa/band/my/device/ota/BandUpgradeActivity;->getCallingIntent(Landroid/content/Context;Lcom/crrepa/band/my/model/BandFirmwareModel;Z)Landroid/content/Intent;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    goto/16 :goto_0

    .line 118
    .line 119
    :pswitch_6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-static {p2}, Lcom/crrepa/band/my/device/setting/other/BandOtherSettingActivity;->getCallIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    goto/16 :goto_0

    .line 128
    .line 129
    :pswitch_7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-static {p2}, Lcom/crrepa/band/my/device/switchui/BandFunctionActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :pswitch_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-static {p2}, Lcom/crrepa/band/my/device/camera/GoogleCameraActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :pswitch_9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-static {p2}, Lcom/crrepa/band/my/device/stock/StockSettingActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    goto :goto_0

    .line 158
    :pswitch_a
    new-instance p2, Landroid/content/Intent;

    .line 159
    .line 160
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    const-class v0, Lcom/crrepa/band/my/device/customkey/activity/CustomKeyHomeActivity;

    .line 165
    .line 166
    invoke-direct {p2, p3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :pswitch_b
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    invoke-static {p2}, Lcom/crrepa/band/my/device/worldclock/WorldClockActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    goto :goto_0

    .line 179
    :pswitch_c
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    invoke-static {p2}, Lcom/crrepa/band/my/device/muslim/MuslimHomeActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    goto :goto_0

    .line 188
    :pswitch_d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-static {p2}, Lcom/crrepa/band/my/device/alarm/BandAlarmActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    goto :goto_0

    .line 197
    :pswitch_e
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-static {p2}, Lcom/crrepa/band/my/device/localphoto/LocalPhotoMainActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    goto :goto_0

    .line 206
    :pswitch_f
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-static {p2}, Lcom/crrepa/band/my/device/localvideo/LocalVideoMainActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    goto :goto_0

    .line 215
    :pswitch_10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-static {p2}, Lcom/crrepa/band/my/device/localmusic/LocalMusicMainActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 220
    .line 221
    .line 222
    move-result-object p2

    .line 223
    goto :goto_0

    .line 224
    :pswitch_11
    iget-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/crrepa/band/my/home/device/presenter/d;->findDevice()V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :pswitch_12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    invoke-static {p2}, Lcom/crrepa/band/my/device/pushmessage/BandNotificationActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 235
    .line 236
    .line 237
    move-result-object p2

    .line 238
    goto :goto_0

    .line 239
    :pswitch_13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    invoke-static {p2}, Lcom/crrepa/band/my/device/ai/chat/AIChatActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 244
    .line 245
    .line 246
    move-result-object p2

    .line 247
    goto :goto_0

    .line 248
    :pswitch_14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 249
    .line 250
    .line 251
    move-result-object p2

    .line 252
    invoke-static {p2}, Lcom/crrepa/band/my/device/appmarket/AppMarketMainActivity;->getCallingIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 257
    .line 258
    .line 259
    move-result-object p3

    .line 260
    invoke-virtual {p3, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/BandSettingItemModel;->getType()Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    sget-object p2, Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;->CAMERA_CONTROL:Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 268
    .line 269
    if-ne p1, p2, :cond_3

    .line 270
    .line 271
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    const p2, 0x7f01000c

    .line 276
    .line 277
    .line 278
    const p3, 0x7f01000d

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1, p2, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 282
    .line 283
    .line 284
    goto :goto_1

    .line 285
    :cond_2
    invoke-direct {p0, p1, p3}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->sendDisplayWatchFaceIndex(Lcom/chad/library/adapter/base/BaseQuickAdapter;I)V

    .line 286
    .line 287
    .line 288
    :cond_3
    :goto_1
    return-void

    .line 289
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onLazyInitView(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/moyoung/dafit/module/common/baseui/BaseFragement;->onLazyInitView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/crrepa/band/my/home/device/presenter/d;->getSettingList()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/moyoung/dafit/module/common/baseui/BaseFragement;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/d;->pause()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->pause()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->presenter:Lcom/crrepa/band/my/home/device/presenter/d;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/d;->resume()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->resume()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public renderAdView(Lcom/squareup/picasso/v;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->binding:Landroidx/viewbinding/ViewBinding;

    .line 2
    .line 3
    check-cast v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;->ivAdPreview:Landroid/widget/ImageView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/squareup/picasso/v;->fit()Lcom/squareup/picasso/v;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->binding:Landroidx/viewbinding/ViewBinding;

    .line 16
    .line 17
    check-cast v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;->ivAdPreview:Landroid/widget/ImageView;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/squareup/picasso/v;->into(Landroid/widget/ImageView;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->binding:Landroidx/viewbinding/ViewBinding;

    .line 25
    .line 26
    check-cast p1, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/crrepa/band/my/databinding/FragmentBandSettingBinding;->ivAdPreview:Landroid/widget/ImageView;

    .line 29
    .line 30
    new-instance v0, Lcom/crrepa/band/my/home/device/BandSettingFragment$d;

    .line 31
    .line 32
    invoke-direct {v0, p0, p2}, Lcom/crrepa/band/my/home/device/BandSettingFragment$d;-><init>(Lcom/crrepa/band/my/home/device/BandSettingFragment;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public renderBandAddress(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandAddress:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public renderBandBattery(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandBattery:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->batteryWidthSacle:F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    cmpg-float v0, v0, v1

    .line 10
    .line 11
    if-gtz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/crrepa/band/my/home/device/BandSettingFragment$e;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment$e;-><init>(Lcom/crrepa/band/my/home/device/BandSettingFragment;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-direct {p0, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->setBandBatteryWidth(I)V

    .line 29
    .line 30
    .line 31
    :goto_0
    return-void
.end method

.method public renderBandConnectState(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0xa

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const p1, 0x7f130158

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const p1, 0x7f13016c

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const p1, 0x7f130157

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    const p1, 0x7f130159

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandConnectState:Landroid/widget/TextView;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 30
    .line 31
    .line 32
    :cond_3
    invoke-static {}, Lcom/crrepa/band/my/profile/userinfo/presenter/b;->logUserInfoEvent()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public renderBandDisconnectedHint()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f13011b

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Lcom/moyoung/dafit/module/common/utils/r0;->showLong(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public renderBandInfoView()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0d0152

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x7f0a014c

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/Button;

    .line 21
    .line 22
    const v2, 0x7f0a08e3

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/TextView;

    .line 30
    .line 31
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandName:Landroid/widget/TextView;

    .line 32
    .line 33
    const v2, 0x7f0a08e0

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Landroid/widget/TextView;

    .line 41
    .line 42
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandAddress:Landroid/widget/TextView;

    .line 43
    .line 44
    const v2, 0x7f0a08e2

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Landroid/widget/TextView;

    .line 52
    .line 53
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandConnectState:Landroid/widget/TextView;

    .line 54
    .line 55
    const v2, 0x7f0a08e1

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Landroid/widget/TextView;

    .line 63
    .line 64
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandBattery:Landroid/widget/TextView;

    .line 65
    .line 66
    const v2, 0x7f0a0361

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroid/widget/ImageView;

    .line 74
    .line 75
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandBattery:Landroid/widget/ImageView;

    .line 76
    .line 77
    const v2, 0x7f0a065f

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 85
    .line 86
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rlBandBattery:Landroid/widget/RelativeLayout;

    .line 87
    .line 88
    const v2, 0x7f0a0362

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Landroid/widget/ImageView;

    .line 96
    .line 97
    iput-object v2, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandScreenshot:Landroid/widget/ImageView;

    .line 98
    .line 99
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setHeaderView(Landroid/view/View;)I

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public renderBandName(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvBandName:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public renderBandScreenshot(Lcom/crrepa/band/my/model/band/BaseBandModel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandScreenshot:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivBandScreenshot:Landroid/widget/ImageView;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/crrepa/band/my/model/band/BaseBandModel;->setBandSnapshot(Landroid/widget/ImageView;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public renderBandSettingList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/crrepa/band/my/model/BandSettingItemModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setNewData(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public renderBandUpgradeComplete()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showNormalUpgrade(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->resetNewBandFirmwareModel()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->hideForcedUpgradeDialog()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public renderDisplayWatchFaceIndex(I)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "showWatchFaceDisplayIndex: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/orhanobut/logger/f;->d(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_5

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const/4 v1, 0x0

    .line 40
    const/4 v2, 0x0

    .line 41
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-ge v2, v3, :cond_4

    .line 46
    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lcom/crrepa/band/my/model/WatchFaceModel;

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/crrepa/band/my/model/WatchFaceModel;->getIndex()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    const/4 v5, 0x1

    .line 58
    if-ne v4, p1, :cond_2

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/crrepa/band/my/model/WatchFaceModel;->isChecked()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-nez v6, :cond_2

    .line 65
    .line 66
    invoke-virtual {v3, v5}, Lcom/crrepa/band/my/model/WatchFaceModel;->setChecked(Z)V

    .line 67
    .line 68
    .line 69
    iget-object v6, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 70
    .line 71
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    invoke-virtual {v6, v2, v7}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    invoke-virtual {v3}, Lcom/crrepa/band/my/model/WatchFaceModel;->isChecked()Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_3

    .line 83
    .line 84
    if-eq v4, p1, :cond_3

    .line 85
    .line 86
    invoke-virtual {v3, v1}, Lcom/crrepa/band/my/model/WatchFaceModel;->setChecked(Z)V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 90
    .line 91
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v3, v2, v4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 102
    .line 103
    invoke-virtual {v0, p1}, Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;->setDisplayWatchFaceIndex(I)V

    .line 104
    .line 105
    .line 106
    :cond_5
    :goto_1
    return-void
.end method

.method public renderDownloadWatchFaceEdit(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvDownloadWatchFaceEdit:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/16 p1, 0x8

    .line 10
    .line 11
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public renderLowBatteryHint()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1306af

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Lcom/moyoung/dafit/module/common/utils/r0;->showLong(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public renderNetErrorHint()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f130795

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Lcom/moyoung/dafit/module/common/utils/r0;->showLong(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public renderNewFirmwareVersion(Lcom/crrepa/band/my/model/BandFirmwareModel;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->newBandFirmwareModel:Lcom/crrepa/band/my/model/BandFirmwareModel;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/BandFirmwareModel;->getType()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/BandFirmwareModel;->getVersion()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, Lcom/crrepa/band/my/model/BandFirmwareModel;->getChangeNote()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v2, 0x1

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0, v2}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showNormalUpgrade(Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v3, 0x2

    .line 26
    if-ne v0, v3, :cond_2

    .line 27
    .line 28
    invoke-direct {p0, v2, v1, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showUpgradeDialog(ZLjava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 v3, 0x3

    .line 33
    if-ne v0, v3, :cond_3

    .line 34
    .line 35
    invoke-direct {p0, v2}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showNormalUpgrade(Z)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/crrepa/band/my/model/band/provider/BandInfoManager;->getIgnoreFirmwareVersion()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_4

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, v0, v1, p1}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->showUpgradeDialog(ZLjava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    invoke-direct {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->resetNewBandFirmwareModel()V

    .line 54
    .line 55
    .line 56
    :cond_4
    :goto_0
    return-void
.end method

.method public renderNotBandView()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0d0154

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x7f0a0132

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/Button;

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setHeaderView(Landroid/view/View;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public renderUpdateDisplayWatchFaceError()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f13011b

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Lcom/moyoung/dafit/module/common/utils/r0;->showLong(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public renderWatchFaceList()V
    .locals 5

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceListView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0155

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceListView:Landroid/view/View;

    const v1, 0x7f0a062c

    .line 2
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rcvWatchFaceList:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceListView:Landroid/view/View;

    const v1, 0x7f0a0956

    .line 3
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->tvDownloadWatchFaceEdit:Landroid/widget/TextView;

    .line 4
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceListView:Landroid/view/View;

    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setHeaderView(Landroid/view/View;I)I

    :cond_0
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    if-nez v0, :cond_1

    .line 6
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rcvWatchFaceList:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rcvWatchFaceList:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    new-instance v1, Lcom/moyoung/dafit/module/common/widgets/decoration/SpacesItemDecoration;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v2, v3}, Lcom/moyoung/dafit/module/common/utils/o;->dp2px(Landroid/content/Context;F)I

    move-result v2

    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-static {v3, v4}, Lcom/moyoung/dafit/module/common/utils/o;->dp2px(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/moyoung/dafit/module/common/widgets/decoration/SpacesItemDecoration;-><init>(II)V

    .line 10
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 11
    new-instance v0, Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    invoke-direct {v0}, Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;-><init>()V

    iput-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->rcvWatchFaceList:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 13
    invoke-virtual {v0, p0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setOnItemChildClickListener(Lcom/chad/library/adapter/base/listener/OnItemChildClickListener;)V

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 14
    invoke-virtual {v0, p0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/listener/OnItemClickListener;)V

    :cond_1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 15
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->getAllWatchFaces()V

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 16
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->getWatchFaceStore()V

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 17
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->getLocalDisplayWatchFaceIndex()V

    return-void
.end method

.method public renderWatchFaceList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/crrepa/band/my/model/WatchFaceModel;",
            ">;)V"
        }
    .end annotation

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WatchFace List size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "watchFaceListView"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    if-eqz v0, :cond_0

    .line 19
    invoke-virtual {v0, p1}, Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;->setNewData(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public resetWatchFaceList()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFacePresenter:Lcom/crrepa/band/my/home/device/presenter/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/presenter/f;->resetWatchFaceProvider()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->watchFaceAdapter:Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/crrepa/band/my/home/device/adapter/WatchFaceAdapter;->resetBandInfo()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/moyoung/dafit/module/common/baseui/BaseVBFragment;->setUserVisibleHint(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-static {p0}, Lcom/moyoung/dafit/module/common/utils/s0;->logFragmentView(Landroidx/fragment/app/Fragment;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public showCustomerServiceUnreadNews(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_2

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/crrepa/band/my/model/BandSettingItemModel;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/crrepa/band/my/model/BandSettingItemModel;->getType()Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget-object v4, Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;->CUSTOMER_SERVICE:Lcom/crrepa/band/my/model/BandSettingItemModel$SettingType;

    .line 28
    .line 29
    if-ne v3, v4, :cond_1

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Lcom/crrepa/band/my/model/BandSettingItemModel;->setNewVersion(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    iget-object p1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->bandSettingAdapter:Lcom/crrepa/band/my/home/device/adapter/BandSettingAdapter;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setNewData(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public startUpgradeActivity()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->newBandFirmwareModel:Lcom/crrepa/band/my/model/BandFirmwareModel;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v0, v1, v2}, Lcom/crrepa/band/my/device/ota/BandUpgradeActivity;->getCallingIntent(Landroid/content/Context;Lcom/crrepa/band/my/model/BandFirmwareModel;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
