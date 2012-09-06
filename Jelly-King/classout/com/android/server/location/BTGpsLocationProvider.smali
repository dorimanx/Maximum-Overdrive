.class public Lcom/android/server/location/BTGpsLocationProvider;
.super Ljava/lang/Object;
.source "BTGpsLocationProvider.java"

# interfaces
.implements Lcom/android/server/location/LocationProviderInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/location/BTGpsLocationProvider$Listener;,
        Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;
    }
.end annotation


# static fields
.field private static final ADD_LISTENER:I = 0x8

.field private static final CHECK_LOCATION:I = 0x1

.field private static final D:Z = true

.field private static final DOWNLOAD_XTRA_DATA:I = 0x6

.field private static final ENABLE:I = 0x2

.field private static final ENABLE_TRACKING:I = 0x3

.field public static final GPS_CUSTOM_COMMAND:I = 0x3ea

.field public static final GPS_DATA_AVAILABLE:I = 0x3e8

.field public static final GPS_STATUS_UPDATE:I = 0x3e9

.field private static final INJECT_NTP_TIME:I = 0x5

.field private static final REMOVE_LISTENER:I = 0x9

.field private static final REQUEST_SINGLE_SHOT:I = 0xa

.field private static final UPDATE_LOCATION:I = 0x7

.field private static final UPDATE_NETWORK_STATE:I = 0x4

.field private static final WAKELOCK_KEY:Ljava/lang/String; = "GpsLocationProvider"


# instance fields
.field private final PROVIDER:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private final btsvc:Lcom/android/server/location/BTGPSService;

.field private final mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private final mBatteryStats:Lcom/android/internal/app/IBatteryStats;

.field private final mClientUids:Landroid/util/SparseIntArray;

.field private final mContext:Landroid/content/Context;

.field private volatile mEnabled:Z

.field private mFixRequestTime:J

.field private final mGpsStatusProvider:Landroid/location/IGpsStatusProvider;

.field private mHandler:Landroid/os/Handler;

.field private final mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

.field private final mIntentBTFilter:Landroid/content/IntentFilter;

.field private mLastFixTime:J

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/location/BTGpsLocationProvider$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private mLocation:Landroid/location/Location;

.field private mLocationExtras:Landroid/os/Bundle;

.field private final mLocationManager:Landroid/location/ILocationManager;

.field private final mMessageLoopThread:Ljava/lang/Thread;

.field private mNavigating:Z

.field private mPendingListenerMessages:I

.field private mPendingMessageBits:I

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStatus:I

.field private mStatusUpdateTime:J

.field private mSvCount:I

