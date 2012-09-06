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
    .line 289
    iput-object p1, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 14
    .parameter "msg"

    .prologue
    .line 295
    iget v8, p1, Landroid/os/Message;->what:I

    packed-switch v8, :pswitch_data_1ae

    .line 389
    :cond_5
    :goto_5
    :pswitch_5
    return-void

    .line 297
    :pswitch_6
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v9, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v9

    .line 298
    :try_start_b
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v8}, Lcom/android/server/am/ActivityManagerService;->isSleeping()Z

    move-result v8

    if-eqz v8, :cond_26

    .line 299
    const-string v8, "ActivityManager"

    const-string v10, "Sleep timeout!  Sleeping now."

    invoke-static {v8, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    const/4 v10, 0x1

    iput-boolean v10, v8, Lcom/android/server/am/ActivityStack;->mSleepTimeout:Z

    .line 301
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    invoke-virtual {v8}, Lcom/android/server/am/ActivityStack;->checkReadyForSleepLocked()V

    .line 303
    :cond_26
    monitor-exit v9

    goto :goto_5

    :catchall_28
    move-exception v8

    monitor-exit v9
    :try_end_2a
    .catchall {:try_start_b .. :try_end_2a} :catchall_28

    throw v8

    .line 306
    :pswitch_2b
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Lcom/android/server/am/ActivityRecord;

    .line 309
    .local v7, r:Lcom/android/server/am/ActivityRecord;
    const-string v8, "ActivityManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Activity pause timeout for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    const/4 v6, -0x1

    .line 311
    .local v6, pid:I
    const-wide/16 v4, 0x0

    .line 312
    .local v4, pauseTime:J
    const/4 v2, 0x0

    .line 313
    .local v2, m:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v9, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v9

    .line 314
    :try_start_50
    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->app:Lcom/android/server/am/ProcessRecord;

    if-eqz v8, :cond_58

    .line 315
    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->app:Lcom/android/server/am/ProcessRecord;

    iget v6, v8, Lcom/android/server/am/ProcessRecord;->pid:I

    .line 317
    :cond_58
    iget-wide v4, v7, Lcom/android/server/am/ActivityRecord;->pauseTime:J

    .line 318
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "pausing "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 319
    monitor-exit v9
    :try_end_6e
    .catchall {:try_start_50 .. :try_end_6e} :catchall_82

    .line 320
    if-lez v6, :cond_77

    .line 321
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v8, v6, v4, v5, v2}, Lcom/android/server/am/ActivityManagerService;->logAppTooSlow(IJLjava/lang/String;)V

    .line 324
    :cond_77
    iget-object v9, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v7, :cond_85

    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :goto_7d
    const/4 v10, 0x1

    invoke-virtual {v9, v8, v10}, Lcom/android/server/am/ActivityStack;->activityPaused(Landroid/os/IBinder;Z)V

    goto :goto_5

    .line 319
    :catchall_82
    move-exception v8

    :try_start_83
    monitor-exit v9
    :try_end_84
    .catchall {:try_start_83 .. :try_end_84} :catchall_82

    throw v8

    .line 324
    :cond_85
    const/4 v8, 0x0

    goto :goto_7d

    .line 327
    .end local v2           #m:Ljava/lang/String;
    .end local v4           #pauseTime:J
    .end local v6           #pid:I
    .end local v7           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_87
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    iget-boolean v8, v8, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    if-eqz v8, :cond_af

    .line 328
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    .line 329
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    const/16 v9, 0xa

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .line 330
    .local v3, nmsg:Landroid/os/Message;
    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object v8, v3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 331
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    const-wide/16 v9, 0x2710

    invoke-virtual {v8, v3, v9, v10}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_5

    .line 336
    .end local v3           #nmsg:Landroid/os/Message;
    :cond_af
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Lcom/android/server/am/ActivityRecord;

    .line 337
    .restart local v7       #r:Lcom/android/server/am/ActivityRecord;
    const-string v8, "ActivityManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Activity idle timeout for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    iget-object v9, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v7, :cond_d8

    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :goto_d1
    const/4 v10, 0x1

    const/4 v11, 0x0

    invoke-virtual {v9, v8, v10, v11}, Lcom/android/server/am/ActivityStack;->activityIdleInternal(Landroid/os/IBinder;ZLandroid/content/res/Configuration;)Lcom/android/server/am/ActivityRecord;

    goto/16 :goto_5

    :cond_d8
    const/4 v8, 0x0

    goto :goto_d1

    .line 341
    .end local v7           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_da
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Lcom/android/server/am/ActivityRecord;

    .line 342
    .restart local v7       #r:Lcom/android/server/am/ActivityRecord;
    const/4 v6, -0x1

    .line 343
    .restart local v6       #pid:I
    const-wide/16 v0, 0x0

    .line 344
    .local v0, launchTickTime:J
    const/4 v2, 0x0

    .line 345
    .restart local v2       #m:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v9, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v9

    .line 346
    :try_start_e7
    invoke-virtual {v7}, Lcom/android/server/am/ActivityRecord;->continueLaunchTickingLocked()Z

    move-result v8

    if-eqz v8, :cond_10a

    .line 347
    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->app:Lcom/android/server/am/ProcessRecord;

    if-eqz v8, :cond_f5

    .line 348
    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->app:Lcom/android/server/am/ProcessRecord;

    iget v6, v8, Lcom/android/server/am/ProcessRecord;->pid:I

    .line 350
    :cond_f5
    iget-wide v0, v7, Lcom/android/server/am/ActivityRecord;->launchTickTime:J

    .line 351
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "launching "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 353
    :cond_10a
    monitor-exit v9
    :try_end_10b
    .catchall {:try_start_e7 .. :try_end_10b} :catchall_116

    .line 354
    if-lez v6, :cond_5

    .line 355
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v8, v6, v0, v1, v2}, Lcom/android/server/am/ActivityManagerService;->logAppTooSlow(IJLjava/lang/String;)V

    goto/16 :goto_5

    .line 353
    :catchall_116
    move-exception v8

    :try_start_117
    monitor-exit v9
    :try_end_118
    .catchall {:try_start_117 .. :try_end_118} :catchall_116

    throw v8

    .line 359
    .end local v0           #launchTickTime:J
    .end local v2           #m:Ljava/lang/String;
    .end local v6           #pid:I
    .end local v7           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_119
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Lcom/android/server/am/ActivityRecord;

    .line 362
    .restart local v7       #r:Lcom/android/server/am/ActivityRecord;
    const-string v8, "ActivityManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Activity destroy timeout for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    iget-object v9, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v7, :cond_140

    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :goto_13b
    invoke-virtual {v9, v8}, Lcom/android/server/am/ActivityStack;->activityDestroyed(Landroid/os/IBinder;)V

    goto/16 :goto_5

    :cond_140
    const/4 v8, 0x0

    goto :goto_13b

    .line 366
    .end local v7           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_142
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Lcom/android/server/am/ActivityRecord;

    .line 367
    .restart local v7       #r:Lcom/android/server/am/ActivityRecord;
    iget-object v9, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    if-eqz v7, :cond_153

    iget-object v8, v7, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    :goto_14c
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v9, v8, v10, v11}, Lcom/android/server/am/ActivityStack;->activityIdleInternal(Landroid/os/IBinder;ZLandroid/content/res/Configuration;)Lcom/android/server/am/ActivityRecord;

    goto/16 :goto_5

    :cond_153
    const/4 v8, 0x0

    goto :goto_14c

    .line 370
    .end local v7           #r:Lcom/android/server/am/ActivityRecord;
    :pswitch_155
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    iget-boolean v8, v8, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    if-eqz v8, :cond_179

    .line 371
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/android/server/am/ActivityManagerService;->mDidDexOpt:Z

    .line 372
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    const/16 v9, 0x10

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .line 373
    .restart local v3       #nmsg:Landroid/os/Message;
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mHandler:Landroid/os/Handler;

    const-wide/16 v9, 0x2710

    invoke-virtual {v8, v3, v9, v10}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_5

    .line 376
    .end local v3           #nmsg:Landroid/os/Message;
    :cond_179
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v9, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v9

    .line 377
    :try_start_17e
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mLaunchingActivity:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v8}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v8

    if-eqz v8, :cond_196

    .line 378
    const-string v8, "ActivityManager"

    const-string v10, "Launch timeout has expired, giving up wake lock!"

    invoke-static {v8, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v8, v8, Lcom/android/server/am/ActivityStack;->mLaunchingActivity:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v8}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 381
    :cond_196
    monitor-exit v9

    goto/16 :goto_5

    :catchall_199
    move-exception v8

    monitor-exit v9
    :try_end_19b
    .catchall {:try_start_17e .. :try_end_19b} :catchall_199

    throw v8

    .line 384
    :pswitch_19c
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    iget-object v9, v8, Lcom/android/server/am/ActivityStack;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v9

    .line 385
    :try_start_1a1
    iget-object v8, p0, Lcom/android/server/am/ActivityStack$1;->this$0:Lcom/android/server/am/ActivityStack;

    const/4 v10, 0x0

    invoke-virtual {v8, v10}, Lcom/android/server/am/ActivityStack;->resumeTopActivityLocked(Lcom/android/server/am/ActivityRecord;)Z

    .line 386
    monitor-exit v9

    goto/16 :goto_5

    :catchall_1aa
    move-exception v8

    monitor-exit v9
    :try_end_1ac
    .catchall {:try_start_1a1 .. :try_end_1ac} :catchall_1aa

    throw v8

    .line 295
    nop

    :pswitch_data_1ae
    .packed-switch 0x8
        :pswitch_6
        :pswitch_2b
        :pswitch_87
        :pswitch_142
        :pswitch_da
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_155
        :pswitch_119
        :pswitch_5
        :pswitch_19c
    .end packed-switch
.end method
