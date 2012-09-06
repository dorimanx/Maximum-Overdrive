.class final Lcom/android/server/wm/WindowState;
.super Ljava/lang/Object;
.source "WindowState.java"

# interfaces
.implements Landroid/view/WindowManagerPolicy$WindowState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/wm/WindowState$1;,
        Lcom/android/server/wm/WindowState$DeathRecipient;
    }
.end annotation


# static fields
.field static final DEBUG_VISIBILITY:Z

.field static final SHOW_LIGHT_TRANSACTIONS:Z

.field static final SHOW_SURFACE_ALLOC:Z

.field static final SHOW_TRANSACTIONS:Z

.field static final mIsEngBuild:Z


# instance fields
.field mAlpha:F

.field mAnimLayer:I

.field mAnimating:Z

.field mAnimation:Landroid/view/animation/Animation;

.field mAnimationIsEntrance:Z

.field mAppFreezing:Z

.field mAppToken:Lcom/android/server/wm/AppWindowToken;

.field mAttachedHidden:Z

.field final mAttachedWindow:Lcom/android/server/wm/WindowState;

.field final mAttrs:Landroid/view/WindowManager$LayoutParams;

.field final mBaseLayer:I

.field final mChildWindows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/WindowState;",
            ">;"
        }
    .end annotation
.end field

.field final mClient:Landroid/view/IWindow;

.field mCommitDrawPending:Z

.field final mCompatFrame:Landroid/graphics/Rect;

.field mConfiguration:Landroid/content/res/Configuration;

.field final mContainingFrame:Landroid/graphics/Rect;

.field mContentChanged:Z

.field final mContentFrame:Landroid/graphics/Rect;

.field final mContentInsets:Landroid/graphics/Rect;

.field mContentInsetsChanged:Z

.field final mDeathRecipient:Lcom/android/server/wm/WindowState$DeathRecipient;

.field mDestroying:Z

.field final mDisplayFrame:Landroid/graphics/Rect;

.field mDrawPending:Z

.field mDsDx:F

.field mDsDy:F

.field mDtDx:F

.field mDtDy:F

.field mEnforceSizeCompat:Z

.field mEnterAnimationPending:Z

.field mExiting:Z

.field final mFrame:Landroid/graphics/Rect;

.field final mGivenContentInsets:Landroid/graphics/Rect;

.field mGivenInsetsPending:Z

.field final mGivenTouchableRegion:Landroid/graphics/Region;

.field final mGivenVisibleInsets:Landroid/graphics/Rect;

.field mGlobalScale:F

.field mHScale:F

.field mHasDrawn:Z

.field mHasLocalTransformation:Z

.field mHasTransformation:Z

.field mHaveFrame:Z

.field mHaveMatrix:Z

.field mInputChannel:Landroid/view/InputChannel;

.field final mInputWindowHandle:Lcom/android/server/wm/InputWindowHandle;

.field mInvGlobalScale:F

.field final mIsFloatingLayer:Z

.field final mIsImWindow:Z

.field final mIsWallpaper:Z

.field mLastAlpha:F

.field final mLastContentInsets:Landroid/graphics/Rect;

.field mLastDsDx:F

.field mLastDsDy:F

.field mLastDtDx:F

.field mLastDtDy:F

.field final mLastFrame:Landroid/graphics/Rect;

.field mLastHScale:F

.field mLastHidden:Z

.field mLastLayer:I

.field mLastTitle:Ljava/lang/CharSequence;

.field mLastVScale:F

.field final mLastVisibleInsets:Landroid/graphics/Rect;

.field mLayer:I

.field final mLayoutAttached:Z

.field mLayoutSeq:I

.field mLocalAnimating:Z

.field mObscured:Z

.field mOrientationChanging:Z

.field final mParentFrame:Landroid/graphics/Rect;

.field mPendingDestroySurface:Landroid/view/Surface;

.field mPolicyVisibility:Z

.field mPolicyVisibilityAfterAnim:Z

.field mReadyToShow:Z

.field mRebuilding:Z

.field mRelayoutCalled:Z

.field mRemoveOnExit:Z

.field mRemoved:Z

.field mReportDestroySurface:Z

.field mRequestedHeight:I

.field mRequestedWidth:I

.field mRootToken:Lcom/android/server/wm/WindowToken;

.field mSeq:I

.field final mService:Lcom/android/server/wm/WindowManagerService;

.field final mSession:Lcom/android/server/wm/Session;

.field mShownAlpha:F

.field final mShownFrame:Landroid/graphics/RectF;

.field mStringNameCache:Ljava/lang/String;

.field final mSubLayer:I

.field mSurface:Landroid/view/Surface;

.field mSurfaceAlpha:F

.field mSurfaceDestroyDeferred:Z

.field mSurfaceH:F

.field mSurfaceLayer:I

.field mSurfacePendingDestroy:Z

.field mSurfaceResized:Z

.field mSurfaceShown:Z

.field mSurfaceW:F

.field mSurfaceX:F

.field mSurfaceY:F

.field mSystemUiVisibility:I

.field mTargetAppToken:Lcom/android/server/wm/AppWindowToken;

.field final mTmpMatrix:Landroid/graphics/Matrix;

.field mToken:Lcom/android/server/wm/WindowToken;

.field mTouchableInsets:I

.field final mTransformation:Landroid/view/animation/Transformation;

.field mTurnOnScreen:Z

.field mVScale:F

.field mViewVisibility:I

.field final mVisibleFrame:Landroid/graphics/Rect;

.field final mVisibleInsets:Landroid/graphics/Rect;

.field mVisibleInsetsChanged:Z

.field mWallpaperVisible:Z

.field mWallpaperX:F

.field mWallpaperXStep:F

.field mWallpaperY:F

.field mWallpaperYStep:F

.field mWasPaused:Z

.field mXOffset:I

.field mYOffset:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 295
    const-string v0, "eng"

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/server/wm/WindowState;->mIsEngBuild:Z

    return-void
.end method

.method constructor <init>(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/Session;Landroid/view/IWindow;Lcom/android/server/wm/WindowToken;Lcom/android/server/wm/WindowState;ILandroid/view/WindowManager$LayoutParams;I)V
    .registers 16
    .parameter "service"
    .parameter "s"
    .parameter "c"
    .parameter "token"
    .parameter "attachedWindow"
    .parameter "seq"
    .parameter "a"
    .parameter "viewVisibility"

    .prologue
    .line 299
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v5, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v5}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    .line 74
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    .line 85
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    .line 86
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    .line 110
    const/4 v5, -0x1

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLayoutSeq:I

    .line 112
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mConfiguration:Landroid/content/res/Configuration;

    .line 119
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    .line 137
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mVisibleInsets:Landroid/graphics/Rect;

    .line 138
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mLastVisibleInsets:Landroid/graphics/Rect;

    .line 145
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mContentInsets:Landroid/graphics/Rect;

    .line 146
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mLastContentInsets:Landroid/graphics/Rect;

    .line 159
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mGivenContentInsets:Landroid/graphics/Rect;

    .line 165
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mGivenVisibleInsets:Landroid/graphics/Rect;

    .line 170
    new-instance v5, Landroid/graphics/Region;

    invoke-direct {v5}, Landroid/graphics/Region;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mGivenTouchableRegion:Landroid/graphics/Region;

    .line 178
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mTouchableInsets:I

    .line 182
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    .line 183
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    .line 184
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mDsDx:F

    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mDtDx:F

    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mDsDy:F

    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mDtDy:F

    .line 185
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastDsDx:F

    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastDtDx:F

    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastDsDy:F

    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastDtDy:F

    .line 186
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mHScale:F

    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mVScale:F

    .line 187
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastHScale:F

    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastVScale:F

    .line 188
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 191
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    .line 192
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mLastFrame:Landroid/graphics/Rect;

    .line 195
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    .line 197
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mContainingFrame:Landroid/graphics/Rect;

    .line 198
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mDisplayFrame:Landroid/graphics/Rect;

    .line 199
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mContentFrame:Landroid/graphics/Rect;

    .line 200
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mParentFrame:Landroid/graphics/Rect;

    .line 201
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    .line 205
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 206
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mAlpha:F

    .line 207
    const/high16 v5, 0x3f80

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastAlpha:F

    .line 220
    new-instance v5, Landroid/view/animation/Transformation;

    invoke-direct {v5}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    .line 224
    const/high16 v5, -0x4080

    iput v5, p0, Lcom/android/server/wm/WindowState;->mWallpaperX:F

    .line 225
    const/high16 v5, -0x4080

    iput v5, p0, Lcom/android/server/wm/WindowState;->mWallpaperY:F

    .line 229
    const/high16 v5, -0x4080

    iput v5, p0, Lcom/android/server/wm/WindowState;->mWallpaperXStep:F

    .line 230
    const/high16 v5, -0x4080

    iput v5, p0, Lcom/android/server/wm/WindowState;->mWallpaperYStep:F

    .line 300
    iput-object p1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    .line 301
    iput-object p2, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    .line 302
    iput-object p3, p0, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    .line 303
    iput-object p4, p0, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    .line 304
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v5, p7}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 305
    iput p8, p0, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    .line 306
    new-instance v2, Lcom/android/server/wm/WindowState$DeathRecipient;

    const/4 v5, 0x0

    invoke-direct {v2, p0, v5}, Lcom/android/server/wm/WindowState$DeathRecipient;-><init>(Lcom/android/server/wm/WindowState;Lcom/android/server/wm/WindowState$1;)V

    .line 307
    .local v2, deathRecipient:Lcom/android/server/wm/WindowState$DeathRecipient;
    iget v5, p7, Landroid/view/WindowManager$LayoutParams;->alpha:F

    iput v5, p0, Lcom/android/server/wm/WindowState;->mAlpha:F

    .line 308
    iput p6, p0, Lcom/android/server/wm/WindowState;->mSeq:I

    .line 309
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v6, 0x2000

    and-int/2addr v5, v6

    if-eqz v5, :cond_192

    const/4 v5, 0x1

    :goto_113
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    .line 314
    :try_start_115
    invoke-interface {p3}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;

    move-result-object v5

    const/4 v6, 0x0

    invoke-interface {v5, v2, v6}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_11d
    .catch Landroid/os/RemoteException; {:try_start_115 .. :try_end_11d} :catch_194

    .line 327
    iput-object v2, p0, Lcom/android/server/wm/WindowState;->mDeathRecipient:Lcom/android/server/wm/WindowState$DeathRecipient;

    .line 329
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x3e8

    if-lt v5, v6, :cond_1b9

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7cf

    if-gt v5, v6, :cond_1b9

    .line 333
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget-object v6, p5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->type:I

    invoke-interface {v5, v6}, Landroid/view/WindowManagerPolicy;->windowTypeToLayerLw(I)I

    move-result v5

    mul-int/lit16 v5, v5, 0x2710

    add-int/lit16 v5, v5, 0x3e8

    iput v5, p0, Lcom/android/server/wm/WindowState;->mBaseLayer:I

    .line 336
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget v6, p7, Landroid/view/WindowManager$LayoutParams;->type:I

    invoke-interface {v5, v6}, Landroid/view/WindowManagerPolicy;->subWindowTypeToLayerLw(I)I

    move-result v5

    iput v5, p0, Lcom/android/server/wm/WindowState;->mSubLayer:I

    .line 337
    iput-object p5, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    .line 339
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v5, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x3eb

    if-eq v5, v6, :cond_1b1

    const/4 v5, 0x1

    :goto_15f
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mLayoutAttached:Z

    .line 342
    iget-object v5, p5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7db

    if-eq v5, v6, :cond_171

    iget-object v5, p5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7dc

    if-ne v5, v6, :cond_1b3

    :cond_171
    const/4 v5, 0x1

    :goto_172
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    .line 344
    iget-object v5, p5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7dd

    if-ne v5, v6, :cond_1b5

    const/4 v5, 0x1

    :goto_17d
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    .line 345
    iget-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    if-nez v5, :cond_187

    iget-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    if-eqz v5, :cond_1b7

    :cond_187
    const/4 v5, 0x1

    :goto_188
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsFloatingLayer:Z

    .line 361
    :goto_18a
    move-object v1, p0

    .line 362
    .local v1, appWin:Lcom/android/server/wm/WindowState;
    :goto_18b
    iget-object v5, v1, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-eqz v5, :cond_202

    .line 363
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    goto :goto_18b

    .line 309
    .end local v1           #appWin:Lcom/android/server/wm/WindowState;
    :cond_192
    const/4 v5, 0x0

    goto :goto_113

    .line 315
    :catch_194
    move-exception v3

    .line 316
    .local v3, e:Landroid/os/RemoteException;
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mDeathRecipient:Lcom/android/server/wm/WindowState$DeathRecipient;

    .line 317
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    .line 318
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mLayoutAttached:Z

    .line 319
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    .line 320
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    .line 321
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsFloatingLayer:Z

    .line 322
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mBaseLayer:I

    .line 323
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mSubLayer:I

    .line 324
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mInputWindowHandle:Lcom/android/server/wm/InputWindowHandle;

    .line 386
    .end local v3           #e:Landroid/os/RemoteException;
    :goto_1b0
    return-void

    .line 340
    :cond_1b1
    const/4 v5, 0x0

    goto :goto_15f

    .line 342
    :cond_1b3
    const/4 v5, 0x0

    goto :goto_172

    .line 344
    :cond_1b5
    const/4 v5, 0x0

    goto :goto_17d

    .line 345
    :cond_1b7
    const/4 v5, 0x0

    goto :goto_188

    .line 349
    :cond_1b9
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget v6, p7, Landroid/view/WindowManager$LayoutParams;->type:I

    invoke-interface {v5, v6}, Landroid/view/WindowManagerPolicy;->windowTypeToLayerLw(I)I

    move-result v5

    mul-int/lit16 v5, v5, 0x2710

    add-int/lit16 v5, v5, 0x3e8

    iput v5, p0, Lcom/android/server/wm/WindowState;->mBaseLayer:I

    .line 352
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mSubLayer:I

    .line 353
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    .line 354
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mLayoutAttached:Z

    .line 355
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7db

    if-eq v5, v6, :cond_1e2

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7dc

    if-ne v5, v6, :cond_1fc

    :cond_1e2
    const/4 v5, 0x1

    :goto_1e3
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    .line 357
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v6, 0x7dd

    if-ne v5, v6, :cond_1fe

    const/4 v5, 0x1

    :goto_1ee
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    .line 358
    iget-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    if-nez v5, :cond_1f8

    iget-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    if-eqz v5, :cond_200

    :cond_1f8
    const/4 v5, 0x1

    :goto_1f9
    iput-boolean v5, p0, Lcom/android/server/wm/WindowState;->mIsFloatingLayer:Z

    goto :goto_18a

    .line 355
    :cond_1fc
    const/4 v5, 0x0

    goto :goto_1e3

    .line 357
    :cond_1fe
    const/4 v5, 0x0

    goto :goto_1ee

    .line 358
    :cond_200
    const/4 v5, 0x0

    goto :goto_1f9

    .line 365
    .restart local v1       #appWin:Lcom/android/server/wm/WindowState;
    :cond_202
    iget-object v0, v1, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    .line 366
    .local v0, appToken:Lcom/android/server/wm/WindowToken;
    :goto_204
    iget-object v5, v0, Lcom/android/server/wm/WindowToken;->appWindowToken:Lcom/android/server/wm/AppWindowToken;

    if-nez v5, :cond_218

    .line 367
    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mTokenMap:Ljava/util/HashMap;

    iget-object v6, v0, Lcom/android/server/wm/WindowToken;->token:Landroid/os/IBinder;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/WindowToken;

    .line 368
    .local v4, parent:Lcom/android/server/wm/WindowToken;
    if-eqz v4, :cond_218

    if-ne v0, v4, :cond_247

    .line 373
    .end local v4           #parent:Lcom/android/server/wm/WindowToken;
    :cond_218
    iput-object v0, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    .line 374
    iget-object v5, v0, Lcom/android/server/wm/WindowToken;->appWindowToken:Lcom/android/server/wm/AppWindowToken;

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 376
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    .line 377
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    .line 378
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    .line 379
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    .line 380
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    .line 381
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLayer:I

    .line 382
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    .line 383
    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/wm/WindowState;->mLastLayer:I

    .line 384
    new-instance v6, Lcom/android/server/wm/InputWindowHandle;

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v5, :cond_249

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v5, v5, Lcom/android/server/wm/AppWindowToken;->mInputApplicationHandle:Lcom/android/server/wm/InputApplicationHandle;

    :goto_240
    invoke-direct {v6, v5, p0}, Lcom/android/server/wm/InputWindowHandle;-><init>(Lcom/android/server/wm/InputApplicationHandle;Landroid/view/WindowManagerPolicy$WindowState;)V

    iput-object v6, p0, Lcom/android/server/wm/WindowState;->mInputWindowHandle:Lcom/android/server/wm/InputWindowHandle;

    goto/16 :goto_1b0

    .line 371
    .restart local v4       #parent:Lcom/android/server/wm/WindowToken;
    :cond_247
    move-object v0, v4

    .line 372
    goto :goto_204

    .line 384
    .end local v4           #parent:Lcom/android/server/wm/WindowToken;
    :cond_249
    const/4 v5, 0x0

    goto :goto_240