.field private mTTFF:I

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private final nmeaparser:Lcom/android/server/location/NMEAParser;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/location/ILocationManager;)V
    .registers 9

    const/4 v5, 0x0

    const/4 v4, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v2, "External Bleutooth Location Provider"

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->PROVIDER:Ljava/lang/String;

    const-string v2, "BTGpsLocationProvider"

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->TAG:Ljava/lang/String;

    new-instance v2, Lcom/android/server/location/NMEAParser;

    const-string v3, "External Bleutooth Location Provider"

    invoke-direct {v2, v3}, Lcom/android/server/location/NMEAParser;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    new-instance v2, Landroid/util/SparseIntArray;

    invoke-direct {v2}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mFixRequestTime:J

    iput v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatusUpdateTime:J

    iput v4, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocationExtras:Landroid/os/Bundle;

    new-instance v2, Landroid/location/Location;

    const-string v3, "External Bleutooth Location Provider"

    invoke-direct {v2, v3}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    new-instance v2, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;-><init>(Lcom/android/server/location/BTGpsLocationProvider;Lcom/android/server/location/BTGpsLocationProvider$1;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mMessageLoopThread:Ljava/lang/Thread;

    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v2, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    new-instance v2, Lcom/android/server/location/BTGpsLocationProvider$2;

    invoke-direct {v2, p0}, Lcom/android/server/location/BTGpsLocationProvider$2;-><init>(Lcom/android/server/location/BTGpsLocationProvider;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mGpsStatusProvider:Landroid/location/IGpsStatusProvider;

    iput-object p1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocationManager:Landroid/location/ILocationManager;

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mMessageLoopThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    :goto_67
    :try_start_67
    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_6c
    .catch Ljava/lang/InterruptedException; {:try_start_67 .. :try_end_6c} :catch_b2

    new-instance v2, Lcom/android/server/location/BTGPSService;

    iget-object v3, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, v3}, Lcom/android/server/location/BTGPSService;-><init>(Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    const-string v3, "power"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    const-string v2, "GpsLocationProvider"

    invoke-virtual {v1, v4, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2, v5}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    const-string v2, "batteryinfo"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/app/IBatteryStats$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IBatteryStats;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    new-instance v2, Lcom/android/server/location/BTGpsLocationProvider$1;

    invoke-direct {v2, p0}, Lcom/android/server/location/BTGpsLocationProvider$1;-><init>(Lcom/android/server/location/BTGpsLocationProvider;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mIntentBTFilter:Landroid/content/IntentFilter;

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/server/location/BTGpsLocationProvider;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v4, p0, Lcom/android/server/location/BTGpsLocationProvider;->mIntentBTFilter:Landroid/content/IntentFilter;

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    :catch_b2
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_67
.end method

.method static synthetic access$100(Lcom/android/server/location/BTGpsLocationProvider;)Lcom/android/server/location/BTGPSService;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/server/location/BTGpsLocationProvider;I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/location/BTGpsLocationProvider;->handleRemoveListener(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/server/location/BTGpsLocationProvider;)Landroid/os/PowerManager$WakeLock;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/server/location/BTGpsLocationProvider;)I
    .registers 2

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingMessageBits:I

    return v0
.end method

.method static synthetic access$1272(Lcom/android/server/location/BTGpsLocationProvider;I)I
    .registers 3

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingMessageBits:I

    and-int/2addr v0, p1

    iput v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingMessageBits:I

    return v0
.end method

.method static synthetic access$1300(Lcom/android/server/location/BTGpsLocationProvider;)I
    .registers 2

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    return v0
.end method

.method static synthetic access$1310(Lcom/android/server/location/BTGpsLocationProvider;)I
    .registers 3

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    return v0
.end method

.method static synthetic access$1400(Lcom/android/server/location/BTGpsLocationProvider;)Ljava/util/concurrent/CountDownLatch;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mInitializedLatch:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/server/location/BTGpsLocationProvider;)Ljava/util/ArrayList;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$202(Lcom/android/server/location/BTGpsLocationProvider;Landroid/os/Handler;)Landroid/os/Handler;
    .registers 2

    iput-object p1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    return-object p1
.end method

.method static synthetic access$300(Lcom/android/server/location/BTGpsLocationProvider;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z

    return v0
.end method

.method static synthetic access$400(Lcom/android/server/location/BTGpsLocationProvider;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/location/BTGpsLocationProvider;->handleNMEAMessages(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/location/BTGpsLocationProvider;Z)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/location/BTGpsLocationProvider;->notifyEnableDisableGPS(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/server/location/BTGpsLocationProvider;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/location/BTGpsLocationProvider;->handleEnable()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/server/location/BTGpsLocationProvider;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/location/BTGpsLocationProvider;->handleDisable()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/server/location/BTGpsLocationProvider;Landroid/location/Location;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/location/BTGpsLocationProvider;->handleUpdateLocation(Landroid/location/Location;)V

    return-void
.end method

.method static synthetic access$900(Lcom/android/server/location/BTGpsLocationProvider;I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/location/BTGpsLocationProvider;->handleAddListener(I)V

    return-void
.end method

.method private handleAddListener(I)V
    .registers 7

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_25

    const-string v1, "BTGpsLocationProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Duplicate add listener for uid "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2

    :goto_24
    return-void

    :cond_25
    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v3}, Landroid/util/SparseIntArray;->put(II)V

    iget-boolean v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mNavigating:Z
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_36

    if-eqz v1, :cond_34

    :try_start_2f
    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v1, p1}, Lcom/android/internal/app/IBatteryStats;->noteStartGps(I)V
    :try_end_34
    .catchall {:try_start_2f .. :try_end_34} :catchall_36
    .catch Landroid/os/RemoteException; {:try_start_2f .. :try_end_34} :catch_39

    :cond_34
    :goto_34
    :try_start_34
    monitor-exit v2

    goto :goto_24

    :catchall_36
    move-exception v1

    monitor-exit v2
    :try_end_38
    .catchall {:try_start_34 .. :try_end_38} :catchall_36

    throw v1

    :catch_39
    move-exception v0

    :try_start_3a
    const-string v1, "BTGpsLocationProvider"

    const-string v3, "RemoteException in addListener"

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_3a .. :try_end_41} :catchall_36

    goto :goto_34
.end method

.method private declared-synchronized handleDisable()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "BTGpsLocationProvider"

    const-string v1, "handleDisable"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_3d

    if-nez v0, :cond_e

    :goto_c
    monitor-exit p0

    return-void

    :cond_e
    :try_start_e
    const-string v0, "BTGpsLocationProvider"

    const-string v1, "mEnabled -> false"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z

    const-string v0, "BTGpsLocationProvider"

    const-string v1, "reportstatus notify listeners and system"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/location/BTGpsLocationProvider;->notifyEnableDisableGPS(Z)V

    const-string v0, "BTGpsLocationProvider"

    const-string v1, "update to out of service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iget v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mSvCount:I

    invoke-direct {p0, v0, v1}, Lcom/android/server/location/BTGpsLocationProvider;->updateStatus(II)V

    const-string v0, "BTGpsLocationProvider"

    const-string v1, "btservice Stop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService;->stop()V
    :try_end_3c
    .catchall {:try_start_e .. :try_end_3c} :catchall_3d

    goto :goto_c

    :catchall_3d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized handleEnable()V
    .registers 9

    monitor-enter p0

    :try_start_1
    const-string v5, "BTGpsLocationProvider"

    const-string v6, "handleEnable"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c7

    if-eqz v5, :cond_e

    :cond_c
    :goto_c
    monitor-exit p0

    return-void

    :cond_e
    :try_start_e
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v5

    if-nez v5, :cond_36

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_2c

    const-string v5, "BTGpsLocationProvider"

    const-string v6, "BT not available. Enable and wait for it..."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->enable()Z
    :try_end_2c
    .catchall {:try_start_e .. :try_end_2c} :catchall_c7

    :cond_2c
    :goto_2c
    :try_start_2c
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getState()I
    :try_end_31
    .catchall {:try_start_2c .. :try_end_31} :catchall_c7
    .catch Ljava/lang/InterruptedException; {:try_start_2c .. :try_end_31} :catch_dc

    move-result v4

    const/16 v5, 0xc

    if-ne v4, v5, :cond_ca

    :cond_36
    :try_start_36
    const-string v5, "BTGpsLocationProvider"

    const-string v6, "mEnabled -> true"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z

    const-string v5, "BTGpsLocationProvider"

    const-string v6, "mStatus -> temp unavailable"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v5, 0x1

    iput v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    const-string v5, "BTGpsLocationProvider"

    const-string v6, "btservice start"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    invoke-virtual {v5}, Lcom/android/server/location/BTGPSService;->start()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mFixRequestTime:J

    const/4 v5, 0x0

    iput v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "0"

    invoke-static {v5, v6}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "BTGpsLocationProvider"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Connecting to saved pref: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_c

    const-string v5, "0"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v5, :cond_c

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_c

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a3

    const-string v5, "BTGpsLocationProvider"

    const-string v6, "Connecting..."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    invoke-virtual {v5, v1}, Lcom/android/server/location/BTGPSService;->connect(Landroid/bluetooth/BluetoothDevice;)Z
    :try_end_c5
    .catchall {:try_start_36 .. :try_end_c5} :catchall_c7

    goto/16 :goto_c

    :catchall_c7
    move-exception v5

    monitor-exit p0

    throw v5

    :cond_ca
    const/16 v5, 0xb

    if-ne v4, v5, :cond_e8

    :try_start_ce
    const-string v5, "BTGpsLocationProvider"

    const-string v6, "BT not available yet. waiting for another 400ms"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v5, 0x190

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_da
    .catchall {:try_start_ce .. :try_end_da} :catchall_c7
    .catch Ljava/lang/InterruptedException; {:try_start_ce .. :try_end_da} :catch_dc

    goto/16 :goto_2c

    :catch_dc
    move-exception v2

    :try_start_dd
    const-string v5, "BTGpsLocationProvider"

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e6
    .catchall {:try_start_dd .. :try_end_e6} :catchall_c7

    goto/16 :goto_2c

    :cond_e8
    :try_start_e8
    const-string v5, "BTGpsLocationProvider"

    const-string v6, "BT got disabled or interrupted by other source"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_ef
    .catchall {:try_start_e8 .. :try_end_ef} :catchall_c7
    .catch Ljava/lang/InterruptedException; {:try_start_e8 .. :try_end_ef} :catch_dc

    goto/16 :goto_c
.end method

.method private handleNMEAMessages(Ljava/lang/String;)V
    .registers 15

    const-string v0, "\r\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->reset()V

    const/4 v7, 0x0

    :goto_c
    array-length v0, v12

    if-ge v7, v0, :cond_4c

    const-string v0, "BTGpsLocationProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "About to parse: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, v12, v7

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    aget-object v0, v12, v7

    if-eqz v0, :cond_3a

    const-string v0, ""

    aget-object v1, v12, v7

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    :goto_37
    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    :cond_3a
    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    aget-object v1, v12, v7

    invoke-virtual {v0, v1}, Lcom/android/server/location/NMEAParser;->parseNMEALine(Ljava/lang/String;)Z

    move-result v11

    aget-object v0, v12, v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/location/BTGpsLocationProvider;->reportNmea(Ljava/lang/String;J)V

    goto :goto_37

    :cond_4c
    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getLocation()Landroid/location/Location;

    move-result-object v8

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->isValid()Z

    move-result v0

    invoke-direct {p0, v8, v0}, Lcom/android/server/location/BTGpsLocationProvider;->reportLocation(Landroid/location/Location;Z)V

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->isSatdataReady()Z

    move-result v0

    if-eqz v0, :cond_8b

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getmSvCount()I

    move-result v1

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getmSvs()[I

    move-result-object v2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getmSnrs()[F

    move-result-object v3

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getmSvElevations()[F

    move-result-object v4

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getmSvAzimuths()[F

    move-result-object v5

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getmSvMasks()[I

    move-result-object v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/server/location/BTGpsLocationProvider;->reportSvStatus(I[I[F[F[F[I)V

    :cond_8b
    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->nmeaparser:Lcom/android/server/location/NMEAParser;

    invoke-virtual {v0}, Lcom/android/server/location/NMEAParser;->getApproximatedRefreshRate()J

    move-result-wide v9

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService;->getRefreshRate()J

    move-result-wide v0

    cmp-long v0, v0, v9

    if-eqz v0, :cond_c8

    const-string v0, "BTGpsLocationProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting refresh rate to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " was: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    invoke-virtual {v2}, Lcom/android/server/location/BTGPSService;->getRefreshRate()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;

    invoke-virtual {v0, v9, v10}, Lcom/android/server/location/BTGPSService;->setRefreshRate(J)V

    :cond_c8
    return-void
.end method

.method private handleRemoveListener(I)V
    .registers 7

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v1

    if-gez v1, :cond_25

    const-string v1, "BTGpsLocationProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unneeded remove listener for uid "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2

    :goto_24
    return-void

    :cond_25
    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->delete(I)V

    iget-boolean v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mNavigating:Z
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_35

    if-eqz v1, :cond_33

    :try_start_2e
    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v1, p1}, Lcom/android/internal/app/IBatteryStats;->noteStopGps(I)V
    :try_end_33
    .catchall {:try_start_2e .. :try_end_33} :catchall_35
    .catch Landroid/os/RemoteException; {:try_start_2e .. :try_end_33} :catch_38

    :cond_33
    :goto_33
    :try_start_33
    monitor-exit v2

    goto :goto_24

    :catchall_35
    move-exception v1

    monitor-exit v2
    :try_end_37
    .catchall {:try_start_33 .. :try_end_37} :catchall_35

    throw v1

    :catch_38
    move-exception v0

    :try_start_39
    const-string v1, "BTGpsLocationProvider"

    const-string v3, "RemoteException in removeListener"

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_40
    .catchall {:try_start_39 .. :try_end_40} :catchall_35

    goto :goto_33
.end method

.method private handleUpdateLocation(Landroid/location/Location;)V
    .registers 3

    invoke-virtual {p1}, Landroid/location/Location;->hasAccuracy()Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_6
    return-void
.end method

.method private notifyEnableDisableGPS(Z)V
    .registers 11

    const-string v6, "BTGpsLocationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "notifyEnableDisableGPS status: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v7, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v7

    :try_start_1b
    iput-boolean p1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mNavigating:Z

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v1, 0x0

    :goto_24
    if-ge v1, v4, :cond_4e

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/location/BTGpsLocationProvider$Listener;
    :try_end_2e
    .catchall {:try_start_1b .. :try_end_2e} :catchall_ae

    if-eqz p1, :cond_38

    :try_start_30
    iget-object v6, v3, Lcom/android/server/location/BTGpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    invoke-interface {v6}, Landroid/location/IGpsStatusListener;->onGpsStarted()V

    :goto_35
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    :cond_38
    iget-object v6, v3, Lcom/android/server/location/BTGpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    invoke-interface {v6}, Landroid/location/IGpsStatusListener;->onGpsStopped()V
    :try_end_3d
    .catchall {:try_start_30 .. :try_end_3d} :catchall_ae
    .catch Landroid/os/RemoteException; {:try_start_30 .. :try_end_3d} :catch_3e

    goto :goto_35

    :catch_3e
    move-exception v0

    :try_start_3f
    const-string v6, "BTGpsLocationProvider"

    const-string v8, "RemoteException in reportStatus"

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_4b
    .catchall {:try_start_3f .. :try_end_4b} :catchall_ae

    add-int/lit8 v4, v4, -0x1

    goto :goto_35

    :cond_4e
    :try_start_4e
    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v6}, Landroid/util/SparseIntArray;->size()I

    move-result v6

    add-int/lit8 v1, v6, -0x1

    :goto_56
    if-ltz v1, :cond_78

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mClientUids:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v5

    iget-boolean v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mNavigating:Z

    if-eqz v6, :cond_6a

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v6, v5}, Lcom/android/internal/app/IBatteryStats;->noteStartGps(I)V

    :goto_67
    add-int/lit8 v1, v1, -0x1

    goto :goto_56

    :cond_6a
    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v6, v5}, Lcom/android/internal/app/IBatteryStats;->noteStopGps(I)V
    :try_end_6f
    .catchall {:try_start_4e .. :try_end_6f} :catchall_ae
    .catch Landroid/os/RemoteException; {:try_start_4e .. :try_end_6f} :catch_70

    goto :goto_67

    :catch_70
    move-exception v0

    :try_start_71
    const-string v6, "BTGpsLocationProvider"

    const-string v8, "RemoteException in reportStatus"

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_78
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.location.GPS_ENABLED_CHANGE"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v6, "enabled"

    invoke-virtual {v2, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    monitor-exit v7
    :try_end_8a
    .catchall {:try_start_71 .. :try_end_8a} :catchall_ae

    :try_start_8a
    const-string v6, "BTGpsLocationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Setting System GPS status to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "gps"

    invoke-static {v6, v7, p1}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V
    :try_end_ad
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_ad} :catch_b1

    :goto_ad
    return-void

    :catchall_ae
    move-exception v6

    :try_start_af
    monitor-exit v7
    :try_end_b0
    .catchall {:try_start_af .. :try_end_b0} :catchall_ae

    throw v6

    :catch_b1
    move-exception v0

    const-string v6, "BTGpsLocationProvider"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_ad
.end method

.method private reportLocation(Landroid/location/Location;Z)V
    .registers 15

    const/4 v11, 0x1

    const/4 v7, 0x0

    const/4 v10, 0x2

    if-nez p2, :cond_2b

    iget v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    if-ne v5, v10, :cond_2a

    iget v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    if-lez v5, :cond_2a

    const-string v5, "BTGpsLocationProvider"

    const-string v6, "Invalid sat fix -> sending notification to system"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.location.GPS_FIX_CHANGE"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v5, "enabled"

    invoke-virtual {v2, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    iget v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mSvCount:I

    invoke-direct {p0, v11, v5}, Lcom/android/server/location/BTGpsLocationProvider;->updateStatus(II)V

    :cond_2a
    :goto_2a
    return-void

    :cond_2b
    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    monitor-enter v6

    :try_start_2e
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v5, p1}, Landroid/location/Location;->set(Landroid/location/Location;)V

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {p0}, Lcom/android/server/location/BTGpsLocationProvider;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/location/Location;->setProvider(Ljava/lang/String;)V

    const-string v5, "BTGpsLocationProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reportLocation lat: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v8}, Landroid/location/Location;->getLatitude()D

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " long: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v8}, Landroid/location/Location;->getLongitude()D

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " alt: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v8}, Landroid/location/Location;->getAltitude()D

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " accuracy: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v8}, Landroid/location/Location;->getAccuracy()F

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " timestamp: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v8}, Landroid/location/Location;->getTime()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9a
    .catchall {:try_start_2e .. :try_end_9a} :catchall_f8

    :try_start_9a
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocationManager:Landroid/location/ILocationManager;

    iget-object v7, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/location/ILocationManager;->reportLocation(Landroid/location/Location;Z)V
    :try_end_a2
    .catchall {:try_start_9a .. :try_end_a2} :catchall_f8
    .catch Landroid/os/RemoteException; {:try_start_9a .. :try_end_a2} :catch_ef

    :goto_a2
    :try_start_a2
    monitor-exit v6
    :try_end_a3
    .catchall {:try_start_a2 .. :try_end_a3} :catchall_f8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLastFixTime:J

    iget v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    if-nez v5, :cond_10c

    if-eqz p2, :cond_10c

    iget-wide v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLastFixTime:J

    iget-wide v7, p0, Lcom/android/server/location/BTGpsLocationProvider;->mFixRequestTime:J

    sub-long/2addr v5, v7

    long-to-int v5, v5

    iput v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    const-string v5, "BTGpsLocationProvider"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "TTFF: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v6

    :try_start_d4
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v1, 0x0

    :goto_db
    if-ge v1, v4, :cond_10b

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/location/BTGpsLocationProvider$Listener;
    :try_end_e5
    .catchall {:try_start_d4 .. :try_end_e5} :catchall_12f

    :try_start_e5
    iget-object v5, v3, Lcom/android/server/location/BTGpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    iget v7, p0, Lcom/android/server/location/BTGpsLocationProvider;->mTTFF:I

    invoke-interface {v5, v7}, Landroid/location/IGpsStatusListener;->onFirstFix(I)V
    :try_end_ec
    .catchall {:try_start_e5 .. :try_end_ec} :catchall_12f
    .catch Landroid/os/RemoteException; {:try_start_e5 .. :try_end_ec} :catch_fb

    :goto_ec
    add-int/lit8 v1, v1, 0x1

    goto :goto_db

    :catch_ef
    move-exception v0

    :try_start_f0
    const-string v5, "BTGpsLocationProvider"

    const-string v7, "RemoteException calling reportLocation"

    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a2

    :catchall_f8
    move-exception v5

    monitor-exit v6
    :try_end_fa
    .catchall {:try_start_f0 .. :try_end_fa} :catchall_f8

    throw v5

    :catch_fb
    move-exception v0

    :try_start_fc
    const-string v5, "BTGpsLocationProvider"

    const-string v7, "RemoteException in first fix notification"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, -0x1

    goto :goto_ec

    :cond_10b
    monitor-exit v6
    :try_end_10c
    .catchall {:try_start_fc .. :try_end_10c} :catchall_12f

    :cond_10c
    iget v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    if-eq v5, v10, :cond_2a

    const-string v5, "BTGpsLocationProvider"

    const-string v6, "Notify that we\'re receiving fixes"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.location.GPS_FIX_CHANGE"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v5, "enabled"

    invoke-virtual {v2, v5, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    iget v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mSvCount:I

    invoke-direct {p0, v10, v5}, Lcom/android/server/location/BTGpsLocationProvider;->updateStatus(II)V

    goto/16 :goto_2a

    :catchall_12f
    move-exception v5

    :try_start_130
    monitor-exit v6
    :try_end_131
    .catchall {:try_start_130 .. :try_end_131} :catchall_12f

    throw v5
.end method

.method private reportNmea(Ljava/lang/String;J)V
    .registers 11

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v5

    :try_start_3
    iget-object v4, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2e

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v3, :cond_2e

    iget-object v4, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/location/BTGpsLocationProvider$Listener;
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_30

    :try_start_16
    iget-object v4, v2, Lcom/android/server/location/BTGpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    invoke-interface {v4, p2, p3, p1}, Landroid/location/IGpsStatusListener;->onNmeaReceived(JLjava/lang/String;)V
    :try_end_1b
    .catchall {:try_start_16 .. :try_end_1b} :catchall_30
    .catch Landroid/os/RemoteException; {:try_start_16 .. :try_end_1b} :catch_1e

    :goto_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :catch_1e
    move-exception v0

    :try_start_1f
    const-string v4, "BTGpsLocationProvider"

    const-string v6, "RemoteException in reportNmea"

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, -0x1

    goto :goto_1b

    :cond_2e
    monitor-exit v5

    return-void

    :catchall_30
    move-exception v4

    monitor-exit v5
    :try_end_32
    .catchall {:try_start_1f .. :try_end_32} :catchall_30

    throw v4
.end method

.method private reportSvStatus(I[I[F[F[F[I)V
    .registers 21

    const-string v0, "BTGpsLocationProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "About to report sat status svcount: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v13, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    monitor-enter v13

    :try_start_1b
    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v12

    const/4 v10, 0x0

    :goto_22
    if-ge v10, v12, :cond_56

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/server/location/BTGpsLocationProvider$Listener;
    :try_end_2c
    .catchall {:try_start_1b .. :try_end_2c} :catchall_64

    :try_start_2c
    iget-object v0, v11, Lcom/android/server/location/BTGpsLocationProvider$Listener;->mListener:Landroid/location/IGpsStatusListener;

    const/4 v1, 0x0

    aget v6, p6, v1

    const/4 v1, 0x1

    aget v7, p6, v1

    const/4 v1, 0x2

    aget v8, p6, v1

    move v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    invoke-interface/range {v0 .. v8}, Landroid/location/IGpsStatusListener;->onSvStatusChanged(I[I[F[F[FIII)V
    :try_end_43
    .catchall {:try_start_2c .. :try_end_43} :catchall_64
    .catch Landroid/os/RemoteException; {:try_start_2c .. :try_end_43} :catch_46

    :goto_43
    add-int/lit8 v10, v10, 0x1

    goto :goto_22

    :catch_46
    move-exception v9

    :try_start_47
    const-string v0, "BTGpsLocationProvider"

    const-string v1, "RemoteException in reportSvInfo"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    add-int/lit8 v12, v12, -0x1

    goto :goto_43

    :cond_56
    monitor-exit v13
    :try_end_57
    .catchall {:try_start_47 .. :try_end_57} :catchall_64

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    const/4 v1, 0x2

    aget v1, p6, v1

    invoke-static {v1}, Ljava/lang/Integer;->bitCount(I)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/location/BTGpsLocationProvider;->updateStatus(II)V

    return-void

    :catchall_64
    move-exception v0

    :try_start_65
    monitor-exit v13
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    throw v0
.end method

.method private sendMessage(IILjava/lang/Object;)V
    .registers 8

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v2

    :try_start_3
    iget v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingMessageBits:I

    const/4 v3, 0x1

    shl-int/2addr v3, p1

    or-int/2addr v1, v3

    iput v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingMessageBits:I

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-static {v1, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    iput p2, v0, Landroid/os/Message;->arg1:I

    iput-object p3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    monitor-exit v2

    return-void

    :catchall_25
    move-exception v1

    monitor-exit v2
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v1
.end method

.method private updateStatus(II)V
    .registers 5

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    if-ne p1, v0, :cond_8

    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mSvCount:I

    if-eq p2, v0, :cond_19

    :cond_8
    iput p1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    iput p2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mSvCount:I

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocationExtras:Landroid/os/Bundle;

    const-string v1, "satellites"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatusUpdateTime:J

    :cond_19
    return-void
.end method


# virtual methods
.method public addListener(I)V
    .registers 6

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v2

    :try_start_3
    iget v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x8

    invoke-static {v1, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    monitor-exit v2

    return-void

    :catchall_1f
    move-exception v1

    monitor-exit v2
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public disable()V
    .registers 5

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v1

    const/4 v0, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_6
    invoke-direct {p0, v0, v2, v3}, Lcom/android/server/location/BTGpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public enable()V
    .registers 5

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v1

    const/4 v0, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_6
    invoke-direct {p0, v0, v2, v3}, Lcom/android/server/location/BTGpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public enableLocationTracking(Z)V
    .registers 2

    return-void
.end method

.method public getAccuracy()I
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public getGpsStatusProvider()Landroid/location/IGpsStatusProvider;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mGpsStatusProvider:Landroid/location/IGpsStatusProvider;

    return-object v0
.end method

.method public getInternalState()Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    const-string v0, "gps"

    return-object v0
.end method

.method public getPowerRequirement()I
    .registers 2

    const/4 v0, 0x2

    return v0
.end method

.method public getStatus(Landroid/os/Bundle;)I
    .registers 4

    if-eqz p1, :cond_9

    const-string v0, "satellites"

    iget v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mSvCount:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_9
    iget v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatus:I

    return v0
.end method

.method public getStatusUpdateTime()J
    .registers 3

    iget-wide v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mStatusUpdateTime:J

    return-wide v0
.end method

.method public hasMonetaryCost()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z

    return v0
.end method

.method public meetsCriteria(Landroid/location/Criteria;)Z
    .registers 4

    const/4 v0, 0x1

    invoke-virtual {p1}, Landroid/location/Criteria;->getPowerRequirement()I

    move-result v1

    if-eq v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public removeListener(I)V
    .registers 6

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v2

    :try_start_3
    iget v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x9

    invoke-static {v1, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    monitor-exit v2

    return-void

    :catchall_1f
    move-exception v1

    monitor-exit v2
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public requestSingleShotFix()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public requiresCell()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public requiresNetwork()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public requiresSatellite()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public sendExtraCommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .registers 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x0

    :goto_7
    return v1

    :cond_8
    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider;->mHandler:Landroid/os/Handler;

    monitor-enter v2

    :try_start_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\r\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3ea

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-direct {p0, v1, v3, v4}, Lcom/android/server/location/BTGpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    monitor-exit v2

    const/4 v1, 0x1

    goto :goto_7

    :catchall_2e
    move-exception v1

    monitor-exit v2
    :try_end_30
    .catchall {:try_start_b .. :try_end_30} :catchall_2e

    throw v1
.end method

.method public setMinTime(JLandroid/os/WorkSource;)V
    .registers 4

    return-void
.end method

.method public supportsAltitude()Z
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->hasAltitude()Z

    move-result v0

    return v0
.end method

.method public supportsBearing()Z
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->hasBearing()Z

    move-result v0

    return v0
.end method

.method public supportsSpeed()Z
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGpsLocationProvider;->mLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->hasSpeed()Z

    move-result v0

    return v0
.end method

.method public updateLocation(Landroid/location/Location;)V
    .registers 4

    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/android/server/location/BTGpsLocationProvider;->sendMessage(IILjava/lang/Object;)V

    return-void
.end method

.method public updateNetworkState(ILandroid/net/NetworkInfo;)V
    .registers 3

    return-void
.end method
