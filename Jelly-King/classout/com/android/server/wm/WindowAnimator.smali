.class public Lcom/android/server/wm/WindowAnimator;
.super Ljava/lang/Object;
.source "WindowAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/wm/WindowAnimator$SetAnimationParams;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WindowAnimator"

.field static final WALLPAPER_ACTION_PENDING:I = 0x1


# instance fields
.field mAdjResult:I

.field private mAnimTransactionSequence:I

.field mAnimating:Z

.field mBulkUpdateParams:I

.field final mContext:Landroid/content/Context;

.field mCurrentFocus:Lcom/android/server/wm/WindowState;

.field mCurrentTime:J

.field mDetachedWallpaper:Lcom/android/server/wm/WindowState;

.field mDh:I

.field mDimAnimator:Lcom/android/server/wm/DimAnimator;

.field mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

.field mDw:I

.field mForceHiding:Z

.field mInnerDh:I

.field mInnerDw:I

.field mPendingActions:I

.field mPendingLayoutChanges:I

.field final mPolicy:Landroid/view/WindowManagerPolicy;

.field mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

.field final mService:Lcom/android/server/wm/WindowManagerService;

.field mWinAnimators:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/WindowStateAnimator;",
            ">;"
        }
    .end annotation
.end field

.field mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

.field mWindowAnimationBackgroundColor:I

.field mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

.field mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;


# direct methods
.method constructor <init>(Lcom/android/server/wm/WindowManagerService;Landroid/content/Context;Landroid/view/WindowManagerPolicy;)V
    .registers 6

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mWinAnimators:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    iput-object p1, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-object p2, p0, Lcom/android/server/wm/WindowAnimator;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/server/wm/WindowAnimator;->mPolicy:Landroid/view/WindowManagerPolicy;

    return-void
.end method

.method private performAnimationsLocked()V
    .registers 3

    const/4 v1, 0x0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowAnimator;->mForceHiding:Z

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    iput v0, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundColor:I

    invoke-direct {p0}, Lcom/android/server/wm/WindowAnimator;->updateWindowsAndWallpaperLocked()V

    iget v0, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_19

    iget v0, p0, Lcom/android/server/wm/WindowAnimator;->mPendingActions:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/server/wm/WindowAnimator;->mPendingActions:I

    :cond_19
    invoke-direct {p0}, Lcom/android/server/wm/WindowAnimator;->testTokenMayBeDrawnLocked()V

    return-void
.end method

.method private testTokenMayBeDrawnLocked()V
    .registers 9

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v5, Lcom/android/server/wm/WindowManagerService;->mAnimatingAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v0, :cond_5f

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/AppWindowToken;

    iget-boolean v1, v4, Lcom/android/server/wm/AppWindowToken;->allDrawn:Z

    iget-object v5, v4, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-boolean v5, v5, Lcom/android/server/wm/AppWindowAnimator;->allDrawn:Z

    if-eq v1, v5, :cond_37

    iget-object v5, v4, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iput-boolean v1, v5, Lcom/android/server/wm/AppWindowAnimator;->allDrawn:Z

    if-eqz v1, :cond_37

    iget-object v5, v4, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-boolean v5, v5, Lcom/android/server/wm/AppWindowAnimator;->freezingScreen:Z

    if-eqz v5, :cond_3a

    iget-object v5, v4, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    invoke-virtual {v5}, Lcom/android/server/wm/AppWindowAnimator;->showAllWindowsLocked()Z

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v5, v4, v6, v7}, Lcom/android/server/wm/WindowManagerService;->unsetAppFreezingScreenLocked(Lcom/android/server/wm/AppWindowToken;ZZ)V

    iget v5, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    :cond_37
    :goto_37
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_3a
    iget v5, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v5, v5, 0x8

    iput v5, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v6, "testTokenMayBeDrawnLocked"

    iget v7, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    invoke-virtual {v5, v6, v7}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mOpeningApps:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_37

    iget-boolean v5, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    iget-object v6, v4, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    invoke-virtual {v6}, Lcom/android/server/wm/AppWindowAnimator;->showAllWindowsLocked()Z

    move-result v6

    or-int/2addr v5, v6

    iput-boolean v5, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    goto :goto_37

    :cond_5f
    return-void
