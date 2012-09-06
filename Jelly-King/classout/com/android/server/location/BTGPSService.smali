.class public Lcom/android/server/location/BTGPSService;
.super Ljava/lang/Object;
.source "BTGPSService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/location/BTGPSService$WatchdogThread;,
        Lcom/android/server/location/BTGPSService$ConnectedThread;,
        Lcom/android/server/location/BTGPSService$ConnectThread;
    }
.end annotation


# static fields
.field private static final BT_UUID:Ljava/util/UUID; = null

.field private static final D:Z = true

.field public static final STATE_CONNECTED:I = 0x3

.field public static final STATE_CONNECTING:I = 0x2

.field public static final STATE_LISTEN:I = 0x1

.field public static final STATE_NONE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BTGPSService"


# instance fields
.field private MAX_ACTIVITY_TIMEOUT:I

.field private MAX_CONNECT_TIMEOUT:I

.field private MAX_RECONNECT_RETRIES:I

.field private final buffer:[C

.field bytes:I

.field private lastActivity:J

.field private lastConnectedDevice:Landroid/bluetooth/BluetoothDevice;

.field private final mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

.field private mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

.field private final mHandler:Landroid/os/Handler;

.field private final mMaxNMEABuffer:I

.field private mState:I

.field private mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

.field private refreshRate:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/android/server/location/BTGPSService;->BT_UUID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;)V
    .registers 6

    const/16 v0, 0x1000

    const/4 v3, 0x5

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    iput-object v2, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    iput-object v2, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    iput v0, p0, Lcom/android/server/location/BTGPSService;->mMaxNMEABuffer:I

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->buffer:[C

    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lcom/android/server/location/BTGPSService;->refreshRate:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/server/location/BTGPSService;->lastActivity:J

    iput v3, p0, Lcom/android/server/location/BTGPSService;->MAX_ACTIVITY_TIMEOUT:I

    iput v3, p0, Lcom/android/server/location/BTGPSService;->MAX_RECONNECT_RETRIES:I

    const/16 v0, 0x32c8

    iput v0, p0, Lcom/android/server/location/BTGPSService;->MAX_CONNECT_TIMEOUT:I

    iput-object v2, p0, Lcom/android/server/location/BTGPSService;->lastConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/location/BTGPSService;->mState:I

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    iput-object p1, p0, Lcom/android/server/location/BTGPSService;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000()Ljava/util/UUID;
    .registers 1

    sget-object v0, Lcom/android/server/location/BTGPSService;->BT_UUID:Ljava/util/UUID;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/location/BTGPSService;)Landroid/bluetooth/BluetoothAdapter;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/server/location/BTGPSService;)Lcom/android/server/location/BTGPSService$ConnectedThread;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/android/server/location/BTGPSService;Lcom/android/server/location/BTGPSService$ConnectedThread;)Lcom/android/server/location/BTGPSService$ConnectedThread;
    .registers 2

    iput-object p1, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/server/location/BTGPSService;I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/location/BTGPSService;->setState(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/server/location/BTGPSService;)I
    .registers 2

    iget v0, p0, Lcom/android/server/location/BTGPSService;->MAX_CONNECT_TIMEOUT:I

    return v0
.end method

