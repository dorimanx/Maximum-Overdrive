.class final Lcom/android/server/wm/WindowManagerService$AnimationRunnable;
.super Ljava/lang/Object;
.source "WindowManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AnimationRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/wm/WindowManagerService;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/WindowManagerService$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;-><init>(Lcom/android/server/wm/WindowManagerService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v4, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v5

    :try_start_5
    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v6, 0x0

    iput-boolean v6, v4, Lcom/android/server/wm/WindowManagerService;->mAnimationScheduled:Z

    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v4, Lcom/android/server/wm/WindowManagerService;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    monitor-enter v6
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_52

    const-wide/16 v7, 0x20

    :try_start_11
    const-string v4, "wmAnimate"

    invoke-static {v7, v8, v4}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget-object v3, v4, Lcom/android/server/wm/WindowAnimator;->mWinAnimators:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_28
    if-ge v1, v0, :cond_40

    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/WindowState;

    iget-object v2, v4, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget-object v4, v2, Lcom/android/server/wm/WindowStateAnimator;->mSurface:Landroid/view/Surface;

    if-eqz v4, :cond_3d

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    :cond_40
    iget-object v4, p0, Lcom/android/server/wm/WindowManagerService$AnimationRunnable;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowAnimator;->animate()V

    const-wide/16 v7, 0x20

    invoke-static {v7, v8}, Landroid/os/Trace;->traceEnd(J)V

    monitor-exit v6
    :try_end_4d
    .catchall {:try_start_11 .. :try_end_4d} :catchall_4f

    :try_start_4d
    monitor-exit v5
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_52

    return-void

    :catchall_4f
    move-exception v4

    :try_start_50
    monitor-exit v6
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    :try_start_51
    throw v4

    :catchall_52
    move-exception v4

    monitor-exit v5
    :try_end_54
    .catchall {:try_start_51 .. :try_end_54} :catchall_52

    throw v4
.end method