.end method

.method private testWallpaperAndBackgroundLocked()V
    .registers 10

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iget-object v7, p0, Lcom/android/server/wm/WindowAnimator;->mDetachedWallpaper:Lcom/android/server/wm/WindowState;

    if-eq v6, v7, :cond_10

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iput-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    or-int/lit8 v6, v6, 0x2

    iput v6, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    :cond_10
    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundColor:I

    if-eqz v6, :cond_66

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-eq v6, v4, :cond_28

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mLowerWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-eq v6, v4, :cond_28

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mUpperWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-ne v6, v4, :cond_42

    :cond_28
    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_31
    if-ge v3, v0, :cond_42

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/wm/WindowState;

    iget-boolean v6, v5, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    if-eqz v6, :cond_63

    move-object v4, v5

    :cond_42
    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    if-nez v6, :cond_51

    new-instance v6, Lcom/android/server/wm/DimSurface;

    iget-object v7, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v7, Lcom/android/server/wm/WindowManagerService;->mFxSession:Landroid/view/SurfaceSession;

    invoke-direct {v6, v7}, Lcom/android/server/wm/DimSurface;-><init>(Landroid/view/SurfaceSession;)V

    iput-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    :cond_51
    iget v2, p0, Lcom/android/server/wm/WindowAnimator;->mDw:I

    iget v1, p0, Lcom/android/server/wm/WindowAnimator;->mDh:I

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    iget-object v7, v4, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget v7, v7, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    add-int/lit8 v7, v7, -0x1

    iget v8, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundColor:I

    invoke-virtual {v6, v2, v1, v7, v8}, Lcom/android/server/wm/DimSurface;->show(IIII)V

    :cond_62
    :goto_62
    return-void

    :cond_63
    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    :cond_66
    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    if-eqz v6, :cond_62

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    invoke-virtual {v6}, Lcom/android/server/wm/DimSurface;->hide()V

    goto :goto_62
.end method

