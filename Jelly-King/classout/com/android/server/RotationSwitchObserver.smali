.class Lcom/android/server/RotationSwitchObserver;
.super Landroid/os/UEventObserver;
.source "RotationSwitchObserver.java"


# static fields
.field private static final LOCK_STATE_PATH:Ljava/lang/String; = "/sys/class/switch/rotationlock/state"

.field private static final LOCK_UEVENT_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/switch/rotationlock"

.field private static final LOG:Z = true

.field private static final MSG_LOCK_STATE:I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAutoRotation:Z

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mLockState:I

.field private mPreviousLockState:I

.field private mSystemReady:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/android/server/RotationSwitchObserver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Landroid/os/UEventObserver;-><init>()V

    new-instance v0, Lcom/android/server/RotationSwitchObserver$1;

    invoke-direct {v0, p0}, Lcom/android/server/RotationSwitchObserver$1;-><init>(Lcom/android/server/RotationSwitchObserver;)V

    iput-object v0, p0, Lcom/android/server/RotationSwitchObserver;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/server/RotationSwitchObserver;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/android/server/RotationSwitchObserver;->init()V

    const-string v0, "DEVPATH=/devices/virtual/switch/rotationlock"

    invoke-virtual {p0, v0}, Lcom/android/server/RotationSwitchObserver;->startObserving(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/server/RotationSwitchObserver;)I
    .registers 2

    iget v0, p0, Lcom/android/server/RotationSwitchObserver;->mLockState:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/server/RotationSwitchObserver;Z)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/RotationSwitchObserver;->setAutoRotation(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/RotationSwitchObserver;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/android/server/RotationSwitchObserver;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private final init()V
    .registers 7

    const/16 v4, 0x400

    new-array v0, v4, [C

    :try_start_4
    new-instance v2, Ljava/io/FileReader;

    const-string v4, "/sys/class/switch/rotationlock/state"

    invoke-direct {v2, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    const/16 v5, 0x400

    invoke-virtual {v2, v0, v4, v5}, Ljava/io/FileReader;->read([CII)I

    move-result v3

    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/android/server/RotationSwitchObserver;->mLockState:I

    iput v4, p0, Lcom/android/server/RotationSwitchObserver;->mPreviousLockState:I
    :try_end_2b
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_2b} :catch_2c
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_2b} :catch_35
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_2b} :catch_3e

    :goto_2b
    return-void

    :catch_2c
    move-exception v1

    sget-object v4, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    const-string v5, "This kernel does not have rotation switch support"

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2b

    :catch_35
    move-exception v1

    sget-object v4, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    const-string v5, ""

    invoke-static {v4, v5, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2b

    :catch_3e
    move-exception v1

    sget-object v4, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    const-string v5, ""

    invoke-static {v4, v5, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2b
.end method

.method private setAutoRotation(Z)V
    .registers 3

    iput-boolean p1, p0, Lcom/android/server/RotationSwitchObserver;->mAutoRotation:Z

    new-instance v0, Lcom/android/server/RotationSwitchObserver$2;

    invoke-direct {v0, p0, p1}, Lcom/android/server/RotationSwitchObserver$2;-><init>(Lcom/android/server/RotationSwitchObserver;Z)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private final update()V
    .registers 3

    iget-object v0, p0, Lcom/android/server/RotationSwitchObserver;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method


# virtual methods
.method public onUEvent(Landroid/os/UEventObserver$UEvent;)V
    .registers 7

    sget-object v2, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_25

    sget-object v2, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Switch UEVENT: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/os/UEventObserver$UEvent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_25
    monitor-enter p0

    :try_start_26
    const-string v2, "SWITCH_STATE"

    invoke-virtual {p1, v2}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iget v2, p0, Lcom/android/server/RotationSwitchObserver;->mLockState:I

    if-eq v1, v2, :cond_41

    iget v2, p0, Lcom/android/server/RotationSwitchObserver;->mLockState:I

    iput v2, p0, Lcom/android/server/RotationSwitchObserver;->mPreviousLockState:I

    iput v1, p0, Lcom/android/server/RotationSwitchObserver;->mLockState:I

    iget-boolean v2, p0, Lcom/android/server/RotationSwitchObserver;->mSystemReady:Z

    if-eqz v2, :cond_41

    invoke-direct {p0}, Lcom/android/server/RotationSwitchObserver;->update()V
    :try_end_41
    .catchall {:try_start_26 .. :try_end_41} :catchall_5d
    .catch Ljava/lang/NumberFormatException; {:try_start_26 .. :try_end_41} :catch_43

    :cond_41
    :goto_41
    :try_start_41
    monitor-exit p0

    return-void

    :catch_43
    move-exception v0

    sget-object v2, Lcom/android/server/RotationSwitchObserver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not parse switch state from event "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_41

    :catchall_5d
    move-exception v2

    monitor-exit p0
    :try_end_5f
    .catchall {:try_start_41 .. :try_end_5f} :catchall_5d

    throw v2
.end method

.method systemReady()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/server/RotationSwitchObserver;->mSystemReady:Z

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_6

    throw v0
.end method
