.class Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;
.super Lcom/android/internal/util/StateMachine;
.source "Tethering.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/connectivity/Tethering;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TetherInterfaceSM"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$UnavailableState;,
        Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$TetheredState;,
        Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$StartingState;,
        Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$InitialState;
    }
.end annotation


# static fields
.field static final CMD_CELL_DUN_ERROR:I = 0x6

.field static final CMD_INTERFACE_DOWN:I = 0x4

.field static final CMD_INTERFACE_UP:I = 0x5

.field static final CMD_IP_FORWARDING_DISABLE_ERROR:I = 0x8

.field static final CMD_IP_FORWARDING_ENABLE_ERROR:I = 0x7

.field static final CMD_SET_DNS_FORWARDERS_ERROR:I = 0xb

.field static final CMD_START_TETHERING_ERROR:I = 0x9

.field static final CMD_STOP_TETHERING_ERROR:I = 0xa

.field static final CMD_TETHER_CONNECTION_CHANGED:I = 0xc

.field static final CMD_TETHER_MODE_DEAD:I = 0x1

.field static final CMD_TETHER_REQUESTED:I = 0x2

.field static final CMD_TETHER_UNREQUESTED:I = 0x3


# instance fields
.field private mAvailable:Z

.field private mDefaultState:Lcom/android/internal/util/State;

.field mIfaceName:Ljava/lang/String;

.field private mInitialState:Lcom/android/internal/util/State;

.field mLastError:I

.field mMyUpstreamIfaceName:Ljava/lang/String;

.field private mStartingState:Lcom/android/internal/util/State;

.field private mTethered:Z

.field private mTetheredState:Lcom/android/internal/util/State;

.field private mUnavailableState:Lcom/android/internal/util/State;

.field mUsb:Z

.field final synthetic this$0:Lcom/android/server/connectivity/Tethering;