.method private updateWindowsAndWallpaperLocked()V
    .registers 18

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mAnimTransactionSequence:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mAnimTransactionSequence:I

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v14, v14, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    add-int/lit8 v7, v14, -0x1

    :goto_18
    if-ltz v7, :cond_223

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v14, v14, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/server/wm/WindowState;

    iget-object v13, v12, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget v6, v13, Lcom/android/server/wm/WindowStateAnimator;->mAttrFlags:I

    iget-object v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mSurface:Landroid/view/Surface;

    if-eqz v14, :cond_132

    iget-boolean v11, v13, Lcom/android/server/wm/WindowStateAnimator;->mWasAnimating:Z

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    invoke-virtual {v13, v14, v15}, Lcom/android/server/wm/WindowStateAnimator;->stepAnimationLocked(J)Z

    move-result v8

    if-eqz v8, :cond_76

    iget-object v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v14, :cond_71

    const/high16 v14, 0x10

    and-int/2addr v14, v6

    if-eqz v14, :cond_4f

    iget-object v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v14}, Landroid/view/animation/Animation;->getDetachWallpaper()Z

    move-result v14

    if-eqz v14, :cond_4f

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/server/wm/WindowAnimator;->mDetachedWallpaper:Lcom/android/server/wm/WindowState;

    :cond_4f
    iget-object v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v14}, Landroid/view/animation/Animation;->getBackgroundColor()I

    move-result v4

    if-eqz v4, :cond_71

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    if-eqz v14, :cond_69

    iget v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    iget-object v15, v15, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget v15, v15, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    if-ge v14, v15, :cond_71

    :cond_69
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundColor:I

    :cond_71
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    :cond_76
    iget-object v14, v12, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-nez v14, :cond_186

    const/4 v2, 0x0

    :goto_7b
    if-eqz v2, :cond_b8

    iget-object v14, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    if-eqz v14, :cond_b8

    iget-boolean v14, v2, Lcom/android/server/wm/AppWindowAnimator;->animating:Z

    if-eqz v14, :cond_b8

    const/high16 v14, 0x10

    and-int/2addr v14, v6

    if-eqz v14, :cond_96

    iget-object v14, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    invoke-virtual {v14}, Landroid/view/animation/Animation;->getDetachWallpaper()Z

    move-result v14

    if-eqz v14, :cond_96

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/server/wm/WindowAnimator;->mDetachedWallpaper:Lcom/android/server/wm/WindowState;

    :cond_96
    iget-object v14, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    invoke-virtual {v14}, Landroid/view/animation/Animation;->getBackgroundColor()I

    move-result v4

    if-eqz v4, :cond_b8

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    if-eqz v14, :cond_b0

    iget v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    iget-object v15, v15, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget v15, v15, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    if-ge v14, v15, :cond_b8

    :cond_b0
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackground:Lcom/android/server/wm/WindowState;

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundColor:I

    :cond_b8
    if-eqz v11, :cond_e9

    iget-boolean v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    if-nez v14, :cond_e9

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v14, v14, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-ne v14, v12, :cond_e9

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    or-int/lit8 v14, v14, 0x2

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v14, v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v15, "updateWindowsAndWallpaperLocked 2"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    :cond_e9
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget-object v15, v12, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v14, v12, v15}, Landroid/view/WindowManagerPolicy;->doesForceHide(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z

    move-result v14

    if-eqz v14, :cond_18c

    if-nez v11, :cond_123

    if-eqz v8, :cond_123

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    or-int/lit8 v14, v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v14, v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v15, "updateWindowsAndWallpaperLocked 3"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v15, 0x1

    iput-boolean v15, v14, Lcom/android/server/wm/WindowManagerService;->mFocusMayChange:Z

    :cond_123
    invoke-virtual {v12}, Lcom/android/server/wm/WindowState;->isReadyForDisplay()Z

    move-result v14

    if-eqz v14, :cond_132

    iget-boolean v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    if-eqz v14, :cond_132

    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/server/wm/WindowAnimator;->mForceHiding:Z

    :cond_132
    :goto_132
    iget-object v3, v12, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    const/4 v15, 0x3

    if-ne v14, v15, :cond_15e

    if-eqz v3, :cond_13f

    iget-boolean v14, v3, Lcom/android/server/wm/AppWindowToken;->allDrawn:Z

    if-eqz v14, :cond_15e

    :cond_13f
    invoke-virtual {v13}, Lcom/android/server/wm/WindowStateAnimator;->performShowLocked()Z

    move-result v14

    if-eqz v14, :cond_15e

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v14, v14, 0x8

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v15, "updateWindowsAndWallpaperLocked 5"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    :cond_15e
    if-nez v3, :cond_21f

    const/4 v2, 0x0

    :goto_161
    if-eqz v2, :cond_182

    iget-object v14, v2, Lcom/android/server/wm/AppWindowAnimator;->thumbnail:Landroid/view/Surface;

    if-eqz v14, :cond_182

    iget v14, v2, Lcom/android/server/wm/AppWindowAnimator;->thumbnailTransactionSeq:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/wm/WindowAnimator;->mAnimTransactionSequence:I

    if-eq v14, v15, :cond_178

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mAnimTransactionSequence:I

    iput v14, v2, Lcom/android/server/wm/AppWindowAnimator;->thumbnailTransactionSeq:I

    const/4 v14, 0x0

    iput v14, v2, Lcom/android/server/wm/AppWindowAnimator;->thumbnailLayer:I

    :cond_178
    iget v14, v2, Lcom/android/server/wm/AppWindowAnimator;->thumbnailLayer:I

    iget v15, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    if-ge v14, v15, :cond_182

    iget v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iput v14, v2, Lcom/android/server/wm/AppWindowAnimator;->thumbnailLayer:I

    :cond_182
    add-int/lit8 v7, v7, -0x1

    goto/16 :goto_18

    :cond_186
    iget-object v14, v12, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v2, v14, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    goto/16 :goto_7b

    :cond_18c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget-object v15, v12, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v14, v12, v15}, Landroid/view/WindowManagerPolicy;->canBeForceHidden(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z

    move-result v14

    if-eqz v14, :cond_132

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/server/wm/WindowAnimator;->mForceHiding:Z

    if-eqz v14, :cond_1dd

    invoke-virtual {v13}, Lcom/android/server/wm/WindowStateAnimator;->isAnimating()Z

    move-result v14

    if-eqz v14, :cond_1ab

    iget v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAttrFlags:I

    const/high16 v15, 0x8

    and-int/2addr v14, v15

    if-nez v14, :cond_1dd

    :cond_1ab
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v12, v14, v15}, Lcom/android/server/wm/WindowState;->hideLw(ZZ)Z

    move-result v5

    :cond_1b1
    :goto_1b1
    if-eqz v5, :cond_132

    const/high16 v14, 0x10

    and-int/2addr v14, v6

    if-eqz v14, :cond_132

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    or-int/lit8 v14, v14, 0x2

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v14, v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v15, "updateWindowsAndWallpaperLocked 4"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    goto/16 :goto_132

    :cond_1dd
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v12, v14, v15}, Lcom/android/server/wm/WindowState;->showLw(ZZ)Z

    move-result v5

    if-eqz v5, :cond_1b1

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    and-int/lit8 v14, v14, 0x4

    if-eqz v14, :cond_207

    invoke-virtual {v12}, Lcom/android/server/wm/WindowState;->isVisibleNow()Z

    move-result v14

    if-eqz v14, :cond_207

    if-nez v9, :cond_1fa

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    :cond_1fa
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v14, v12, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v14, v14, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v15, 0x10

    and-int/2addr v14, v15

    if-eqz v14, :cond_207

    const/4 v10, 0x1

    :cond_207
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    if-eqz v14, :cond_217

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    iget v14, v14, Lcom/android/server/wm/WindowState;->mLayer:I

    iget v15, v12, Lcom/android/server/wm/WindowState;->mLayer:I

    if-ge v14, v15, :cond_1b1

    :cond_217
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v15, 0x1

    iput-boolean v15, v14, Lcom/android/server/wm/WindowManagerService;->mFocusMayChange:Z

    goto :goto_1b1

    :cond_21f
    iget-object v2, v3, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    goto/16 :goto_161

    :cond_223
    if-eqz v9, :cond_246

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v14

    add-int/lit8 v7, v14, -0x1

    :goto_22b
    if-ltz v7, :cond_246

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/wm/WindowAnimator;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v14, v10}, Landroid/view/WindowManagerPolicy;->createForceHideEnterAnimation(Z)Landroid/view/animation/Animation;

    move-result-object v1

    if-eqz v1, :cond_243

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/server/wm/WindowStateAnimator;

    invoke-virtual {v13, v1}, Lcom/android/server/wm/WindowStateAnimator;->setAnimation(Landroid/view/animation/Animation;)V

    const/4 v14, 0x1

    iput-boolean v14, v13, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    :cond_243
    add-int/lit8 v7, v7, -0x1

    goto :goto_22b

    :cond_246
    return-void