.method static synthetic access$200(Lcom/android/server/location/BTGPSService;)[C
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->buffer:[C

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/location/BTGPSService;)J
    .registers 3

    iget-wide v0, p0, Lcom/android/server/location/BTGPSService;->refreshRate:J

    return-wide v0
.end method

.method static synthetic access$302(Lcom/android/server/location/BTGPSService;J)J
    .registers 3

    iput-wide p1, p0, Lcom/android/server/location/BTGPSService;->refreshRate:J

    return-wide p1
.end method

.method static synthetic access$400(Lcom/android/server/location/BTGPSService;)J
    .registers 3

    iget-wide v0, p0, Lcom/android/server/location/BTGPSService;->lastActivity:J

    return-wide v0
.end method

.method static synthetic access$402(Lcom/android/server/location/BTGPSService;J)J
    .registers 3

    iput-wide p1, p0, Lcom/android/server/location/BTGPSService;->lastActivity:J

    return-wide p1
.end method

.method static synthetic access$500(Lcom/android/server/location/BTGPSService;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/server/location/BTGPSService;)I
    .registers 2

    iget v0, p0, Lcom/android/server/location/BTGPSService;->MAX_ACTIVITY_TIMEOUT:I

    return v0
.end method

.method static synthetic access$700(Lcom/android/server/location/BTGPSService;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/location/BTGPSService;->handleFailedConnection()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/server/location/BTGPSService;)I
    .registers 2

    iget v0, p0, Lcom/android/server/location/BTGPSService;->MAX_RECONNECT_RETRIES:I

    return v0
.end method

.method static synthetic access$900(Lcom/android/server/location/BTGPSService;)Lcom/android/server/location/BTGPSService$ConnectThread;
    .registers 2

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    return-object v0
.end method

.method static synthetic access$902(Lcom/android/server/location/BTGPSService;Lcom/android/server/location/BTGPSService$ConnectThread;)Lcom/android/server/location/BTGPSService$ConnectThread;
    .registers 2

    iput-object p1, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    return-object p1
.end method

.method private handleFailedConnection()V
    .registers 3

    invoke-virtual {p0}, Lcom/android/server/location/BTGPSService;->getServiceState()I

    move-result v0

    if-eqz v0, :cond_13

    const-string v0, "BTGPSService"

    const-string v1, "Connection failed with status != 0. try to reconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->lastConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p0, v0}, Lcom/android/server/location/BTGPSService;->connect(Landroid/bluetooth/BluetoothDevice;)Z

    :goto_12
    return-void

    :cond_13
    const-string v0, "BTGPSService"

    const-string v1, "Connection stopped with status = 0."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method private sendMessage(IILjava/lang/Object;)V
    .registers 6

    iget-object v1, p0, Lcom/android/server/location/BTGPSService;->mHandler:Landroid/os/Handler;

    invoke-static {v1, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    iput p2, v0, Landroid/os/Message;->arg1:I

    iput-object p3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/server/location/BTGPSService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method private declared-synchronized setState(I)V
    .registers 5

    monitor-enter p0

    :try_start_1
    const-string v0, "BTGPSService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setState() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/location/BTGPSService;->mState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p1, p0, Lcom/android/server/location/BTGPSService;->mState:I

    iget v0, p0, Lcom/android/server/location/BTGPSService;->mState:I

    if-nez v0, :cond_34

    const/16 v0, 0x3e9

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/location/BTGPSService;->sendMessage(IILjava/lang/Object;)V
    :try_end_32
    .catchall {:try_start_1 .. :try_end_32} :catchall_41

    :cond_32
    :goto_32
    monitor-exit p0

    return-void

    :cond_34
    :try_start_34
    iget v0, p0, Lcom/android/server/location/BTGPSService;->mState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_32

    const/16 v0, 0x3e9

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/location/BTGPSService;->sendMessage(IILjava/lang/Object;)V
    :try_end_40
    .catchall {:try_start_34 .. :try_end_40} :catchall_41

    goto :goto_32

    :catchall_41
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized connect(Landroid/bluetooth/BluetoothDevice;)Z
    .registers 5

    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/android/server/location/BTGPSService;->lastConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    const-string v0, "BTGPSService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "connect to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    :cond_27
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$WatchdogThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    :cond_33
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    if-eqz v0, :cond_3f

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectedThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    :cond_3f
    new-instance v0, Lcom/android/server/location/BTGPSService$WatchdogThread;

    invoke-direct {v0, p0, p1}, Lcom/android/server/location/BTGPSService$WatchdogThread;-><init>(Lcom/android/server/location/BTGPSService;Landroid/bluetooth/BluetoothDevice;)V

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$WatchdogThread;->start()V
    :try_end_4b
    .catchall {:try_start_1 .. :try_end_4b} :catchall_4e

    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :catchall_4e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized connected(Landroid/bluetooth/BluetoothSocket;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    :cond_8
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$WatchdogThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    :cond_14
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectedThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    :cond_20
    new-instance v0, Lcom/android/server/location/BTGPSService$ConnectedThread;

    invoke-direct {v0, p0, p1}, Lcom/android/server/location/BTGPSService$ConnectedThread;-><init>(Lcom/android/server/location/BTGPSService;Landroid/bluetooth/BluetoothSocket;)V

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectedThread;->start()V

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/android/server/location/BTGPSService;->setState(I)V
    :try_end_30
    .catchall {:try_start_1 .. :try_end_30} :catchall_32

    monitor-exit p0

    return-void

    :catchall_32
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRefreshRate()J
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/android/server/location/BTGPSService;->refreshRate:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getServiceState()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/android/server/location/BTGPSService;->mState:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRefreshRate(J)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iput-wide p1, p0, Lcom/android/server/location/BTGPSService;->refreshRate:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-void

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "BTGPSService"

    const-string v1, "start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/location/BTGPSService;->setState(I)V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_33

    :goto_14
    monitor-exit p0

    return-void

    :cond_16
    :try_start_16
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    :cond_22
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectedThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    :cond_2e
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/location/BTGPSService;->setState(I)V
    :try_end_32
    .catchall {:try_start_16 .. :try_end_32} :catchall_33

    goto :goto_14

    :catchall_33
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stop()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "BTGPSService"

    const-string v1, "Stopping btsvc, Set state to None"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/location/BTGPSService;->setState(I)V

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    if-eqz v0, :cond_1f

    const-string v0, "BTGPSService"

    const-string v1, "Cancelling watchdog thread"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$WatchdogThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mWatchdogThread:Lcom/android/server/location/BTGPSService$WatchdogThread;

    :cond_1f
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    if-eqz v0, :cond_32

    const-string v0, "BTGPSService"

    const-string v1, "Cancelling connect thread"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectThread:Lcom/android/server/location/BTGPSService$ConnectThread;

    :cond_32
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    if-eqz v0, :cond_45

    const-string v0, "BTGPSService"

    const-string v1, "Cancelling connected thread"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    invoke-virtual {v0}, Lcom/android/server/location/BTGPSService$ConnectedThread;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;
    :try_end_45
    .catchall {:try_start_1 .. :try_end_45} :catchall_47

    :cond_45
    monitor-exit p0

    return-void

    :catchall_47
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public write([B)V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget v1, p0, Lcom/android/server/location/BTGPSService;->mState:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_8

    monitor-exit p0

    :goto_7
    return-void

    :cond_8
    iget-object v0, p0, Lcom/android/server/location/BTGPSService;->mConnectedThread:Lcom/android/server/location/BTGPSService$ConnectedThread;

    monitor-exit p0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_f

    invoke-virtual {v0, p1}, Lcom/android/server/location/BTGPSService$ConnectedThread;->write([B)V

    goto :goto_7

    :catchall_f
    move-exception v1

    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v1
.end method
