.class Lcom/android/server/MountService$MountServiceHandler;
.super Landroid/os/Handler;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/MountService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MountServiceHandler"
.end annotation


# instance fields
.field mForceUnmounts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/MountService$UnmountCallBack;",
            ">;"
        }
    .end annotation
.end field

.field mUpdatingStatus:Z

.field final synthetic this$0:Lcom/android/server/MountService;


# direct methods
.method constructor <init>(Lcom/android/server/MountService;Landroid/os/Looper;)V
    .registers 4
    .parameter
    .parameter "l"

    .prologue
    .line 367
    iput-object p1, p0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    .line 368
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 364
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    .line 365
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 369
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 18
    .parameter "msg"

    .prologue
    .line 373
    move-object/from16 v0, p1

    iget v11, v0, Landroid/os/Message;->what:I

    packed-switch v11, :pswitch_data_112

    .line 454
    :cond_7
    :goto_7
    return-void

    .line 376
    :pswitch_8
    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Lcom/android/server/MountService$UnmountCallBack;

    .line 377
    .local v10, ucb:Lcom/android/server/MountService$UnmountCallBack;
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    if-nez v11, :cond_24

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    iget-object v12, v10, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    #calls: Lcom/android/server/MountService;->isExternalStorage(Ljava/lang/String;)Z
    invoke-static {v11, v12}, Lcom/android/server/MountService;->access$300(Lcom/android/server/MountService;Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_24

    .line 381
    invoke-virtual {v10}, Lcom/android/server/MountService$UnmountCallBack;->handleFinished()V

    goto :goto_7

    .line 384
    :cond_24
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    if-nez v11, :cond_7

    .line 389
    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 390
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mPms:Lcom/android/server/pm/PackageManagerService;
    invoke-static {v11}, Lcom/android/server/MountService;->access$400(Lcom/android/server/MountService;)Lcom/android/server/pm/PackageManagerService;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {v11, v12, v13}, Lcom/android/server/pm/PackageManagerService;->updateExternalMediaStatus(ZZ)V

    goto :goto_7

    .line 397
    .end local v10           #ucb:Lcom/android/server/MountService$UnmountCallBack;
    :pswitch_44
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 398
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 399
    .local v6, size:I
    new-array v7, v6, [I

    .line 400
    .local v7, sizeArr:[I
    const/4 v8, 0x0

    .line 402
    .local v8, sizeArrN:I
    const-string v11, "activity"

    invoke-static {v11}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/ActivityManagerService;

    .line 404
    .local v1, ams:Lcom/android/server/am/ActivityManagerService;
    const/4 v3, 0x0

    .local v3, i:I
    move v9, v8

    .end local v8           #sizeArrN:I
    .local v9, sizeArrN:I
    :goto_5e
    if-ge v3, v6, :cond_f6

    .line 405
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/MountService$UnmountCallBack;

    .line 406
    .restart local v10       #ucb:Lcom/android/server/MountService$UnmountCallBack;
    iget-object v4, v10, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    .line 407
    .local v4, path:Ljava/lang/String;
    const/4 v2, 0x0

    .line 408
    .local v2, done:Z
    iget-boolean v11, v10, Lcom/android/server/MountService$UnmountCallBack;->force:Z

    if-nez v11, :cond_a9

    .line 409
    const/4 v2, 0x1

    .line 424
    :cond_72
    :goto_72
    if-nez v2, :cond_cd

    iget v11, v10, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    const/4 v12, 0x4

    if-ge v11, v12, :cond_cd

    .line 426
    const-string v11, "MountService"

    const-string v12, "Retrying to kill storage users again"

    invoke-static {v11, v12}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static {v11}, Lcom/android/server/MountService;->access$500(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static {v12}, Lcom/android/server/MountService;->access$500(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v12

    const/4 v13, 0x2

    iget v14, v10, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    add-int/lit8 v15, v14, 0x1

    iput v15, v10, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v12

    const-wide/16 v13, 0x1e

    invoke-virtual {v11, v12, v13, v14}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move v8, v9

    .line 404
    .end local v9           #sizeArrN:I
    .restart local v8       #sizeArrN:I
    :goto_a5
    add-int/lit8 v3, v3, 0x1

    move v9, v8

    .end local v8           #sizeArrN:I
    .restart local v9       #sizeArrN:I
    goto :goto_5e

    .line 411
    :cond_a9
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v11, v4}, Lcom/android/server/MountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v5

    .line 412
    .local v5, pids:[I
    if-eqz v5, :cond_b6

    array-length v11, v5

    if-nez v11, :cond_b8

    .line 413
    :cond_b6
    const/4 v2, 0x1

    goto :goto_72

    .line 416
    :cond_b8
    const-string v11, "unmount media"

    const/4 v12, 0x1

    invoke-virtual {v1, v5, v11, v12}, Lcom/android/server/am/ActivityManagerService;->killPids([ILjava/lang/String;Z)Z

    .line 418
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v11, v4}, Lcom/android/server/MountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v5

    .line 419
    if-eqz v5, :cond_cb

    array-length v11, v5

    if-nez v11, :cond_72

    .line 420
    :cond_cb
    const/4 v2, 0x1

    goto :goto_72

    .line 432
    .end local v5           #pids:[I
    :cond_cd
    iget v11, v10, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    const/4 v12, 0x4

    if-lt v11, v12, :cond_d9

    .line 433
    const-string v11, "MountService"

    const-string v12, "Failed to unmount media inspite of 4 retries. Forcibly killing processes now"

    invoke-static {v11, v12}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    :cond_d9
    add-int/lit8 v8, v9, 0x1

    .end local v9           #sizeArrN:I
    .restart local v8       #sizeArrN:I
    aput v3, v7, v9

    .line 437
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static {v11}, Lcom/android/server/MountService;->access$500(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static {v12}, Lcom/android/server/MountService;->access$500(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {v12, v13, v10}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_a5

    .line 442
    .end local v2           #done:Z
    .end local v4           #path:Ljava/lang/String;
    .end local v8           #sizeArrN:I
    .end local v10           #ucb:Lcom/android/server/MountService$UnmountCallBack;
    .restart local v9       #sizeArrN:I
    :cond_f6
    add-int/lit8 v3, v9, -0x1

    :goto_f8
    if-ltz v3, :cond_7

    .line 443
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    aget v12, v7, v3

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 442
    add-int/lit8 v3, v3, -0x1

    goto :goto_f8

    .line 449
    .end local v1           #ams:Lcom/android/server/am/ActivityManagerService;
    .end local v3           #i:I
    .end local v6           #size:I
    .end local v7           #sizeArr:[I
    .end local v9           #sizeArrN:I
    :pswitch_106
    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Lcom/android/server/MountService$UnmountCallBack;

    .line 450
    .restart local v10       #ucb:Lcom/android/server/MountService$UnmountCallBack;
    invoke-virtual {v10}, Lcom/android/server/MountService$UnmountCallBack;->handleFinished()V

    goto/16 :goto_7

    .line 373
    nop

    :pswitch_data_112
    .packed-switch 0x1
        :pswitch_8
        :pswitch_44
        :pswitch_106
    .end packed-switch
.end method