.end method

.method private updateWindowsAppsAndRotationAnimationsLocked()V
    .registers 13

    const/4 v8, 0x0

    const/4 v7, 0x1

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v6, Lcom/android/server/wm/WindowManagerService;->mAnimatingAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v4, 0x0

    :goto_b
    if-ge v4, v0, :cond_5e

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/wm/AppWindowToken;

    iget-object v2, v6, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v6, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    if-eqz v6, :cond_31

    iget-object v6, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    sget-object v9, Lcom/android/server/wm/AppWindowAnimator;->sDummyAnimation:Landroid/view/animation/Animation;

    if-eq v6, v9, :cond_31

    move v5, v7

    :goto_20
    iget-wide v9, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mInnerDw:I

    iget v11, p0, Lcom/android/server/wm/WindowAnimator;->mInnerDh:I

    invoke-virtual {v2, v9, v10, v6, v11}, Lcom/android/server/wm/AppWindowAnimator;->stepAnimationLocked(JII)Z

    move-result v6

    if-eqz v6, :cond_33

    iput-boolean v7, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    :cond_2e
    :goto_2e
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    :cond_31
    move v5, v8

    goto :goto_20

    :cond_33
    if-eqz v5, :cond_2e

    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v6, v6, 0x4

    iput v6, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "appToken "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v2, Lcom/android/server/wm/AppWindowAnimator;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " done"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iget v10, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    invoke-virtual {v6, v9, v10}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    goto :goto_2e

    :cond_5e
    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mExitingAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v4, 0x0

    :goto_67
    if-ge v4, v1, :cond_be

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mExitingAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/wm/AppWindowToken;

    iget-object v2, v6, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v6, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    if-eqz v6, :cond_91

    iget-object v6, v2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    sget-object v9, Lcom/android/server/wm/AppWindowAnimator;->sDummyAnimation:Landroid/view/animation/Animation;

    if-eq v6, v9, :cond_91

    move v5, v7

    :goto_80
    iget-wide v9, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mInnerDw:I

    iget v11, p0, Lcom/android/server/wm/WindowAnimator;->mInnerDh:I

    invoke-virtual {v2, v9, v10, v6, v11}, Lcom/android/server/wm/AppWindowAnimator;->stepAnimationLocked(JII)Z

    move-result v6

    if-eqz v6, :cond_93

    iput-boolean v7, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    :cond_8e
    :goto_8e
    add-int/lit8 v4, v4, 0x1

    goto :goto_67

    :cond_91
    move v5, v8

    goto :goto_80

    :cond_93
    if-eqz v5, :cond_8e

    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v6, v6, 0x4

    iput v6, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "exiting appToken "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v2, Lcom/android/server/wm/AppWindowAnimator;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " done"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iget v10, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    invoke-virtual {v6, v9, v10}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    goto :goto_8e

    :cond_be
    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    if-eqz v6, :cond_d6

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v6}, Lcom/android/server/wm/ScreenRotationAnimation;->isAnimating()Z

    move-result v6

    if-eqz v6, :cond_d6

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    iget-wide v8, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    invoke-virtual {v6, v8, v9}, Lcom/android/server/wm/ScreenRotationAnimation;->stepAnimationLocked(J)Z

    move-result v6

    if-eqz v6, :cond_d7

    iput-boolean v7, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    :cond_d6
    :goto_d6
    return-void

    :cond_d7
    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    iget-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v6}, Lcom/android/server/wm/ScreenRotationAnimation;->kill()V

    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    goto :goto_d6