.end method

.method private static applyInsets(Landroid/graphics/Region;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 8
    .parameter "outRegion"
    .parameter "frame"
    .parameter "inset"

    .prologue
    .line 1638
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v1

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, p2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v3

    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    iget v4, p2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/graphics/Region;->set(IIII)Z

    .line 1641
    return-void
.end method


# virtual methods
.method attach()V
    .registers 2

    .prologue
    .line 392
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {v0}, Lcom/android/server/wm/Session;->windowAddedLocked()V

    .line 393
    return-void
.end method

.method public final canReceiveKeys()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1551
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v1, v1, Lcom/android/server/wm/WindowManagerService;->mSkipWidgetFocus:Z

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v2, 0x834

    if-ne v1, v2, :cond_10

    .line 1555
    :cond_f
    :goto_f
    return v0

    :cond_10
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->isVisibleOrAdding()Z

    move-result v1

    if-eqz v1, :cond_f

    iget v1, p0, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    if-nez v1, :cond_f

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_f

    const/4 v0, 0x1

    goto :goto_f
.end method

.method cancelExitAnimationForNextAnimationLocked()V
    .registers 2

    .prologue
    .line 639
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v0, :cond_5

    .line 646
    :goto_4
    return-void

    .line 640
    :cond_5
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_14

    .line 641
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 642
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    .line 643
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->destroySurfaceLocked()V

    .line 645
    :cond_14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    goto :goto_4
.end method

.method public clearAnimation()V
    .registers 2

    .prologue
    .line 628
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_12

    .line 629
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 630
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    .line 631
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 632
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    .line 634
    :cond_12
    return-void
.end method

.method commitFinishDrawingLocked(J)Z
    .registers 8
    .parameter "currentTime"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 877
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    if-nez v3, :cond_7

    .line 887
    :goto_6
    return v1

    .line 880
    :cond_7
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    .line 881
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mReadyToShow:Z

    .line 882
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_13

    move v1, v2

    .line 883
    .local v1, starting:Z
    :cond_13
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 884
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    if-eqz v0, :cond_1d

    iget-boolean v3, v0, Lcom/android/server/wm/AppWindowToken;->allDrawn:Z

    if-nez v3, :cond_1d

    if-eqz v1, :cond_20

    .line 885
    :cond_1d
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->performShowLocked()Z

    :cond_20
    move v1, v2

    .line 887
    goto :goto_6
.end method

.method public computeFrameLw(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 26
    .parameter "pf"
    .parameter "df"
    .parameter "cf"
    .parameter "vf"

    .prologue
    .line 396
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/server/wm/WindowState;->mHaveFrame:Z

    .line 398
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/WindowState;->mContainingFrame:Landroid/graphics/Rect;

    .line 399
    .local v5, container:Landroid/graphics/Rect;
    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 401
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/wm/WindowState;->mDisplayFrame:Landroid/graphics/Rect;

    .line 402
    .local v11, display:Landroid/graphics/Rect;
    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 404
    iget v2, v5, Landroid/graphics/Rect;->right:I

    iget v6, v5, Landroid/graphics/Rect;->left:I

    sub-int v15, v2, v6

    .line 405
    .local v15, pw:I
    iget v2, v5, Landroid/graphics/Rect;->bottom:I

    iget v6, v5, Landroid/graphics/Rect;->top:I

    sub-int v14, v2, v6

    .line 408
    .local v14, ph:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v2, v2, 0x4000

    if-eqz v2, :cond_20e

    .line 409
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    if-gez v2, :cond_1ce

    .line 410
    move v3, v15

    .line 416
    .local v3, w:I
    :goto_36
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    if-gez v2, :cond_1ee

    .line 417
    move v4, v14

    .line 440
    .local v4, h:I
    :goto_3f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mParentFrame:Landroid/graphics/Rect;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_59

    .line 443
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mParentFrame:Landroid/graphics/Rect;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 444
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/server/wm/WindowState;->mContentChanged:Z

    .line 447
    :cond_59
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/WindowState;->mContentFrame:Landroid/graphics/Rect;

    .line 448
    .local v9, content:Landroid/graphics/Rect;
    move-object/from16 v0, p3

    invoke-virtual {v9, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    .line 451
    .local v16, visible:Landroid/graphics/Rect;
    move-object/from16 v0, v16

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 453
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    .line 454
    .local v8, frame:Landroid/graphics/Rect;
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v13

    .line 455
    .local v13, fw:I
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v12

    .line 461
    .local v12, fh:I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v2, :cond_25a

    .line 462
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    mul-float v18, v2, v6

    .line 463
    .local v18, x:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    mul-float v19, v2, v6

    .line 469
    .local v19, y:F
    :goto_9b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    int-to-float v7, v15

    mul-float/2addr v6, v7

    add-float v6, v6, v18

    float-to-int v6, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v7, v7, Landroid/view/WindowManager$LayoutParams;->verticalMargin:F

    int-to-float v0, v14

    move/from16 v20, v0

    mul-float v7, v7, v20

    add-float v7, v7, v19

    float-to-int v7, v7

    invoke-static/range {v2 .. v8}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;IILandroid/graphics/Rect;)V

    .line 476
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    move-object/from16 v0, p2

    invoke-static {v2, v0, v8}, Landroid/view/Gravity;->applyDisplay(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 480
    iget v2, v9, Landroid/graphics/Rect;->left:I

    iget v6, v8, Landroid/graphics/Rect;->left:I

    if-ge v2, v6, :cond_d2

    iget v2, v8, Landroid/graphics/Rect;->left:I

    iput v2, v9, Landroid/graphics/Rect;->left:I

    .line 481
    :cond_d2
    iget v2, v9, Landroid/graphics/Rect;->top:I

    iget v6, v8, Landroid/graphics/Rect;->top:I

    if-ge v2, v6, :cond_dc

    iget v2, v8, Landroid/graphics/Rect;->top:I

    iput v2, v9, Landroid/graphics/Rect;->top:I

    .line 482
    :cond_dc
    iget v2, v9, Landroid/graphics/Rect;->right:I

    iget v6, v8, Landroid/graphics/Rect;->right:I

    if-le v2, v6, :cond_e6

    iget v2, v8, Landroid/graphics/Rect;->right:I

    iput v2, v9, Landroid/graphics/Rect;->right:I

    .line 483
    :cond_e6
    iget v2, v9, Landroid/graphics/Rect;->bottom:I

    iget v6, v8, Landroid/graphics/Rect;->bottom:I

    if-le v2, v6, :cond_f0

    iget v2, v8, Landroid/graphics/Rect;->bottom:I

    iput v2, v9, Landroid/graphics/Rect;->bottom:I

    .line 484
    :cond_f0
    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v6, v8, Landroid/graphics/Rect;->left:I

    if-ge v2, v6, :cond_fe

    iget v2, v8, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, v16

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 485
    :cond_fe
    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v6, v8, Landroid/graphics/Rect;->top:I

    if-ge v2, v6, :cond_10c

    iget v2, v8, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, v16

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 486
    :cond_10c
    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Rect;->right:I

    iget v6, v8, Landroid/graphics/Rect;->right:I

    if-le v2, v6, :cond_11a

    iget v2, v8, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, v16

    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 487
    :cond_11a
    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    iget v6, v8, Landroid/graphics/Rect;->bottom:I

    if-le v2, v6, :cond_128

    iget v2, v8, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, v16

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 489
    :cond_128
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/server/wm/WindowState;->mContentInsets:Landroid/graphics/Rect;

    .line 490
    .local v10, contentInsets:Landroid/graphics/Rect;
    iget v2, v9, Landroid/graphics/Rect;->left:I

    iget v6, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v6

    iput v2, v10, Landroid/graphics/Rect;->left:I

    .line 491
    iget v2, v9, Landroid/graphics/Rect;->top:I

    iget v6, v8, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v6

    iput v2, v10, Landroid/graphics/Rect;->top:I

    .line 492
    iget v2, v8, Landroid/graphics/Rect;->right:I

    iget v6, v9, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v6

    iput v2, v10, Landroid/graphics/Rect;->right:I

    .line 493
    iget v2, v8, Landroid/graphics/Rect;->bottom:I

    iget v6, v9, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v6

    iput v2, v10, Landroid/graphics/Rect;->bottom:I

    .line 495
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mVisibleInsets:Landroid/graphics/Rect;

    move-object/from16 v17, v0

    .line 496
    .local v17, visibleInsets:Landroid/graphics/Rect;
    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v6, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v6

    move-object/from16 v0, v17

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 497
    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v6, v8, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v6

    move-object/from16 v0, v17

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 498
    iget v2, v8, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, v16

    iget v6, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v6

    move-object/from16 v0, v17

    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 499
    iget v2, v8, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, v16

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v6

    move-object/from16 v0, v17

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 501
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v2, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 502
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v2, :cond_1a2

    .line 506
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    invoke-virtual {v10, v2}, Landroid/graphics/Rect;->scale(F)V

    .line 507
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Rect;->scale(F)V

    .line 511
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    invoke-virtual {v2, v6}, Landroid/graphics/Rect;->scale(F)V

    .line 514
    :cond_1a2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    if-eqz v2, :cond_1cd

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v2

    if-ne v13, v2, :cond_1b4

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v2

    if-eq v12, v2, :cond_1cd

    .line 515
    :cond_1b4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v6, v6, Lcom/android/server/wm/WindowManagerService;->mAppDisplayWidth:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v7, v7, Lcom/android/server/wm/WindowManagerService;->mAppDisplayHeight:I

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v2, v0, v6, v7, v1}, Lcom/android/server/wm/WindowManagerService;->updateWallpaperOffsetLocked(Lcom/android/server/wm/WindowState;IIZ)Z

    .line 530
    :cond_1cd
    return-void

    .line 411
    .end local v3           #w:I
    .end local v4           #h:I
    .end local v8           #frame:Landroid/graphics/Rect;
    .end local v9           #content:Landroid/graphics/Rect;
    .end local v10           #contentInsets:Landroid/graphics/Rect;
    .end local v12           #fh:I
    .end local v13           #fw:I
    .end local v16           #visible:Landroid/graphics/Rect;
    .end local v17           #visibleInsets:Landroid/graphics/Rect;
    .end local v18           #x:F
    .end local v19           #y:F
    :cond_1ce
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v2, :cond_1e6

    .line 412
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    mul-float/2addr v2, v6

    const/high16 v6, 0x3f00

    add-float/2addr v2, v6

    float-to-int v3, v2

    .restart local v3       #w:I
    goto/16 :goto_36

    .line 414
    .end local v3           #w:I
    :cond_1e6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .restart local v3       #w:I
    goto/16 :goto_36

    .line 418
    :cond_1ee
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v2, :cond_206

    .line 419
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    mul-float/2addr v2, v6

    const/high16 v6, 0x3f00

    add-float/2addr v2, v6

    float-to-int v4, v2

    .restart local v4       #h:I
    goto/16 :goto_3f

    .line 421
    .end local v4           #h:I
    :cond_206
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .restart local v4       #h:I
    goto/16 :goto_3f

    .line 424
    .end local v3           #w:I
    .end local v4           #h:I
    :cond_20e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v6, -0x1

    if-ne v2, v6, :cond_224

    .line 425
    move v3, v15

    .line 431
    .restart local v3       #w:I
    :goto_218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    const/4 v6, -0x1

    if-ne v2, v6, :cond_23e

    .line 432
    move v4, v14

    .restart local v4       #h:I
    goto/16 :goto_3f

    .line 426
    .end local v3           #w:I
    .end local v4           #h:I
    :cond_224
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v2, :cond_239

    .line 427
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    mul-float/2addr v2, v6

    const/high16 v6, 0x3f00

    add-float/2addr v2, v6

    float-to-int v3, v2

    .restart local v3       #w:I
    goto :goto_218

    .line 429
    .end local v3           #w:I
    :cond_239
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    .restart local v3       #w:I
    goto :goto_218

    .line 433
    :cond_23e
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v2, :cond_254

    .line 434
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    mul-float/2addr v2, v6

    const/high16 v6, 0x3f00

    add-float/2addr v2, v6

    float-to-int v4, v2

    .restart local v4       #h:I
    goto/16 :goto_3f

    .line 436
    .end local v4           #h:I
    :cond_254
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    .restart local v4       #h:I
    goto/16 :goto_3f

    .line 465
    .restart local v8       #frame:Landroid/graphics/Rect;
    .restart local v9       #content:Landroid/graphics/Rect;
    .restart local v12       #fh:I
    .restart local v13       #fw:I
    .restart local v16       #visible:Landroid/graphics/Rect;
    :cond_25a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    int-to-float v0, v2

    move/from16 v18, v0

    .line 466
    .restart local v18       #x:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float v0, v2

    move/from16 v19, v0

    .restart local v19       #y:F
    goto/16 :goto_9b
.end method

.method computeShownFrameLocked()V
    .registers 16

    .prologue
    .line 1167
    iget-boolean v5, p0, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    .line 1168
    .local v5, selfTransformation:Z
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-eqz v11, :cond_1b2

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    iget-boolean v11, v11, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    if-eqz v11, :cond_1b2

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    iget-object v1, v11, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    .line 1171
    .local v1, attachedTransformation:Landroid/view/animation/Transformation;
    :goto_10
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v11, :cond_1b5

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-boolean v11, v11, Lcom/android/server/wm/AppWindowToken;->hasTransformation:Z

    if-eqz v11, :cond_1b5

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v0, v11, Lcom/android/server/wm/AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    .line 1177
    .local v0, appTransformation:Landroid/view/animation/Transformation;
    :goto_1e
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v11, v11, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v12, 0x7dd

    if-ne v11, v12, :cond_86

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mLowerWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-nez v11, :cond_86

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    if-eqz v11, :cond_86

    .line 1179
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-boolean v11, v11, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    if-eqz v11, :cond_54

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v11, :cond_54

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v11}, Landroid/view/animation/Animation;->getDetachWallpaper()Z

    move-result v11

    if-nez v11, :cond_54

    .line 1182
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v1, v11, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    .line 1187
    :cond_54
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v11, :cond_86

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-boolean v11, v11, Lcom/android/server/wm/AppWindowToken;->hasTransformation:Z

    if-eqz v11, :cond_86

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v11, v11, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v11, :cond_86

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v11, v11, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    invoke-virtual {v11}, Landroid/view/animation/Animation;->getDetachWallpaper()Z

    move-result v11

    if-nez v11, :cond_86

    .line 1191
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    iget-object v11, v11, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v0, v11, Lcom/android/server/wm/AppWindowToken;->transformation:Landroid/view/animation/Transformation;

    .line 1198
    :cond_86
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    if-eqz v11, :cond_1b8

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v11}, Lcom/android/server/wm/ScreenRotationAnimation;->isAnimating()Z

    move-result v11

    if-eqz v11, :cond_1b8

    const/4 v4, 0x1

    .line 1200
    .local v4, screenAnimation:Z
    :goto_97
    if-nez v5, :cond_9f

    if-nez v1, :cond_9f

    if-nez v0, :cond_9f

    if-eqz v4, :cond_1c5

    .line 1203
    :cond_9f
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    .line 1204
    .local v2, frame:Landroid/graphics/Rect;
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v11, Lcom/android/server/wm/WindowManagerService;->mTmpFloats:[F

    .line 1205
    .local v6, tmpFloats:[F
    iget-object v7, p0, Lcom/android/server/wm/WindowState;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 1208
    .local v7, tmpMatrix:Landroid/graphics/Matrix;
    if-eqz v4, :cond_1c0

    .line 1216
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v11

    int-to-float v8, v11

    .line 1217
    .local v8, w:F
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v11

    int-to-float v3, v11

    .line 1218
    .local v3, h:F
    const/high16 v11, 0x3f80

    cmpl-float v11, v8, v11

    if-ltz v11, :cond_1bb

    const/high16 v11, 0x3f80

    cmpl-float v11, v3, v11

    if-ltz v11, :cond_1bb

    .line 1219
    const/high16 v11, 0x3f80

    const/high16 v12, 0x4000

    div-float/2addr v12, v8

    add-float/2addr v11, v12

    const/high16 v12, 0x3f80

    const/high16 v13, 0x4000

    div-float/2addr v13, v3

    add-float/2addr v12, v13

    const/high16 v13, 0x4000

    div-float v13, v8, v13

    const/high16 v14, 0x4000

    div-float v14, v3, v14

    invoke-virtual {v7, v11, v12, v13, v14}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 1226
    .end local v3           #h:F
    .end local v8           #w:F
    :goto_d6
    iget v11, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    iget v12, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    invoke-virtual {v7, v11, v12}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 1227
    if-eqz v5, :cond_e8

    .line 1228
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v11}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v11

    invoke-virtual {v7, v11}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1230
    :cond_e8
    iget v11, v2, Landroid/graphics/Rect;->left:I

    iget v12, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    add-int/2addr v11, v12

    int-to-float v11, v11

    iget v12, v2, Landroid/graphics/Rect;->top:I

    iget v13, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    add-int/2addr v12, v13

    int-to-float v12, v12

    invoke-virtual {v7, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1231
    if-eqz v1, :cond_100

    .line 1232
    invoke-virtual {v1}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v11

    invoke-virtual {v7, v11}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1234
    :cond_100
    if-eqz v0, :cond_109

    .line 1235
    invoke-virtual {v0}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v11

    invoke-virtual {v7, v11}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1237
    :cond_109
    if-eqz v4, :cond_11a

    .line 1238
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v11}, Lcom/android/server/wm/ScreenRotationAnimation;->getEnterTransformation()Landroid/view/animation/Transformation;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v11

    invoke-virtual {v7, v11}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1248
    :cond_11a
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/android/server/wm/WindowState;->mHaveMatrix:Z

    .line 1249
    invoke-virtual {v7, v6}, Landroid/graphics/Matrix;->getValues([F)V

    .line 1250
    const/4 v11, 0x0

    aget v11, v6, v11

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDsDx:F

    .line 1251
    const/4 v11, 0x3

    aget v11, v6, v11

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDtDx:F

    .line 1252
    const/4 v11, 0x1

    aget v11, v6, v11

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDsDy:F

    .line 1253
    const/4 v11, 0x4

    aget v11, v6, v11

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDtDy:F

    .line 1254
    const/4 v11, 0x2

    aget v9, v6, v11

    .line 1255
    .local v9, x:F
    const/4 v11, 0x5

    aget v10, v6, v11

    .line 1256
    .local v10, y:F
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v8

    .line 1257
    .local v8, w:I
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v3

    .line 1258
    .local v3, h:I
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    int-to-float v12, v8

    add-float/2addr v12, v9

    int-to-float v13, v3

    add-float/2addr v13, v10

    invoke-virtual {v11, v9, v10, v12, v13}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1265
    iget v11, p0, Lcom/android/server/wm/WindowState;->mAlpha:F

    iput v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 1266
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v11, v11, Lcom/android/server/wm/WindowManagerService;->mLimitedAlphaCompositing:Z

    if-eqz v11, :cond_17b

    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v11, v11, Landroid/view/WindowManager$LayoutParams;->format:I

    invoke-static {v11}, Landroid/graphics/PixelFormat;->formatHasAlpha(I)Z

    move-result v11

    if-eqz v11, :cond_17b

    iget v11, p0, Lcom/android/server/wm/WindowState;->mDsDx:F

    iget v12, p0, Lcom/android/server/wm/WindowState;->mDtDx:F

    iget v13, p0, Lcom/android/server/wm/WindowState;->mDsDy:F

    iget v14, p0, Lcom/android/server/wm/WindowState;->mDtDy:F

    invoke-virtual {p0, v11, v12, v13, v14}, Lcom/android/server/wm/WindowState;->isIdentityMatrix(FFFF)Z

    move-result v11

    if-eqz v11, :cond_1b1

    iget v11, v2, Landroid/graphics/Rect;->left:I

    int-to-float v11, v11

    cmpl-float v11, v9, v11

    if-nez v11, :cond_1b1

    iget v11, v2, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    cmpl-float v11, v10, v11

    if-nez v11, :cond_1b1

    .line 1271
    :cond_17b
    if-eqz v5, :cond_188

    .line 1272
    iget v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    iget-object v12, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v12}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v12

    mul-float/2addr v11, v12

    iput v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 1274
    :cond_188
    if-eqz v1, :cond_193

    .line 1275
    iget v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    invoke-virtual {v1}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v12

    mul-float/2addr v11, v12

    iput v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 1277
    :cond_193
    if-eqz v0, :cond_19e

    .line 1278
    iget v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    invoke-virtual {v0}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v12

    mul-float/2addr v11, v12

    iput v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 1280
    :cond_19e
    if-eqz v4, :cond_1b1

    .line 1281
    iget v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    iget-object v12, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v12, v12, Lcom/android/server/wm/WindowManagerService;->mScreenRotationAnimation:Lcom/android/server/wm/ScreenRotationAnimation;

    invoke-virtual {v12}, Lcom/android/server/wm/ScreenRotationAnimation;->getEnterTransformation()Landroid/view/animation/Transformation;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v12

    mul-float/2addr v11, v12

    iput v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 1305
    .end local v2           #frame:Landroid/graphics/Rect;
    .end local v3           #h:I
    .end local v6           #tmpFloats:[F
    .end local v7           #tmpMatrix:Landroid/graphics/Matrix;
    .end local v8           #w:I
    .end local v9           #x:F
    .end local v10           #y:F
    :cond_1b1
    :goto_1b1
    return-void

    .line 1168
    .end local v0           #appTransformation:Landroid/view/animation/Transformation;
    .end local v1           #attachedTransformation:Landroid/view/animation/Transformation;
    .end local v4           #screenAnimation:Z
    :cond_1b2
    const/4 v1, 0x0

    goto/16 :goto_10

    .line 1171
    .restart local v1       #attachedTransformation:Landroid/view/animation/Transformation;
    :cond_1b5
    const/4 v0, 0x0

    goto/16 :goto_1e

    .line 1198
    .restart local v0       #appTransformation:Landroid/view/animation/Transformation;
    :cond_1b8
    const/4 v4, 0x0

    goto/16 :goto_97

    .line 1221
    .restart local v2       #frame:Landroid/graphics/Rect;
    .local v3, h:F
    .restart local v4       #screenAnimation:Z
    .restart local v6       #tmpFloats:[F
    .restart local v7       #tmpMatrix:Landroid/graphics/Matrix;
    .local v8, w:F
    :cond_1bb
    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    goto/16 :goto_d6

    .line 1224
    .end local v3           #h:F
    .end local v8           #w:F
    :cond_1c0
    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    goto/16 :goto_d6

    .line 1295
    .end local v2           #frame:Landroid/graphics/Rect;
    .end local v6           #tmpFloats:[F
    .end local v7           #tmpMatrix:Landroid/graphics/Matrix;
    :cond_1c5
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    iget-object v12, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v11, v12}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 1296
    iget v11, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    if-nez v11, :cond_1d4

    iget v11, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    if-eqz v11, :cond_1df

    .line 1297
    :cond_1d4
    iget-object v11, p0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    iget v12, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    int-to-float v12, v12

    iget v13, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    int-to-float v13, v13

    invoke-virtual {v11, v12, v13}, Landroid/graphics/RectF;->offset(FF)V

    .line 1299
    :cond_1df
    iget v11, p0, Lcom/android/server/wm/WindowState;->mAlpha:F

    iput v11, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    .line 1300
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/server/wm/WindowState;->mHaveMatrix:Z

    .line 1301
    iget v11, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDsDx:F

    .line 1302
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDtDx:F

    .line 1303
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDsDy:F

    .line 1304
    iget v11, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    iput v11, p0, Lcom/android/server/wm/WindowState;->mDtDy:F

    goto :goto_1b1
