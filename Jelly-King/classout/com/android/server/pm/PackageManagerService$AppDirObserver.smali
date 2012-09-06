.class final Lcom/android/server/pm/PackageManagerService$AppDirObserver;
.super Landroid/os/FileObserver;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AppDirObserver"
.end annotation


# instance fields
.field private final mIsRom:Z

.field private final mRootDir:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/pm/PackageManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;IZ)V
    .registers 5

    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    invoke-direct {p0, p2, p3}, Landroid/os/FileObserver;-><init>(Ljava/lang/String;I)V

    iput-object p2, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mIsRom:Z

    return-void
.end method


# virtual methods
.method public onEvent(ILjava/lang/String;)V
    .registers 21

    const/16 v16, 0x0

    const/16 v17, -0x1

    const/4 v10, 0x0

    const/4 v11, -0x1

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v7, v1, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    monitor-enter v7

    const/4 v14, 0x0

    const/4 v2, 0x0

    if-eqz p2, :cond_22

    :try_start_12
    new-instance v13, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v13, v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1d
    .catchall {:try_start_12 .. :try_end_1d} :catchall_32

    :try_start_1d
    invoke-virtual {v13}, Ljava/io/File;->getPath()Ljava/lang/String;
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_118

    move-result-object v14

    move-object v2, v13

    :cond_22
    :try_start_22
    #calls: Lcom/android/server/pm/PackageManagerService;->isPackageFilename(Ljava/lang/String;)Z
    invoke-static/range {p2 .. p2}, Lcom/android/server/pm/PackageManagerService;->access$1200(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2a

    monitor-exit v7

    :cond_29
    :goto_29
    return-void

    :cond_2a
    #calls: Lcom/android/server/pm/PackageManagerService;->ignoreCodePath(Ljava/lang/String;)Z
    invoke-static {v14}, Lcom/android/server/pm/PackageManagerService;->access$1300(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    monitor-exit v7

    goto :goto_29

    :catchall_32
    move-exception v1

    :goto_33
    monitor-exit v7
    :try_end_34
    .catchall {:try_start_22 .. :try_end_34} :catchall_32

    throw v1

    :cond_35
    const/4 v15, 0x0

    :try_start_36
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v1, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_3d
    .catchall {:try_start_36 .. :try_end_3d} :catchall_32

    :try_start_3d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, v1, Lcom/android/server/pm/PackageManagerService;->mAppDirs:Ljava/util/HashMap;

    invoke-virtual {v1, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/content/pm/PackageParser$Package;

    move-object v15, v0

    monitor-exit v3
    :try_end_4c
    .catchall {:try_start_3d .. :try_end_4c} :catchall_106

    move/from16 v0, p1

    and-int/lit16 v1, v0, 0x248

    if-eqz v1, :cond_11e

    if-eqz v15, :cond_11e

    :try_start_54
    iget-boolean v1, v15, Landroid/content/pm/PackageParser$Package;->mIsThemeApk:Z

    if-eqz v1, :cond_5a

    const-string v5, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    :cond_5a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    const/4 v3, 0x1

    invoke-virtual {v1, v15, v3}, Lcom/android/server/pm/PackageManagerService;->removePackageLI(Landroid/content/pm/PackageParser$Package;Z)V

    iget-object v1, v15, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v16, v0

    iget-object v1, v15, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v17, v0
    :try_end_6e
    .catchall {:try_start_54 .. :try_end_6e} :catchall_32

    move-object v12, v5

    :goto_6f
    move/from16 v0, p1

    and-int/lit16 v1, v0, 0x88

    if-eqz v1, :cond_11c

    if-nez v15, :cond_b5

    :try_start_77
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mIsRom:Z

    if-eqz v3, :cond_109

    const/16 v3, 0x41

    :goto_83
    or-int/lit8 v3, v3, 0x2

    or-int/lit8 v3, v3, 0x4

    const/16 v4, 0x61

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    #calls: Lcom/android/server/pm/PackageManagerService;->scanPackageLI(Ljava/io/File;IIJ)Landroid/content/pm/PackageParser$Package;
    invoke-static/range {v1 .. v6}, Lcom/android/server/pm/PackageManagerService;->access$1400(Lcom/android/server/pm/PackageManagerService;Ljava/io/File;IIJ)Landroid/content/pm/PackageParser$Package;

    move-result-object v15

    if-eqz v15, :cond_b5

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v1, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_9a
    .catchall {:try_start_77 .. :try_end_9a} :catchall_111

    :try_start_9a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v8, v15, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    iget-object v1, v15, Landroid/content/pm/PackageParser$Package;->permissions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_10c

    const/4 v1, 0x1

    :goto_a9
    #calls: Lcom/android/server/pm/PackageManagerService;->updatePermissionsLPw(Ljava/lang/String;Landroid/content/pm/PackageParser$Package;I)V
    invoke-static {v4, v8, v15, v1}, Lcom/android/server/pm/PackageManagerService;->access$1500(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Landroid/content/pm/PackageParser$Package;I)V

    monitor-exit v3
    :try_end_ad
    .catchall {:try_start_9a .. :try_end_ad} :catchall_10e

    :try_start_ad
    iget-object v1, v15, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v10, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v1, v15, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v11, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    :cond_b5
    if-eqz v15, :cond_11c

    iget-boolean v1, v15, Landroid/content/pm/PackageParser$Package;->mIsThemeApk:Z

    if-eqz v1, :cond_11c

    const-string v5, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"
    :try_end_bd
    .catchall {:try_start_ad .. :try_end_bd} :catchall_111

    :goto_bd
    :try_start_bd
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v1, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_c4
    .catchall {:try_start_bd .. :try_end_c4} :catchall_32

    :try_start_c4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, v1, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v1}, Lcom/android/server/pm/Settings;->writeLPr()V

    monitor-exit v3
    :try_end_ce
    .catchall {:try_start_c4 .. :try_end_ce} :catchall_115

    :try_start_ce
    monitor-exit v7
    :try_end_cf
    .catchall {:try_start_ce .. :try_end_cf} :catchall_32

    if-eqz v16, :cond_ee

    new-instance v6, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Landroid/os/Bundle;-><init>(I)V

    const-string v1, "android.intent.extra.UID"

    move/from16 v0, v17

    invoke-virtual {v6, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "android.intent.extra.DATA_REMOVED"

    const/4 v3, 0x0

    invoke-virtual {v6, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, -0x1

    move-object/from16 v4, v16

    invoke-static/range {v3 .. v9}, Lcom/android/server/pm/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/IIntentReceiver;I)V

    :cond_ee
    if-eqz v10, :cond_29

    new-instance v6, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Landroid/os/Bundle;-><init>(I)V

    const-string v1, "android.intent.extra.UID"

    invoke-virtual {v6, v1, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v3, "android.intent.action.PACKAGE_ADDED"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, -0x1

    move-object v4, v10

    invoke-static/range {v3 .. v9}, Lcom/android/server/pm/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/IIntentReceiver;I)V

    goto/16 :goto_29

    :catchall_106
    move-exception v1

    :try_start_107
    monitor-exit v3
    :try_end_108
    .catchall {:try_start_107 .. :try_end_108} :catchall_106

    :try_start_108
    throw v1
    :try_end_109
    .catchall {:try_start_108 .. :try_end_109} :catchall_32

    :cond_109
    const/4 v3, 0x0

    goto/16 :goto_83

    :cond_10c
    const/4 v1, 0x0

    goto :goto_a9

    :catchall_10e
    move-exception v1

    :try_start_10f
    monitor-exit v3
    :try_end_110
    .catchall {:try_start_10f .. :try_end_110} :catchall_10e

    :try_start_110
    throw v1
    :try_end_111
    .catchall {:try_start_110 .. :try_end_111} :catchall_111

    :catchall_111
    move-exception v1

    move-object v5, v12

    goto/16 :goto_33

    :catchall_115
    move-exception v1

    :try_start_116
    monitor-exit v3
    :try_end_117
    .catchall {:try_start_116 .. :try_end_117} :catchall_115

    :try_start_117
    throw v1
    :try_end_118
    .catchall {:try_start_117 .. :try_end_118} :catchall_32

    :catchall_118
    move-exception v1

    move-object v2, v13

    goto/16 :goto_33

    :cond_11c
    move-object v5, v12

    goto :goto_bd

    :cond_11e
    move-object v12, v5

    goto/16 :goto_6f
.end method
