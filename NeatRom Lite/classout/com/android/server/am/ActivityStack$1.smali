.class Lcom/android/server/am/ActivityStack$1;
.super Landroid/os/Handler;
.source "ActivityStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ActivityStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ActivityStack;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityStack;)V
    .registers 2
    .parameter

    .prologue
    .line 302
    iput-object p1, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 11
    .parameter "msg"

    .prologue
    const-wide/16 v7, 0x2710

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 308
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_154

    .line 382
    :goto_a
    :pswitch_a
    return-void

    .line 310
    :pswitch_b
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v3, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v3

    .line 311
    :try_start_10
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v2}, Lcom/android/server/am/ActivityManagerService;->isSleeping()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 312
    const-string v2, "ActivityManager"

    const-string v4, "Sleep timeout!  Sleeping now."

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/android/server/am/ActivityStack;->mSleepTimeout:Z

    .line 314
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    invoke-virtual {v2}, Lcom/android/server/am/ActivityStack;->checkReadyForSleepLocked()V

    .line 316
    :cond_2b
    monitor-exit v3

    goto :goto_a

    :catchall_2d
    move-exception v2

    monitor-exit v3
    :try_end_2f
    .catchall {:try_start_10 .. :try_end_2f} :catchall_2d

    throw v2

    .line 319
    :pswitch_30
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/server/am/ActivityRecord;

    .line 322
    .local v1, r:Lcom/android/server/am/ActivityRecord;
    sget-boolean v3, Lcom/android/server/am/ActivityStack;->mIsEngBuild:Z

    if-eqz v3, :cond_5a

    .line 323
    const-string v3, "ActivityManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Activity pause timeout for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    :goto_50
    iget-object v3, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v1, :cond_56

    iget-object v2, v1, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :cond_56
    invoke-virtual {v3, v2, v6}, Lcom/android/server/am/ActivityStack;->activityPaused(Landroid/os/IBinder;Z)V

    goto :goto_a

    .line 325
    :cond_5a
    const-string v3, "ActivityManager"

    const-string v4, "Activity pause timeout for r"

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_50

    .line 330
    .end local v1           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_62
    iget-object v3, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v3, v3, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    iget-boolean v3, v3, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    if-eqz v3, :cond_86

    .line 331
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    iput-boolean v5, v2, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    .line 332
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 333
    .local v0, nmsg:Landroid/os/Message;
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 334
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_a

    .line 339
    .end local v0           #nmsg:Landroid/os/Message;
    :cond_86
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/server/am/ActivityRecord;

    .line 340
    .restart local v1       #r:Lcom/android/server/am/ActivityRecord;
    sget-boolean v3, Lcom/android/server/am/ActivityStack;->mIsEngBuild:Z

    if-eqz v3, :cond_b1

    .line 341
    const-string v3, "ActivityManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Activity idle timeout for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    :goto_a6
    iget-object v4, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v1, :cond_b9

    iget-object v3, v1, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :goto_ac
    invoke-virtual {v4, v3, v6, v2}, Lcom/android/server/am/ActivityStack;->activityIdleInternal(Landroid/os/IBinder;ZLandroid/content/res/Configuration;)Lcom/android/server/am/ActivityRecord;

    goto/16 :goto_a

    .line 343
    :cond_b1
    const-string v3, "ActivityManager"

    const-string v4, "Activity idle timeout for r"

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a6

    :cond_b9
    move-object v3, v2

    .line 345
    goto :goto_ac

    .line 348
    .end local v1           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_bb
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/server/am/ActivityRecord;

    .line 351
    .restart local v1       #r:Lcom/android/server/am/ActivityRecord;
    sget-boolean v3, Lcom/android/server/am/ActivityStack;->mIsEngBuild:Z

    if-eqz v3, :cond_e6

    .line 352
    const-string v3, "ActivityManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Activity destroy timeout for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    :goto_db
    iget-object v3, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v1, :cond_e1

    iget-object v2, v1, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :cond_e1
    invoke-virtual {v3, v2}, Lcom/android/server/am/ActivityStack;->activityDestroyed(Landroid/os/IBinder;)V

    goto/16 :goto_a

    .line 354
    :cond_e6
    const-string v3, "ActivityManager"

    const-string v4, "Activity destroy timeout for r"

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_db

    .line 359
    .end local v1           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_ee
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/server/am/ActivityRecord;

    .line 360
    .restart local v1       #r:Lcom/android/server/am/ActivityRecord;
    iget-object v4, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v1, :cond_fd

    iget-object v3, v1, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :goto_f8
    invoke-virtual {v4, v3, v5, v2}, Lcom/android/server/am/ActivityStack;->activityIdleInternal(Landroid/os/IBinder;ZLandroid/content/res/Configuration;)Lcom/android/server/am/ActivityRecord;

    goto/16 :goto_a

    :cond_fd
    move-object v3, v2

    goto :goto_f8

    .line 363
    .end local v1           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_ff
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    iget-boolean v2, v2, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    if-eqz v2, :cond_120

    .line 364
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    iput-boolean v5, v2, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    .line 365
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 366
    .restart local v0       #nmsg:Landroid/os/Message;
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_a

    .line 369
    .end local v0           #nmsg:Landroid/os/Message;
    :cond_120
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v3, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v3

    .line 370
    :try_start_125
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mLaunchingActivity:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-eqz v2, :cond_13d

    .line 371
    const-string v2, "ActivityManager"

    const-string v4, "Launch timeout has expired, giving up wake lock!"

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v2, v2, Lcom/android/server/am/ActivityStack;->mLaunchingActivity:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 374
    :cond_13d
    monitor-exit v3

    goto/16 :goto_a

    :catchall_140
    move-exception v2

    monitor-exit v3
    :try_end_142
    .catchall {:try_start_125 .. :try_end_142} :catchall_140

    throw v2

    .line 377
    :pswitch_143
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v3, v2, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v3

    .line 378
    :try_start_148
    iget-object v2, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/android/server/am/ActivityStack;->resumeTopActivityLocked(Lcom/android/server/am/ActivityRecord;)Z

    .line 379
    monitor-exit v3

    goto/16 :goto_a

    :catchall_151
    move-exception v2

    monitor-exit v3
    :try_end_153
    .catchall {:try_start_148 .. :try_end_153} :catchall_151

    throw v2

    .line 308
    :pswitch_data_154
    .packed-switch 0x8
        :pswitch_b
        :pswitch_30
        :pswitch_62
        :pswitch_ee
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_ff
        :pswitch_bb
        :pswitch_a
        :pswitch_143
    .end packed-switch
.end method
