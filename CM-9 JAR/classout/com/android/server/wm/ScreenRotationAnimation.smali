.class Lcom/android/server/wm/ScreenRotationAnimation;
.super Ljava/lang/Object;
.source "ScreenRotationAnimation.java"


# static fields
.field static final DEBUG:Z = false

.field static final FREEZE_LAYER:I = 0x1e8480

.field static final TAG:Ljava/lang/String; = "ScreenRotationAnimation"


# instance fields
.field mBlackFrame:Lcom/android/server/wm/BlackFrame;

.field final mContext:Landroid/content/Context;

.field mCurRotation:I

.field mEnterAnimation:Landroid/view/animation/Animation;

.field final mEnterTransformation:Landroid/view/animation/Transformation;

.field mExitAnimation:Landroid/view/animation/Animation;

.field final mExitTransformation:Landroid/view/animation/Transformation;

.field mHeight:I

.field mOriginalHeight:I

.field mOriginalRotation:I

.field mOriginalWidth:I

.field mSnapshotDeltaRotation:I

.field final mSnapshotFinalMatrix:Landroid/graphics/Matrix;

.field final mSnapshotInitialMatrix:Landroid/graphics/Matrix;

.field mSnapshotRotation:I

.field mStarted:Z

.field mSurface:Landroid/view/Surface;

