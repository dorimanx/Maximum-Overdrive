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
    .parameter
    .parameter "path"
    .parameter "mask"
    .parameter "isrom"

    .prologue
    .line 4862
    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    .line 4863
    invoke-direct {p0, p2, p3}, Landroid/os/FileObserver;-><init>(Ljava/lang/String;I)V

    .line 4864
    iput-object p2, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    .line 4865
    iput-boolean p4, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mIsRom:Z

    .line 4866
    return-void
.end method


# virtual methods
.method public onEvent(ILjava/lang/String;)V
    .registers 22
    .parameter "event"
    .parameter "path"

    .prologue
    .line 4869
    const/16 v17, 0x0

    .line 4870
    .local v17, removedPackage:Ljava/lang/String;
    const/16 v18, -0x1

    .line 4871
    .local v18, removedUid:I
    const/4 v12, 0x0

    .line 4872
    .local v12, addedPackage:Ljava/lang/String;
    const/4 v13, -0x1

    .line 4873
    .local v13, addedUid:I
    const/4 v8, 0x0

    .line 4876
    .local v8, category:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v10, v1, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    monitor-enter v10

    .line 4877
    const/16 v16, 0x0

    .line 4878
    .local v16, fullPathStr:Ljava/lang/String;
    const/4 v2, 0x0

    .line 4879
    .local v2, fullPath:Ljava/io/File;
    if-eqz p2, :cond_23

    .line 4880
    :try_start_13
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v15, v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1e
    .catchall {:try_start_13 .. :try_end_1e} :catchall_33

    .line 4881
    .end local v2           #fullPath:Ljava/io/File;
    .local v15, fullPath:Ljava/io/File;
    :try_start_1e
    invoke-virtual {v15}, Ljava/io/File;->getPath()Ljava/lang/String;
    :try_end_21
    .catchall {:try_start_1e .. :try_end_21} :catchall_11b

    move-result-object v16

    move-object v2, v15

    .line 4887
    .end local v15           #fullPath:Ljava/io/File;
    .restart local v2       #fullPath:Ljava/io/File;
    :cond_23
    :try_start_23
    #calls: Lcom/android/server/pm/PackageManagerService;->isPackageFilename(Ljava/lang/String;)Z
    invoke-static/range {p2 .. p2}, Lcom/android/server/pm/PackageManagerService;->access$1100(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 4890
    monitor-exit v10

    .line 4962
    :cond_2a
    :goto_2a
    return-void

    .line 4895
    :cond_2b
    #calls: Lcom/android/server/pm/PackageManagerService;->ignoreCodePath(Ljava/lang/String;)Z
    invoke-static/range {v16 .. v16}, Lcom/android/server/pm/PackageManagerService;->access$1200(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 4896
    monitor-exit v10

    goto :goto_2a

    .line 4947
    :catchall_33
    move-exception v1

    :goto_34
    monitor-exit v10
    :try_end_35
    .catchall {:try_start_23 .. :try_end_35} :catchall_33

    throw v1

    .line 4898
    :cond_36
    const/4 v5, 0x0

    .line 4900
    .local v5, p:Landroid/content/pm/PackageParser$Package;
    :try_start_37
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v1, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_3e
    .catchall {:try_start_37 .. :try_end_3e} :catchall_33

    .line 4901
    :try_start_3e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, v1, Lcom/android/server/pm/PackageManagerService;->mAppDirs:Ljava/util/HashMap;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/content/pm/PackageParser$Package;

    move-object v5, v0

    .line 4902
    monitor-exit v3
    :try_end_4f
    .catchall {:try_start_3e .. :try_end_4f} :catchall_109

    .line 4903
    move/from16 v0, p1

    and-int/lit16 v1, v0, 0x248

    if-eqz v1, :cond_121

    .line 4904
    if-eqz v5, :cond_121

    .line 4905
    :try_start_57
    iget-boolean v1, v5, Landroid/content/pm/PackageParser$Package;->mIsThemeApk:Z

    if-eqz v1, :cond_5d

    .line 4906
    const-string v8, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    .line 4908
    :cond_5d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    const/4 v3, 0x1

    invoke-virtual {v1, v5, v3}, Lcom/android/server/pm/PackageManagerService;->removePackageLI(Landroid/content/pm/PackageParser$Package;Z)V

    .line 4909
    iget-object v1, v5, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v17, v0

    .line 4910
    iget-object v1, v5, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    move/from16 v18, v0
    :try_end_71
    .catchall {:try_start_57 .. :try_end_71} :catchall_33

    move-object v14, v8

    .line 4914
    .end local v8           #category:Ljava/lang/String;
    .local v14, category:Ljava/lang/String;
    :goto_72
    move/from16 v0, p1

    and-int/lit16 v1, v0, 0x88

    if-eqz v1, :cond_11f

    .line 4915
    if-nez v5, :cond_ba

    .line 4916
    :try_start_7a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mIsRom:Z

    if-eqz v3, :cond_10c

    const/16 v3, 0x41

    :goto_86
    or-int/lit8 v3, v3, 0x2

    or-int/lit8 v3, v3, 0x4

    const/16 v4, 0x61

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .end local v5           #p:Landroid/content/pm/PackageParser$Package;
    #calls: Lcom/android/server/pm/PackageManagerService;->scanPackageLI(Ljava/io/File;IIJ)Landroid/content/pm/PackageParser$Package;
    invoke-static/range {v1 .. v6}, Lcom/android/server/pm/PackageManagerService;->access$1300(Lcom/android/server/pm/PackageManagerService;Ljava/io/File;IIJ)Landroid/content/pm/PackageParser$Package;

    move-result-object v5

    .line 4923
    .restart local v5       #p:Landroid/content/pm/PackageParser$Package;
    if-eqz v5, :cond_ba

    .line 4930
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v11, v1, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v11
    :try_end_9d
    .catchall {:try_start_7a .. :try_end_9d} :catchall_114

    .line 4931
    :try_start_9d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v4, v5, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    iget-object v1, v5, Landroid/content/pm/PackageParser$Package;->permissions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_10f

    const/4 v6, 0x1

    :goto_ac
    const/4 v7, 0x0

    const/4 v8, 0x0

    #calls: Lcom/android/server/pm/PackageManagerService;->updatePermissionsLPw(Ljava/lang/String;Landroid/content/pm/PackageParser$Package;ZZZ)V
    invoke-static/range {v3 .. v8}, Lcom/android/server/pm/PackageManagerService;->access$1400(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Landroid/content/pm/PackageParser$Package;ZZZ)V

    .line 4933
    monitor-exit v11
    :try_end_b2
    .catchall {:try_start_9d .. :try_end_b2} :catchall_111

    .line 4934
    :try_start_b2
    iget-object v1, v5, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v12, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 4935
    iget-object v1, v5, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v13, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 4938
    :cond_ba
    if-eqz v5, :cond_11f

    iget-boolean v1, v5, Landroid/content/pm/PackageParser$Package;->mIsThemeApk:Z

    if-eqz v1, :cond_11f

    .line 4939
    const-string v8, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"
    :try_end_c2
    .catchall {:try_start_b2 .. :try_end_c2} :catchall_114

    .line 4944
    .end local v14           #category:Ljava/lang/String;
    .restart local v8       #category:Ljava/lang/String;
    :goto_c2
    :try_start_c2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v1, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3
    :try_end_c9
    .catchall {:try_start_c2 .. :try_end_c9} :catchall_33

    .line 4945
    :try_start_c9
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, v1, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v1}, Lcom/android/server/pm/Settings;->writeLPr()V

    .line 4946
    monitor-exit v3
    :try_end_d3
    .catchall {:try_start_c9 .. :try_end_d3} :catchall_118

    .line 4947
    :try_start_d3
    monitor-exit v10
    :try_end_d4
    .catchall {:try_start_d3 .. :try_end_d4} :catchall_33

    .line 4949
    if-eqz v17, :cond_f2

    .line 4950
    new-instance v9, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v9, v1}, Landroid/os/Bundle;-><init>(I)V

    .line 4951
    .local v9, extras:Landroid/os/Bundle;
    const-string v1, "android.intent.extra.UID"

    move/from16 v0, v18

    invoke-virtual {v9, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4952
    const-string v1, "android.intent.extra.DATA_REMOVED"

    const/4 v3, 0x0

    invoke-virtual {v9, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 4953
    const-string v6, "android.intent.action.PACKAGE_REMOVED"

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, v17

    invoke-static/range {v6 .. v11}, Lcom/android/server/pm/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/IIntentReceiver;)V

    .line 4956
    .end local v9           #extras:Landroid/os/Bundle;
    :cond_f2
    if-eqz v12, :cond_2a

    .line 4957
    new-instance v9, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v9, v1}, Landroid/os/Bundle;-><init>(I)V

    .line 4958
    .restart local v9       #extras:Landroid/os/Bundle;
    const-string v1, "android.intent.extra.UID"

    invoke-virtual {v9, v1, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4959
    const-string v6, "android.intent.action.PACKAGE_ADDED"

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v7, v12

    invoke-static/range {v6 .. v11}, Lcom/android/server/pm/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/IIntentReceiver;)V

    goto/16 :goto_2a

    .line 4902
    .end local v9           #extras:Landroid/os/Bundle;
    :catchall_109
    move-exception v1

    :try_start_10a
    monitor-exit v3
    :try_end_10b
    .catchall {:try_start_10a .. :try_end_10b} :catchall_109

    :try_start_10b
    throw v1
    :try_end_10c
    .catchall {:try_start_10b .. :try_end_10c} :catchall_33

    .line 4916
    .end local v8           #category:Ljava/lang/String;
    .restart local v14       #category:Ljava/lang/String;
    :cond_10c
    const/4 v3, 0x0

    goto/16 :goto_86

    .line 4931
    :cond_10f
    const/4 v6, 0x0

    goto :goto_ac

    .line 4933
    :catchall_111
    move-exception v1

    :try_start_112
    monitor-exit v11
    :try_end_113
    .catchall {:try_start_112 .. :try_end_113} :catchall_111

    :try_start_113
    throw v1
    :try_end_114
    .catchall {:try_start_113 .. :try_end_114} :catchall_114

    .line 4947
    .end local v5           #p:Landroid/content/pm/PackageParser$Package;
    :catchall_114
    move-exception v1

    move-object v8, v14

    .end local v14           #category:Ljava/lang/String;
    .restart local v8       #category:Ljava/lang/String;
    goto/16 :goto_34

    .line 4946
    .restart local v5       #p:Landroid/content/pm/PackageParser$Package;
    :catchall_118
    move-exception v1

    :try_start_119
    monitor-exit v3
    :try_end_11a
    .catchall {:try_start_119 .. :try_end_11a} :catchall_118

    :try_start_11a
    throw v1
    :try_end_11b
    .catchall {:try_start_11a .. :try_end_11b} :catchall_33

    .line 4947
    .end local v2           #fullPath:Ljava/io/File;
    .end local v5           #p:Landroid/content/pm/PackageParser$Package;
    .restart local v15       #fullPath:Ljava/io/File;
    :catchall_11b
    move-exception v1

    move-object v2, v15

    .end local v15           #fullPath:Ljava/io/File;
    .restart local v2       #fullPath:Ljava/io/File;
    goto/16 :goto_34

    .end local v8           #category:Ljava/lang/String;
    .restart local v5       #p:Landroid/content/pm/PackageParser$Package;
    .restart local v14       #category:Ljava/lang/String;
    :cond_11f
    move-object v8, v14

    .end local v14           #category:Ljava/lang/String;
    .restart local v8       #category:Ljava/lang/String;
    goto :goto_c2

    :cond_121
    move-object v14, v8

    .end local v8           #category:Ljava/lang/String;
    .restart local v14       #category:Ljava/lang/String;
    goto/16 :goto_72
.end method
