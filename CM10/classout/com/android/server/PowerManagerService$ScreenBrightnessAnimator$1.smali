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
    .line 2266
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

    .line 2268
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightessEnabled:Z
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4600(Lcom/android/server/PowerManagerService;)Z

    move-result v11

    if-eqz v11, :cond_f0

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mInitialAnimation:Z
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4700(Lcom/android/server/PowerManagerService;)Z

    move-result v11

    if-nez v11, :cond_f0

    move v0, v9

    .line 2271
    .local v0, brightnessMode:I
    :goto_17
    iget v11, p1, Landroid/os/Message;->what:I

    const/16 v12, 0xa

    if-ne v11, v12, :cond_fd

    .line 2272
    iget v4, p1, Landroid/os/Message;->arg1:I

    .line 2273
    .local v4, mask:I
    iget v8, p1, Landroid/os/Message;->arg2:I

    .line 2274
    .local v8, value:I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    .line 2275
    .local v6, tStart:J
    and-int/lit8 v11, v4, 0x2

    if-eqz v11, :cond_34

    .line 2277
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLcdLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4800(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v11

    invoke-virtual {v11, v8, v0}, Lcom/android/server/LightsService$Light;->setBrightness(II)V

    .line 2279
    :cond_34
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    sub-long v2, v11, v6

    .line 2280
    .local v2, elapsed:J
    and-int/lit8 v11, v4, 0x4

    if-eqz v11, :cond_5d

    .line 2285
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mButtonLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5000(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v12

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorButtonBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4900(Lcom/android/server/PowerManagerService;)I

    move-result v11

    if-ltz v11, :cond_f3

    if-lez v8, :cond_f3

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorButtonBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4900(Lcom/android/server/PowerManagerService;)I

    move-result v11

    :goto_5a
    invoke-virtual {v12, v11}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 2289
    :cond_5d
    and-int/lit8 v11, v4, 0x8

    if-eqz v11, :cond_80

    .line 2290
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mKeyboardLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5200(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v12

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorKeyboardBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5100(Lcom/android/server/PowerManagerService;)I

    move-result v11

    if-ltz v11, :cond_f6

    if-lez v8, :cond_f6

    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorKeyboardBrightness:I
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5100(Lcom/android/server/PowerManagerService;)I

    move-result v11

    :goto_7d
    invoke-virtual {v12, v11}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 2294
    :cond_80
    and-int/lit8 v11, v4, 0x2

    if-eqz v11, :cond_96

    .line 2300
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLcdLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$4800(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v11

    invoke-virtual {v11, v8, v0}, Lcom/android/server/LightsService$Light;->setBrightness(II)V

    .line 2301
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #setter for: Lcom/android/server/PowerManagerService;->mLastLcdValue:I
    invoke-static {v11, v8}, Lcom/android/server/PowerManagerService;->access$5302(Lcom/android/server/PowerManagerService;I)I

    .line 2303
    :cond_96
    and-int/lit8 v11, v4, 0x4

    if-eqz v11, :cond_a5

    .line 2304
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mButtonLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5000(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v11

    invoke-virtual {v11, v8}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 2306
    :cond_a5
    and-int/lit8 v11, v4, 0x8

    if-eqz v11, :cond_b4

    .line 2307
    iget-object v11, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v11, v11, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mKeyboardLight:Lcom/android/server/LightsService$Light;
    invoke-static {v11}, Lcom/android/server/PowerManagerService;->access$5200(Lcom/android/server/PowerManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v11

    invoke-virtual {v11, v8}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 2310
    :cond_b4
    const-wide/16 v11, 0x64

    cmp-long v11, v2, v11

    if-lez v11, :cond_dc

    .line 2311
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

    .line 2316
    :cond_dc
    const-wide/16 v11, 0x10

    cmp-long v11, v2, v11

    if-gez v11, :cond_f8

    const/16 v1, 0x10

    .line 2317
    .local v1, delay:I
    :goto_e4
    monitor-enter p0

    .line 2318
    :try_start_e5
    iget-object v9, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iput v8, v9, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->currentValue:I

    .line 2319
    monitor-exit p0
    :try_end_ea
    .catchall {:try_start_e5 .. :try_end_ea} :catchall_fa

    .line 2320
    iget-object v9, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    #calls: Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->animateInternal(IZI)V
    invoke-static {v9, v4, v10, v1}, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->access$5400(Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;IZI)V

    .line 2325
    .end local v1           #delay:I
    .end local v2           #elapsed:J
    .end local v4           #mask:I
    .end local v6           #tStart:J
    .end local v8           #value:I
    :cond_ef
    :goto_ef
    return-void

    .end local v0           #brightnessMode:I
    :cond_f0
    move v0, v10

    .line 2268
    goto/16 :goto_17

    .restart local v0       #brightnessMode:I
    .restart local v2       #elapsed:J
    .restart local v4       #mask:I
    .restart local v6       #tStart:J
    .restart local v8       #value:I
    :cond_f3
    move v11, v8

    .line 2285
    goto/16 :goto_5a

    :cond_f6
    move v11, v8

    .line 2290
    goto :goto_7d

    :cond_f8
    move v1, v9

    .line 2316
    goto :goto_e4

    .line 2319
    .restart local v1       #delay:I
    :catchall_fa
    move-exception v9

    :try_start_fb
    monitor-exit p0
    :try_end_fc
    .catchall {:try_start_fb .. :try_end_fc} :catchall_fa

    throw v9

    .line 2321
    .end local v1           #delay:I
    .end local v2           #elapsed:J
    .end local v4           #mask:I
    .end local v6           #tStart:J
    .end local v8           #value:I
    :cond_fd
    iget v9, p1, Landroid/os/Message;->what:I

    const/16 v10, 0xb

    if-ne v9, v10, :cond_ef

    .line 2322
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 2323
    .local v5, mode:I
    iget-object v9, p0, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator$1;->this$1:Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;

    iget-object v9, v9, Lcom/android/server/PowerManagerService$ScreenBrightnessAnimator;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->nativeStartSurfaceFlingerAnimation(I)V
    invoke-static {v9, v5}, Lcom/android/server/PowerManagerService;->access$5500(Lcom/android/server/PowerManagerService;I)V

    goto :goto_ef
.end method
