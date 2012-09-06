.class Lcom/android/server/VibratorService$VibrateThread;
.super Ljava/lang/Thread;
.source "VibratorService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/VibratorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VibrateThread"
.end annotation


# instance fields
.field mDone:Z

.field final mVibration:Lcom/android/server/VibratorService$Vibration;

.field final synthetic this$0:Lcom/android/server/VibratorService;


# direct methods
.method constructor <init>(Lcom/android/server/VibratorService;Lcom/android/server/VibratorService$Vibration;)V
    .registers 5

    iput-object p1, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p2, p0, Lcom/android/server/VibratorService$VibrateThread;->mVibration:Lcom/android/server/VibratorService$Vibration;

    #getter for: Lcom/android/server/VibratorService;->mTmpWorkSource:Landroid/os/WorkSource;
    invoke-static {p1}, Lcom/android/server/VibratorService;->access$900(Lcom/android/server/VibratorService;)Landroid/os/WorkSource;

    move-result-object v0

    #getter for: Lcom/android/server/VibratorService$Vibration;->mUid:I
    invoke-static {p2}, Lcom/android/server/VibratorService$Vibration;->access$800(Lcom/android/server/VibratorService$Vibration;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/os/WorkSource;->set(I)V

    #getter for: Lcom/android/server/VibratorService;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {p1}, Lcom/android/server/VibratorService;->access$1000(Lcom/android/server/VibratorService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    #getter for: Lcom/android/server/VibratorService;->mTmpWorkSource:Landroid/os/WorkSource;
    invoke-static {p1}, Lcom/android/server/VibratorService;->access$900(Lcom/android/server/VibratorService;)Landroid/os/WorkSource;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    #getter for: Lcom/android/server/VibratorService;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {p1}, Lcom/android/server/VibratorService;->access$1000(Lcom/android/server/VibratorService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    return-void
.end method

.method private delay(J)V
    .registers 9

    const-wide/16 v4, 0x0

    cmp-long v2, p1, v4

    if-lez v2, :cond_11

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    :cond_a
    :try_start_a
    invoke-virtual {p0, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_d} :catch_1f

    :goto_d
    iget-boolean v2, p0, Lcom/android/server/VibratorService$VibrateThread;->mDone:Z

    if-eqz v2, :cond_12

    :cond_11
    :goto_11
    return-void

    :cond_12
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sub-long v2, p1, v2

    sub-long p1, v2, v0

    cmp-long v2, p1, v4

    if-gtz v2, :cond_a

    goto :goto_11

    :catch_1f
    move-exception v2

    goto :goto_d
.end method


# virtual methods
.method public run()V
    .registers 11

    const/4 v7, -0x8

    invoke-static {v7}, Landroid/os/Process;->setThreadPriority(I)V

    monitor-enter p0

    const/4 v2, 0x0

    :try_start_6
    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->mVibration:Lcom/android/server/VibratorService$Vibration;

    #getter for: Lcom/android/server/VibratorService$Vibration;->mPattern:[J
    invoke-static {v7}, Lcom/android/server/VibratorService$Vibration;->access$700(Lcom/android/server/VibratorService$Vibration;)[J

    move-result-object v5

    array-length v4, v5

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->mVibration:Lcom/android/server/VibratorService$Vibration;

    #getter for: Lcom/android/server/VibratorService$Vibration;->mRepeat:I
    invoke-static {v7}, Lcom/android/server/VibratorService$Vibration;->access$1100(Lcom/android/server/VibratorService$Vibration;)I
    :try_end_12
    .catchall {:try_start_6 .. :try_end_12} :catchall_7f

    move-result v6

    const-wide/16 v0, 0x0

    move v3, v2

    :goto_16
    :try_start_16
    iget-boolean v7, p0, Lcom/android/server/VibratorService$VibrateThread;->mDone:Z
    :try_end_18
    .catchall {:try_start_16 .. :try_end_18} :catchall_85

    if-nez v7, :cond_8a

    if-ge v3, v4, :cond_22

    add-int/lit8 v2, v3, 0x1

    :try_start_1e
    aget-wide v7, v5, v3
    :try_end_20
    .catchall {:try_start_1e .. :try_end_20} :catchall_7f

    add-long/2addr v0, v7

    move v3, v2

    :cond_22
    :try_start_22
    invoke-direct {p0, v0, v1}, Lcom/android/server/VibratorService$VibrateThread;->delay(J)V

    iget-boolean v7, p0, Lcom/android/server/VibratorService$VibrateThread;->mDone:Z
    :try_end_27
    .catchall {:try_start_22 .. :try_end_27} :catchall_85

    if-eqz v7, :cond_63

    move v2, v3

    :goto_2a
    :try_start_2a
    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    #getter for: Lcom/android/server/VibratorService;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v7}, Lcom/android/server/VibratorService;->access$1000(Lcom/android/server/VibratorService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/PowerManager$WakeLock;->release()V

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_2a .. :try_end_34} :catchall_7f

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    #getter for: Lcom/android/server/VibratorService;->mVibrations:Ljava/util/LinkedList;
    invoke-static {v7}, Lcom/android/server/VibratorService;->access$000(Lcom/android/server/VibratorService;)Ljava/util/LinkedList;

    move-result-object v8

    monitor-enter v8

    :try_start_3b
    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    iget-object v7, v7, Lcom/android/server/VibratorService;->mThread:Lcom/android/server/VibratorService$VibrateThread;

    if-ne v7, p0, :cond_46

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    const/4 v9, 0x0

    iput-object v9, v7, Lcom/android/server/VibratorService;->mThread:Lcom/android/server/VibratorService$VibrateThread;

    :cond_46
    iget-boolean v7, p0, Lcom/android/server/VibratorService$VibrateThread;->mDone:Z

    if-nez v7, :cond_61

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    #getter for: Lcom/android/server/VibratorService;->mVibrations:Ljava/util/LinkedList;
    invoke-static {v7}, Lcom/android/server/VibratorService;->access$000(Lcom/android/server/VibratorService;)Ljava/util/LinkedList;

    move-result-object v7

    iget-object v9, p0, Lcom/android/server/VibratorService$VibrateThread;->mVibration:Lcom/android/server/VibratorService$Vibration;

    invoke-virtual {v7, v9}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    iget-object v9, p0, Lcom/android/server/VibratorService$VibrateThread;->mVibration:Lcom/android/server/VibratorService$Vibration;

    #calls: Lcom/android/server/VibratorService;->unlinkVibration(Lcom/android/server/VibratorService$Vibration;)V
    invoke-static {v7, v9}, Lcom/android/server/VibratorService;->access$1300(Lcom/android/server/VibratorService;Lcom/android/server/VibratorService$Vibration;)V

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    #calls: Lcom/android/server/VibratorService;->startNextVibrationLocked()V
    invoke-static {v7}, Lcom/android/server/VibratorService;->access$300(Lcom/android/server/VibratorService;)V

    :cond_61
    monitor-exit v8
    :try_end_62
    .catchall {:try_start_3b .. :try_end_62} :catchall_82

    return-void

    :cond_63
    if-ge v3, v4, :cond_76

    add-int/lit8 v2, v3, 0x1

    :try_start_67
    aget-wide v0, v5, v3

    const-wide/16 v7, 0x0

    cmp-long v7, v0, v7

    if-lez v7, :cond_88

    iget-object v7, p0, Lcom/android/server/VibratorService$VibrateThread;->this$0:Lcom/android/server/VibratorService;

    #calls: Lcom/android/server/VibratorService;->doVibratorOn(J)V
    invoke-static {v7, v0, v1}, Lcom/android/server/VibratorService;->access$1200(Lcom/android/server/VibratorService;J)V

    move v3, v2

    goto :goto_16

    :cond_76
    if-gez v6, :cond_7a

    move v2, v3

    goto :goto_2a

    :cond_7a
    move v2, v6

    const-wide/16 v0, 0x0

    move v3, v2

    goto :goto_16

    :catchall_7f
    move-exception v7

    :goto_80
    monitor-exit p0
    :try_end_81
    .catchall {:try_start_67 .. :try_end_81} :catchall_7f

    throw v7

    :catchall_82
    move-exception v7

    :try_start_83
    monitor-exit v8
    :try_end_84
    .catchall {:try_start_83 .. :try_end_84} :catchall_82

    throw v7

    :catchall_85
    move-exception v7

    move v2, v3

    goto :goto_80

    :cond_88
    move v3, v2

    goto :goto_16

    :cond_8a
    move v2, v3

    goto :goto_2a
.end method