.field final mTmpFloats:[F

.field final mTmpMatrix:Landroid/graphics/Matrix;

.field mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/SurfaceSession;ZIII)V
    .registers 24
    .parameter "context"
    .parameter "session"
    .parameter "inTransaction"
    .parameter "originalWidth"
    .parameter "originalHeight"
    .parameter "originalRotation"

    .prologue
    .line 64
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v2, Landroid/view/animation/Transformation;

    invoke-direct {v2}, Landroid/view/animation/Transformation;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitTransformation:Landroid/view/animation/Transformation;

    .line 55
    new-instance v2, Landroid/view/animation/Transformation;

    invoke-direct {v2}, Landroid/view/animation/Transformation;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterTransformation:Landroid/view/animation/Transformation;

    .line 58
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotInitialMatrix:Landroid/graphics/Matrix;

    .line 59
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotFinalMatrix:Landroid/graphics/Matrix;

    .line 60
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 61
    const/16 v2, 0x9

    new-array v2, v2, [F

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    .line 65
    const-string v2, "ro.board.platform"

    const-string v3, ""

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "tegra"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    .line 66
    .local v13, isTegra:Z
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    .line 70
    const-string v2, "ro.sf.hwrotation"

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    div-int/lit8 v2, v2, 0x5a

    rsub-int/lit8 v2, v2, 0x4

    rem-int/lit8 v2, v2, 0x4

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotRotation:I

    .line 71
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotRotation:I

    if-eqz v2, :cond_6a

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotRotation:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_da

    .line 72
    :cond_6a
    const/4 v2, 0x1

    move/from16 v0, p6

    if-eq v0, v2, :cond_74

    const/4 v2, 0x3

    move/from16 v0, p6

    if-ne v0, v2, :cond_cd

    .line 74
    :cond_74
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    .line 75
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    .line 90
    :goto_80
    move/from16 v0, p6

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalRotation:I

    .line 91
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalWidth:I

    .line 92
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalHeight:I

    .line 94
    if-nez p3, :cond_97

    .line 97
    invoke-static {}, Landroid/view/Surface;->openTransaction()V

    .line 102
    :cond_97
    :try_start_97
    new-instance v2, Landroid/view/Surface;

    const/4 v4, 0x0

    const-string v5, "FreezeSurface"

    const/4 v6, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    const/4 v9, -0x1

    if-eqz v13, :cond_fe

    const/4 v10, 0x0

    :goto_a9
    move-object/from16 v3, p2

    invoke-direct/range {v2 .. v10}, Landroid/view/Surface;-><init>(Landroid/view/SurfaceSession;ILjava/lang/String;IIIII)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    .line 104
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    if-eqz v2, :cond_c2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2}, Landroid/view/Surface;->isValid()Z

    move-result v2

    if-nez v2, :cond_102

    .line 106
    :cond_c2
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;
    :try_end_c7
    .catchall {:try_start_97 .. :try_end_c7} :catchall_15e
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_97 .. :try_end_c7} :catch_155

    .line 150
    if-nez p3, :cond_cc

    .line 151
    :goto_c9
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    .line 156
    :cond_cc
    return-void

    .line 77
    :cond_cd
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    .line 78
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    goto :goto_80

    .line 81
    :cond_da
    const/4 v2, 0x1

    move/from16 v0, p6

    if-eq v0, v2, :cond_e4

    const/4 v2, 0x3

    move/from16 v0, p6

    if-ne v0, v2, :cond_f1

    .line 83
    :cond_e4
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    .line 84
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    goto :goto_80

    .line 86
    :cond_f1
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    .line 87
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    goto :goto_80

    .line 102
    :cond_fe
    const v10, 0x30004

    goto :goto_a9

    .line 109
    :cond_102
    :try_start_102
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    const v3, 0x1e8481

    invoke-virtual {v2, v3}, Landroid/view/Surface;->setLayer(I)V

    .line 110
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2}, Landroid/view/Surface;->show()V
    :try_end_113
    .catchall {:try_start_102 .. :try_end_113} :catchall_15e
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_102 .. :try_end_113} :catch_155

    .line 119
    :goto_113
    :try_start_113
    move-object/from16 v0, p0

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/android/server/wm/ScreenRotationAnimation;->setRotation(I)V

    .line 121
    if-eqz v13, :cond_195

    .line 122
    new-instance v15, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    invoke-direct {v15, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V
    :try_end_12b
    .catchall {:try_start_113 .. :try_end_12b} :catchall_15e

    .line 123
    .local v15, rect:Landroid/graphics/Rect;
    const/4 v11, 0x0

    .line 126
    .local v11, canvas:Landroid/graphics/Canvas;
    :try_start_12c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2, v15}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;
    :try_end_133
    .catchall {:try_start_12c .. :try_end_133} :catchall_15e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12c .. :try_end_133} :catch_165
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_12c .. :try_end_133} :catch_16e

    move-result-object v11

    .line 133
    :goto_134
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_136
    invoke-static {v2, v3}, Landroid/view/Surface;->screenshot(II)Landroid/graphics/Bitmap;

    move-result-object v16

    .line 134
    .local v16, screenshot:Landroid/graphics/Bitmap;
    if-eqz v11, :cond_13e

    if-nez v16, :cond_177

    .line 135
    :cond_13e
    const-string v2, "ScreenRotationAnimation"

    const-string v3, "Null surface canvas"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2}, Landroid/view/Surface;->destroy()V

    .line 137
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    .line 150
    if-nez p3, :cond_cc

    goto/16 :goto_c9

    .line 111
    .end local v11           #canvas:Landroid/graphics/Canvas;
    .end local v15           #rect:Landroid/graphics/Rect;
    .end local v16           #screenshot:Landroid/graphics/Bitmap;
    :catch_155
    move-exception v12

    .line 112
    .local v12, e:Landroid/view/Surface$OutOfResourcesException;
    const-string v2, "ScreenRotationAnimation"

    const-string v3, "Unable to allocate freeze surface"

    invoke-static {v2, v3, v12}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_15d
    .catchall {:try_start_136 .. :try_end_15d} :catchall_15e

    goto :goto_113

    .line 150
    .end local v12           #e:Landroid/view/Surface$OutOfResourcesException;
    :catchall_15e
    move-exception v2

    if-nez p3, :cond_164

    .line 151
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    .line 150
    :cond_164
    throw v2

    .line 127
    .restart local v11       #canvas:Landroid/graphics/Canvas;
    .restart local v15       #rect:Landroid/graphics/Rect;
    :catch_165
    move-exception v12

    .line 128
    .local v12, e:Ljava/lang/IllegalArgumentException;
    :try_start_166
    const-string v2, "ScreenRotationAnimation"

    const-string v3, "Unable to lock surface"

    invoke-static {v2, v3, v12}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_134

    .line 129
    .end local v12           #e:Ljava/lang/IllegalArgumentException;
    :catch_16e
    move-exception v12

    .line 130
    .local v12, e:Landroid/view/Surface$OutOfResourcesException;
    const-string v2, "ScreenRotationAnimation"

    const-string v3, "Unable to lock surface"

    invoke-static {v2, v3, v12}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_134

    .line 141
    .end local v12           #e:Landroid/view/Surface$OutOfResourcesException;
    .restart local v16       #screenshot:Landroid/graphics/Bitmap;
    :cond_177
    new-instance v14, Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-direct {v14, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 142
    .local v14, paint:Landroid/graphics/Paint;
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v14, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 144
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v11, v0, v2, v3, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 145
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2, v11}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_195
    .catchall {:try_start_166 .. :try_end_195} :catchall_15e

    .line 150
    .end local v11           #canvas:Landroid/graphics/Canvas;
    .end local v14           #paint:Landroid/graphics/Paint;
    .end local v15           #rect:Landroid/graphics/Rect;
    .end local v16           #screenshot:Landroid/graphics/Bitmap;
    :cond_195
    if-nez p3, :cond_cc

    goto/16 :goto_c9
