.class Lcom/android/server/PowerManagerService$BrightnessState;
.super Ljava/lang/Object;
.source "PowerManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BrightnessState"
.end annotation


# instance fields
.field animating:Z

.field curValue:F

.field delta:F

.field initialized:Z

.field final mask:I

.field targetValue:I

.field final synthetic this$0:Lcom/android/server/PowerManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/PowerManagerService;I)V
    .registers 3
    .parameter
    .parameter "m"

    .prologue
    .line 2207
    iput-object p1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2208
    iput p2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->mask:I

    .line 2209
    return-void
.end method

.method private finishAnimationLocked(ZI)V
    .registers 5
    .parameter "more"
    .parameter "curIntValue"

    .prologue
    .line 2294
    iput-boolean p1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    .line 2295
    if-nez p1, :cond_16

    .line 2296
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->mask:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_16

    if-nez p2, :cond_16

    .line 2297
    iget-object v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenOffReason:I
    invoke-static {v1}, Lcom/android/server/PowerManagerService;->access$4800(Lcom/android/server/PowerManagerService;)I

    move-result v1

    #calls: Lcom/android/server/PowerManagerService;->screenOffFinishedAnimatingLocked(I)I
    invoke-static {v0, v1}, Lcom/android/server/PowerManagerService;->access$4900(Lcom/android/server/PowerManagerService;I)I

    .line 2300
    :cond_16
    return-void
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .registers 5
    .parameter "pw"
    .parameter "prefix"

    .prologue
    .line 2212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "animating="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " targetValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " curValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " delta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->delta:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2216
    return-void
.end method

.method forceValueLocked(I)V
    .registers 4
    .parameter "value"

    .prologue
    .line 2219
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    .line 2220
    int-to-float v0, p1

    iput v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2221
    iget-object v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    iget v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->mask:I

    #calls: Lcom/android/server/PowerManagerService;->setLightBrightness(II)V
    invoke-static {v0, v1, p1}, Lcom/android/server/PowerManagerService;->access$4700(Lcom/android/server/PowerManagerService;II)V

    .line 2222
    iget-boolean v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    if-eqz v0, :cond_15

    .line 2223
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/android/server/PowerManagerService$BrightnessState;->finishAnimationLocked(ZI)V

    .line 2225
    :cond_15
    return-void
.end method

.method jumpToTargetLocked()V
    .registers 5

    .prologue
    .line 2286
    iget-object v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->mask:I

    iget v3, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    #calls: Lcom/android/server/PowerManagerService;->setLightBrightness(II)V
    invoke-static {v1, v2, v3}, Lcom/android/server/PowerManagerService;->access$4700(Lcom/android/server/PowerManagerService;II)V

    .line 2287
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    .line 2288
    .local v0, tv:I
    int-to-float v1, v0

    iput v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2289
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    .line 2290
    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/android/server/PowerManagerService$BrightnessState;->finishAnimationLocked(ZI)V

    .line 2291
    return-void
.end method

