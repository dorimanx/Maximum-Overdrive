.class public Lcom/android/server/AssetRedirectionManagerService;
.super Lcom/android/internal/app/IAssetRedirectionManager$Stub;
.source "AssetRedirectionManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/AssetRedirectionManagerService$ResourceRedirectionsProcessor;,
        Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AssetRedirectionManager"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mRedirections:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;",
            "Landroid/content/res/PackageRedirectionMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Lcom/android/internal/app/IAssetRedirectionManager$Stub;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    iput-object p1, p0, Lcom/android/server/AssetRedirectionManagerService;->mContext:Landroid/content/Context;

    return-void
.end method

.method private static findThemeResourceId([Landroid/content/pm/ThemeInfo;Ljava/lang/String;)I
    .registers 6

    if-eqz p0, :cond_1c

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1c

    array-length v2, p0

    const/4 v0, 0x0

    :goto_a
    if-ge v0, v2, :cond_1c

    aget-object v1, p0, v0

    iget-object v3, v1, Landroid/content/pm/ThemeInfo;->themeId:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    iget v3, v1, Landroid/content/pm/ThemeInfo;->styleResourceId:I

    :goto_18
    return v3

    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_1c
    const/4 v3, 0x0

    goto :goto_18
.end method

.method private generateExplicitRedirections(Landroid/content/res/PackageRedirectionMap;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    const/16 v1, 0x2e

    const/16 v3, 0x5f

    invoke-virtual {p4, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    const-string v1, "xml"

    invoke-virtual {p2, v6, v1, p3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_11

    :goto_10
    return-void

    :cond_11
    new-instance v0, Lcom/android/server/AssetRedirectionManagerService$ResourceRedirectionsProcessor;

    move-object v1, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AssetRedirectionManagerService$ResourceRedirectionsProcessor;-><init>(Landroid/content/res/Resources;ILjava/lang/String;Ljava/lang/String;Landroid/content/res/PackageRedirectionMap;)V

    invoke-virtual {v0}, Lcom/android/server/AssetRedirectionManagerService$ResourceRedirectionsProcessor;->process()V

    goto :goto_10
.end method

.method private generatePackageRedirectionMap(Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;)Landroid/content/res/PackageRedirectionMap;
    .registers 12

    const/4 v6, 0x0

    new-instance v0, Landroid/content/res/AssetManager;

    invoke-direct {v0}, Landroid/content/res/AssetManager;-><init>()V

    iget-object v7, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    const-string v8, "android"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v7, p0, Lcom/android/server/AssetRedirectionManagerService;->mContext:Landroid/content/Context;

    iget-object v8, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/android/server/AssetRedirectionManagerService;->getPackageInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v2

    if-eqz v2, :cond_28

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v7, :cond_28

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    invoke-virtual {v0, v7}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_44

    :cond_28
    const-string v7, "AssetRedirectionManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to attach target package assets for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v6

    :goto_43
    return-object v4

    :cond_44
    iget-object v7, p0, Lcom/android/server/AssetRedirectionManagerService;->mContext:Landroid/content/Context;

    iget-object v8, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/android/server/AssetRedirectionManagerService;->getPackageInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v2

    if-eqz v2, :cond_60

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v7, :cond_60

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->themeInfos:[Landroid/content/pm/ThemeInfo;

    if-eqz v7, :cond_60

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    invoke-virtual {v0, v7}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_7c

    :cond_60
    const-string v7, "AssetRedirectionManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to attach theme package assets from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v6

    goto :goto_43

    :cond_7c
    new-instance v4, Landroid/content/res/PackageRedirectionMap;

    invoke-direct {v4}, Landroid/content/res/PackageRedirectionMap;-><init>()V

    if-eqz v1, :cond_95

    iget-object v7, v2, Landroid/content/pm/PackageInfo;->themeInfos:[Landroid/content/pm/ThemeInfo;

    iget-object v8, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/android/server/AssetRedirectionManagerService;->findThemeResourceId([Landroid/content/pm/ThemeInfo;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4}, Landroid/content/res/PackageRedirectionMap;->getNativePointer()I

    move-result v7

    const v8, 0x1030005

    invoke-virtual {v0, v7, v8, v5}, Landroid/content/res/AssetManager;->generateStyleRedirections(III)Z

    :cond_95
    new-instance v3, Landroid/content/res/Resources;

    invoke-direct {v3, v0, v6, v6}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    iget-object v6, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    iget-object v7, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    invoke-direct {p0, v4, v3, v6, v7}, Lcom/android/server/AssetRedirectionManagerService;->generateExplicitRedirections(Landroid/content/res/PackageRedirectionMap;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_43
.end method

.method private static getPackageInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    :goto_9
    return-object v1

    :catch_a
    move-exception v0

    const/4 v1, 0x0

    goto :goto_9
.end method

.method private static getUnredirectedResourcesForPackage(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;
    .registers 8

    const/4 v2, 0x0

    new-instance v0, Landroid/content/res/AssetManager;

    invoke-direct {v0}, Landroid/content/res/AssetManager;-><init>()V

    const-string v3, "android"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3b

    invoke-static {p0, p1}, Lcom/android/server/AssetRedirectionManagerService;->getPackageInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v1

    if-eqz v1, :cond_22

    iget-object v3, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v3, :cond_22

    iget-object v3, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_3b

    :cond_22
    const-string v3, "AssetRedirectionManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to get resources for package "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3a
    return-object v2

    :cond_3b
    new-instance v3, Landroid/content/res/Resources;

    invoke-direct {v3, v0, v2, v2}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    move-object v2, v3

    goto :goto_3a
.end method


# virtual methods
.method public clearPackageRedirectionMap(Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v4, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    monitor-enter v4

    :try_start_3
    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;

    iget-object v3, v1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_d

    :catchall_25
    move-exception v3

    monitor-exit v4
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v3

    :cond_28
    :try_start_28
    monitor-exit v4
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_25

    return-void
.end method

.method public clearRedirectionMapsByTheme(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v4, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    monitor-enter v4

    :try_start_3
    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;

    iget-object v3, v1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    if-eqz p2, :cond_2b

    iget-object v3, v1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    :cond_2b
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_d

    :catchall_2f
    move-exception v3

    monitor-exit v4
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_2f

    throw v3

    :cond_32
    :try_start_32
    monitor-exit v4
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_2f

    return-void
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    move-object/from16 v20, v0

    monitor-enter v20

    :try_start_7
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1a
    :goto_1a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_47

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/res/PackageRedirectionMap;

    if-eqz v13, :cond_1a

    invoke-virtual {v13}, Landroid/content/res/PackageRedirectionMap;->getPackageId()I

    move-result v19

    const/16 v21, -0x1

    move/from16 v0, v19

    move/from16 v1, v21

    if-eq v0, v1, :cond_1a

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :catchall_44
    move-exception v19

    monitor-exit v20
    :try_end_46
    .catchall {:try_start_7 .. :try_end_46} :catchall_44

    throw v19

    :cond_47
    :try_start_47
    new-instance v19, Lcom/android/server/AssetRedirectionManagerService$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/server/AssetRedirectionManagerService$1;-><init>(Lcom/android/server/AssetRedirectionManagerService;)V

    move-object/from16 v0, v19

    invoke-static {v4, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const-string v19, "Theme asset redirections:"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v12, 0x0

    const/4 v11, 0x0

    const/16 v16, 0x0

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_66
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_1a7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;

    if-eqz v12, :cond_80

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c4

    :cond_80
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "* Theme package "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ":"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v12, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AssetRedirectionManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v19, v0

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/android/server/AssetRedirectionManagerService;->getUnredirectedResourcesForPackage(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v16

    :cond_c4
    if-eqz v11, :cond_d2

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_104

    :cond_d2
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "  theme id #"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ":"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v11, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    :cond_104
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "    "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ":"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AssetRedirectionManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v19, v0

    iget-object v0, v10, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/android/server/AssetRedirectionManagerService;->getUnredirectedResourcesForPackage(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/content/res/PackageRedirectionMap;

    invoke-virtual {v14}, Landroid/content/res/PackageRedirectionMap;->getRedirectionKeys()[I

    move-result-object v6

    array-length v2, v6

    const/4 v8, 0x0

    :goto_15a
    if-ge v8, v2, :cond_66

    aget v5, v6, v8

    invoke-virtual {v14, v5}, Landroid/content/res/PackageRedirectionMap;->lookupRedirection(I)I

    move-result v17

    if-eqz v15, :cond_1a2

    invoke-virtual {v15, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v7

    :goto_168
    if-eqz v16, :cond_1a4

    invoke-virtual/range {v16 .. v17}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v18

    :goto_16e
    const-string v19, "      %s (0x%08x) => %s (0x%08x)"

    const/16 v21, 0x4

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v7, v21, v22

    const/16 v22, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    aput-object v18, v21, v22

    const/16 v22, 0x3

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_15a

    :cond_1a2
    const/4 v7, 0x0

    goto :goto_168

    :cond_1a4
    const/16 v18, 0x0

    goto :goto_16e

    :cond_1a7
    monitor-exit v20
    :try_end_1a8
    .catchall {:try_start_47 .. :try_end_1a8} :catchall_44

    return-void
.end method

.method public getPackageRedirectionMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/res/PackageRedirectionMap;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v4, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    monitor-enter v4

    :try_start_3
    new-instance v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;-><init>(Lcom/android/server/AssetRedirectionManagerService$1;)V

    iput-object p1, v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    iput-object p2, v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    iput-object p3, v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/res/PackageRedirectionMap;

    if-eqz v1, :cond_1c

    monitor-exit v4

    move-object v2, v1

    :goto_1b
    return-object v2

    :cond_1c
    invoke-direct {p0, v0}, Lcom/android/server/AssetRedirectionManagerService;->generatePackageRedirectionMap(Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;)Landroid/content/res/PackageRedirectionMap;

    move-result-object v1

    if-eqz v1, :cond_27

    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService;->mRedirections:Ljava/util/HashMap;

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27
    monitor-exit v4

    move-object v2, v1

    goto :goto_1b

    :catchall_2a
    move-exception v3

    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_2a

    throw v3
.end method