.end method

.method public static createRotationMatrix(IIILandroid/graphics/Matrix;)V
    .registers 6
    .parameter "rotation"
    .parameter "width"
    .parameter "height"
    .parameter "outMatrix"

    .prologue
    const/4 v1, 0x0

    .line 191
    packed-switch p0, :pswitch_data_28

    .line 208
    :goto_4
    return-void

    .line 193
    :pswitch_5
    invoke-virtual {p3}, Landroid/graphics/Matrix;->reset()V

    goto :goto_4

    .line 196
    :pswitch_9
    const/high16 v0, 0x42b4

    invoke-virtual {p3, v0, v1, v1}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 197
    int-to-float v0, p2

    invoke-virtual {p3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_4

    .line 200
    :pswitch_13
    const/high16 v0, 0x4334

    invoke-virtual {p3, v0, v1, v1}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 201
    int-to-float v0, p1

    int-to-float v1, p2

    invoke-virtual {p3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_4

    .line 204
    :pswitch_1e
    const/high16 v0, 0x4387

    invoke-virtual {p3, v0, v1, v1}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 205
    int-to-float v0, p1

    invoke-virtual {p3, v1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_4

    .line 191
    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_5
        :pswitch_9
        :pswitch_13
        :pswitch_1e
    .end packed-switch
.end method

.method static deltaRotation(II)I
    .registers 3
    .parameter "oldRotation"
    .parameter "newRotation"

    .prologue
    .line 163
    sub-int v0, p1, p0

    .line 164
    .local v0, delta:I
    if-gez v0, :cond_6

    add-int/lit8 v0, v0, 0x4

    .line 165
    :cond_6
    return v0
.end method


# virtual methods
.method public dismiss(Landroid/view/SurfaceSession;JFII)Z
    .registers 15
    .parameter "session"
    .parameter "maxAnimationDuration"
    .parameter "animationScale"
    .parameter "finalWidth"
    .parameter "finalHeight"

    .prologue
    const/4 v4, 0x0

    .line 229
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    if-nez v5, :cond_6

    .line 293
    :goto_5
    return v4

    .line 235
    :cond_6
    iget v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mCurRotation:I

    iget v6, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalRotation:I

    invoke-static {v5, v6}, Lcom/android/server/wm/ScreenRotationAnimation;->deltaRotation(II)I

    move-result v0

    .line 237
    .local v0, delta:I
    packed-switch v0, :pswitch_data_ca

    .line 268
    :goto_11
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    iget v6, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalWidth:I

    iget v7, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalHeight:I

    invoke-virtual {v5, p5, p6, v6, v7}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 269
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    iget v6, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalWidth:I

    iget v7, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mOriginalHeight:I

    invoke-virtual {v5, p5, p6, v6, v7}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 270
    iput-boolean v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mStarted:Z

    .line 272
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p2, p3}, Landroid/view/animation/Animation;->restrictDuration(J)V

    .line 273
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p4}, Landroid/view/animation/Animation;->scaleCurrentDuration(F)V

    .line 274
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p2, p3}, Landroid/view/animation/Animation;->restrictDuration(J)V

    .line 275
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p4}, Landroid/view/animation/Animation;->scaleCurrentDuration(F)V

    .line 279
    invoke-static {}, Landroid/view/Surface;->openTransaction()V

    .line 282
    :try_start_3c
    new-instance v3, Landroid/graphics/Rect;

    neg-int v4, p5

    neg-int v5, p6

    mul-int/lit8 v6, p5, 0x2

    mul-int/lit8 v7, p6, 0x2

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 283
    .local v3, outer:Landroid/graphics/Rect;
    new-instance v2, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v2, v4, v5, p5, p6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 284
    .local v2, inner:Landroid/graphics/Rect;
    new-instance v4, Lcom/android/server/wm/BlackFrame;

    const v5, 0x1e8480

    invoke-direct {v4, p1, v3, v2, v5}, Lcom/android/server/wm/BlackFrame;-><init>(Landroid/view/SurfaceSession;Landroid/graphics/Rect;Landroid/graphics/Rect;I)V

    iput-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;
    :try_end_58
    .catchall {:try_start_3c .. :try_end_58} :catchall_c4
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_3c .. :try_end_58} :catch_bb

    .line 288
    .end local v2           #inner:Landroid/graphics/Rect;
    .end local v3           #outer:Landroid/graphics/Rect;
    :goto_58
    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    .line 293
    const/4 v4, 0x1

    goto :goto_5

    .line 239
    :pswitch_5d
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a002d

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    .line 241
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a002c

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    goto :goto_11

    .line 245
    :pswitch_74
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a0033

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    .line 247
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a0032

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    goto :goto_11

    .line 251
    :pswitch_8b
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a002f

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    .line 253
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a002e

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    goto/16 :goto_11

    .line 257
    :pswitch_a3
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a0031

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    .line 259
    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mContext:Landroid/content/Context;

    const v6, 0x10a0030

    invoke-static {v5, v6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    goto/16 :goto_11

    .line 285
    :catch_bb
    move-exception v1

    .line 286
    .local v1, e:Landroid/view/Surface$OutOfResourcesException;
    :try_start_bc
    const-string v4, "ScreenRotationAnimation"

    const-string v5, "Unable to allocate black surface"

    invoke-static {v4, v5, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c3
    .catchall {:try_start_bc .. :try_end_c3} :catchall_c4

    goto :goto_58

    .line 288
    .end local v1           #e:Landroid/view/Surface$OutOfResourcesException;
    :catchall_c4
    move-exception v4

    invoke-static {}, Landroid/view/Surface;->closeTransaction()V

    throw v4

    .line 237
    nop

    :pswitch_data_ca
    .packed-switch 0x0
        :pswitch_5d
        :pswitch_74
        :pswitch_8b
        :pswitch_a3
    .end packed-switch
.end method

.method public getEnterTransformation()Landroid/view/animation/Transformation;
    .registers 2

    .prologue
    .line 377
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterTransformation:Landroid/view/animation/Transformation;

    return-object v0
.end method

.method hasScreenshot()Z
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isAnimating()Z
    .registers 2

    .prologue
    .line 318
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public kill()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 297
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_c

    .line 301
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->destroy()V

    .line 302
    iput-object v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    .line 304
    :cond_c
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    if-eqz v0, :cond_15

    .line 305
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    invoke-virtual {v0}, Lcom/android/server/wm/BlackFrame;->kill()V

    .line 307
    :cond_15
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_20

    .line 308
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 309
    iput-object v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    .line 311
    :cond_20
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_2b

    .line 312
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 313
    iput-object v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    .line 315
    :cond_2b
    return-void
.end method

.method public setRotation(I)V
    .registers 6
    .parameter "rotation"

    .prologue
    .line 212
    iput p1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mCurRotation:I

    .line 217
    iget v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotRotation:I

    invoke-static {p1, v1}, Lcom/android/server/wm/ScreenRotationAnimation;->deltaRotation(II)I

    move-result v0

    .line 218
    .local v0, delta:I
    iget v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mWidth:I

    iget v2, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mHeight:I

    iget-object v3, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotInitialMatrix:Landroid/graphics/Matrix;

    invoke-static {v0, v1, v2, v3}, Lcom/android/server/wm/ScreenRotationAnimation;->createRotationMatrix(IIILandroid/graphics/Matrix;)V

    .line 221
    iget-object v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotInitialMatrix:Landroid/graphics/Matrix;

    const/high16 v2, 0x3f80

    invoke-virtual {p0, v1, v2}, Lcom/android/server/wm/ScreenRotationAnimation;->setSnapshotTransform(Landroid/graphics/Matrix;F)V

    .line 222
    return-void
.end method

.method setSnapshotTransform(Landroid/graphics/Matrix;F)V
    .registers 9
    .parameter "matrix"
    .parameter "alpha"

    .prologue
    .line 169
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_36

    .line 170
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 171
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    const/4 v3, 0x5

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/view/Surface;->setPosition(FF)V

    .line 173
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    iget-object v3, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mTmpFloats:[F

    const/4 v5, 0x4

    aget v4, v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/Surface;->setMatrix(FFFF)V

    .line 176
    iget-object v0, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0, p2}, Landroid/view/Surface;->setAlpha(F)V

    .line 187
    :cond_36
    return-void
.end method

.method public stepAnimation(J)Z
    .registers 10
    .parameter "now"

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 322
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    if-nez v4, :cond_c

    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    if-nez v4, :cond_c

    .line 373
    :cond_b
    :goto_b
    return v2

    .line 326
    :cond_c
    iget-boolean v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mStarted:Z

    if-nez v4, :cond_24

    .line 327
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_19

    .line 328
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p1, p2}, Landroid/view/animation/Animation;->setStartTime(J)V

    .line 330
    :cond_19
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_22

    .line 331
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p1, p2}, Landroid/view/animation/Animation;->setStartTime(J)V

    .line 333
    :cond_22
    iput-boolean v3, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mStarted:Z

    .line 336
    :cond_24
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->clear()V

    .line 337
    const/4 v1, 0x0

    .line 338
    .local v1, moreExit:Z
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_4d

    .line 339
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4, p1, p2, v5}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v1

    .line 341
    if-nez v1, :cond_4d

    .line 343
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4}, Landroid/view/animation/Animation;->cancel()V

    .line 344
    iput-object v6, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitAnimation:Landroid/view/animation/Animation;

    .line 345
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->clear()V

    .line 346
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    if-eqz v4, :cond_4d

    .line 347
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSurface:Landroid/view/Surface;

    invoke-virtual {v4}, Landroid/view/Surface;->hide()V

    .line 352
    :cond_4d
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->clear()V

    .line 353
    const/4 v0, 0x0

    .line 354
    .local v0, moreEnter:Z
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_76

    .line 355
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4, p1, p2, v5}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v0

    .line 356
    if-nez v0, :cond_95

    .line 357
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4}, Landroid/view/animation/Animation;->cancel()V

    .line 358
    iput-object v6, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterAnimation:Landroid/view/animation/Animation;

    .line 359
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->clear()V

    .line 360
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    if-eqz v4, :cond_76

    .line 361
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    invoke-virtual {v4}, Lcom/android/server/wm/BlackFrame;->hide()V

    .line 370
    :cond_76
    :goto_76
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotFinalMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotInitialMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->setConcat(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z

    .line 371
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mSnapshotFinalMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mExitTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v5

    invoke-virtual {p0, v4, v5}, Lcom/android/server/wm/ScreenRotationAnimation;->setSnapshotTransform(Landroid/graphics/Matrix;F)V

    .line 373
    if-nez v0, :cond_92

    if-eqz v1, :cond_b

    :cond_92
    move v2, v3

    goto/16 :goto_b

    .line 364
    :cond_95
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    if-eqz v4, :cond_76

    .line 365
    iget-object v4, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mBlackFrame:Lcom/android/server/wm/BlackFrame;

    iget-object v5, p0, Lcom/android/server/wm/ScreenRotationAnimation;->mEnterTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/server/wm/BlackFrame;->setMatrix(Landroid/graphics/Matrix;)V

    goto :goto_76
.end method
