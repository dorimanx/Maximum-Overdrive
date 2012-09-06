.class Lcom/android/server/BackupManagerService$1;
.super Landroid/content/BroadcastReceiver;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/BackupManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 1276
    iput-object p1, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v11, 0x0

    .line 1280
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1281
    .local v0, action:Ljava/lang/String;
    const/4 v8, 0x0

    .line 1282
    .local v8, replacing:Z
    const/4 v1, 0x0

    .line 1283
    .local v1, added:Z
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 1284
    .local v3, extras:Landroid/os/Bundle;
    const/4 v6, 0x0

    .line 1285
    .local v6, pkgList:[Ljava/lang/String;
    const-string v10, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_24

    const-string v10, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_24

    const-string v10, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6a

    .line 1288
    :cond_24
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    .line 1289
    .local v9, uri:Landroid/net/Uri;
    if-nez v9, :cond_2b

    .line 1338
    .end local v1           #added:Z
    .end local v9           #uri:Landroid/net/Uri;
    :cond_2a
    :goto_2a
    return-void

    .line 1292
    .restart local v1       #added:Z
    .restart local v9       #uri:Landroid/net/Uri;
    :cond_2b
    invoke-virtual {v9}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v7

    .line 1293
    .local v7, pkgName:Ljava/lang/String;
    if-eqz v7, :cond_36

    .line 1294
    const/4 v10, 0x1

    new-array v6, v10, [Ljava/lang/String;

    .end local v6           #pkgList:[Ljava/lang/String;
    aput-object v7, v6, v11

    .line 1296
    .restart local v6       #pkgList:[Ljava/lang/String;
    :cond_36
    const-string v10, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5d

    .line 1299
    const/4 v8, 0x1

    move v1, v8

    .line 1312
    .end local v1           #added:Z
    .end local v7           #pkgName:Ljava/lang/String;
    .end local v9           #uri:Landroid/net/Uri;
    :cond_40
    :goto_40
    if-eqz v6, :cond_2a

    array-length v10, v6

    if-eqz v10, :cond_2a

    .line 1315
    if-eqz v1, :cond_95

    .line 1316
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v11, v10, Lcom/android/server/BackupManagerService;->mBackupParticipants:Landroid/util/SparseArray;

    monitor-enter v11

    .line 1317
    move-object v2, v6

    .local v2, arr$:[Ljava/lang/String;
    :try_start_4d
    array-length v5, v2

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_4f
    if-ge v4, v5, :cond_93

    aget-object v7, v2, v4

    .line 1318
    .restart local v7       #pkgName:Ljava/lang/String;
    if-eqz v8, :cond_8a

    .line 1320
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v10, v7}, Lcom/android/server/BackupManagerService;->updatePackageParticipantsLocked(Ljava/lang/String;)V
    :try_end_5a
    .catchall {:try_start_4d .. :try_end_5a} :catchall_90

    .line 1317
    :goto_5a
    add-int/lit8 v4, v4, 0x1

    goto :goto_4f

    .line 1301
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .restart local v1       #added:Z
    .restart local v9       #uri:Landroid/net/Uri;
    :cond_5d
    const-string v10, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1302
    const-string v10, "android.intent.extra.REPLACING"

    invoke-virtual {v3, v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    goto :goto_40

    .line 1304
    .end local v7           #pkgName:Ljava/lang/String;
    .end local v9           #uri:Landroid/net/Uri;
    :cond_6a
    const-string v10, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7a

    .line 1305
    const/4 v1, 0x1

    .line 1306
    const-string v10, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v10}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    goto :goto_40

    .line 1307
    :cond_7a
    const-string v10, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_40

    .line 1308
    const/4 v1, 0x0

    .line 1309
    const-string v10, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v10}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    goto :goto_40

    .line 1323
    .end local v1           #added:Z
    .restart local v2       #arr$:[Ljava/lang/String;
    .restart local v4       #i$:I
    .restart local v5       #len$:I
    .restart local v7       #pkgName:Ljava/lang/String;
    :cond_8a
    :try_start_8a
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v10, v7}, Lcom/android/server/BackupManagerService;->addPackageParticipantsLocked(Ljava/lang/String;)V

    goto :goto_5a

    .line 1326
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #pkgName:Ljava/lang/String;
    :catchall_90
    move-exception v10

    monitor-exit v11
    :try_end_92
    .catchall {:try_start_8a .. :try_end_92} :catchall_90

    throw v10

    .restart local v4       #i$:I
    .restart local v5       #len$:I
    :cond_93
    :try_start_93
    monitor-exit v11
    :try_end_94
    .catchall {:try_start_93 .. :try_end_94} :catchall_90

    goto :goto_2a

    .line 1328
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_95
    if-nez v8, :cond_2a

    .line 1331
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v11, v10, Lcom/android/server/BackupManagerService;->mBackupParticipants:Landroid/util/SparseArray;

    monitor-enter v11

    .line 1332
    move-object v2, v6

    .restart local v2       #arr$:[Ljava/lang/String;
    :try_start_9d
    array-length v5, v2

    .restart local v5       #len$:I
    const/4 v4, 0x0

    .restart local v4       #i$:I
    :goto_9f
    if-ge v4, v5, :cond_ab

    aget-object v7, v2, v4

    .line 1333
    .restart local v7       #pkgName:Ljava/lang/String;
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v10, v7}, Lcom/android/server/BackupManagerService;->removePackageParticipantsLocked(Ljava/lang/String;)V

    .line 1332
    add-int/lit8 v4, v4, 0x1

    goto :goto_9f

    .line 1335
    .end local v7           #pkgName:Ljava/lang/String;
    :cond_ab
    monitor-exit v11

    goto/16 :goto_2a

    .end local v4           #i$:I
    .end local v5           #len$:I
    :catchall_ae
    move-exception v10

    monitor-exit v11
    :try_end_b0
    .catchall {:try_start_9d .. :try_end_b0} :catchall_ae

    throw v10
.end method
