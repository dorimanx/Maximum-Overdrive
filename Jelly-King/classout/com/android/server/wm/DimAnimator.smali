.class Lcom/android/server/wm/DimAnimator;
.super Ljava/lang/Object;
.source "DimAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/wm/DimAnimator$Parameters;
    }
.end annotation


# instance fields
.field mDimCurrentAlpha:F

.field mDimDeltaPerMs:F

.field mDimShown:Z

.field mDimSurface:Landroid/view/Surface;

.field mDimTargetAlpha:F

.field mLastDimAnimTime:J

.field mLastDimHeight:I

.field mLastDimWidth:I


# direct methods
.method constructor <init>(Landroid/view/SurfaceSession;)V
    .registers 12

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/android/server/wm/DimAnimator;->mDimShown:Z

    iget-object v0, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    if-nez v0, :cond_23

    :try_start_a
    new-instance v0, Landroid/view/Surface;

    const/4 v2, 0x0

    const-string v3, "DimAnimator"

    const/4 v4, -0x1

    const/16 v5, 0x10

    const/16 v6, 0x10

    const/4 v7, -0x1

    const/high16 v8, 0x2

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Landroid/view/Surface;-><init>(Landroid/view/SurfaceSession;ILjava/lang/String;IIIII)V

    iput-object v0, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Surface;->setAlpha(F)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_23} :catch_24

    :cond_23
    :goto_23
    return-void

    :catch_24
    move-exception v9

    const-string v0, "WindowManager"

    const-string v1, "Exception creating Dim surface"

    invoke-static {v0, v1, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_23
.end method


# virtual methods
.method public printTo(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .registers 5

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mDimSurface="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/DimAnimator;->mLastDimWidth:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " x "

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/DimAnimator;->mLastDimHeight:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(I)V

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mDimShown="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/DimAnimator;->mDimShown:Z

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " current="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(F)V

    const-string v0, " target="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(F)V

    const-string v0, " delta="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/DimAnimator;->mDimDeltaPerMs:F

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(F)V

    const-string v0, " lastAnimTime="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    invoke-virtual {p2, v0, v1}, Ljava/io/PrintWriter;->println(J)V

    return-void
.end method

.method updateParameters(Landroid/content/res/Resources;Lcom/android/server/wm/DimAnimator$Parameters;J)V
    .registers 17

    iget v8, p2, Lcom/android/server/wm/DimAnimator$Parameters;->mDimWidth:I

    int-to-double v8, v8

    const-wide/high16 v10, 0x3ff8

    mul-double/2addr v8, v10

    double-to-int v3, v8

    iget v8, p2, Lcom/android/server/wm/DimAnimator$Parameters;->mDimHeight:I

    int-to-double v8, v8

    const-wide/high16 v10, 0x3ff8

    mul-double/2addr v8, v10

    double-to-int v0, v8

    iget-object v7, p2, Lcom/android/server/wm/DimAnimator$Parameters;->mDimWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget v5, p2, Lcom/android/server/wm/DimAnimator$Parameters;->mDimTarget:F

    iget-boolean v8, p0, Lcom/android/server/wm/DimAnimator;->mDimShown:Z

    if-nez v8, :cond_8d

    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/server/wm/DimAnimator;->mDimShown:Z

    :try_start_19
    iput v3, p0, Lcom/android/server/wm/DimAnimator;->mLastDimWidth:I

    iput v0, p0, Lcom/android/server/wm/DimAnimator;->mLastDimHeight:I

    iget-object v8, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    mul-int/lit8 v9, v3, -0x1

    div-int/lit8 v9, v9, 0x6

    mul-int/lit8 v10, v0, -0x1

    div-int/lit8 v10, v10, 0x6

    invoke-virtual {v8, v9, v10}, Landroid/view/Surface;->setPosition(II)V

    iget-object v8, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v8, v3, v0}, Landroid/view/Surface;->setSize(II)V

    iget-object v8, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v8}, Landroid/view/Surface;->show()V
    :try_end_34
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_34} :catch_84

    :cond_34
    :goto_34
    iget-object v8, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget v9, v7, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v9}, Landroid/view/Surface;->setLayer(I)V

    iget v8, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    cmpl-float v8, v8, v5

    if-eqz v8, :cond_83

    iput-wide p3, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    iget-boolean v8, v7, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    if-eqz v8, :cond_ac

    iget-object v8, v7, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v8, :cond_ac

    iget-object v8, v7, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v8}, Landroid/view/animation/Animation;->computeDurationHint()J

    move-result-wide v1

    :goto_53
    iget v8, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    cmpl-float v8, v5, v8

    if-lez v8, :cond_70

    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    const/high16 v8, 0x112

    const/4 v9, 0x1

    invoke-virtual {p1, v8, v6, v9}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    iget v8, v6, Landroid/util/TypedValue;->type:I

    const/4 v9, 0x6

    if-ne v8, v9, :cond_af

    long-to-float v8, v1

    long-to-float v9, v1

    invoke-virtual {v6, v8, v9}, Landroid/util/TypedValue;->getFraction(FF)F

    move-result v8

    float-to-long v1, v8

    :cond_70
    :goto_70
    const-wide/16 v8, 0x1

    cmp-long v8, v1, v8

    if-gez v8, :cond_78

    const-wide/16 v1, 0x1

    :cond_78
    iput v5, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    iget v8, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    iget v9, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    sub-float/2addr v8, v9

    long-to-float v9, v1

    div-float/2addr v8, v9

    iput v8, p0, Lcom/android/server/wm/DimAnimator;->mDimDeltaPerMs:F

    :cond_83
    return-void

    :catch_84
    move-exception v4

    const-string v8, "WindowManager"

    const-string v9, "Failure showing dim surface"

    invoke-static {v8, v9, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_34

    :cond_8d
    iget v8, p0, Lcom/android/server/wm/DimAnimator;->mLastDimWidth:I

    if-ne v8, v3, :cond_95

    iget v8, p0, Lcom/android/server/wm/DimAnimator;->mLastDimHeight:I

    if-eq v8, v0, :cond_34

    :cond_95
    iput v3, p0, Lcom/android/server/wm/DimAnimator;->mLastDimWidth:I

    iput v0, p0, Lcom/android/server/wm/DimAnimator;->mLastDimHeight:I

    iget-object v8, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v8, v3, v0}, Landroid/view/Surface;->setSize(II)V

    iget-object v8, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    mul-int/lit8 v9, v3, -0x1

    div-int/lit8 v9, v9, 0x6

    mul-int/lit8 v10, v0, -0x1

    div-int/lit8 v10, v10, 0x6

    invoke-virtual {v8, v9, v10}, Landroid/view/Surface;->setPosition(II)V

    goto :goto_34

    :cond_ac
    const-wide/16 v1, 0xc8

    goto :goto_53

    :cond_af
    iget v8, v6, Landroid/util/TypedValue;->type:I

    const/16 v9, 0x10

    if-lt v8, v9, :cond_70

    iget v8, v6, Landroid/util/TypedValue;->type:I

    const/16 v9, 0x1f

    if-gt v8, v9, :cond_70

    iget v8, v6, Landroid/util/TypedValue;->data:I

    int-to-long v1, v8

    goto :goto_70
