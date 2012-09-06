.class Lcom/android/server/WiredAccessoryObserver;
.super Landroid/os/UEventObserver;
.source "WiredAccessoryObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;,
        Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;,
        Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    }
.end annotation


# static fields
.field private static final BIT_HDMI_AUDIO:I = 0x10

.field private static final BIT_HEADSET:I = 0x1

.field private static final BIT_HEADSET_NO_MIC:I = 0x2

.field private static final BIT_USB_HEADSET_ANLG:I = 0x4

.field private static final BIT_USB_HEADSET_DGTL:I = 0x8

.field private static final HEADSETS_WITH_MIC:I = 0x1

.field private static final LOG:Z = true

.field private static final SUPPORTED_HEADSETS:I = 0x1f

.field private static final TAG:Ljava/lang/String;

.field private static mHeadsetState:I

.field private static uEventInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/WiredAccessoryObserver$UEventInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private dockAudioEnabled:Z

.field private final mAudioManager:Landroid/media/AudioManager;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mHeadsetName:Ljava/lang/String;

.field private mPrevHeadsetState:I

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/android/server/WiredAccessoryObserver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->makeObservedUEventList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 8

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {p0}, Landroid/os/UEventObserver;-><init>()V

    iput-boolean v4, p0, Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z

    new-instance v2, Lcom/android/server/WiredAccessoryObserver$1;

    invoke-direct {v2, p0}, Lcom/android/server/WiredAccessoryObserver$1;-><init>(Lcom/android/server/WiredAccessoryObserver;)V

    iput-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/server/WiredAccessoryObserver;->mContext:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    const/4 v2, 0x1

    const-string v3, "WiredAccessoryObserver"

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2, v4}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    const-string v2, "audio"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mAudioManager:Landroid/media/AudioManager;

    new-instance v0, Ljava/io/File;

    const-string v2, "/sys/class/switch/dock/state"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_4e

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4e

    new-instance v2, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;

    invoke-direct {v2, p0, v5}, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;-><init>(Lcom/android/server/WiredAccessoryObserver;Lcom/android/server/WiredAccessoryObserver$1;)V

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.cyanogenmod.settings.SamsungDock"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2, v3, v5, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    :cond_4e
    new-instance v2, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;

    invoke-direct {v2, p0, v5}, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;-><init>(Lcom/android/server/WiredAccessoryObserver;Lcom/android/server/WiredAccessoryObserver$1;)V

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2, v3, v5, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()I
    .registers 1

    sget v0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    return v0
.end method