.end method


# virtual methods
.method declared-synchronized animate()V
    .registers 13

    const/4 v5, 0x1

    const/4 v6, 0x0

    monitor-enter p0

    const/4 v4, 0x0

    :try_start_4
    iput v4, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    const/4 v4, 0x0

    iput v4, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    iget-boolean v3, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    invoke-static {}, Landroid/view/Surface;->openTransaction()V
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_cd

    :try_start_17
    invoke-direct {p0}, Lcom/android/server/wm/WindowAnimator;->updateWindowsAppsAndRotationAnimationsLocked()V

    invoke-direct {p0}, Lcom/android/server/wm/WindowAnimator;->performAnimationsLocked()V

    invoke-direct {p0}, Lcom/android/server/wm/WindowAnimator;->testWallpaperAndBackgroundLocked()V

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    if-eqz v4, :cond_29

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v4}, Lcom/android/server/wm/ScreenRotationAnimation;->updateSurfaces()V

    :cond_29
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mWinAnimators:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_30
    if-ge v2, v0, :cond_41

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mWinAnimators:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/WindowStateAnimator;

    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Lcom/android/server/wm/WindowStateAnimator;->prepareSurfaceLocked(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_30

    :cond_41
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    if-eqz v4, :cond_54

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    iget-object v7, p0, Lcom/android/server/wm/WindowAnimator;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    iget-wide v9, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    invoke-virtual {v4, v7, v8, v9, v10}, Lcom/android/server/wm/DimAnimator;->updateParameters(Landroid/content/res/Resources;Lcom/android/server/wm/DimAnimator$Parameters;J)V

    :cond_54
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    if-eqz v4, :cond_78

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    iget-boolean v4, v4, Lcom/android/server/wm/DimAnimator;->mDimShown:Z

    if-eqz v4, :cond_78

    iget-boolean v7, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    iget-object v8, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    invoke-virtual {p0}, Lcom/android/server/wm/WindowAnimator;->isDimming()Z

    move-result v9

    iget-wide v10, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentTime:J

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->okToDisplay()Z

    move-result v4

    if-nez v4, :cond_b7

    move v4, v5

    :goto_71
    invoke-virtual {v8, v9, v10, v11, v4}, Lcom/android/server/wm/DimAnimator;->updateSurface(ZJZ)Z

    move-result v4

    or-int/2addr v4, v7

    iput-boolean v4, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    :cond_78
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    if-eqz v4, :cond_93

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    if-eqz v4, :cond_b9

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v5}, Lcom/android/server/wm/ScreenRotationAnimation;->getEnterTransformation()Landroid/view/animation/Transformation;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/server/wm/BlackFrame;->setMatrix(Landroid/graphics/Matrix;)V

    :cond_93
    :goto_93
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mWatermark:Lcom/android/server/wm/Watermark;

    if-eqz v4, :cond_a0

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mWatermark:Lcom/android/server/wm/Watermark;

    invoke-virtual {v4}, Lcom/android/server/wm/Watermark;->drawIfNeeded()V
    :try_end_a0
    .catchall {:try_start_17 .. :try_end_a0} :catchall_d0
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_a0} :catch_c1

    :cond_a0
    :try_start_a0
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    :goto_a3
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v5, p0, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    iget v6, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    invoke-virtual {v4, v5, v6}, Lcom/android/server/wm/WindowManagerService;->bulkSetParameters(II)V

    iget-boolean v4, p0, Lcom/android/server/wm/WindowAnimator;->mAnimating:Z

    if-eqz v4, :cond_d5

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->scheduleAnimationLocked()V
    :try_end_b5
    .catchall {:try_start_a0 .. :try_end_b5} :catchall_cd

    :cond_b5
    :goto_b5
    monitor-exit p0

    return-void

    :cond_b7
    move v4, v6

    goto :goto_71

    :cond_b9
    :try_start_b9
    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    invoke-virtual {v4}, Lcom/android/server/wm/BlackFrame;->clearMatrix()V
    :try_end_c0
    .catchall {:try_start_b9 .. :try_end_c0} :catchall_d0
    .catch Ljava/lang/RuntimeException; {:try_start_b9 .. :try_end_c0} :catch_c1

    goto :goto_93

    :catch_c1
    move-exception v1

    :try_start_c2
    const-string v4, "WindowAnimator"

    const-string v5, "Unhandled exception in Window Manager"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c9
    .catchall {:try_start_c2 .. :try_end_c9} :catchall_d0

    :try_start_c9
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V
    :try_end_cc
    .catchall {:try_start_c9 .. :try_end_cc} :catchall_cd

    goto :goto_a3

    :catchall_cd
    move-exception v4

    monitor-exit p0

    throw v4

    :catchall_d0
    move-exception v4

    :try_start_d1
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    throw v4

    :cond_d5
    if-eqz v3, :cond_b5

    iget-object v4, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->requestTraversalLocked()V
    :try_end_dc
    .catchall {:try_start_d1 .. :try_end_dc} :catchall_cd

    goto :goto_b5