.end method

.method createSurfaceLocked()Landroid/view/Surface;
    .registers 14

    .prologue
    const/4 v11, 0x0

    const/4 v1, 0x0

    const/4 v12, 0x1

    const/4 v10, 0x0

    .line 649
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_d5

    .line 650
    iput-boolean v10, p0, Lcom/android/server/wm/WindowState;->mReportDestroySurface:Z

    .line 651
    iput-boolean v10, p0, Lcom/android/server/wm/WindowState;->mSurfacePendingDestroy:Z

    .line 654
    iput-boolean v12, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    .line 655
    iput-boolean v10, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    .line 656
    iput-boolean v10, p0, Lcom/android/server/wm/WindowState;->mReadyToShow:Z

    .line 657
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_1a

    .line 658
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v10, v0, Lcom/android/server/wm/AppWindowToken;->allDrawn:Z

    .line 661
    :cond_1a
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v0, p0}, Lcom/android/server/wm/WindowManagerService;->makeWindowFreezingScreenIfNeededLocked(Lcom/android/server/wm/WindowState;)V

    .line 663
    const/4 v8, 0x0

    .line 665
    .local v8, flags:I
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_2a

    .line 666
    or-int/lit16 v8, v8, 0x80

    .line 675
    :cond_2a
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v5

    .line 676
    .local v5, w:I
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    .line 677
    .local v6, h:I
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x4000

    if-eqz v0, :cond_42

    .line 680
    iget v5, p0, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    .line 681
    iget v6, p0, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    .line 686
    :cond_42
    if-gtz v5, :cond_45

    const/4 v5, 0x1

    .line 687
    :cond_45
    if-gtz v6, :cond_48

    const/4 v6, 0x1

    .line 689
    :cond_48
    iput-boolean v10, p0, Lcom/android/server/wm/WindowState;->mSurfaceShown:Z

    .line 690
    iput v10, p0, Lcom/android/server/wm/WindowState;->mSurfaceLayer:I

    .line 691
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceAlpha:F

    .line 692
    iput v1, p0, Lcom/android/server/wm/WindowState;->mSurfaceX:F

    .line 693
    iput v1, p0, Lcom/android/server/wm/WindowState;->mSurfaceY:F

    .line 694
    int-to-float v0, v5

    iput v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceW:F

    .line 695
    int-to-float v0, v6

    iput v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceH:F

    .line 697
    :try_start_5a
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v1, 0x100

    and-int/2addr v0, v1

    if-eqz v0, :cond_64

    move v10, v12

    .line 699
    .local v10, isHwAccelerated:Z
    :cond_64
    if-eqz v10, :cond_d8

    const/4 v7, -0x3

    .line 700
    .local v7, format:I
    :goto_67
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    invoke-static {v0}, Landroid/graphics/PixelFormat;->formatHasAlpha(I)Z

    move-result v0

    if-nez v0, :cond_73

    .line 701
    or-int/lit16 v8, v8, 0x400

    .line 703
    :cond_73
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget-object v1, v1, Lcom/android/server/wm/Session;->mSurfaceSession:Landroid/view/SurfaceSession;

    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v2, v2, Lcom/android/server/wm/Session;->mPid:I

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v3}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/Surface;-><init>(Landroid/view/SurfaceSession;ILjava/lang/String;IIIII)V

    iput-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;
    :try_end_8d
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_5a .. :try_end_8d} :catch_dd
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_8d} :catch_ee

    .line 735
    invoke-static {}, Landroid/view/Surface;->openTransaction()V

    .line 738
    :try_start_90
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget v1, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceX:F

    .line 739
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iget v1, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceY:F

    .line 740
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    iget v1, p0, Lcom/android/server/wm/WindowState;->mSurfaceX:F

    iget v2, p0, Lcom/android/server/wm/WindowState;->mSurfaceY:F

    invoke-virtual {v0, v1, v2}, Landroid/view/Surface;->setPosition(FF)V

    .line 741
    iget v0, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    iput v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceLayer:I

    .line 742
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    iget v1, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    invoke-virtual {v0, v1}, Landroid/view/Surface;->setLayer(I)V

    .line 743
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceShown:Z

    .line 744
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->hide()V

    .line 745
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_cf

    .line 747
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    const/4 v1, 0x4

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/view/Surface;->setFlags(II)V
    :try_end_cf
    .catchall {:try_start_90 .. :try_end_cf} :catchall_11a
    .catch Ljava/lang/RuntimeException; {:try_start_90 .. :try_end_cf} :catch_f8

    .line 754
    :cond_cf
    :goto_cf
    const/4 v0, 0x1

    :try_start_d0
    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLastHidden:Z
    :try_end_d2
    .catchall {:try_start_d0 .. :try_end_d2} :catchall_11a

    .line 756
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    .line 763
    .end local v5           #w:I
    .end local v6           #h:I
    .end local v7           #format:I
    .end local v8           #flags:I
    .end local v10           #isHwAccelerated:Z
    :cond_d5
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    :goto_d7
    return-object v0

    .line 699
    .restart local v5       #w:I
    .restart local v6       #h:I
    .restart local v8       #flags:I
    .restart local v10       #isHwAccelerated:Z
    :cond_d8
    :try_start_d8
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v7, v0, Landroid/view/WindowManager$LayoutParams;->format:I
    :try_end_dc
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_d8 .. :try_end_dc} :catch_dd
    .catch Ljava/lang/Exception; {:try_start_d8 .. :try_end_dc} :catch_ee

    goto :goto_67

    .line 715
    .end local v10           #isHwAccelerated:Z
    :catch_dd
    move-exception v9

    .line 716
    .local v9, e:Landroid/view/Surface$OutOfResourcesException;
    const-string v0, "WindowManager"

    const-string v1, "OutOfResourcesException creating surface"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v1, "create"

    invoke-virtual {v0, p0, v1, v12}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowState;Ljava/lang/String;Z)Z

    move-object v0, v11

    .line 718
    goto :goto_d7

    .line 719
    .end local v9           #e:Landroid/view/Surface$OutOfResourcesException;
    :catch_ee
    move-exception v9

    .line 720
    .local v9, e:Ljava/lang/Exception;
    const-string v0, "WindowManager"

    const-string v1, "Exception creating surface"

    invoke-static {v0, v1, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v11

    .line 721
    goto :goto_d7

    .line 750
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v7       #format:I
    .restart local v10       #isHwAccelerated:Z
    :catch_f8
    move-exception v9

    .line 751
    .local v9, e:Ljava/lang/RuntimeException;
    :try_start_f9
    const-string v0, "WindowManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error creating surface in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 752
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v1, "create-init"

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowState;Ljava/lang/String;Z)Z
    :try_end_119
    .catchall {:try_start_f9 .. :try_end_119} :catchall_11a

    goto :goto_cf

    .line 756
    .end local v9           #e:Ljava/lang/RuntimeException;
    :catchall_11a
    move-exception v0

    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    throw v0
