.class Lcom/android/server/NotificationManagerService$1;
.super Ljava/lang/Object;
.source "NotificationManagerService.java"

# interfaces
.implements Lcom/android/server/StatusBarManagerService$NotificationCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 244
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClearAll()V
    .registers 2

    .prologue
    .line 271
    iget-object v0, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-virtual {v0}, Lcom/android/server/NotificationManagerService;->cancelAll()V

    .line 272
    return-void
.end method

.method public onNotificationClear(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 11
    .parameter "pkg"
    .parameter "tag"
    .parameter "id"

    .prologue
    .line 280
    iget-object v0, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v4, 0x0

    const/16 v5, 0x42

    const/4 v6, 0x1

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    #calls: Lcom/android/server/NotificationManagerService;->cancelNotification(Ljava/lang/String;Ljava/lang/String;IIIZ)V
    invoke-static/range {v0 .. v6}, Lcom/android/server/NotificationManagerService;->access$500(Lcom/android/server/NotificationManagerService;Ljava/lang/String;Ljava/lang/String;IIIZ)V

    .line 283
    return-void
.end method

.method public onNotificationClick(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 11
    .parameter "pkg"
    .parameter "tag"
    .parameter "id"

    .prologue
    .line 275
    iget-object v0, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    const/16 v4, 0x10

    const/16 v5, 0x40

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    #calls: Lcom/android/server/NotificationManagerService;->cancelNotification(Ljava/lang/String;Ljava/lang/String;IIIZ)V
    invoke-static/range {v0 .. v6}, Lcom/android/server/NotificationManagerService;->access$500(Lcom/android/server/NotificationManagerService;Ljava/lang/String;Ljava/lang/String;IIIZ)V

    .line 277
    return-void
.end method

.method public onNotificationError(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V
    .registers 16
    .parameter "pkg"
    .parameter "tag"
    .parameter "id"
    .parameter "uid"
    .parameter "initialPid"
    .parameter "message"

    .prologue
    const/4 v4, 0x0

    .line 316
    const-string v0, "NotificationService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNotification error pkg="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " tag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; will crashApplication(uid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", pid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    iget-object v0, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v5, v4

    move v6, v4

    #calls: Lcom/android/server/NotificationManagerService;->cancelNotification(Ljava/lang/String;Ljava/lang/String;IIIZ)V
    invoke-static/range {v0 .. v6}, Lcom/android/server/NotificationManagerService;->access$500(Lcom/android/server/NotificationManagerService;Ljava/lang/String;Ljava/lang/String;IIIZ)V

    .line 319
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v7

    .line 321
    .local v7, ident:J
    :try_start_55
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad notification posted from package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p4, p5, p1, v1}, Landroid/app/IActivityManager;->crashApplication(IILjava/lang/String;Ljava/lang/String;)V
    :try_end_79
    .catch Landroid/os/RemoteException; {:try_start_55 .. :try_end_79} :catch_7d

    .line 326
    :goto_79
    invoke-static {v7, v8}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 327
    return-void

    .line 324
    :catch_7d
    move-exception v0

    goto :goto_79
.end method

.method public onPanelRevealed()V
    .registers 6

    .prologue
    .line 286
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$100(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v3

    monitor-enter v3

    .line 288
    :try_start_7
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v4, 0x0

    #setter for: Lcom/android/server/NotificationManagerService;->mSoundNotification:Lcom/android/server/NotificationManagerService$NotificationRecord;
    invoke-static {v2, v4}, Lcom/android/server/NotificationManagerService;->access$602(Lcom/android/server/NotificationManagerService;Lcom/android/server/NotificationManagerService$NotificationRecord;)Lcom/android/server/NotificationManagerService$NotificationRecord;

    .line 289
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_4e

    move-result-wide v0

    .line 291
    .local v0, identity:J
    :try_start_11
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mSound:Lcom/android/server/NotificationPlayer;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$300(Lcom/android/server/NotificationManagerService;)Lcom/android/server/NotificationPlayer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/NotificationPlayer;->stop()V
    :try_end_1a
    .catchall {:try_start_11 .. :try_end_1a} :catchall_49

    .line 294
    :try_start_1a
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 298
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v4, 0x0

    #setter for: Lcom/android/server/NotificationManagerService;->mVibrateNotification:Lcom/android/server/NotificationManagerService$NotificationRecord;
    invoke-static {v2, v4}, Lcom/android/server/NotificationManagerService;->access$702(Lcom/android/server/NotificationManagerService;Lcom/android/server/NotificationManagerService$NotificationRecord;)Lcom/android/server/NotificationManagerService$NotificationRecord;

    .line 299
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_26
    .catchall {:try_start_1a .. :try_end_26} :catchall_4e

    move-result-wide v0

    .line 301
    :try_start_27
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mVibrator:Landroid/os/Vibrator;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$400(Lcom/android/server/NotificationManagerService;)Landroid/os/Vibrator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Vibrator;->cancel()V
    :try_end_30
    .catchall {:try_start_27 .. :try_end_30} :catchall_51

    .line 304
    :try_start_30
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 308
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mLights:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$800(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 309
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v4, 0x0

    #setter for: Lcom/android/server/NotificationManagerService;->mLedNotification:Lcom/android/server/NotificationManagerService$NotificationRecord;
    invoke-static {v2, v4}, Lcom/android/server/NotificationManagerService;->access$902(Lcom/android/server/NotificationManagerService;Lcom/android/server/NotificationManagerService$NotificationRecord;)Lcom/android/server/NotificationManagerService$NotificationRecord;

    .line 310
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #calls: Lcom/android/server/NotificationManagerService;->updateLightsLocked()V
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$1000(Lcom/android/server/NotificationManagerService;)V

    .line 311
    monitor-exit v3

    .line 312
    return-void

    .line 294
    :catchall_49
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 311
    .end local v0           #identity:J
    :catchall_4e
    move-exception v2

    monitor-exit v3
    :try_end_50
    .catchall {:try_start_30 .. :try_end_50} :catchall_4e

    throw v2

    .line 304
    .restart local v0       #identity:J
    :catchall_51
    move-exception v2

    :try_start_52
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
    :try_end_56
    .catchall {:try_start_52 .. :try_end_56} :catchall_4e
.end method

.method public onSetDisabled(I)V
    .registers 7
    .parameter "status"

    .prologue
    .line 247
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$100(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v3

    monitor-enter v3

    .line 248
    :try_start_7
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #setter for: Lcom/android/server/NotificationManagerService;->mDisabledNotifications:I
    invoke-static {v2, p1}, Lcom/android/server/NotificationManagerService;->access$202(Lcom/android/server/NotificationManagerService;I)I

    .line 249
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mDisabledNotifications:I
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$200(Lcom/android/server/NotificationManagerService;)I

    move-result v2

    const/high16 v4, 0x4

    and-int/2addr v2, v4

    if-eqz v2, :cond_37

    .line 251
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_1a
    .catchall {:try_start_7 .. :try_end_1a} :catchall_3e

    move-result-wide v0

    .line 253
    .local v0, identity:J
    :try_start_1b
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mSound:Lcom/android/server/NotificationPlayer;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$300(Lcom/android/server/NotificationManagerService;)Lcom/android/server/NotificationPlayer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/NotificationPlayer;->stop()V
    :try_end_24
    .catchall {:try_start_1b .. :try_end_24} :catchall_39

    .line 256
    :try_start_24
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 259
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_2a
    .catchall {:try_start_24 .. :try_end_2a} :catchall_3e

    move-result-wide v0

    .line 261
    :try_start_2b
    iget-object v2, p0, Lcom/android/server/NotificationManagerService$1;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mVibrator:Landroid/os/Vibrator;
    invoke-static {v2}, Lcom/android/server/NotificationManagerService;->access$400(Lcom/android/server/NotificationManagerService;)Landroid/os/Vibrator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Vibrator;->cancel()V
    :try_end_34
    .catchall {:try_start_2b .. :try_end_34} :catchall_41

    .line 264
    :try_start_34
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 267
    .end local v0           #identity:J
    :cond_37
    monitor-exit v3

    .line 268
    return-void

    .line 256
    .restart local v0       #identity:J
    :catchall_39
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 267
    .end local v0           #identity:J
    :catchall_3e
    move-exception v2

    monitor-exit v3
    :try_end_40
    .catchall {:try_start_34 .. :try_end_40} :catchall_3e

    throw v2

    .line 264
    .restart local v0       #identity:J
    :catchall_41
    move-exception v2

    :try_start_42
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
    :try_end_46
    .catchall {:try_start_42 .. :try_end_46} :catchall_3e
.end method
