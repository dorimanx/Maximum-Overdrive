.class Lcom/android/server/PowerManagerService$15;
.super Ljava/lang/Object;
.source "PowerManagerService.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PowerManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/PowerManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 3514
    iput-object p1, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    .line 3592
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 14
    .parameter "event"

    .prologue
    const/4 v10, -0x1

    const/4 v4, 0x1

    const/high16 v9, -0x4080

    const/4 v5, 0x0

    .line 3516
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLocks:Lcom/android/server/PowerManagerService$LockList;
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$500(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$LockList;

    move-result-object v7

    monitor-enter v7

    .line 3518
    :try_start_c
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->isScreenTurningOffLocked()Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$6000(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 3519
    monitor-exit v7

    .line 3588
    :goto_15
    return-void

    .line 3522
    :cond_16
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v8, 0x0

    aget v6, v6, v8

    float-to-int v3, v6

    .line 3523
    .local v3, value:I
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 3528
    .local v1, milliseconds:J
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #setter for: Lcom/android/server/PowerManagerService;->mLightFilterSample:I
    invoke-static {v6, v3}, Lcom/android/server/PowerManagerService;->access$5902(Lcom/android/server/PowerManagerService;I)I

    .line 3529
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightessEnabled:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_ca

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterEnabled:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$7700(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_ca

    .line 3530
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterRunning:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7800(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-eqz v4, :cond_83

    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v4

    cmpl-float v4, v4, v9

    if-eqz v4, :cond_83

    .line 3532
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v4

    float-to-int v4, v4

    sub-int v0, v3, v4

    .line 3533
    .local v0, diff:I
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterReset:I
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7900(Lcom/android/server/PowerManagerService;)I

    move-result v4

    if-eq v4, v10, :cond_7e

    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterReset:I
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7900(Lcom/android/server/PowerManagerService;)I

    move-result v4

    if-le v0, v4, :cond_7e

    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v4

    const v5, 0x44bb8000

    cmpg-float v4, v4, v5

    if-gez v4, :cond_7e

    .line 3540
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v5, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v5

    int-to-float v6, v0

    const/high16 v8, 0x4000

    div-float/2addr v6, v8

    add-float/2addr v5, v6

    float-to-int v5, v5

    #calls: Lcom/android/server/PowerManagerService;->lightFilterReset(I)V
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$8000(Lcom/android/server/PowerManagerService;I)V

    .line 3560
    .end local v0           #diff:I
    :cond_7e
    :goto_7e
    monitor-exit v7

    goto :goto_15

    .line 3587
    .end local v1           #milliseconds:J
    .end local v3           #value:I
    :catchall_80
    move-exception v4

    monitor-exit v7
    :try_end_82
    .catchall {:try_start_c .. :try_end_82} :catchall_80

    throw v4

    .line 3546
    .restart local v1       #milliseconds:J
    .restart local v3       #value:I
    :cond_83
    :try_start_83
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v4

    cmpl-float v4, v4, v9

    if-eqz v4, :cond_9f

    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLastScreenOnTime:J
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$8100(Lcom/android/server/PowerManagerService;)J

    move-result-wide v4

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorWarmupTime:I
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$8200(Lcom/android/server/PowerManagerService;)I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    cmp-long v4, v1, v4

    if-gez v4, :cond_aa

    .line 3549
    :cond_9f
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, -0x1

    #calls: Lcom/android/server/PowerManagerService;->lightFilterReset(I)V
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$8000(Lcom/android/server/PowerManagerService;I)V

    .line 3550
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->lightSensorChangedLocked(I)V
    invoke-static {v4, v3}, Lcom/android/server/PowerManagerService;->access$5800(Lcom/android/server/PowerManagerService;I)V

    .line 3552
    :cond_aa
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterRunning:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7800(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-nez v4, :cond_7e

    .line 3556
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, 0x1

    #setter for: Lcom/android/server/PowerManagerService;->mLightFilterRunning:Z
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$7802(Lcom/android/server/PowerManagerService;Z)Z

    .line 3557
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$4300(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterTask:Ljava/lang/Runnable;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$6700(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v5

    const-wide/16 v8, 0x7d0

    invoke-virtual {v4, v5, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_7e

    .line 3563
    :cond_ca
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v6

    cmpl-float v6, v6, v9

    if-eqz v6, :cond_e6

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLastScreenOnTime:J
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$8100(Lcom/android/server/PowerManagerService;)J

    move-result-wide v8

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorWarmupTime:I
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$8200(Lcom/android/server/PowerManagerService;)I

    move-result v6

    int-to-long v10, v6

    add-long/2addr v8, v10

    cmp-long v6, v1, v8

    if-gez v6, :cond_109

    .line 3566
    :cond_e6
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$4300(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$8300(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3567
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, 0x0

    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$5502(Lcom/android/server/PowerManagerService;Z)Z

    .line 3568
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, 0x0

    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$5602(Lcom/android/server/PowerManagerService;Z)Z

    .line 3569
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->lightSensorChangedLocked(I)V
    invoke-static {v4, v3}, Lcom/android/server/PowerManagerService;->access$5800(Lcom/android/server/PowerManagerService;I)V

    .line 3587
    :cond_106
    :goto_106
    monitor-exit v7

    goto/16 :goto_15

    .line 3571
    :cond_109
    int-to-float v6, v3

    iget-object v8, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v8

    cmpl-float v6, v6, v8

    if-lez v6, :cond_11c

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$5500(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-nez v6, :cond_14a

    :cond_11c
    int-to-float v6, v3

    iget-object v8, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v8

    cmpg-float v6, v6, v8

    if-gez v6, :cond_12f

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$5600(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-nez v6, :cond_14a

    :cond_12f
    int-to-float v6, v3

    iget-object v8, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v8

    cmpl-float v6, v6, v8

    if-eqz v6, :cond_14a

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$5500(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-nez v6, :cond_1a7

    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$5600(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-nez v6, :cond_1a7

    .line 3576
    :cond_14a
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$4300(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$8300(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3577
    iget-object v8, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v6, v3

    iget-object v9, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v9}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v9

    cmpg-float v6, v6, v9

    if-gez v6, :cond_1a3

    move v6, v4

    :goto_167
    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v8, v6}, Lcom/android/server/PowerManagerService;->access$5502(Lcom/android/server/PowerManagerService;Z)Z

    .line 3578
    iget-object v6, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v8, v3

    iget-object v9, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v9}, Lcom/android/server/PowerManagerService;->access$6500(Lcom/android/server/PowerManagerService;)F

    move-result v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_1a5

    :goto_177
    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v6, v4}, Lcom/android/server/PowerManagerService;->access$5602(Lcom/android/server/PowerManagerService;Z)Z

    .line 3579
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$5500(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-nez v4, :cond_18a

    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$5600(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-eqz v4, :cond_106

    .line 3580
    :cond_18a
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v5, v3

    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingValue:F
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$5702(Lcom/android/server/PowerManagerService;F)F

    .line 3581
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$4300(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$8300(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v5

    const-wide/16 v8, 0x7d0

    invoke-virtual {v4, v5, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_106

    :cond_1a3
    move v6, v5

    .line 3577
    goto :goto_167

    :cond_1a5
    move v4, v5

    .line 3578
    goto :goto_177

    .line 3584
    :cond_1a7
    iget-object v4, p0, Lcom/android/server/PowerManagerService$15;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v5, v3

    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingValue:F
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$5702(Lcom/android/server/PowerManagerService;F)F
    :try_end_1ad
    .catchall {:try_start_83 .. :try_end_1ad} :catchall_80

    goto/16 :goto_106
.end method