.end method

.method destroyDeferredSurfaceLocked()V
    .registers 5

    .prologue
    .line 843
    :try_start_0
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    if-eqz v1, :cond_9

    .line 852
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    invoke-virtual {v1}, Landroid/view/Surface;->destroy()V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_9} :catch_10

    .line 859
    :cond_9
    :goto_9
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mSurfaceDestroyDeferred:Z

    .line 860
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    .line 861
    return-void

    .line 854
    :catch_10
    move-exception v0

    .line 855
    .local v0, e:Ljava/lang/RuntimeException;
    const-string v1, "WindowManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception thrown when destroying Window "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " surface "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " session "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9
.end method

.method destroySurfaceLocked()V
    .registers 8

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 767
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v3, :cond_10

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v3, v3, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    if-ne p0, v3, :cond_10

    .line 768
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v6, v3, Lcom/android/server/wm/AppWindowToken;->startingDisplayed:Z

    .line 771
    :cond_10
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v3, :cond_3c

    .line 772
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    .line 773
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    .line 774
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mReadyToShow:Z

    .line 776
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 777
    .local v2, i:I
    :goto_20
    if-lez v2, :cond_2f

    .line 778
    add-int/lit8 v2, v2, -0x1

    .line 779
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowState;

    .line 780
    .local v0, c:Lcom/android/server/wm/WindowState;
    iput-boolean v4, v0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    goto :goto_20

    .line 783
    .end local v0           #c:Lcom/android/server/wm/WindowState;
    :cond_2f
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mReportDestroySurface:Z

    if-eqz v3, :cond_3e

    .line 784
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mReportDestroySurface:Z

    .line 785
    iput-boolean v4, p0, Lcom/android/server/wm/WindowState;->mSurfacePendingDestroy:Z

    .line 787
    :try_start_37
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v3}, Landroid/view/IWindow;->dispatchGetNewSurface()V
    :try_end_3c
    .catch Landroid/os/RemoteException; {:try_start_37 .. :try_end_3c} :catch_3d

    .line 839
    .end local v2           #i:I
    :cond_3c
    :goto_3c
    return-void

    .line 790
    .restart local v2       #i:I
    :catch_3d
    move-exception v3

    .line 804
    :cond_3e
    :try_start_3e
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mSurfaceDestroyDeferred:Z

    if-eqz v3, :cond_5f

    .line 805
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v3, :cond_59

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eq v3, v4, :cond_59

    .line 806
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    if-eqz v3, :cond_55

    .line 815
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    invoke-virtual {v3}, Landroid/view/Surface;->destroy()V

    .line 817
    :cond_55
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    iput-object v3, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;
    :try_end_59
    .catch Ljava/lang/RuntimeException; {:try_start_3e .. :try_end_59} :catch_65

    .line 836
    :cond_59
    :goto_59
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mSurfaceShown:Z

    .line 837
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    goto :goto_3c

    .line 828
    :cond_5f
    :try_start_5f
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    invoke-virtual {v3}, Landroid/view/Surface;->destroy()V
    :try_end_64
    .catch Ljava/lang/RuntimeException; {:try_start_5f .. :try_end_64} :catch_65

    goto :goto_59

    .line 830
    :catch_65
    move-exception v1

    .line 831
    .local v1, e:Ljava/lang/RuntimeException;
    const-string v3, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception thrown when destroying Window "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " surface "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " session "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_59
