.class Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;
.super Landroid/os/Handler;
.source "PowerManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->onLooperPrepared()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;


# direct methods
.method constructor <init>(Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;)V
    .registers 2
    .parameter

    .prologue
    .line 2222
    iput-object p1, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 16
    .parameter "msg"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 2224
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightessEnabled:Z
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4500(Lcom/android/server/PowerManagerService;)Z

    move-result v11

    if-eqz v11, :cond_bc

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mInitialAnimation:Z
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4600(Lcom/android/server/PowerManagerService;)Z

    move-result v11

    if-nez v11, :cond_bc

    move v0, v9

    .line 2227
    .local v0, brightnessMode:I
    :goto_17
    iget v11, p1, Landroid/os/Message;->what:I

    const/16 v12, 0xa

    if-ne v11, v12, :cond_c8

    .line 2228
    iget v4, p1, Landroid/os/Message;->arg1:I

    .line 2229
    .local v4, mask:I
    iget v8, p1, Landroid/os/Message;->arg2:I

    .line 2230
    .local v8, value:I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    .line 2231
    .local v6, tStart:J
    and-int/lit8 v11, v4, 0x2

    if-eqz v11, :cond_34

    .line 2233
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLcdLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4700(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v11

    invoke-virtual {v11, v8, v0}, Lcom/android/server/LightsService$Light;->setBrightness(II)V

    .line 2235
    :cond_34
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    sub-long v2, v11, v6

    .line 2236
    .local v2, elapsed:J
    and-int/lit8 v11, v4, 0x4

    if-eqz v11, :cond_5d

    .line 2241
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mButtonLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4900(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v12

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorButtonBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4800(Lcom/android/server/PowerManagerService;)I

    move-result v11

    if-ltz v11, :cond_bf

    if-lez v8, :cond_bf

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorButtonBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4800(Lcom/android/server/PowerManagerService;)I

    move-result v11

    :goto_5a
    invoke-virtual {v12, v11}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 2246
    :cond_5d
    and-int/lit8 v11, v4, 0x8

    if-eqz v11, :cond_80

    .line 2247
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mKeyboardLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5100(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v12

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorKeyboardBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5000(Lcom/android/server/PowerManagerService;)I

    move-result v11

    if-ltz v11, :cond_c1

    if-lez v8, :cond_c1

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorKeyboardBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5000(Lcom/android/server/PowerManagerService;)I

    move-result v11

    :goto_7d
    invoke-virtual {v12, v11}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 2251
    :cond_80
    const-wide/16 v11, 0x64

    cmp-long v11, v2, v11

    if-lez v11, :cond_a8

    .line 2252
    const-string v11, "PowerManagerService"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Excessive delay setting brightness: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "ms, mask="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2257
    :cond_a8
    const-wide/16 v11, 0x10

    cmp-long v11, v2, v11

    if-gez v11, :cond_c3

    const/16 v1, 0x10

    .line 2258
    .local v1, delay:I
    :goto_b0
    monitor-enter p0

    .line 2259
    :try_start_b1
    iget-object v9, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iput v8, v9, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->currentValue:I

    .line 2260
    monitor-exit p0
    :try_end_b6
    .catchall {:try_start_b1 .. :try_end_b6} :catchall_c5

    .line 2261
    iget-object v9, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    #calls: Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->animateInternal(IZI)V
    invoke-static {v9, v4, v10, v1}, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->access$5200(Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;IZI)V

    .line 2266
    .end local v1           #delay:I
    .end local v2           #elapsed:J
    .end local v4           #mask:I
    .end local v6           #tStart:J
    .end local v8           #value:I
    :cond_bb
    :goto_bb
    return-void

    .end local v0           #brightnessMode:I
    :cond_bc
    move v0, v10

    .line 2224
    goto/16 :goto_17

    .restart local v0       #brightnessMode:I
    .restart local v2       #elapsed:J
    .restart local v4       #mask:I
    .restart local v6       #tStart:J
    .restart local v8       #value:I
    :cond_bf
    move v11, v8

    .line 2241
    goto :goto_5a

    :cond_c1
    move v11, v8

    .line 2247
    goto :goto_7d

    :cond_c3
    move v1, v9

    .line 2257
    goto :goto_b0

    .line 2260
    .restart local v1       #delay:I
    :catchall_c5
    move-exception v9

    :try_start_c6
    monitor-exit p0
    :try_end_c7
    .catchall {:try_start_c6 .. :try_end_c7} :catchall_c5

    throw v9

    .line 2262
    .end local v1           #delay:I
    .end local v2           #elapsed:J
    .end local v4           #mask:I
    .end local v6           #tStart:J
    .end local v8           #value:I
    :cond_c8
    iget v9, p1, Landroid/os/Message;->what:I

    const/16 v10, 0xb

    if-ne v9, v10, :cond_bb

    .line 2263
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 2264
    .local v5, mode:I
    iget-object v9, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v9, v9, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->nativeStartSurfaceFlingerAnimation(I)V
    invoke-static {v9, v5}, Lcom/android/server/PowerManagerService;->access$5300(Lcom/android/server/PowerManagerService;I)V

    goto :goto_bb
.end method
