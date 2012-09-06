.class Lcom/android/server/wm/WindowManagerService$PolicyThread;
.super Ljava/lang/Thread;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PolicyThread"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mPM:Lcom/android/server/PowerManagerService;

.field private final mPolicy:Landroid/view/WindowManagerPolicy;

.field mRunning:Z

.field private final mService:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Landroid/view/WindowManagerPolicy;Lcom/android/server/wm/WindowManagerService;Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    .registers 6
    .parameter "policy"
    .parameter "service"
    .parameter "context"
    .parameter "pm"

    .prologue
    .line 719
    const-string v0, "WindowManagerPolicy"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 714
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mRunning:Z

    .line 720
    iput-object p1, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mPolicy:Landroid/view/WindowManagerPolicy;

    .line 721
    iput-object p2, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mService:Lcom/android/server/wm/WindowManagerService;

    .line 722
    iput-object p3, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mContext:Landroid/content/Context;

    .line 723
    iput-object p4, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mPM:Lcom/android/server/PowerManagerService;

    .line 724
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 727
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 728
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/internal/view/WindowManagerPolicyThread;->set(Ljava/lang/Thread;Landroid/os/Looper;)V

    .line 732
    const/4 v0, -0x2

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 734
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 735
    iget-object v0, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget-object v1, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mPM:Lcom/android/server/PowerManagerService;

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/WindowManagerPolicy;->init(Landroid/content/Context;Landroid/view/IWindowManager;Landroid/view/WindowManagerPolicy$WindowManagerFuncs;Landroid/os/LocalPowerManager;)V

    .line 737
    monitor-enter p0

    .line 738
    const/4 v0, 0x1

    :try_start_21
    iput-boolean v0, p0, Lcom/android/server/wm/WindowManagerService$PolicyThread;->mRunning:Z

    .line 739
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 740
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_21 .. :try_end_27} :catchall_38

    .line 743
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 744
    const-string v0, "WindowManager"

    const-string v1, "Enabled StrictMode for PolicyThread\'s Looper"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    :cond_34
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 748
    return-void

    .line 740
    :catchall_38
    move-exception v0

    :try_start_39
    monitor-exit p0
    :try_end_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_38

    throw v0
.end method