.end method

.method disposeInputChannel()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1518
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    if-eqz v0, :cond_15

    .line 1519
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mInputManager:Lcom/android/server/wm/InputManager;

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    invoke-virtual {v0, v1}, Lcom/android/server/wm/InputManager;->unregisterInputChannel(Landroid/view/InputChannel;)V

    .line 1521
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    invoke-virtual {v0}, Landroid/view/InputChannel;->dispose()V

    .line 1522
    iput-object v2, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    .line 1525
    :cond_15
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputWindowHandle:Lcom/android/server/wm/InputWindowHandle;

    iput-object v2, v0, Lcom/android/server/wm/InputWindowHandle;->inputChannel:Landroid/view/InputChannel;

    .line 1526
    return-void
.end method

.method dump(Ljava/io/PrintWriter;Ljava/lang/String;Z)V
    .registers 7
    .parameter "pw"
    .parameter "prefix"
    .parameter "dumpAll"

    .prologue
    const/high16 v2, -0x4080

    const/high16 v1, 0x3f80

    .line 1666
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSession="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 1667
    const-string v0, " mClient="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v0}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1668
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAttrs="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1669
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Requested w="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1670
    const-string v0, " h="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1671
    const-string v0, " mLayoutSeq="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mLayoutSeq:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1672
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-nez v0, :cond_55

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLayoutAttached:Z

    if-eqz v0, :cond_6c

    .line 1673
    :cond_55
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAttachedWindow="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 1674
    const-string v0, " mLayoutAttached="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLayoutAttached:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1676
    :cond_6c
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    if-nez v0, :cond_78

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    if-nez v0, :cond_78

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mIsFloatingLayer:Z

    if-eqz v0, :cond_a3

    .line 1677
    :cond_78
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mIsImWindow="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1678
    const-string v0, " mIsWallpaper="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1679
    const-string v0, " mIsFloatingLayer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mIsFloatingLayer:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1680
    const-string v0, " mWallpaperVisible="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperVisible:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1682
    :cond_a3
    if-eqz p3, :cond_ea

    .line 1683
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mBaseLayer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mBaseLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1684
    const-string v0, " mSubLayer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSubLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1685
    const-string v0, " mAnimLayer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, "+"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1686
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mTargetAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_529

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mTargetAppToken:Lcom/android/server/wm/AppWindowToken;

    iget v0, v0, Lcom/android/server/wm/AppWindowToken;->animLayerAdjustment:I

    :goto_d3
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1688
    const-string v0, "="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1689
    const-string v0, " mLastLayer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mLastLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1691
    :cond_ea
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_146

    .line 1692
    if-eqz p3, :cond_fd

    .line 1693
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSurface="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1695
    :cond_fd
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Surface: shown="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceShown:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1696
    const-string v0, " layer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1697
    const-string v0, " alpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1698
    const-string v0, " rect=("

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceX:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1699
    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceY:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1700
    const-string v0, ") "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceW:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1701
    const-string v0, " x "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceH:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1703
    :cond_146
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    if-eqz v0, :cond_157

    .line 1704
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mPendingDestroySurface="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1705
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mPendingDestroySurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1707
    :cond_157
    if-eqz p3, :cond_1df

    .line 1708
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mToken="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1709
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mRootToken="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1710
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_184

    .line 1711
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAppToken="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1713
    :cond_184
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mTargetAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_195

    .line 1714
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mTargetAppToken="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mTargetAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1716
    :cond_195
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mViewVisibility=0x"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1717
    iget v0, p0, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1718
    const-string v0, " mLastHidden="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLastHidden:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1719
    const-string v0, " mHaveFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHaveFrame:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1720
    const-string v0, " mObscured="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mObscured:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1721
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSeq="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mSeq:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1722
    const-string v0, " mSystemUiVisibility=0x"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1723
    iget v0, p0, Lcom/android/server/wm/WindowState;->mSystemUiVisibility:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1725
    :cond_1df
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v0, :cond_1eb

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    if-eqz v0, :cond_1eb

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-eqz v0, :cond_20c

    .line 1726
    :cond_1eb
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mPolicyVisibility="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1727
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1728
    const-string v0, " mPolicyVisibilityAfterAnim="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1729
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1730
    const-string v0, " mAttachedHidden="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1732
    :cond_20c
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRelayoutCalled:Z

    if-nez v0, :cond_21d

    .line 1733
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mRelayoutCalled="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRelayoutCalled:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1735
    :cond_21d
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceResized:Z

    if-nez v0, :cond_225

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceDestroyDeferred:Z

    if-eqz v0, :cond_23c

    .line 1736
    :cond_225
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSurfaceResized="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceResized:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1737
    const-string v0, " mSurfaceDestroyDeferred="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mSurfaceDestroyDeferred:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1739
    :cond_23c
    iget v0, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    if-nez v0, :cond_244

    iget v0, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    if-eqz v0, :cond_25b

    .line 1740
    :cond_244
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Offsets x="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mXOffset:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1741
    const-string v0, " y="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mYOffset:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1743
    :cond_25b
    if-eqz p3, :cond_2a3

    .line 1744
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mGivenContentInsets="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1745
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mGivenContentInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1746
    const-string v0, " mGivenVisibleInsets="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1747
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mGivenVisibleInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1748
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1749
    iget v0, p0, Lcom/android/server/wm/WindowState;->mTouchableInsets:I

    if-nez v0, :cond_27f

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mGivenInsetsPending:Z

    if-eqz v0, :cond_296

    .line 1750
    :cond_27f
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mTouchableInsets="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mTouchableInsets:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1751
    const-string v0, " mGivenInsetsPending="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mGivenInsetsPending:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1753
    :cond_296
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mConfiguration="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1755
    :cond_2a3
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mShownFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1756
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->printShortString(Ljava/io/PrintWriter;)V

    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1757
    if-eqz p3, :cond_2cf

    .line 1758
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1759
    const-string v0, " last="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mLastFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1760
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1762
    :cond_2cf
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v0, :cond_2e3

    .line 1763
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mCompatFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1764
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1766
    :cond_2e3
    if-eqz p3, :cond_351

    .line 1767
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mContainingFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1768
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mContainingFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1769
    const-string v0, " mParentFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1770
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mParentFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1771
    const-string v0, " mDisplayFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1772
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mDisplayFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1773
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1774
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mContentFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mContentFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1775
    const-string v0, " mVisibleFrame="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1776
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1777
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mContentInsets="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mContentInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1778
    const-string v0, " last="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mLastContentInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1779
    const-string v0, " mVisibleInsets="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mVisibleInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1780
    const-string v0, " last="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mLastVisibleInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->printShortString(Ljava/io/PrintWriter;)V

    .line 1781
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1783
    :cond_351
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    if-nez v0, :cond_361

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    if-nez v0, :cond_361

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAnimationIsEntrance:Z

    if-nez v0, :cond_361

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_38c

    .line 1785
    :cond_361
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAnimating="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1786
    const-string v0, " mLocalAnimating="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1787
    const-string v0, " mAnimationIsEntrance="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAnimationIsEntrance:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1788
    const-string v0, " mAnimation="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1790
    :cond_38c
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHasTransformation:Z

    if-nez v0, :cond_394

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    if-eqz v0, :cond_3b8

    .line 1791
    :cond_394
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "XForm: has="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1792
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHasTransformation:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1793
    const-string v0, " hasLocal="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1794
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v0, p1}, Landroid/view/animation/Transformation;->printShortString(Ljava/io/PrintWriter;)V

    .line 1795
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1797
    :cond_3b8
    iget v0, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_3ca

    iget v0, p0, Lcom/android/server/wm/WindowState;->mAlpha:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_3ca

    iget v0, p0, Lcom/android/server/wm/WindowState;->mLastAlpha:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3eb

    .line 1798
    :cond_3ca
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mShownAlpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mShownAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1799
    const-string v0, " mAlpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1800
    const-string v0, " mLastAlpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mLastAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1802
    :cond_3eb
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHaveMatrix:Z

    if-nez v0, :cond_3f5

    iget v0, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_42a

    .line 1803
    :cond_3f5
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mGlobalScale="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1804
    const-string v0, " mDsDx="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mDsDx:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1805
    const-string v0, " mDtDx="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mDtDx:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1806
    const-string v0, " mDsDy="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mDsDy:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1807
    const-string v0, " mDtDy="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mDtDy:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1809
    :cond_42a
    if-eqz p3, :cond_457

    .line 1810
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mDrawPending="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1811
    const-string v0, " mCommitDrawPending="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1812
    const-string v0, " mReadyToShow="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mReadyToShow:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1813
    const-string v0, " mHasDrawn="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHasDrawn:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1815
    :cond_457
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v0, :cond_467

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRemoveOnExit:Z

    if-nez v0, :cond_467

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v0, :cond_467

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRemoved:Z

    if-eqz v0, :cond_492

    .line 1816
    :cond_467
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mExiting="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1817
    const-string v0, " mRemoveOnExit="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRemoveOnExit:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1818
    const-string v0, " mDestroying="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1819
    const-string v0, " mRemoved="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRemoved:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1821
    :cond_492
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    if-nez v0, :cond_49e

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAppFreezing:Z

    if-nez v0, :cond_49e

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mTurnOnScreen:Z

    if-eqz v0, :cond_4bf

    .line 1822
    :cond_49e
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mOrientationChanging="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1823
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1824
    const-string v0, " mAppFreezing="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAppFreezing:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1825
    const-string v0, " mTurnOnScreen="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mTurnOnScreen:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1827
    :cond_4bf
    iget v0, p0, Lcom/android/server/wm/WindowState;->mHScale:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_4cb

    iget v0, p0, Lcom/android/server/wm/WindowState;->mVScale:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_4e2

    .line 1828
    :cond_4cb
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mHScale="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mHScale:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1829
    const-string v0, " mVScale="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mVScale:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1831
    :cond_4e2
    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperX:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_4ee

    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperY:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_505

    .line 1832
    :cond_4ee
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mWallpaperX="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperX:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1833
    const-string v0, " mWallpaperY="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperY:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1835
    :cond_505
    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperXStep:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_511

    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperYStep:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_528

    .line 1836
    :cond_511
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mWallpaperXStep="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperXStep:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1837
    const-string v0, " mWallpaperYStep="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowState;->mWallpaperYStep:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1839
    :cond_528
    return-void

    .line 1686
    :cond_529
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_533

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget v0, v0, Lcom/android/server/wm/AppWindowToken;->animLayerAdjustment:I

    goto/16 :goto_d3

    :cond_533
    const/4 v0, 0x0

    goto/16 :goto_d3