.method public run()V
    .registers 11

    .prologue
    const/4 v0, 0x1

    const/4 v5, 0x0

    .line 2303
    iget-object v6, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLocks:Lcom/android/server/PowerManagerService$LockList;
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$500(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$LockList;

    move-result-object v6

    monitor-enter v6

    .line 2305
    :try_start_9
    iget-boolean v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    if-eqz v7, :cond_57

    iget v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    if-nez v7, :cond_57

    move v4, v0

    .line 2306
    .local v4, turningOff:Z
    :goto_12
    iget-boolean v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    if-eqz v7, :cond_59

    iget-object v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAnimateCrtOff:Z
    invoke-static {v7}, Lcom/android/server/PowerManagerService;->access$2100(Lcom/android/server/PowerManagerService;)Z

    move-result v7

    if-eqz v7, :cond_22

    iget v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    if-eqz v7, :cond_2f

    :cond_22
    iget-object v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAnimateCrtOn:Z
    invoke-static {v7}, Lcom/android/server/PowerManagerService;->access$2000(Lcom/android/server/PowerManagerService;)Z

    move-result v7

    if-eqz v7, :cond_59

    iget v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    float-to-int v7, v7

    if-nez v7, :cond_59

    .line 2310
    .local v0, crtAnimate:Z
    :cond_2f
    :goto_2f
    if-nez v0, :cond_5b

    iget-object v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    iget-boolean v7, v7, Lcom/android/server/PowerManagerService;->mAnimateScreenLights:Z

    if-nez v7, :cond_39

    if-nez v4, :cond_5b

    .line 2311
    :cond_39
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 2312
    .local v2, now:J
    iget-object v5, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenBrightness:Lcom/android/server/PowerManagerService$BrightnessState;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$5000(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$BrightnessState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/server/PowerManagerService$BrightnessState;->stepLocked()Z

    move-result v1

    .line 2313
    .local v1, more:Z
    if-eqz v1, :cond_55

    .line 2314
    iget-object v5, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenOffHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$2200(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v5

    const-wide/16 v7, 0x10

    add-long/2addr v7, v2

    invoke-virtual {v5, p0, v7, v8}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 2323
    .end local v1           #more:Z
    .end local v2           #now:J
    :cond_55
    :goto_55
    monitor-exit v6

    .line 2324
    return-void

    .end local v0           #crtAnimate:Z
    .end local v4           #turningOff:Z
    :cond_57
    move v4, v5

    .line 2305
    goto :goto_12

    .restart local v4       #turningOff:Z
    :cond_59
    move v0, v5

    .line 2306
    goto :goto_2f

    .line 2319
    .restart local v0       #crtAnimate:Z
    :cond_5b
    iget-object v7, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v8, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenOffReason:I
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$4800(Lcom/android/server/PowerManagerService;)I

    move-result v8

    const/4 v9, 0x4

    if-ne v8, v9, :cond_76

    :goto_66
    #calls: Lcom/android/server/PowerManagerService;->nativeStartSurfaceFlingerAnimation(I)V
    invoke-static {v7, v5}, Lcom/android/server/PowerManagerService;->access$5100(Lcom/android/server/PowerManagerService;I)V

    .line 2321
    iget-object v5, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenBrightness:Lcom/android/server/PowerManagerService$BrightnessState;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$5000(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$BrightnessState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/server/PowerManagerService$BrightnessState;->jumpToTargetLocked()V

    goto :goto_55

    .line 2323
    .end local v0           #crtAnimate:Z
    .end local v4           #turningOff:Z
    :catchall_73
    move-exception v5

    monitor-exit v6
    :try_end_75
    .catchall {:try_start_9 .. :try_end_75} :catchall_73

    throw v5

    .line 2319
    .restart local v0       #crtAnimate:Z
    .restart local v4       #turningOff:Z
    :cond_76
    :try_start_76
    iget-object v5, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAnimationSetting:I
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$1800(Lcom/android/server/PowerManagerService;)I
    :try_end_7b
    .catchall {:try_start_76 .. :try_end_7b} :catchall_73

    move-result v5

    goto :goto_66
.end method

.method setTargetLocked(IIII)V
    .registers 8
    .parameter "target"
    .parameter "stepsToTarget"
    .parameter "initialValue"
    .parameter "nominalCurrentValue"

    .prologue
    const/4 v2, 0x1

    .line 2229
    iget-boolean v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->initialized:Z

    if-nez v0, :cond_2d

    .line 2230
    iput-boolean v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->initialized:Z

    .line 2231
    int-to-float v0, p3

    iput v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2235
    :cond_a
    iput p1, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    .line 2236
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    int-to-float v1, v0

    if-ltz p4, :cond_32

    int-to-float v0, p4

    :goto_12
    sub-float v0, v1, v0

    int-to-float v1, p2

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->delta:F

    .line 2246
    iput-boolean v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    .line 2251
    iget-object v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenOffHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/PowerManagerService;->access$2200(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 2252
    iget-object v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenOffHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/PowerManagerService;->access$2200(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2253
    :goto_2c
    return-void

    .line 2232
    :cond_2d
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    if-ne v0, p1, :cond_a

    goto :goto_2c

    .line 2236
    :cond_32
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    goto :goto_12
.end method

.method stepLocked()Z
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 2256
    iget-boolean v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->animating:Z

    if-nez v2, :cond_7

    const/4 v1, 0x0

    .line 2281
    :goto_6
    return v1

    .line 2261
    :cond_7
    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    iget v3, p0, Lcom/android/server/PowerManagerService$BrightnessState;->delta:F

    add-float/2addr v2, v3

    iput v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2262
    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    float-to-int v0, v2

    .line 2263
    .local v0, curIntValue:I
    const/4 v1, 0x1

    .line 2264
    .local v1, more:Z
    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->delta:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_29

    .line 2265
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    int-to-float v2, v0

    iput v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2266
    const/4 v1, 0x0

    .line 2279
    :cond_1e
    :goto_1e
    iget-object v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->this$0:Lcom/android/server/PowerManagerService;

    iget v3, p0, Lcom/android/server/PowerManagerService$BrightnessState;->mask:I

    #calls: Lcom/android/server/PowerManagerService;->setLightBrightness(II)V
    invoke-static {v2, v3, v0}, Lcom/android/server/PowerManagerService;->access$4700(Lcom/android/server/PowerManagerService;II)V

    .line 2280
    invoke-direct {p0, v1, v0}, Lcom/android/server/PowerManagerService$BrightnessState;->finishAnimationLocked(ZI)V

    goto :goto_6

    .line 2267
    :cond_29
    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->delta:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_3a

    .line 2268
    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    if-lt v0, v2, :cond_1e

    .line 2269
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    int-to-float v2, v0

    iput v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2270
    const/4 v1, 0x0

    goto :goto_1e

    .line 2273
    :cond_3a
    iget v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    if-gt v0, v2, :cond_1e

    .line 2274
    iget v0, p0, Lcom/android/server/PowerManagerService$BrightnessState;->targetValue:I

    int-to-float v2, v0

    iput v2, p0, Lcom/android/server/PowerManagerService$BrightnessState;->curValue:F

    .line 2275
    const/4 v1, 0x0

    goto :goto_1e
.end method
