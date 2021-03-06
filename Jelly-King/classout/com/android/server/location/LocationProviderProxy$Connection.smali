.class Lcom/android/server/location/LocationProviderProxy$Connection;
.super Ljava/lang/Object;
.source "LocationProviderProxy.java"

# interfaces
.implements Landroid/content/ServiceConnection;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/location/LocationProviderProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Connection"
.end annotation


# instance fields
.field private mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

.field private mProvider:Landroid/location/ILocationProvider;

.field final synthetic this$0:Lcom/android/server/location/LocationProviderProxy;


# direct methods
.method private constructor <init>(Lcom/android/server/location/LocationProviderProxy;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/location/LocationProviderProxy;Lcom/android/server/location/LocationProviderProxy$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/android/server/location/LocationProviderProxy$Connection;-><init>(Lcom/android/server/location/LocationProviderProxy;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized getCachedAttributes()Lcom/android/internal/location/DummyLocationProvider;
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getProvider()Landroid/location/ILocationProvider;
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mProvider:Landroid/location/ILocationProvider;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    invoke-static {p2}, Landroid/location/ILocationProvider$Stub;->asInterface(Landroid/os/IBinder;)Landroid/location/ILocationProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mProvider:Landroid/location/ILocationProvider;

    iget-object v0, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mProvider:Landroid/location/ILocationProvider;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/location/LocationProviderProxy;->access$100(Lcom/android/server/location/LocationProviderProxy;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_14
    monitor-exit p0

    return-void

    :catchall_16
    move-exception v0

    monitor-exit p0
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 3

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mProvider:Landroid/location/ILocationProvider;

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_6

    throw v0
.end method

.method public run()V
    .registers 9

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mMutex:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$200(Lcom/android/server/location/LocationProviderProxy;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_7
    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mServiceConnection:Lcom/android/server/location/LocationProviderProxy$Connection;
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$300(Lcom/android/server/location/LocationProviderProxy;)Lcom/android/server/location/LocationProviderProxy$Connection;

    move-result-object v2

    if-eq v2, p0, :cond_11

    monitor-exit v3

    :goto_10
    return-void

    :cond_11
    invoke-virtual {p0}, Lcom/android/server/location/LocationProviderProxy$Connection;->getProvider()Landroid/location/ILocationProvider;

    move-result-object v1

    if-nez v1, :cond_1c

    monitor-exit v3

    goto :goto_10

    :catchall_19
    move-exception v2

    monitor-exit v3
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_19

    throw v2

    :cond_1c
    :try_start_1c
    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mEnabled:Z
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$400(Lcom/android/server/location/LocationProviderProxy;)Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Landroid/location/ILocationProvider;->enable()V

    :cond_27
    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mLocationTracking:Z
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$500(Lcom/android/server/location/LocationProviderProxy;)Z

    move-result v2

    if-eqz v2, :cond_33

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/location/ILocationProvider;->enableLocationTracking(Z)V

    :cond_33
    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mMinTime:J
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$600(Lcom/android/server/location/LocationProviderProxy;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-ltz v2, :cond_4e

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mMinTime:J
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$600(Lcom/android/server/location/LocationProviderProxy;)J

    move-result-wide v4

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mMinTimeSource:Landroid/os/WorkSource;
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$700(Lcom/android/server/location/LocationProviderProxy;)Landroid/os/WorkSource;

    move-result-object v2

    invoke-interface {v1, v4, v5, v2}, Landroid/location/ILocationProvider;->setMinTime(JLandroid/os/WorkSource;)V

    :cond_4e
    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mNetworkInfo:Landroid/net/NetworkInfo;
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$800(Lcom/android/server/location/LocationProviderProxy;)Landroid/net/NetworkInfo;

    move-result-object v2

    if-eqz v2, :cond_65

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mNetworkState:I
    invoke-static {v2}, Lcom/android/server/location/LocationProviderProxy;->access$900(Lcom/android/server/location/LocationProviderProxy;)I

    move-result v2

    iget-object v4, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mNetworkInfo:Landroid/net/NetworkInfo;
    invoke-static {v4}, Lcom/android/server/location/LocationProviderProxy;->access$800(Lcom/android/server/location/LocationProviderProxy;)Landroid/net/NetworkInfo;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Landroid/location/ILocationProvider;->updateNetworkState(ILandroid/net/NetworkInfo;)V
    :try_end_65
    .catchall {:try_start_1c .. :try_end_65} :catchall_19
    .catch Landroid/os/RemoteException; {:try_start_1c .. :try_end_65} :catch_d0

    :cond_65
    :goto_65
    :try_start_65
    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;
    :try_end_67
    .catchall {:try_start_65 .. :try_end_67} :catchall_19

    if-nez v2, :cond_c8

    :try_start_69
    new-instance v2, Lcom/android/internal/location/DummyLocationProvider;

    iget-object v4, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->this$0:Lcom/android/server/location/LocationProviderProxy;

    #getter for: Lcom/android/server/location/LocationProviderProxy;->mName:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/server/location/LocationProviderProxy;->access$1000(Lcom/android/server/location/LocationProviderProxy;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v2, v4, v5}, Lcom/android/internal/location/DummyLocationProvider;-><init>(Ljava/lang/String;Landroid/location/ILocationManager;)V

    iput-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->requiresNetwork()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setRequiresNetwork(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->requiresSatellite()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setRequiresSatellite(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->requiresCell()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setRequiresCell(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->hasMonetaryCost()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setHasMonetaryCost(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->supportsAltitude()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setSupportsAltitude(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->supportsSpeed()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setSupportsSpeed(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->supportsBearing()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setSupportsBearing(Z)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->getPowerRequirement()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setPowerRequirement(I)V

    iget-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;

    invoke-interface {v1}, Landroid/location/ILocationProvider;->getAccuracy()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/internal/location/DummyLocationProvider;->setAccuracy(I)V
    :try_end_c8
    .catchall {:try_start_69 .. :try_end_c8} :catchall_19
    .catch Landroid/os/RemoteException; {:try_start_69 .. :try_end_c8} :catch_cb

    :cond_c8
    :goto_c8
    :try_start_c8
    monitor-exit v3

    goto/16 :goto_10

    :catch_cb
    move-exception v0

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/server/location/LocationProviderProxy$Connection;->mCachedAttributes:Lcom/android/internal/location/DummyLocationProvider;
    :try_end_cf
    .catchall {:try_start_c8 .. :try_end_cf} :catchall_19

    goto :goto_c8

    :catch_d0
    move-exception v2

    goto :goto_65
.end method