.end method

.method finishDrawingLocked()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 864
    iget-boolean v2, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    if-eqz v2, :cond_b

    .line 867
    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    .line 868
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    .line 871
    :goto_a
    return v0

    :cond_b
    move v0, v1

    goto :goto_a
.end method

.method finishExit()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1114
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1115
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_9
    if-ge v2, v0, :cond_19

    .line 1116
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->finishExit()V

    .line 1115
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 1119
    :cond_19
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v3, :cond_1e

    .line 1147
    :cond_1d
    :goto_1d
    return-void

    .line 1123
    :cond_1e
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->isWindowAnimating()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 1130
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v3, :cond_3a

    .line 1131
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mDestroySurface:Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1132
    iput-boolean v7, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    .line 1134
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mSurfaceShown:Z

    .line 1136
    :try_start_33
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    invoke-virtual {v3}, Landroid/view/Surface;->hide()V
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_33 .. :try_end_38} :catch_4a

    .line 1140
    :goto_38
    iput-boolean v7, p0, Lcom/android/server/wm/WindowState;->mLastHidden:Z

    .line 1142
    :cond_3a
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    .line 1143
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mRemoveOnExit:Z

    if-eqz v3, :cond_1d

    .line 1144
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mPendingRemove:Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1145
    iput-boolean v6, p0, Lcom/android/server/wm/WindowState;->mRemoveOnExit:Z

    goto :goto_1d

    .line 1137
    :catch_4a
    move-exception v1

    .line 1138
    .local v1, e:Ljava/lang/RuntimeException;
    const-string v3, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error hiding surface in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_38
.end method

.method public getAppToken()Landroid/view/IApplicationToken;
    .registers 2

    .prologue
    .line 604
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getAttrs()Landroid/view/WindowManager$LayoutParams;
    .registers 2

    .prologue
    .line 565
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    return-object v0
.end method

.method public getContentFrameLw()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 545
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mContentFrame:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getDisplayFrameLw()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 541
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mDisplayFrame:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getFrameLw()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 533
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getGivenContentInsetsLw()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 557
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mGivenContentInsets:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getGivenInsetsPendingLw()Z
    .registers 2

    .prologue
    .line 553
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mGivenInsetsPending:Z

    return v0
.end method

.method public getGivenVisibleInsetsLw()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 561
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mGivenVisibleInsets:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getInputDispatchingTimeoutNanos()J
    .registers 3

    .prologue
    .line 608
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-wide v0, v0, Lcom/android/server/wm/AppWindowToken;->inputDispatchingTimeoutNanos:J

    :goto_8
    return-wide v0

    :cond_9
    const-wide v0, 0x12a05f200L

    goto :goto_8
.end method

.method public getNeedsMenuLw(Landroid/view/WindowManagerPolicy$WindowState;)Z
    .registers 7
    .parameter "bottom"

    .prologue
    const/4 v2, 0x0

    .line 569
    const/4 v0, -0x1

    .line 570
    .local v0, index:I
    move-object v1, p0

    .line 572
    .local v1, ws:Lcom/android/server/wm/WindowState;
    :goto_3
    iget-object v3, v1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_16

    .line 574
    iget-object v3, v1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v4, 0x800

    and-int/2addr v3, v4

    if-eqz v3, :cond_15

    const/4 v2, 0x1

    .line 589
    :cond_15
    return v2

    .line 578
    :cond_16
    if-eq v1, p1, :cond_15

    .line 584
    if-gez v0, :cond_22

    .line 585
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 587
    :cond_22
    add-int/lit8 v0, v0, -0x1

    .line 588
    if-ltz v0, :cond_15

    .line 591
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #ws:Lcom/android/server/wm/WindowState;
    check-cast v1, Lcom/android/server/wm/WindowState;

    .restart local v1       #ws:Lcom/android/server/wm/WindowState;
    goto :goto_3
.end method

.method public getShownFrameLw()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 537
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getSurfaceLayer()I
    .registers 2

    .prologue
    .line 600
    iget v0, p0, Lcom/android/server/wm/WindowState;->mLayer:I

    return v0
.end method

.method public getSystemUiVisibility()I
    .registers 2

    .prologue
    .line 596
    iget v0, p0, Lcom/android/server/wm/WindowState;->mSystemUiVisibility:I

    return v0
.end method

.method public getTouchableRegion(Landroid/graphics/Region;)V
    .registers 6
    .parameter "outRegion"

    .prologue
    .line 1644
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    .line 1645
    .local v0, frame:Landroid/graphics/Rect;
    iget v2, p0, Lcom/android/server/wm/WindowState;->mTouchableInsets:I

    packed-switch v2, :pswitch_data_24

    .line 1648
    invoke-virtual {p1, v0}, Landroid/graphics/Region;->set(Landroid/graphics/Rect;)Z

    .line 1663
    :goto_a
    return-void

    .line 1651
    :pswitch_b
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mGivenContentInsets:Landroid/graphics/Rect;

    invoke-static {p1, v0, v2}, Lcom/android/server/wm/WindowState;->applyInsets(Landroid/graphics/Region;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    goto :goto_a

    .line 1654
    :pswitch_11
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mGivenVisibleInsets:Landroid/graphics/Rect;

    invoke-static {p1, v0, v2}, Lcom/android/server/wm/WindowState;->applyInsets(Landroid/graphics/Region;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    goto :goto_a

    .line 1657
    :pswitch_17
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mGivenTouchableRegion:Landroid/graphics/Region;

    .line 1658
    .local v1, givenTouchableRegion:Landroid/graphics/Region;
    invoke-virtual {p1, v1}, Landroid/graphics/Region;->set(Landroid/graphics/Region;)Z

    .line 1659
    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v3, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Region;->translate(II)V

    goto :goto_a

    .line 1645
    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_b
        :pswitch_11
        :pswitch_17
    .end packed-switch
.end method

.method public getVisibleFrameLw()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 549
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    return-object v0
.end method

.method public hasAppShownWindows()Z
    .registers 2

    .prologue
    .line 614
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-boolean v0, v0, Lcom/android/server/wm/AppWindowToken;->firstWindowDrawn:Z

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public hasDrawnLw()Z
    .registers 2

    .prologue
    .line 1561
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHasDrawn:Z

    return v0
.end method

.method public hideLw(Z)Z
    .registers 3
    .parameter "doAnimation"

    .prologue
    .line 1597
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/server/wm/WindowState;->hideLw(ZZ)Z

    move-result v0

    return v0
.end method

.method hideLw(ZZ)Z
    .registers 8
    .parameter "doAnimation"
    .parameter "requestAnim"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1601
    if-eqz p1, :cond_15

    .line 1602
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v3, v3, Lcom/android/server/wm/WindowManagerService;->mDisplayFrozen:Z

    if-nez v3, :cond_14

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v3}, Landroid/view/WindowManagerPolicy;->isScreenOnFully()Z

    move-result v3

    if-nez v3, :cond_15

    .line 1603
    :cond_14
    const/4 p1, 0x0

    .line 1606
    :cond_15
    if-eqz p1, :cond_1c

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    .line 1608
    .local v0, current:Z
    :goto_19
    if-nez v0, :cond_1f

    .line 1634
    :goto_1b
    return v1

    .line 1606
    .end local v0           #current:Z
    :cond_1c
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    goto :goto_19

    .line 1611
    .restart local v0       #current:Z
    :cond_1f
    if-eqz p1, :cond_2d

    .line 1612
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    const/16 v4, 0x2002

    invoke-virtual {v3, p0, v4, v1}, Lcom/android/server/wm/WindowManagerService;->applyAnimationLocked(Lcom/android/server/wm/WindowState;IZ)Z

    .line 1613
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v3, :cond_2d

    .line 1614
    const/4 p1, 0x0

    .line 1617
    :cond_2d
    if-eqz p1, :cond_3c

    .line 1618
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    .line 1631
    :cond_31
    :goto_31
    if-eqz p2, :cond_3a

    .line 1632
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v3, v4}, Lcom/android/server/wm/WindowManagerService;->requestAnimationLocked(J)V

    :cond_3a
    move v1, v2

    .line 1634
    goto :goto_1b

    .line 1621
    :cond_3c
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    .line 1622
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    .line 1626
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v1}, Lcom/android/server/wm/WindowManagerService;->enableScreenIfNeededLocked()V

    .line 1627
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    if-ne v1, p0, :cond_31

    .line 1628
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-boolean v2, v1, Lcom/android/server/wm/WindowManagerService;->mFocusMayChange:Z

    goto :goto_31
.end method