.end method

.method updateSurface(ZJZ)Z
    .registers 15

    const-wide/16 v8, 0x0

    const/4 v2, 0x0

    const/4 v7, 0x0

    if-nez p1, :cond_18

    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    cmpl-float v3, v3, v7

    if-eqz v3, :cond_18

    iput-wide p2, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    iput v7, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    neg-float v3, v3

    const/high16 v4, 0x4348

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/server/wm/DimAnimator;->mDimDeltaPerMs:F

    :cond_18
    iget-wide v3, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    cmp-long v3, v3, v8

    if-eqz v3, :cond_3d

    const/4 v0, 0x1

    :goto_1f
    if-eqz v0, :cond_3c

    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    iget v4, p0, Lcom/android/server/wm/DimAnimator;->mDimDeltaPerMs:F

    iget-wide v5, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    sub-long v5, p2, v5

    long-to-float v5, v5

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    iput v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    if-eqz p4, :cond_3f

    const/4 v0, 0x0

    :cond_31
    :goto_31
    if-eqz v0, :cond_61

    iput-wide p2, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    iget-object v2, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    invoke-virtual {v2, v3}, Landroid/view/Surface;->setAlpha(F)V

    :cond_3c
    :goto_3c
    return v0

    :cond_3d
    move v0, v2

    goto :goto_1f

    :cond_3f
    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimDeltaPerMs:F

    cmpl-float v3, v3, v7

    if-lez v3, :cond_4f

    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    iget v4, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_31

    const/4 v0, 0x0

    goto :goto_31

    :cond_4f
    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimDeltaPerMs:F

    cmpg-float v3, v3, v7

    if-gez v3, :cond_5f

    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    iget v4, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_31

    const/4 v0, 0x0

    goto :goto_31

    :cond_5f
    const/4 v0, 0x0

    goto :goto_31

    :cond_61
    iget v3, p0, Lcom/android/server/wm/DimAnimator;->mDimTargetAlpha:F

    iput v3, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    iput-wide v8, p0, Lcom/android/server/wm/DimAnimator;->mLastDimAnimTime:J

    iget-object v3, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    iget v4, p0, Lcom/android/server/wm/DimAnimator;->mDimCurrentAlpha:F

    invoke-virtual {v3, v4}, Landroid/view/Surface;->setAlpha(F)V

    if-nez p1, :cond_3c

    :try_start_70
    iget-object v3, p0, Lcom/android/server/wm/DimAnimator;->mDimSurface:Landroid/view/Surface;

    invoke-virtual {v3}, Landroid/view/Surface;->hide()V
    :try_end_75
    .catch Ljava/lang/RuntimeException; {:try_start_70 .. :try_end_75} :catch_78

    :goto_75
    iput-boolean v2, p0, Lcom/android/server/wm/DimAnimator;->mDimShown:Z

    goto :goto_3c

    :catch_78
    move-exception v1

    const-string v3, "WindowManager"

    const-string v4, "Illegal argument exception hiding dim surface"

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_75
.end method