.end method

.method declared-synchronized clearPendingActions()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput v0, p0, Lcom/android/server/wm/WindowAnimator;->mPendingActions:I
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_6

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;Z)V
    .registers 7

    if-eqz p3, :cond_68

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    if-eqz v0, :cond_13

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mWindowDetachedWallpaper="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_13
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAnimTransactionSequence="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowAnimator;->mAnimTransactionSequence:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    if-eqz v0, :cond_44

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mWindowAnimationBackgroundSurface:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mWindowAnimationBackgroundSurface:Lcom/android/server/wm/DimSurface;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/android/server/wm/DimSurface;->printTo(Ljava/lang/String;Ljava/io/PrintWriter;)V

    :cond_44
    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    if-eqz v0, :cond_69

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mDimAnimator:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/android/server/wm/DimAnimator;->printTo(Ljava/lang/String;Ljava/io/PrintWriter;)V

    :cond_68
    :goto_68
    return-void

    :cond_69
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "no DimAnimator "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_68
.end method

.method hideWallpapersLocked(Lcom/android/server/wm/WindowState;)V
    .registers 9

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-ne v5, p1, :cond_c

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mLowerWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-eqz v5, :cond_12

    :cond_c
    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-nez v5, :cond_52

    :cond_12
    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mWallpaperTokens:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_52

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowToken;

    iget-object v5, v2, Lcom/android/server/wm/WindowToken;->windows:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2c
    :goto_2c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/WindowState;

    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget-boolean v5, v4, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    if-nez v5, :cond_2c

    invoke-virtual {v4}, Lcom/android/server/wm/WindowStateAnimator;->hide()V

    iget-object v5, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Lcom/android/server/wm/WindowManagerService;->dispatchWallpaperVisibility(Lcom/android/server/wm/WindowState;Z)V

    iget v5, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    or-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/android/server/wm/WindowAnimator;->mPendingLayoutChanges:I

    goto :goto_2c

    :cond_4e
    const/4 v5, 0x1

    iput-boolean v5, v2, Lcom/android/server/wm/WindowToken;->hidden:Z

    goto :goto_1a

    :cond_52
    return-void