.method isAnimating()Z
    .registers 4

    .prologue
    .line 1423
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    .line 1424
    .local v1, attached:Lcom/android/server/wm/WindowState;
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1425
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v2, :cond_18

    if-eqz v1, :cond_e

    iget-object v2, v1, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v2, :cond_18

    :cond_e
    if-eqz v0, :cond_1a

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-nez v2, :cond_18

    iget-boolean v2, v0, Lcom/android/server/wm/AppWindowToken;->inPendingTransaction:Z

    if-eqz v2, :cond_1a

    :cond_18
    const/4 v2, 0x1

    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public isDisplayedLw()Z
    .registers 3

    .prologue
    .line 1442
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1443
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v1, :cond_26

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v1, :cond_26

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v1, :cond_26

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    if-nez v1, :cond_26

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    if-nez v1, :cond_26

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v1, :cond_20

    if-eqz v0, :cond_24

    iget-boolean v1, v0, Lcom/android/server/wm/AppWindowToken;->hiddenRequested:Z

    if-eqz v1, :cond_24

    :cond_20
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    if-eqz v1, :cond_26

    :cond_24
    const/4 v1, 0x1

    :goto_25
    return v1

    :cond_26
    const/4 v1, 0x0

    goto :goto_25
.end method

.method public isDrawnLw()Z
    .registers 3

    .prologue
    .line 1455
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1456
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v1, :cond_14

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v1, :cond_14

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    if-nez v1, :cond_14

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    if-nez v1, :cond_14

    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method isFullscreen(II)Z
    .registers 4
    .parameter "screenWidth"
    .parameter "screenHeight"

    .prologue
    .line 1486
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    if-gtz v0, :cond_1a

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    if-gtz v0, :cond_1a

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    if-lt v0, p1, :cond_1a

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    if-lt v0, p2, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method isIdentityMatrix(FFFF)Z
    .registers 11
    .parameter "dsdx"
    .parameter "dtdx"
    .parameter "dsdy"
    .parameter "dtdy"

    .prologue
    const v5, 0x3f800054

    const v4, 0x3f7fff58

    const v3, 0x358637bd

    const v2, -0x4a79c843

    const/4 v0, 0x0

    .line 1150
    cmpg-float v1, p1, v4

    if-ltz v1, :cond_15

    cmpl-float v1, p1, v5

    if-lez v1, :cond_16

    .line 1154
    :cond_15
    :goto_15
    return v0

    .line 1151
    :cond_16
    cmpg-float v1, p4, v4

    if-ltz v1, :cond_15

    cmpl-float v1, p4, v5

    if-gtz v1, :cond_15

    .line 1152
    cmpg-float v1, p2, v2

    if-ltz v1, :cond_15

    cmpl-float v1, p2, v3

    if-gtz v1, :cond_15

    .line 1153
    cmpg-float v1, p3, v2

    if-ltz v1, :cond_15

    cmpl-float v1, p3, v3

    if-gtz v1, :cond_15

    .line 1154
    const/4 v0, 0x1

    goto :goto_15
.end method

.method isOnScreen()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1392
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1393
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    if-eqz v0, :cond_25

    .line 1394
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v3, :cond_23

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v3, :cond_23

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v3, :cond_23

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v3, :cond_1a

    iget-boolean v3, v0, Lcom/android/server/wm/AppWindowToken;->hiddenRequested:Z

    if-eqz v3, :cond_22

    :cond_1a
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v3, :cond_22

    iget-object v3, v0, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_23

    .line 1398
    :cond_22
    :goto_22
    return v1

    :cond_23
    move v1, v2

    .line 1394
    goto :goto_22

    .line 1398
    :cond_25
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v3, :cond_39

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v3, :cond_39

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v3, :cond_39

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-eqz v3, :cond_22

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v3, :cond_22

    :cond_39
    move v1, v2

    goto :goto_22
.end method

.method isOpaqueDrawn()Z
    .registers 3

    .prologue
    .line 1465
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v1, 0x7dd

    if-ne v0, v1, :cond_2b

    :cond_f
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-nez v0, :cond_2b

    :cond_21
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    if-nez v0, :cond_2b

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    if-nez v0, :cond_2b

    const/4 v0, 0x1

    :goto_2a
    return v0

    :cond_2b
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method isPotentialDragTarget()Z
    .registers 2

    .prologue
    .line 1369
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->isVisibleNow()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mRemoved:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputWindowHandle:Lcom/android/server/wm/InputWindowHandle;

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method isReadyForDisplay()Z
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1408
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowToken;->waitingToShow:Z

    if-eqz v4, :cond_10

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mNextAppTransition:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_10

    .line 1415
    :goto_f
    return v3

    .line 1412
    :cond_10
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1413
    .local v1, atoken:Lcom/android/server/wm/AppWindowToken;
    if-eqz v1, :cond_3d

    iget-object v4, v1, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_3b

    move v0, v2

    .line 1415
    .local v0, animating:Z
    :goto_19
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v4, :cond_3f

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v4, :cond_3f

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v4, :cond_3f

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v4, :cond_33

    iget v4, p0, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    if-nez v4, :cond_33

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowToken;->hidden:Z

    if-eqz v4, :cond_39

    :cond_33
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v4, :cond_39

    if-eqz v0, :cond_3f

    :cond_39
    :goto_39
    move v3, v2

    goto :goto_f

    .end local v0           #animating:Z
    :cond_3b
    move v0, v3

    .line 1413
    goto :goto_19

    :cond_3d
    move v0, v3

    goto :goto_19

    .restart local v0       #animating:Z
    :cond_3f
    move v2, v3

    .line 1415
    goto :goto_39
.end method

.method public isVisibleLw()Z
    .registers 3

    .prologue
    .line 1313
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1314
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v1, :cond_1e

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v1, :cond_1e

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v1, :cond_1e

    if-eqz v0, :cond_14

    iget-boolean v1, v0, Lcom/android/server/wm/AppWindowToken;->hiddenRequested:Z

    if-nez v1, :cond_1e

    :cond_14
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v1, :cond_1e

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v1, :cond_1e

    const/4 v1, 0x1

    :goto_1d
    return v1

    :cond_1e
    const/4 v1, 0x0

    goto :goto_1d
.end method

.method isVisibleNow()Z
    .registers 2

    .prologue
    .line 1359
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v0, v0, Lcom/android/server/wm/WindowToken;->hidden:Z

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method isVisibleOrAdding()Z
    .registers 3

    .prologue
    .line 1378
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1379
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v1, :cond_a

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mReportDestroySurface:Z

    if-eqz v1, :cond_12

    :cond_a
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mRelayoutCalled:Z

    if-nez v1, :cond_2a

    iget v1, p0, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    if-nez v1, :cond_2a

    :cond_12
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v1, :cond_2a

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v1, :cond_2a

    if-eqz v0, :cond_20

    iget-boolean v1, v0, Lcom/android/server/wm/AppWindowToken;->hiddenRequested:Z

    if-nez v1, :cond_2a

    :cond_20
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v1, :cond_2a

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v1, :cond_2a

    const/4 v1, 0x1

    :goto_29
    return v1

    :cond_2a
    const/4 v1, 0x0

    goto :goto_29
.end method

.method public isVisibleOrBehindKeyguardLw()Z
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1328
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowToken;->waitingToShow:Z

    if-eqz v4, :cond_10

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mNextAppTransition:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_10

    .line 1335
    :goto_f
    return v3

    .line 1332
    :cond_10
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1333
    .local v1, atoken:Lcom/android/server/wm/AppWindowToken;
    if-eqz v1, :cond_43

    iget-object v4, v1, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_41

    move v0, v2

    .line 1335
    .local v0, animating:Z
    :goto_19
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v4, :cond_49

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v4, :cond_49

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v4, :cond_49

    if-nez v1, :cond_45

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v4, :cond_49

    :cond_2b
    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v4, :cond_39

    iget v4, p0, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    if-nez v4, :cond_39

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mRootToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowToken;->hidden:Z

    if-eqz v4, :cond_3f

    :cond_39
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v4, :cond_3f

    if-eqz v0, :cond_49

    :cond_3f
    :goto_3f
    move v3, v2

    goto :goto_f

    .end local v0           #animating:Z
    :cond_41
    move v0, v3

    .line 1333
    goto :goto_19

    :cond_43
    move v0, v3

    goto :goto_19

    .line 1335
    .restart local v0       #animating:Z
    :cond_45
    iget-boolean v4, v1, Lcom/android/server/wm/AppWindowToken;->hiddenRequested:Z

    if-eqz v4, :cond_2b

    :cond_49
    move v2, v3

    goto :goto_3f
.end method

.method public isWinVisibleLw()Z
    .registers 3

    .prologue
    .line 1348
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 1349
    .local v0, atoken:Lcom/android/server/wm/AppWindowToken;
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v1, :cond_22

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v1, :cond_22

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v1, :cond_22

    if-eqz v0, :cond_18

    iget-boolean v1, v0, Lcom/android/server/wm/AppWindowToken;->hiddenRequested:Z

    if-eqz v1, :cond_18

    iget-boolean v1, v0, Lcom/android/server/wm/AppWindowToken;->animating:Z

    if-eqz v1, :cond_22

    :cond_18
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v1, :cond_22

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mDestroying:Z

    if-nez v1, :cond_22

    const/4 v1, 0x1

    :goto_21
    return v1

    :cond_22
    const/4 v1, 0x0

    goto :goto_21
.end method

.method isWindowAnimating()Z
    .registers 2

    .prologue
    .line 1434
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method makeInputChannelName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1842
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v1}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method performShowLocked()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 902
    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mReadyToShow:Z

    if-eqz v4, :cond_86

    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->isReadyForDisplay()Z

    move-result v4

    if-eqz v4, :cond_86

    .line 915
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4, p0}, Lcom/android/server/wm/WindowManagerService;->showSurfaceRobustlyLocked(Lcom/android/server/wm/WindowState;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 968
    :goto_14
    return v2

    .line 918
    :cond_15
    const/high16 v4, -0x4080

    iput v4, p0, Lcom/android/server/wm/WindowState;->mLastAlpha:F

    .line 919
    iput-boolean v3, p0, Lcom/android/server/wm/WindowState;->mHasDrawn:Z

    .line 920
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mLastHidden:Z

    .line 921
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mReadyToShow:Z

    .line 922
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->enableScreenIfNeededLocked()V

    .line 924
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4, p0}, Lcom/android/server/wm/WindowManagerService;->applyEnterAnimationLocked(Lcom/android/server/wm/WindowState;)V

    .line 926
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 927
    .local v1, i:I
    :cond_2f
    :goto_2f
    if-lez v1, :cond_4d

    .line 928
    add-int/lit8 v1, v1, -0x1

    .line 929
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowState;

    .line 930
    .local v0, c:Lcom/android/server/wm/WindowState;
    iget-boolean v4, v0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-eqz v4, :cond_2f

    .line 931
    iput-boolean v2, v0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    .line 932
    iget-object v4, v0, Lcom/android/server/wm/WindowState;->mSurface:Landroid/view/Surface;

    if-eqz v4, :cond_2f

    .line 933
    invoke-virtual {v0}, Lcom/android/server/wm/WindowState;->performShowLocked()Z

    .line 939
    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-boolean v3, v4, Lcom/android/server/wm/WindowManagerService;->mLayoutNeeded:Z

    goto :goto_2f

    .line 944
    .end local v0           #c:Lcom/android/server/wm/WindowState;
    :cond_4d
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v4, 0x3

    if-eq v2, v4, :cond_86

    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v2, :cond_86

    .line 946
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v3, v2, Lcom/android/server/wm/AppWindowToken;->firstWindowDrawn:Z

    .line 948
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v2, v2, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    if-eqz v2, :cond_81

    .line 956
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v2, :cond_70

    .line 957
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v2}, Landroid/view/animation/Animation;->cancel()V

    .line 958
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    .line 960
    iput-boolean v3, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 962
    :cond_70
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 963
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Lcom/android/server/wm/WindowManagerService$H;->sendEmptyMessage(I)Z

    .line 965
    :cond_81
    iget-object v2, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v2}, Lcom/android/server/wm/AppWindowToken;->updateReportedVisibilityLocked()V

    .end local v1           #i:I
    :cond_86
    move v2, v3

    .line 968
    goto :goto_14
