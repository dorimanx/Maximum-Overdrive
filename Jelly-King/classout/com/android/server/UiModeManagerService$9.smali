.class Lcom/android/server/UiModeManagerService$9;
.super Landroid/os/Handler;
.source "UiModeManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/UiModeManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mDidFirstInit:Z

.field mLastNetworkRegisterTime:J

.field mNetworkListenerEnabled:Z

.field mPassiveListenerEnabled:Z

.field final synthetic this$0:Lcom/android/server/UiModeManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/UiModeManagerService;)V
    .registers 4

    iput-object p1, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const-wide/32 v0, -0x1b7740

    iput-wide v0, p0, Lcom/android/server/UiModeManagerService$9;->mLastNetworkRegisterTime:J

    return-void
.end method

.method private retrieveLocation()V
    .registers 14

    const/4 v4, 0x0

    iget-object v6, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v6}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v6

    new-instance v7, Landroid/location/Criteria;

    invoke-direct {v7}, Landroid/location/Criteria;-><init>()V

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v8}, Landroid/location/LocationManager;->getProviders(Landroid/location/Criteria;Z)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_15
    :goto_15
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v6}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    if-eqz v4, :cond_3b

    if-eqz v1, :cond_15

    invoke-virtual {v4}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    invoke-virtual {v1}, Landroid/location/Location;->getTime()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_15

    :cond_3b
    move-object v4, v1

    goto :goto_15

    :cond_3d
    if-nez v4, :cond_79

    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Landroid/text/format/Time;->set(J)V

    const-wide v7, 0x3f71111111111111L

    iget-wide v9, v0, Landroid/text/format/Time;->gmtoff:J

    iget v6, v0, Landroid/text/format/Time;->isDst:I

    if-lez v6, :cond_85

    const/16 v6, 0xe10

    :goto_58
    int-to-long v11, v6

    sub-long/2addr v9, v11

    long-to-double v9, v9

    mul-double v2, v7, v9

    new-instance v4, Landroid/location/Location;

    const-string v6, "fake"

    invoke-direct {v4, v6}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    const-wide/16 v6, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/location/Location;->setLatitude(D)V

    const v6, 0x48cb9d00

    invoke-virtual {v4, v6}, Landroid/location/Location;->setAccuracy(F)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Landroid/location/Location;->setTime(J)V

    :cond_79
    iget-object v6, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    iget-object v7, v6, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v7

    :try_start_7e
    iget-object v6, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #setter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v6, v4}, Lcom/android/server/UiModeManagerService;->access$802(Lcom/android/server/UiModeManagerService;Landroid/location/Location;)Landroid/location/Location;

    monitor-exit v7

    return-void

    :cond_85
    const/4 v6, 0x0

    goto :goto_58

    :catchall_87
    move-exception v6

    monitor-exit v7
    :try_end_89
    .catchall {:try_start_7e .. :try_end_89} :catchall_87

    throw v6
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 15

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_146

    :cond_5
    :goto_5
    return-void

    :pswitch_6
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    iget-object v1, v0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_b
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v0}, Lcom/android/server/UiModeManagerService;->isDoingNightMode()Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$800(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mNightMode:I
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$300(Lcom/android/server/UiModeManagerService;)I

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v0}, Lcom/android/server/UiModeManagerService;->updateTwilightLocked()V

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    :cond_2f
    monitor-exit v1

    goto :goto_5

    :catchall_31
    move-exception v0

    monitor-exit v1
    :try_end_33
    .catchall {:try_start_b .. :try_end_33} :catchall_31

    throw v0

    :pswitch_34
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mNetworkListenerEnabled:Z

    if-eqz v0, :cond_5

    iget-wide v0, p0, Lcom/android/server/UiModeManagerService$9;->mLastNetworkRegisterTime:J

    const-wide/32 v2, 0x1b7740

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mNetworkListenerEnabled:Z

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mEmptyLocationListener:Landroid/location/LocationListener;
    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    :pswitch_58
    :try_start_58
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_63} :catch_131

    move-result v10

    :goto_64
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mNetworkListenerEnabled:Z

    if-nez v0, :cond_c4

    if-eqz v10, :cond_c4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mNetworkListenerEnabled:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/UiModeManagerService$9;->mLastNetworkRegisterTime:J

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "network"

    const-wide/32 v2, 0x5265c00

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mEmptyLocationListener:Landroid/location/LocationListener;
    invoke-static {v5}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mDidFirstInit:Z

    if-nez v0, :cond_c4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mDidFirstInit:Z

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$800(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;

    move-result-object v0

    if-nez v0, :cond_9a

    invoke-direct {p0}, Lcom/android/server/UiModeManagerService$9;->retrieveLocation()V

    :cond_9a
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    iget-object v1, v0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_9f
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v0}, Lcom/android/server/UiModeManagerService;->isDoingNightMode()Z

    move-result v0

    if-eqz v0, :cond_c3

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$800(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_c3

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mNightMode:I
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$300(Lcom/android/server/UiModeManagerService;)I

    move-result v0

    if-nez v0, :cond_c3

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v0}, Lcom/android/server/UiModeManagerService;->updateTwilightLocked()V

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    :cond_c3
    monitor-exit v1
    :try_end_c4
    .catchall {:try_start_9f .. :try_end_c4} :catchall_135

    :cond_c4
    :try_start_c4
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "passive"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_cf
    .catch Ljava/lang/Exception; {:try_start_c4 .. :try_end_cf} :catch_138

    move-result v12

    :goto_d0
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mPassiveListenerEnabled:Z

    if-nez v0, :cond_ef

    if-eqz v12, :cond_ef

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mPassiveListenerEnabled:Z

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "passive"

    const-wide/16 v2, 0x0

    const v4, 0x469c4000

    iget-object v5, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationListener:Landroid/location/LocationListener;
    invoke-static {v5}, Lcom/android/server/UiModeManagerService;->access$1100(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    :cond_ef
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mNetworkListenerEnabled:Z

    if-eqz v0, :cond_f7

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$9;->mPassiveListenerEnabled:Z

    if-nez v0, :cond_5

    :cond_f7
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "LAST_UPDATE_INTERVAL"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    long-to-double v0, v8

    const-wide/high16 v2, 0x3ff8

    mul-double/2addr v0, v2

    double-to-long v8, v0

    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-nez v0, :cond_13b

    const-wide/16 v8, 0x1388

    :cond_10e
    :goto_10e
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    const-string v0, "LAST_UPDATE_INTERVAL"

    invoke-virtual {v6, v0, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$400(Lcom/android/server/UiModeManagerService;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v11

    invoke-virtual {v11, v6}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/android/server/UiModeManagerService$9;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$400(Lcom/android/server/UiModeManagerService;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v11, v8, v9}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_5

    :catch_131
    move-exception v7

    const/4 v10, 0x0

    goto/16 :goto_64

    :catchall_135
    move-exception v0

    :try_start_136
    monitor-exit v1
    :try_end_137
    .catchall {:try_start_136 .. :try_end_137} :catchall_135

    throw v0

    :catch_138
    move-exception v7

    const/4 v12, 0x0

    goto :goto_d0

    :cond_13b
    const-wide/32 v0, 0xdbba0

    cmp-long v0, v8, v0

    if-lez v0, :cond_10e

    const-wide/32 v8, 0xdbba0

    goto :goto_10e

    :pswitch_data_146
    .packed-switch 0x0
        :pswitch_6
        :pswitch_58
        :pswitch_34
    .end packed-switch
.end method