.end method

.method isDimming()Z
    .registers 2

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method isDimming(Lcom/android/server/wm/WindowStateAnimator;)Z
    .registers 3

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    iget-object v0, v0, Lcom/android/server/wm/DimAnimator$Parameters;->mDimWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    if-ne v0, p1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method setCurrentFocus(Lcom/android/server/wm/WindowState;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/wm/WindowAnimator;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    return-void
.end method

.method setDisplayDimensions(IIII)V
    .registers 5

    iput p1, p0, Lcom/android/server/wm/WindowAnimator;->mDw:I

    iput p2, p0, Lcom/android/server/wm/WindowAnimator;->mDh:I

    iput p3, p0, Lcom/android/server/wm/WindowAnimator;->mInnerDw:I

    iput p4, p0, Lcom/android/server/wm/WindowAnimator;->mInnerDh:I

    return-void
.end method

.method startDimming(Lcom/android/server/wm/WindowStateAnimator;FII)V
    .registers 10

    iget-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    if-nez v1, :cond_f

    new-instance v1, Lcom/android/server/wm/DimAnimator;

    iget-object v2, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mFxSession:Landroid/view/SurfaceSession;

    invoke-direct {v1, v2}, Lcom/android/server/wm/DimAnimator;-><init>(Landroid/view/SurfaceSession;)V

    iput-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDimAnimator:Lcom/android/server/wm/DimAnimator;

    :cond_f
    iget-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    if-nez v1, :cond_3c

    const/4 v0, 0x0

    :goto_14
    iget-boolean v1, p1, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    if-eqz v1, :cond_3b

    if-eqz v0, :cond_24

    iget-boolean v1, v0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    if-eqz v1, :cond_24

    iget v1, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iget v2, p1, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    if-ge v1, v2, :cond_3b

    :cond_24
    iget-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    iget-object v2, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const v3, 0x186a3

    new-instance v4, Lcom/android/server/wm/DimAnimator$Parameters;

    invoke-direct {v4, p1, p3, p4, p2}, Lcom/android/server/wm/DimAnimator$Parameters;-><init>(Lcom/android/server/wm/WindowStateAnimator;IIF)V

    invoke-virtual {v2, v3, v4}, Lcom/android/server/wm/WindowManagerService$H;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/server/wm/WindowManagerService$H;->sendMessage(Landroid/os/Message;)Z

    :cond_3b
    return-void

    :cond_3c
    iget-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mDimParams:Lcom/android/server/wm/DimAnimator$Parameters;

    iget-object v0, v1, Lcom/android/server/wm/DimAnimator$Parameters;->mDimWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    goto :goto_14
.end method

.method stopDimming()V
    .registers 5

    iget-object v0, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    iget-object v1, p0, Lcom/android/server/wm/WindowAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const v2, 0x186a3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/server/wm/WindowManagerService$H;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/wm/WindowManagerService$H;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