.end method

.method prelayout()V
    .registers 3

    .prologue
    const/high16 v1, 0x3f80

    .line 1158
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v0, :cond_13

    .line 1159
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v0, v0, Lcom/android/server/wm/WindowManagerService;->mCompatibleScreenScale:F

    iput v0, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    .line 1160
    iget v0, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    div-float v0, v1, v0

    iput v0, p0, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    .line 1164
    :goto_12
    return-void

    .line 1162
    :cond_13
    iput v1, p0, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    iput v1, p0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    goto :goto_12
.end method

.method removeLocked()V
    .registers 4

    .prologue
    .line 1491
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->disposeInputChannel()V

    .line 1493
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-eqz v0, :cond_e

    .line 1495
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mChildWindows:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1497
    :cond_e
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->destroyDeferredSurfaceLocked()V

    .line 1498
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->destroySurfaceLocked()V

    .line 1499
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {v0}, Lcom/android/server/wm/Session;->windowRemovedLocked()V

    .line 1501
    :try_start_19
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    invoke-interface {v0}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mDeathRecipient:Lcom/android/server/wm/WindowState$DeathRecipient;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z
    :try_end_25
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_25} :catch_26

    .line 1506
    :goto_25
    return-void

    .line 1502
    :catch_26
    move-exception v0

    goto :goto_25
.end method

.method public setAnimation(Landroid/view/animation/Animation;)V
    .registers 5
    .parameter "anim"

    .prologue
    const/4 v0, 0x0

    .line 620
    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 621
    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    .line 622
    iput-object p1, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    .line 623
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x2710

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->restrictDuration(J)V

    .line 624
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v1, v1, Lcom/android/server/wm/WindowManagerService;->mWindowAnimationScale:F

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->scaleCurrentDuration(F)V

    .line 625
    return-void
.end method

.method setInputChannel(Landroid/view/InputChannel;)V
    .registers 4
    .parameter "inputChannel"

    .prologue
    .line 1509
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    if-eqz v0, :cond_c

    .line 1510
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Window already has an input channel."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1513
    :cond_c
    iput-object p1, p0, Lcom/android/server/wm/WindowState;->mInputChannel:Landroid/view/InputChannel;

    .line 1514
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mInputWindowHandle:Lcom/android/server/wm/InputWindowHandle;

    iput-object p1, v0, Lcom/android/server/wm/InputWindowHandle;->inputChannel:Landroid/view/InputChannel;

    .line 1515
    return-void
.end method

.method shouldAnimateMove()Z
    .registers 3

    .prologue
    .line 1478
    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mContentChanged:Z

    if-eqz v0, :cond_3e

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v0, :cond_3e

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mLastHidden:Z

    if-nez v0, :cond_3e

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v0, v0, Lcom/android/server/wm/WindowManagerService;->mDisplayFrozen:Z

    if-nez v0, :cond_3e

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mLastFrame:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    if-ne v0, v1, :cond_26

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mLastFrame:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    if-eq v0, v1, :cond_3e

    :cond_26
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-eqz v0, :cond_32

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowState;->shouldAnimateMove()Z

    move-result v0

    if-nez v0, :cond_3e

    :cond_32
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v0}, Landroid/view/WindowManagerPolicy;->isScreenOnFully()Z

    move-result v0

    if-eqz v0, :cond_3e

    const/4 v0, 0x1

    :goto_3d
    return v0

    :cond_3e
    const/4 v0, 0x0

    goto :goto_3d
.end method

.method public showLw(Z)Z
    .registers 3
    .parameter "doAnimation"

    .prologue
    .line 1565
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/server/wm/WindowState;->showLw(ZZ)Z

    move-result v0

    return v0
.end method

.method showLw(ZZ)Z
    .registers 7
    .parameter "doAnimation"
    .parameter "requestAnim"

    .prologue
    const/4 v0, 0x1

    .line 1569
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v1, :cond_b

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    if-eqz v1, :cond_b

    .line 1570
    const/4 v0, 0x0

    .line 1593
    :cond_a
    :goto_a
    return v0

    .line 1573
    :cond_b
    if-eqz p1, :cond_1e

    .line 1576
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v1, v1, Lcom/android/server/wm/WindowManagerService;->mDisplayFrozen:Z

    if-nez v1, :cond_1d

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v1}, Landroid/view/WindowManagerPolicy;->isScreenOnFully()Z

    move-result v1

    if-nez v1, :cond_35

    .line 1577
    :cond_1d
    const/4 p1, 0x0

    .line 1585
    :cond_1e
    :goto_1e
    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    .line 1586
    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    .line 1587
    if-eqz p1, :cond_2b

    .line 1588
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    const/16 v2, 0x1001

    invoke-virtual {v1, p0, v2, v0}, Lcom/android/server/wm/WindowManagerService;->applyAnimationLocked(Lcom/android/server/wm/WindowState;IZ)Z

    .line 1590
    :cond_2b
    if-eqz p2, :cond_a

    .line 1591
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/server/wm/WindowManagerService;->requestAnimationLocked(J)V

    goto :goto_a

    .line 1578
    :cond_35
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-nez v1, :cond_1e

    .line 1582
    const/4 p1, 0x0

    goto :goto_1e
.end method

.method stepAnimationLocked(JII)Z
    .registers 12
    .parameter "currentTime"
    .parameter "dw"
    .parameter "dh"

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 974
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v3, v3, Lcom/android/server/wm/WindowManagerService;->mDisplayFrozen:Z

    if-nez v3, :cond_94

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v3}, Landroid/view/WindowManagerPolicy;->isScreenOnFully()Z

    move-result v3

    if-eqz v3, :cond_94

    .line 977
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mDrawPending:Z

    if-nez v3, :cond_5c

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mCommitDrawPending:Z

    if-nez v3, :cond_5c

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_5c

    .line 978
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mHasTransformation:Z

    .line 979
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    .line 980
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    if-nez v3, :cond_41

    .line 986
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget-object v5, p0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-virtual {v3, v4, v5, p3, p4}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 987
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v3, p1, p2}, Landroid/view/animation/Animation;->setStartTime(J)V

    .line 988
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    .line 989
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 991
    :cond_41
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->clear()V

    .line 992
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v3, p1, p2, v4}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v0

    .line 997
    .local v0, more:Z
    if-eqz v0, :cond_51

    .line 1104
    .end local v0           #more:Z
    :goto_50
    return v1

    .line 1005
    .restart local v0       #more:Z
    :cond_51
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_5c

    .line 1006
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v3}, Landroid/view/animation/Animation;->cancel()V

    .line 1007
    iput-object v6, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    .line 1011
    .end local v0           #more:Z
    :cond_5c
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    .line 1012
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    if-eqz v3, :cond_66

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mAnimationIsEntrance:Z

    if-eqz v3, :cond_7b

    :cond_66
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v3, :cond_7b

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v3, v3, Lcom/android/server/wm/AppWindowToken;->animation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_7b

    .line 1021
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 1022
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mHasTransformation:Z

    .line 1023
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v1}, Landroid/view/animation/Transformation;->clear()V

    move v1, v2

    .line 1024
    goto :goto_50

    .line 1025
    :cond_7b
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mHasTransformation:Z

    if-eqz v3, :cond_8b

    .line 1028
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 1041
    :cond_81
    :goto_81
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    if-nez v3, :cond_a4

    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    if-nez v3, :cond_a4

    move v1, v2

    .line 1042
    goto :goto_50

    .line 1029
    :cond_8b
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->isAnimating()Z

    move-result v3

    if-eqz v3, :cond_81

    .line 1030
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    goto :goto_81

    .line 1032
    :cond_94
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_81

    .line 1035
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 1036
    iput-boolean v1, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    .line 1037
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v3}, Landroid/view/animation/Animation;->cancel()V

    .line 1038
    iput-object v6, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    goto :goto_81

    .line 1050
    :cond_a4
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mAnimating:Z

    .line 1051
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mLocalAnimating:Z

    .line 1052
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_b3

    .line 1053
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v3}, Landroid/view/animation/Animation;->cancel()V

    .line 1054
    iput-object v6, p0, Lcom/android/server/wm/WindowState;->mAnimation:Landroid/view/animation/Animation;

    .line 1056
    :cond_b3
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    if-ne v3, p0, :cond_bd

    .line 1057
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-object v6, v3, Lcom/android/server/wm/WindowManagerService;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    .line 1059
    :cond_bd
    iget v3, p0, Lcom/android/server/wm/WindowState;->mLayer:I

    iput v3, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    .line 1060
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    if-eqz v3, :cond_133

    .line 1061
    iget v3, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mInputMethodAnimLayerAdjustment:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    .line 1067
    :cond_ce
    :goto_ce
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mHasTransformation:Z

    .line 1068
    iput-boolean v2, p0, Lcom/android/server/wm/WindowState;->mHasLocalTransformation:Z

    .line 1069
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    iget-boolean v4, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    if-eq v3, v4, :cond_f3

    .line 1074
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    iput-boolean v3, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    .line 1075
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-boolean v1, v3, Lcom/android/server/wm/WindowManagerService;->mLayoutNeeded:Z

    .line 1076
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-nez v3, :cond_f3

    .line 1077
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    if-ne v3, p0, :cond_ee

    .line 1078
    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-boolean v1, v3, Lcom/android/server/wm/WindowManagerService;->mFocusMayChange:Z

    .line 1083
    :cond_ee
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v1}, Lcom/android/server/wm/WindowManagerService;->enableScreenIfNeededLocked()V

    .line 1086
    :cond_f3
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v1}, Landroid/view/animation/Transformation;->clear()V

    .line 1087
    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mHasDrawn:Z

    if-eqz v1, :cond_124

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v3, 0x3

    if-ne v1, v3, :cond_124

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v1, :cond_124

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-boolean v1, v1, Lcom/android/server/wm/AppWindowToken;->firstWindowDrawn:Z

    if-eqz v1, :cond_124

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v1, v1, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    if-eqz v1, :cond_124

    .line 1094
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1095
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/4 v3, 0x7

    invoke-virtual {v1, v3}, Lcom/android/server/wm/WindowManagerService$H;->sendEmptyMessage(I)Z

    .line 1098
    :cond_124
    invoke-virtual {p0}, Lcom/android/server/wm/WindowState;->finishExit()V

    .line 1100
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v1, :cond_130

    .line 1101
    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v1}, Lcom/android/server/wm/AppWindowToken;->updateReportedVisibilityLocked()V

    :cond_130
    move v1, v2

    .line 1104
    goto/16 :goto_50

    .line 1062
    :cond_133
    iget-boolean v3, p0, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    if-eqz v3, :cond_ce

    .line 1063
    iget v3, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    iget-object v4, p0, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mWallpaperAnimLayerAdjustment:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/android/server/wm/WindowState;->mAnimLayer:I

    goto :goto_ce
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1848
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mStringNameCache:Ljava/lang/String;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mLastTitle:Ljava/lang/CharSequence;

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v1}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    if-ne v0, v1, :cond_16

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mWasPaused:Z

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v1, v1, Lcom/android/server/wm/WindowToken;->paused:Z

    if-eq v0, v1, :cond_5f

    .line 1850
    :cond_16
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v0}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/WindowState;->mLastTitle:Ljava/lang/CharSequence;

    .line 1851
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    iget-boolean v0, v0, Lcom/android/server/wm/WindowToken;->paused:Z

    iput-boolean v0, p0, Lcom/android/server/wm/WindowState;->mWasPaused:Z

    .line 1852
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Window{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wm/WindowState;->mLastTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " paused="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/wm/WindowState;->mWasPaused:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/WindowState;->mStringNameCache:Ljava/lang/String;

    .line 1855
    :cond_5f
    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mStringNameCache:Ljava/lang/String;

    return-object v0
.end method
