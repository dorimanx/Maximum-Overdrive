.class Lcom/android/server/PowerManagerService$14;
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

    iput-object p1, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 14

    const/4 v11, -0x1

    const/high16 v10, -0x4080

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLocks:Lcom/android/server/PowerManagerService$LockList;
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$500(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$LockList;

    move-result-object v7

    monitor-enter v7

    :try_start_c
    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->isScreenTurningOffLocked()Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$7100(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_16

    monitor-exit v7

    :goto_15
    return-void

    :cond_16
    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x0

    aget v8, v8, v9

    float-to-int v8, v8

    iget-object v9, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mWaitingForFirstLightSensor:Z
    invoke-static {v9}, Lcom/android/server/PowerManagerService;->access$8700(Lcom/android/server/PowerManagerService;)Z

    move-result v9

    #calls: Lcom/android/server/PowerManagerService;->handleLightSensorValue(IZ)V
    invoke-static {v6, v8, v9}, Lcom/android/server/PowerManagerService;->access$8800(Lcom/android/server/PowerManagerService;IZ)V

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mWaitingForFirstLightSensor:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$8700(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mPreparingForScreenOn:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$3200(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-nez v6, :cond_3d

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v8, 0x0

    #setter for: Lcom/android/server/PowerManagerService;->mWaitingForFirstLightSensor:Z
    invoke-static {v6, v8}, Lcom/android/server/PowerManagerService;->access$8702(Lcom/android/server/PowerManagerService;Z)Z

    :cond_3d
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v8, 0x0

    aget v6, v6, v8

    float-to-int v3, v6

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$4100(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$8900(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #setter for: Lcom/android/server/PowerManagerService;->mLightFilterSample:I
    invoke-static {v6, v3}, Lcom/android/server/PowerManagerService;->access$7002(Lcom/android/server/PowerManagerService;I)I

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightessEnabled:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$4600(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_102

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterEnabled:Z
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$9000(Lcom/android/server/PowerManagerService;)Z

    move-result v6

    if-eqz v6, :cond_102

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterRunning:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$9100(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-eqz v4, :cond_ba

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v4

    cmpl-float v4, v4, v10

    if-eqz v4, :cond_ba

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v4

    float-to-int v4, v4

    sub-int v0, v3, v4

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterReset:I
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$9200(Lcom/android/server/PowerManagerService;)I

    move-result v4

    if-eq v4, v11, :cond_b4

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterReset:I
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$9200(Lcom/android/server/PowerManagerService;)I

    move-result v4

    if-le v0, v4, :cond_b4

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v4

    const v5, 0x44bb8000

    cmpg-float v4, v4, v5

    if-gez v4, :cond_b4

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v5, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v5

    int-to-float v6, v0

    const/high16 v8, 0x4000

    div-float/2addr v6, v8

    add-float/2addr v5, v6

    float-to-int v5, v5

    #calls: Lcom/android/server/PowerManagerService;->lightFilterReset(I)V
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$9300(Lcom/android/server/PowerManagerService;I)V

    :cond_b4
    :goto_b4
    monitor-exit v7

    goto/16 :goto_15

    :catchall_b7
    move-exception v4

    monitor-exit v7
    :try_end_b9
    .catchall {:try_start_c .. :try_end_b9} :catchall_b7

    throw v4

    :cond_ba
    :try_start_ba
    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v4

    cmpl-float v4, v4, v10

    if-eqz v4, :cond_d6

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLastScreenOnTime:J
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$9400(Lcom/android/server/PowerManagerService;)J

    move-result-wide v4

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorWarmupTime:I
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$9500(Lcom/android/server/PowerManagerService;)I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    cmp-long v4, v1, v4

    if-gez v4, :cond_e2

    :cond_d6
    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, -0x1

    #calls: Lcom/android/server/PowerManagerService;->lightFilterReset(I)V
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$9300(Lcom/android/server/PowerManagerService;I)V

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, 0x1

    #calls: Lcom/android/server/PowerManagerService;->lightSensorChangedLocked(IZ)V
    invoke-static {v4, v3, v5}, Lcom/android/server/PowerManagerService;->access$6900(Lcom/android/server/PowerManagerService;IZ)V

    :cond_e2
    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterRunning:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$9100(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-nez v4, :cond_b4

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, 0x1

    #setter for: Lcom/android/server/PowerManagerService;->mLightFilterRunning:Z
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$9102(Lcom/android/server/PowerManagerService;Z)Z

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$4100(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightFilterTask:Ljava/lang/Runnable;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$7800(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v5

    const-wide/16 v8, 0x7d0

    invoke-virtual {v4, v5, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_b4

    :cond_102
    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v6

    int-to-float v8, v3

    cmpl-float v6, v6, v8

    if-eqz v6, :cond_18e

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v6

    cmpl-float v6, v6, v10

    if-eqz v6, :cond_129

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLastScreenOnTime:J
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$9400(Lcom/android/server/PowerManagerService;)J

    move-result-wide v8

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorWarmupTime:I
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$9500(Lcom/android/server/PowerManagerService;)I

    move-result v6

    int-to-long v10, v6

    add-long/2addr v8, v10

    cmp-long v6, v1, v8

    if-gez v6, :cond_132

    :cond_129
    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v5, 0x1

    #calls: Lcom/android/server/PowerManagerService;->lightSensorChangedLocked(IZ)V
    invoke-static {v4, v3, v5}, Lcom/android/server/PowerManagerService;->access$6900(Lcom/android/server/PowerManagerService;IZ)V

    :cond_12f
    :goto_12f
    monitor-exit v7

    goto/16 :goto_15

    :cond_132
    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v6}, Lcom/android/server/PowerManagerService;->access$4100(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v8}, Lcom/android/server/PowerManagerService;->access$8900(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v8, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v6, v3

    iget-object v9, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v9}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v9

    cmpg-float v6, v6, v9

    if-gez v6, :cond_18a

    move v6, v4

    :goto_14f
    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v8, v6}, Lcom/android/server/PowerManagerService;->access$6602(Lcom/android/server/PowerManagerService;Z)Z

    iget-object v6, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v8, v3

    iget-object v9, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorValue:F
    invoke-static {v9}, Lcom/android/server/PowerManagerService;->access$7600(Lcom/android/server/PowerManagerService;)F

    move-result v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_18c

    :goto_15f
    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v6, v4}, Lcom/android/server/PowerManagerService;->access$6702(Lcom/android/server/PowerManagerService;Z)Z

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingDecrease:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$6600(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-nez v4, :cond_172

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingIncrease:Z
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$6700(Lcom/android/server/PowerManagerService;)Z

    move-result v4

    if-eqz v4, :cond_12f

    :cond_172
    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v5, v3

    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingValue:F
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$6802(Lcom/android/server/PowerManagerService;F)F

    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/server/PowerManagerService;->access$4100(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAutoBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v5}, Lcom/android/server/PowerManagerService;->access$8900(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v5

    const-wide/16 v8, 0x7d0

    invoke-virtual {v4, v5, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_12f

    :cond_18a
    move v6, v5

    goto :goto_14f

    :cond_18c
    move v4, v5

    goto :goto_15f

    :cond_18e
    iget-object v4, p0, Lcom/android/server/PowerManagerService$14;->this$0:Lcom/android/server/PowerManagerService;

    int-to-float v5, v3

    #setter for: Lcom/android/server/PowerManagerService;->mLightSensorPendingValue:F
    invoke-static {v4, v5}, Lcom/android/server/PowerManagerService;->access$6802(Lcom/android/server/PowerManagerService;F)F
    :try_end_194
    .catchall {:try_start_ba .. :try_end_194} :catchall_b7

    goto :goto_12f
.end method