.method static synthetic access$402(Lcom/android/server/WiredAccessoryObserver;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/server/WiredAccessoryObserver;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/WiredAccessoryObserver;->init()V

    return-void
.end method

.method static synthetic access$600()Ljava/util/List;
    .registers 1

    sget-object v0, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/server/WiredAccessoryObserver;IILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/WiredAccessoryObserver;->setDevicesState(IILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/server/WiredAccessoryObserver;)Landroid/os/PowerManager$WakeLock;
    .registers 2

    iget-object v0, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method private final declared-synchronized init()V
    .registers 11

    monitor-enter p0

    const/16 v7, 0x400

    :try_start_3
    new-array v0, v7, [C

    sget v7, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iput v7, p0, Lcom/android/server/WiredAccessoryObserver;->mPrevHeadsetState:I

    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v8, "init()"

    invoke-static {v7, v8}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x0

    :goto_11
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v4, v7, :cond_80

    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_74

    :try_start_21
    new-instance v3, Ljava/io/FileReader;

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getSwitchStatePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    const/4 v7, 0x0

    const/16 v8, 0x400

    invoke-virtual {v3, v0, v7, v8}, Ljava/io/FileReader;->read([CII)I

    move-result v5

    invoke-virtual {v3}, Ljava/io/FileReader;->close()V

    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x0

    invoke-direct {v7, v0, v8, v5}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lez v1, :cond_53

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getDevPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getDevName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8, v1}, Lcom/android/server/WiredAccessoryObserver;->updateState(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_53
    .catchall {:try_start_21 .. :try_end_53} :catchall_74
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_53} :catch_56
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_53} :catch_77

    :cond_53
    :goto_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :catch_56
    move-exception v2

    :try_start_57
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getSwitchStatePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not found while attempting to determine initial switch state"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_73
    .catchall {:try_start_57 .. :try_end_73} :catchall_74

    goto :goto_53

    :catchall_74
    move-exception v7

    monitor-exit p0

    throw v7

    :catch_77
    move-exception v2

    :try_start_78
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v8, ""

    invoke-static {v7, v8, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7f
    .catchall {:try_start_78 .. :try_end_7f} :catchall_74

    goto :goto_53

    :cond_80
    monitor-exit p0

    return-void
.end method

.method private static makeObservedUEventList()Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/WiredAccessoryObserver$UEventInfo;",
            ">;"
        }
    .end annotation

    const/16 v8, 0x10

    const/16 v7, 0x8

    const/4 v6, 0x4

    const/4 v5, 0x0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    const-string v2, "h2w"

    const/4 v3, 0x1

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_4e

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1d
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    const-string v2, "usb_audio"

    invoke-direct {v1, v2, v6, v7}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2d
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    const-string v2, "dock"

    invoke-direct {v1, v2, v7, v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_5e

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_3d
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    const-string v2, "hdmi_audio"

    invoke-direct {v1, v2, v8, v5}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_66

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_4d
    return-object v0

    :cond_4e
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have wired headset support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    :cond_56
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have usb audio support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2d

    :cond_5e
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have samsung usb dock audio support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3d

    :cond_66
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    const-string v2, "hdmi"

    invoke-direct {v1, v2, v8, v5}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_77

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4d

    :cond_77
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have HDMI audio support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4d
.end method

.method private final setDeviceState(IIILjava/lang/String;)V
    .registers 11

    const/4 v5, 0x1

    and-int v2, p2, p1

    and-int v3, p3, p1

    if-eq v2, v3, :cond_34

    and-int v2, p2, p1

    if-eqz v2, :cond_35

    const/4 v1, 0x1

    :goto_c
    if-ne p1, v5, :cond_37

    const/4 v0, 0x4

    :goto_f
    sget-object v3, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "device "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-ne v1, v5, :cond_6a

    const-string v2, " connected"

    :goto_24
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v2, v0, v1, p4}, Landroid/media/AudioManager;->setWiredDeviceConnectionState(IILjava/lang/String;)V

    :cond_34
    :goto_34
    return-void

    :cond_35
    const/4 v1, 0x0

    goto :goto_c

    :cond_37
    const/4 v2, 0x2

    if-ne p1, v2, :cond_3d

    const/16 v0, 0x8

    goto :goto_f

    :cond_3d
    const/4 v2, 0x4

    if-ne p1, v2, :cond_43

    const/16 v0, 0x800

    goto :goto_f

    :cond_43
    const/16 v2, 0x8

    if-ne p1, v2, :cond_4a

    const/16 v0, 0x1000

    goto :goto_f

    :cond_4a
    const/16 v2, 0x10

    if-ne p1, v2, :cond_51

    const/16 v0, 0x400

    goto :goto_f

    :cond_51
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setDeviceState() invalid headset type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34

    :cond_6a
    const-string v2, " disconnected"

    goto :goto_24
.end method

.method private final declared-synchronized setDevicesState(IILjava/lang/String;)V
    .registers 7

    monitor-enter p0

    const/16 v0, 0x1f

    const/4 v1, 0x1

    :goto_4
    if-eqz v0, :cond_13

    and-int v2, v1, v0

    if-eqz v2, :cond_10

    :try_start_a
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/android/server/WiredAccessoryObserver;->setDeviceState(IIILjava/lang/String;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_15

    xor-int/lit8 v2, v1, -0x1

    and-int/2addr v0, v2

    :cond_10
    shl-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_13
    monitor-exit p0

    return-void

    :catchall_15
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private final declared-synchronized update(Ljava/lang/String;I)V
    .registers 18

    monitor-enter p0

    and-int/lit8 v4, p2, 0x1f

    :try_start_3
    sget v9, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    or-int v5, v4, v9

    const/4 v1, 0x0

    and-int/lit8 v7, v4, 0x4

    and-int/lit8 v8, v4, 0x8

    and-int/lit8 v3, v4, 0x3

    const/4 v2, 0x1

    const/4 v6, 0x1

    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "newState = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", headsetState = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "mHeadsetState = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget v11, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget v9, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    if-eq v9, v4, :cond_4f

    add-int/lit8 v9, v3, -0x1

    and-int/2addr v9, v3

    if-eqz v9, :cond_57

    :cond_4f
    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v10, "unsetting h2w flag"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    :cond_57
    shr-int/lit8 v9, v7, 0x2

    const/4 v10, 0x1

    if-ne v9, v10, :cond_69

    shr-int/lit8 v9, v8, 0x3

    const/4 v10, 0x1

    if-ne v9, v10, :cond_69

    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v10, "unsetting usb flag"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x0

    :cond_69
    if-nez v2, :cond_76

    if-nez v6, :cond_76

    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v10, "invalid transition, returning ..."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_74
    .catchall {:try_start_3 .. :try_end_74} :catchall_98

    :goto_74
    monitor-exit p0

    return-void

    :cond_76
    :try_start_76
    move-object/from16 v0, p1

    iput-object v0, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetName:Ljava/lang/String;

    sget v9, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iput v9, p0, Lcom/android/server/WiredAccessoryObserver;->mPrevHeadsetState:I

    sput v4, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iget-object v9, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v9}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v9, p0, Lcom/android/server/WiredAccessoryObserver;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/server/WiredAccessoryObserver;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    sget v12, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iget v13, p0, Lcom/android/server/WiredAccessoryObserver;->mPrevHeadsetState:I

    iget-object v14, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetName:Ljava/lang/String;

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_97
    .catchall {:try_start_76 .. :try_end_97} :catchall_98

    goto :goto_74

    :catchall_98
    move-exception v9

    monitor-exit p0

    throw v9
.end method

.method private final declared-synchronized updateState(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 7

    monitor-enter p0

    const/4 v0, 0x0

    :goto_2
    :try_start_2
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_23

    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getDevPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-virtual {v1, p2, p3}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->computeNewHeadsetState(Ljava/lang/String;I)I

    move-result v2

    invoke-direct {p0, p2, v2}, Lcom/android/server/WiredAccessoryObserver;->update(Ljava/lang/String;I)V
    :try_end_23
    .catchall {:try_start_2 .. :try_end_23} :catchall_28

    :cond_23
    monitor-exit p0

    return-void

    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :catchall_28
    move-exception v2

    monitor-exit p0

    throw v2
.end method


# virtual methods
.method public onUEvent(Landroid/os/UEventObserver$UEvent;)V
    .registers 9

    sget-object v4, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Headset UEVENT: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/os/UEventObserver$UEvent;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_1c
    const-string v4, "DEVPATH"

    invoke-virtual {p1, v4}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "SWITCH_NAME"

    invoke-virtual {p1, v4}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "dock"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4d

    iget-boolean v4, p0, Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z

    if-nez v4, :cond_4d

    sget-object v4, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Ignoring dock event as Audio routing disabled "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4c
    return-void

    :cond_4d
    const-string v4, "SWITCH_STATE"

    invoke-virtual {p1, v4}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-direct {p0, v0, v2, v3}, Lcom/android/server/WiredAccessoryObserver;->updateState(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_5a
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_5a} :catch_5b

    goto :goto_4c

    :catch_5b
    move-exception v1

    sget-object v4, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not parse switch state from event "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4c
.end method