# direct methods
.method constructor <init>(Lcom/android/server/connectivity/Tethering;Ljava/lang/String;Landroid/os/Looper;Z)V
    .registers 6
    .parameter
    .parameter "name"
    .parameter "looper"
    .parameter "usb"

    .prologue
    .line 792
    iput-object p1, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    .line 793
    invoke-direct {p0, p2, p3}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;Landroid/os/Looper;)V

    .line 794
    iput-object p2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mIfaceName:Ljava/lang/String;

    .line 795
    iput-boolean p4, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mUsb:Z

    .line 796
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->setLastError(I)V

    .line 798
    new-instance v0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$InitialState;

    invoke-direct {v0, p0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$InitialState;-><init>(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mInitialState:Lcom/android/internal/util/State;

    .line 799
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mInitialState:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->addState(Lcom/android/internal/util/State;)V

    .line 800
    new-instance v0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$StartingState;

    invoke-direct {v0, p0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$StartingState;-><init>(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mStartingState:Lcom/android/internal/util/State;

    .line 801
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mStartingState:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->addState(Lcom/android/internal/util/State;)V

    .line 802
    new-instance v0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$TetheredState;

    invoke-direct {v0, p0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$TetheredState;-><init>(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTetheredState:Lcom/android/internal/util/State;

    .line 803
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTetheredState:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->addState(Lcom/android/internal/util/State;)V

    .line 804
    new-instance v0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$UnavailableState;

    invoke-direct {v0, p0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM$UnavailableState;-><init>(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mUnavailableState:Lcom/android/internal/util/State;

    .line 805
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mUnavailableState:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->addState(Lcom/android/internal/util/State;)V

    .line 807
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mInitialState:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->setInitialState(Lcom/android/internal/util/State;)V

    .line 808
    return-void
.end method

.method static synthetic access$1100(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->setLastError(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)Lcom/android/internal/util/State;
    .registers 2
    .parameter "x0"

    .prologue
    .line 749
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mStartingState:Lcom/android/internal/util/State;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)Lcom/android/internal/util/State;
    .registers 2
    .parameter "x0"

    .prologue
    .line 749
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mUnavailableState:Lcom/android/internal/util/State;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)Lcom/android/internal/util/State;
    .registers 2
    .parameter "x0"

    .prologue
    .line 749
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mInitialState:Lcom/android/internal/util/State;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;)Lcom/android/internal/util/State;
    .registers 2
    .parameter "x0"

    .prologue
    .line 749
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTetheredState:Lcom/android/internal/util/State;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->setAvailable(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 749
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->setTethered(Z)V

    return-void
.end method

.method private setAvailable(Z)V
    .registers 4
    .parameter "available"

    .prologue
    .line 851
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 852
    :try_start_7
    iput-boolean p1, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mAvailable:Z

    .line 853
    monitor-exit v1

    .line 854
    return-void

    .line 853
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_b

    throw v0
.end method

.method private setLastError(I)V
    .registers 5
    .parameter "error"

    .prologue
    .line 831
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 832
    :try_start_7
    iput p1, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mLastError:I

    .line 834
    invoke-virtual {p0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->isErrored()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 835
    iget-boolean v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mUsb:Z

    if-eqz v0, :cond_19

    .line 838
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    const/4 v2, 0x0

    #calls: Lcom/android/server/connectivity/Tethering;->configureUsbIface(Z)Z
    invoke-static {v0, v2}, Lcom/android/server/connectivity/Tethering;->access$700(Lcom/android/server/connectivity/Tethering;Z)Z

    .line 841
    :cond_19
    monitor-exit v1

    .line 842
    return-void

    .line 841
    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_7 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method private setTethered(Z)V
    .registers 4
    .parameter "tethered"

    .prologue
    .line 863
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 864
    :try_start_7
    iput-boolean p1, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTethered:Z

    .line 865
    monitor-exit v1

    .line 866
    return-void

    .line 865
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_b

    throw v0
.end method


# virtual methods
.method public getLastError()I
    .registers 3

    .prologue
    .line 825
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 826
    :try_start_7
    iget v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mLastError:I

    monitor-exit v1

    return v0

    .line 827
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public isAvailable()Z
    .registers 3

    .prologue
    .line 845
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 846
    :try_start_7
    iget-boolean v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mAvailable:Z

    monitor-exit v1

    return v0

    .line 847
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public isErrored()Z
    .registers 3

    .prologue
    .line 869
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 870
    :try_start_7
    iget v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mLastError:I

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_c
    monitor-exit v1

    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_c

    .line 871
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public isTethered()Z
    .registers 3

    .prologue
    .line 857
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->this$0:Lcom/android/server/connectivity/Tethering;

    #getter for: Lcom/android/server/connectivity/Tethering;->mPublicSync:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/connectivity/Tethering;->access$200(Lcom/android/server/connectivity/Tethering;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 858
    :try_start_7
    iget-boolean v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTethered:Z

    monitor-exit v1

    return v0

    .line 859
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_b

    throw v0
.end method

.method setLastErrorAndTransitionToInitialState(I)V
    .registers 3
    .parameter "error"

    .prologue
    .line 1121
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->setLastError(I)V

    .line 1122
    iget-object v0, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mInitialState:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 1123
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 811
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    .line 812
    .local v1, res:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mIfaceName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 813
    invoke-virtual {p0}, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    .line 814
    .local v0, current:Lcom/android/internal/util/IState;
    iget-object v2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mInitialState:Lcom/android/internal/util/State;

    if-ne v0, v2, :cond_39

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "InitialState"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 815
    :cond_39
    iget-object v2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mStartingState:Lcom/android/internal/util/State;

    if-ne v0, v2, :cond_50

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "StartingState"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 816
    :cond_50
    iget-object v2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTetheredState:Lcom/android/internal/util/State;

    if-ne v0, v2, :cond_67

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "TetheredState"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 817
    :cond_67
    iget-object v2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mUnavailableState:Lcom/android/internal/util/State;

    if-ne v0, v2, :cond_7e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "UnavailableState"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 818
    :cond_7e
    iget-boolean v2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mAvailable:Z

    if-eqz v2, :cond_95

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - Available"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 819
    :cond_95
    iget-boolean v2, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mTethered:Z

    if-eqz v2, :cond_ac

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - Tethered"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 820
    :cond_ac
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - lastError ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/server/connectivity/Tethering$TetherInterfaceSM;->mLastError:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 821
    return-object v1
.end method
