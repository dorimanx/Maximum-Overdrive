.class Lcom/android/server/WallpaperManagerService;
.super Landroid/app/IWallpaperManager$Stub;
.source "WallpaperManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/WallpaperManagerService$MyPackageMonitor;,
        Lcom/android/server/WallpaperManagerService$WallpaperConnection;,
        Lcom/android/server/WallpaperManagerService$WallpaperData;,
        Lcom/android/server/WallpaperManagerService$WallpaperObserver;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final MIN_WALLPAPER_CRASH_TIME:J = 0x2710L

.field static final TAG:Ljava/lang/String; = "WallpaperService"

.field static final WALLPAPER:Ljava/lang/String; = "wallpaper"

.field static final WALLPAPER_BASE_DIR:Ljava/io/File; = null

.field static final WALLPAPER_INFO:Ljava/lang/String; = "wallpaper_info.xml"


# instance fields
.field final mContext:Landroid/content/Context;

.field mCurrentUserId:I

.field final mIWindowManager:Landroid/view/IWindowManager;

.field mLastWallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;

.field final mLock:Ljava/lang/Object;

.field final mMonitor:Lcom/android/server/WallpaperManagerService$MyPackageMonitor;

.field mWallpaperMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/server/WallpaperManagerService$WallpaperData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 93
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/users"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/WallpaperManagerService;->WALLPAPER_BASE_DIR:Ljava/io/File;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 386
    invoke-direct {p0}, Landroid/app/IWallpaperManager$Stub;-><init>()V

    .line 85
    new-array v0, v3, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    .line 151
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    .line 388
    iput-object p1, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    .line 389
    const-string v0, "window"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/WallpaperManagerService;->mIWindowManager:Landroid/view/IWindowManager;

    .line 391
    new-instance v0, Lcom/android/server/WallpaperManagerService$MyPackageMonitor;

    invoke-direct {v0, p0}, Lcom/android/server/WallpaperManagerService$MyPackageMonitor;-><init>(Lcom/android/server/WallpaperManagerService;)V

    iput-object v0, p0, Lcom/android/server/WallpaperManagerService;->mMonitor:Lcom/android/server/WallpaperManagerService$MyPackageMonitor;

    .line 392
    iget-object v0, p0, Lcom/android/server/WallpaperManagerService;->mMonitor:Lcom/android/server/WallpaperManagerService$MyPackageMonitor;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Lcom/android/server/WallpaperManagerService$MyPackageMonitor;->register(Landroid/content/Context;Landroid/os/Looper;Z)V

    .line 393
    sget-object v0, Lcom/android/server/WallpaperManagerService;->WALLPAPER_BASE_DIR:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 394
    invoke-direct {p0, v3}, Lcom/android/server/WallpaperManagerService;->loadSettingsLocked(I)V

    .line 395
    return-void
.end method

.method static synthetic access$000(I)Ljava/io/File;
    .registers 2
    .parameter "x0"

    .prologue
    .line 81
    invoke-static {p0}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/WallpaperManagerService;Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/server/WallpaperManagerService;->notifyCallbacksLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/WallpaperManagerService;Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/server/WallpaperManagerService;->saveSettingsLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    return-void
.end method

.method private checkPermission(Ljava/lang/String;)V
    .registers 5
    .parameter "permission"

    .prologue
    .line 875
    iget-object v0, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_2f

    .line 876
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Access denied to process: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", must have permission "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 879
    :cond_2f
    return-void
.end method

.method private static getWallpaperDir(I)Ljava/io/File;
    .registers 4
    .parameter "userId"

    .prologue
    .line 398
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/server/WallpaperManagerService;->WALLPAPER_BASE_DIR:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private loadSettingsLocked(I)V
    .registers 20
    .parameter "userId"

    .prologue
    .line 937
    invoke-static/range {p1 .. p1}, Lcom/android/server/WallpaperManagerService;->makeJournaledFile(I)Lcom/android/internal/util/JournaledFile;

    move-result-object v6

    .line 938
    .local v6, journal:Lcom/android/internal/util/JournaledFile;
    const/4 v8, 0x0

    .line 939
    .local v8, stream:Ljava/io/FileInputStream;
    invoke-virtual {v6}, Lcom/android/internal/util/JournaledFile;->chooseForRead()Ljava/io/File;

    move-result-object v5

    .line 940
    .local v5, file:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_12

    .line 942
    invoke-direct/range {p0 .. p0}, Lcom/android/server/WallpaperManagerService;->migrateFromOld()V

    .line 944
    :cond_12
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 945
    .local v13, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-nez v13, :cond_30

    .line 946
    new-instance v13, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .end local v13           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    move/from16 v0, p1

    invoke-direct {v13, v0}, Lcom/android/server/WallpaperManagerService$WallpaperData;-><init>(I)V

    .line 947
    .restart local v13       #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    move/from16 v0, p1

    invoke-virtual {v15, v0, v13}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 949
    :cond_30
    const/4 v10, 0x0

    .line 951
    .local v10, success:Z
    :try_start_31
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_36
    .catch Ljava/lang/NullPointerException; {:try_start_31 .. :try_end_36} :catch_dc
    .catch Ljava/lang/NumberFormatException; {:try_start_31 .. :try_end_36} :catch_104
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_31 .. :try_end_36} :catch_12d
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_36} :catch_156
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_31 .. :try_end_36} :catch_17f

    .line 952
    .end local v8           #stream:Ljava/io/FileInputStream;
    .local v9, stream:Ljava/io/FileInputStream;
    :try_start_36
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v7

    .line 953
    .local v7, parser:Lorg/xmlpull/v1/XmlPullParser;
    const/4 v15, 0x0

    invoke-interface {v7, v9, v15}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 957
    :cond_3e
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v12

    .line 958
    .local v12, type:I
    const/4 v15, 0x2

    if-ne v12, v15, :cond_a3

    .line 959
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 960
    .local v11, tag:Ljava/lang/String;
    const-string v15, "wp"

    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a3

    .line 961
    const/4 v15, 0x0

    const-string v16, "width"

    move-object/from16 v0, v16

    invoke-interface {v7, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    iput v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    .line 962
    const/4 v15, 0x0

    const-string v16, "height"

    move-object/from16 v0, v16

    invoke-interface {v7, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    iput v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    .line 964
    const/4 v15, 0x0

    const-string v16, "name"

    move-object/from16 v0, v16

    invoke-interface {v7, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    iput-object v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    .line 965
    const/4 v15, 0x0

    const-string v16, "component"

    move-object/from16 v0, v16

    invoke-interface {v7, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 966
    .local v2, comp:Ljava/lang/String;
    if-eqz v2, :cond_da

    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v15

    :goto_89
    iput-object v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    .line 969
    iget-object v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    if-eqz v15, :cond_9f

    const-string v15, "android"

    iget-object v0, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a3

    .line 972
    :cond_9f
    iget-object v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    iput-object v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;
    :try_end_a3
    .catch Ljava/lang/NullPointerException; {:try_start_36 .. :try_end_a3} :catch_1b9
    .catch Ljava/lang/NumberFormatException; {:try_start_36 .. :try_end_a3} :catch_1b5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_36 .. :try_end_a3} :catch_1b1
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_a3} :catch_1ae
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_36 .. :try_end_a3} :catch_1ab

    .line 984
    .end local v2           #comp:Ljava/lang/String;
    .end local v11           #tag:Ljava/lang/String;
    :cond_a3
    const/4 v15, 0x1

    if-ne v12, v15, :cond_3e

    .line 985
    const/4 v10, 0x1

    move-object v8, v9

    .line 998
    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v9           #stream:Ljava/io/FileInputStream;
    .end local v12           #type:I
    .restart local v8       #stream:Ljava/io/FileInputStream;
    :goto_a8
    if-eqz v8, :cond_ad

    .line 999
    :try_start_aa
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V
    :try_end_ad
    .catch Ljava/io/IOException; {:try_start_aa .. :try_end_ad} :catch_1a8

    .line 1005
    :cond_ad
    :goto_ad
    if-nez v10, :cond_b9

    .line 1006
    const/4 v15, -0x1

    iput v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    .line 1007
    const/4 v15, -0x1

    iput v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    .line 1008
    const-string v15, ""

    iput-object v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    .line 1012
    :cond_b9
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    const-string v16, "window"

    invoke-virtual/range {v15 .. v16}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/WindowManager;

    .line 1013
    .local v14, wm:Landroid/view/WindowManager;
    invoke-interface {v14}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 1014
    .local v3, d:Landroid/view/Display;
    invoke-virtual {v3}, Landroid/view/Display;->getMaximumSizeDimension()I

    move-result v1

    .line 1015
    .local v1, baseSize:I
    iget v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    if-ge v15, v1, :cond_d3

    .line 1016
    iput v1, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    .line 1018
    :cond_d3
    iget v15, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    if-ge v15, v1, :cond_d9

    .line 1019
    iput v1, v13, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    .line 1021
    :cond_d9
    return-void

    .line 966
    .end local v1           #baseSize:I
    .end local v3           #d:Landroid/view/Display;
    .end local v8           #stream:Ljava/io/FileInputStream;
    .end local v14           #wm:Landroid/view/WindowManager;
    .restart local v2       #comp:Ljava/lang/String;
    .restart local v7       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v9       #stream:Ljava/io/FileInputStream;
    .restart local v11       #tag:Ljava/lang/String;
    .restart local v12       #type:I
    :cond_da
    const/4 v15, 0x0

    goto :goto_89

    .line 986
    .end local v2           #comp:Ljava/lang/String;
    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v9           #stream:Ljava/io/FileInputStream;
    .end local v11           #tag:Ljava/lang/String;
    .end local v12           #type:I
    .restart local v8       #stream:Ljava/io/FileInputStream;
    :catch_dc
    move-exception v4

    .line 987
    .local v4, e:Ljava/lang/NullPointerException;
    :goto_dd
    const-string v15, "WallpaperService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "failed parsing "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a8

    .line 988
    .end local v4           #e:Ljava/lang/NullPointerException;
    :catch_104
    move-exception v4

    .line 989
    .local v4, e:Ljava/lang/NumberFormatException;
    :goto_105
    const-string v15, "WallpaperService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "failed parsing "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a8

    .line 990
    .end local v4           #e:Ljava/lang/NumberFormatException;
    :catch_12d
    move-exception v4

    .line 991
    .local v4, e:Lorg/xmlpull/v1/XmlPullParserException;
    :goto_12e
    const-string v15, "WallpaperService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "failed parsing "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a8

    .line 992
    .end local v4           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :catch_156
    move-exception v4

    .line 993
    .local v4, e:Ljava/io/IOException;
    :goto_157
    const-string v15, "WallpaperService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "failed parsing "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a8

    .line 994
    .end local v4           #e:Ljava/io/IOException;
    :catch_17f
    move-exception v4

    .line 995
    .local v4, e:Ljava/lang/IndexOutOfBoundsException;
    :goto_180
    const-string v15, "WallpaperService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "failed parsing "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a8

    .line 1001
    .end local v4           #e:Ljava/lang/IndexOutOfBoundsException;
    :catch_1a8
    move-exception v15

    goto/16 :goto_ad

    .line 994
    .end local v8           #stream:Ljava/io/FileInputStream;
    .restart local v9       #stream:Ljava/io/FileInputStream;
    :catch_1ab
    move-exception v4

    move-object v8, v9

    .end local v9           #stream:Ljava/io/FileInputStream;
    .restart local v8       #stream:Ljava/io/FileInputStream;
    goto :goto_180

    .line 992
    .end local v8           #stream:Ljava/io/FileInputStream;
    .restart local v9       #stream:Ljava/io/FileInputStream;
    :catch_1ae
    move-exception v4

    move-object v8, v9

    .end local v9           #stream:Ljava/io/FileInputStream;
    .restart local v8       #stream:Ljava/io/FileInputStream;
    goto :goto_157

    .line 990
    .end local v8           #stream:Ljava/io/FileInputStream;
    .restart local v9       #stream:Ljava/io/FileInputStream;
    :catch_1b1
    move-exception v4

    move-object v8, v9

    .end local v9           #stream:Ljava/io/FileInputStream;
    .restart local v8       #stream:Ljava/io/FileInputStream;
    goto/16 :goto_12e

    .line 988
    .end local v8           #stream:Ljava/io/FileInputStream;
    .restart local v9       #stream:Ljava/io/FileInputStream;
    :catch_1b5
    move-exception v4

    move-object v8, v9

    .end local v9           #stream:Ljava/io/FileInputStream;
    .restart local v8       #stream:Ljava/io/FileInputStream;
    goto/16 :goto_105

    .line 986
    .end local v8           #stream:Ljava/io/FileInputStream;
    .restart local v9       #stream:Ljava/io/FileInputStream;
    :catch_1b9
    move-exception v4

    move-object v8, v9

    .end local v9           #stream:Ljava/io/FileInputStream;
    .restart local v8       #stream:Ljava/io/FileInputStream;
    goto/16 :goto_dd
.end method

.method private static makeJournaledFile(I)Lcom/android/internal/util/JournaledFile;
    .registers 7
    .parameter "userId"

    .prologue
    .line 882
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "wallpaper_info.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 883
    .local v0, base:Ljava/lang/String;
    new-instance v1, Lcom/android/internal/util/JournaledFile;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".tmp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lcom/android/internal/util/JournaledFile;-><init>(Ljava/io/File;Ljava/io/File;)V

    return-object v1
.end method

.method private migrateFromOld()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 922
    new-instance v3, Ljava/io/File;

    const-string v4, "/data/data/com.android.settings/files/wallpaper"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 923
    .local v3, oldWallpaper:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v4, "/data/system/wallpaper_info.xml"

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 924
    .local v2, oldInfo:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_23

    .line 925
    new-instance v1, Ljava/io/File;

    invoke-static {v6}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v4

    const-string v5, "wallpaper"

    invoke-direct {v1, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 926
    .local v1, newWallpaper:Ljava/io/File;
    invoke-virtual {v3, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 928
    .end local v1           #newWallpaper:Ljava/io/File;
    :cond_23
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_37

    .line 929
    new-instance v0, Ljava/io/File;

    invoke-static {v6}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v4

    const-string v5, "wallpaper_info.xml"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 930
    .local v0, newInfo:Ljava/io/File;
    invoke-virtual {v2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 932
    .end local v0           #newInfo:Ljava/io/File;
    :cond_37
    return-void
.end method

.method private notifyCallbacksLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 6
    .parameter "wallpaper"

    .prologue
    .line 859
    #getter for: Lcom/android/server/WallpaperManagerService$WallpaperData;->callbacks:Landroid/os/RemoteCallbackList;
    invoke-static {p1}, Lcom/android/server/WallpaperManagerService$WallpaperData;->access$300(Lcom/android/server/WallpaperManagerService$WallpaperData;)Landroid/os/RemoteCallbackList;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v2

    .line 860
    .local v2, n:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_9
    if-ge v0, v2, :cond_1b

    .line 862
    :try_start_b
    #getter for: Lcom/android/server/WallpaperManagerService$WallpaperData;->callbacks:Landroid/os/RemoteCallbackList;
    invoke-static {p1}, Lcom/android/server/WallpaperManagerService$WallpaperData;->access$300(Lcom/android/server/WallpaperManagerService$WallpaperData;)Landroid/os/RemoteCallbackList;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v3

    check-cast v3, Landroid/app/IWallpaperManagerCallback;

    invoke-interface {v3}, Landroid/app/IWallpaperManagerCallback;->onWallpaperChanged()V
    :try_end_18
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_18} :catch_2f

    .line 860
    :goto_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 869
    :cond_1b
    #getter for: Lcom/android/server/WallpaperManagerService$WallpaperData;->callbacks:Landroid/os/RemoteCallbackList;
    invoke-static {p1}, Lcom/android/server/WallpaperManagerService$WallpaperData;->access$300(Lcom/android/server/WallpaperManagerService$WallpaperData;)Landroid/os/RemoteCallbackList;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    .line 870
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.WALLPAPER_CHANGED"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 871
    .local v1, intent:Landroid/content/Intent;
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 872
    return-void

    .line 863
    .end local v1           #intent:Landroid/content/Intent;
    :catch_2f
    move-exception v3

    goto :goto_18
.end method

.method private saveSettingsLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 10
    .parameter "wallpaper"

    .prologue
    .line 887
    iget v5, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    invoke-static {v5}, Lcom/android/server/WallpaperManagerService;->makeJournaledFile(I)Lcom/android/internal/util/JournaledFile;

    move-result-object v1

    .line 888
    .local v1, journal:Lcom/android/internal/util/JournaledFile;
    const/4 v3, 0x0

    .line 890
    .local v3, stream:Ljava/io/FileOutputStream;
    :try_start_7
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Lcom/android/internal/util/JournaledFile;->chooseForWrite()Ljava/io/File;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_11} :catch_75

    .line 891
    .end local v3           #stream:Ljava/io/FileOutputStream;
    .local v4, stream:Ljava/io/FileOutputStream;
    :try_start_11
    new-instance v2, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v2}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 892
    .local v2, out:Lorg/xmlpull/v1/XmlSerializer;
    const-string v5, "utf-8"

    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 893
    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 895
    const/4 v5, 0x0

    const-string v6, "wp"

    invoke-interface {v2, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 896
    const/4 v5, 0x0

    const-string v6, "width"

    iget v7, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 897
    const/4 v5, 0x0

    const-string v6, "height"

    iget v7, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 898
    const/4 v5, 0x0

    const-string v6, "name"

    iget-object v7, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    invoke-interface {v2, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 899
    iget-object v5, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    if-eqz v5, :cond_64

    iget-object v5, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    iget-object v6, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    invoke-virtual {v5, v6}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_64

    .line 901
    const/4 v5, 0x0

    const-string v6, "component"

    iget-object v7, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    invoke-virtual {v7}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 904
    :cond_64
    const/4 v5, 0x0

    const-string v6, "wp"

    invoke-interface {v2, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 906
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 907
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 908
    invoke-virtual {v1}, Lcom/android/internal/util/JournaledFile;->commit()V
    :try_end_73
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_73} :catch_81

    move-object v3, v4

    .line 919
    .end local v2           #out:Lorg/xmlpull/v1/XmlSerializer;
    .end local v4           #stream:Ljava/io/FileOutputStream;
    .restart local v3       #stream:Ljava/io/FileOutputStream;
    :goto_74
    return-void

    .line 909
    :catch_75
    move-exception v0

    .line 911
    .local v0, e:Ljava/io/IOException;
    :goto_76
    if-eqz v3, :cond_7b

    .line 912
    :try_start_78
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_7b} :catch_7f

    .line 917
    :cond_7b
    :goto_7b
    invoke-virtual {v1}, Lcom/android/internal/util/JournaledFile;->rollback()V

    goto :goto_74

    .line 914
    :catch_7f
    move-exception v5

    goto :goto_7b

    .line 909
    .end local v0           #e:Ljava/io/IOException;
    .end local v3           #stream:Ljava/io/FileOutputStream;
    .restart local v4       #stream:Ljava/io/FileOutputStream;
    :catch_81
    move-exception v0

    move-object v3, v4

    .end local v4           #stream:Ljava/io/FileOutputStream;
    .restart local v3       #stream:Ljava/io/FileOutputStream;
    goto :goto_76
.end method


# virtual methods
.method attachServiceLocked(Lcom/android/server/WallpaperManagerService$WallpaperConnection;Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 12
    .parameter "conn"
    .parameter "wallpaper"

    .prologue
    const/4 v8, 0x0

    .line 847
    :try_start_1
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    iget-object v2, p1, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mToken:Landroid/os/Binder;

    const/16 v3, 0x7dd

    const/4 v4, 0x0

    iget v5, p2, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    iget v6, p2, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    move-object v1, p1

    invoke-interface/range {v0 .. v6}, Landroid/service/wallpaper/IWallpaperService;->attach(Landroid/service/wallpaper/IWallpaperConnection;Landroid/os/IBinder;IZII)V
    :try_end_10
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_10} :catch_11

    .line 856
    :cond_10
    :goto_10
    return-void

    .line 850
    :catch_11
    move-exception v7

    .line 851
    .local v7, e:Landroid/os/RemoteException;
    const-string v0, "WallpaperService"

    const-string v1, "Failed attaching wallpaper; clearing"

    invoke-static {v0, v1, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 852
    iget-boolean v0, p2, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperUpdating:Z

    if-nez v0, :cond_10

    .line 853
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v8, v8, p2}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z

    goto :goto_10
.end method

.method bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z
    .registers 24
    .parameter "componentName"
    .parameter "force"
    .parameter "fromUser"
    .parameter "wallpaper"

    .prologue
    .line 681
    if-nez p2, :cond_20

    .line 682
    move-object/from16 v0, p4

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    if-eqz v13, :cond_20

    .line 683
    move-object/from16 v0, p4

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    if-nez v13, :cond_12

    .line 684
    if-nez p1, :cond_20

    .line 687
    const/4 v13, 0x1

    .line 816
    :goto_11
    return v13

    .line 689
    :cond_12
    move-object/from16 v0, p4

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_20

    .line 692
    const/4 v13, 0x1

    goto :goto_11

    .line 698
    :cond_20
    if-nez p1, :cond_3b

    .line 699
    :try_start_22
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    const v14, 0x1040023

    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 701
    .local v2, defaultComponent:Ljava/lang/String;
    if-eqz v2, :cond_33

    .line 703
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object p1

    .line 706
    :cond_33
    if-nez p1, :cond_3b

    .line 708
    move-object/from16 v0, p4

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    move-object/from16 p1, v0

    .line 714
    .end local v2           #defaultComponent:Ljava/lang/String;
    :cond_3b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    const/16 v14, 0x1080

    move-object/from16 v0, p1

    invoke-virtual {v13, v0, v14}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v11

    .line 716
    .local v11, si:Landroid/content/pm/ServiceInfo;
    const-string v13, "android.permission.BIND_WALLPAPER"

    iget-object v14, v11, Landroid/content/pm/ServiceInfo;->permission:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_98

    .line 717
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Selected service does not require android.permission.BIND_WALLPAPER: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 720
    .local v6, msg:Ljava/lang/String;
    if-eqz p3, :cond_90

    .line 721
    new-instance v13, Ljava/lang/SecurityException;

    invoke-direct {v13, v6}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_72
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_22 .. :try_end_72} :catch_72

    .line 808
    .end local v6           #msg:Ljava/lang/String;
    .end local v11           #si:Landroid/content/pm/ServiceInfo;
    :catch_72
    move-exception v3

    .line 809
    .local v3, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Unknown component "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 810
    .restart local v6       #msg:Ljava/lang/String;
    if-eqz p3, :cond_202

    .line 811
    new-instance v13, Ljava/lang/IllegalArgumentException;

    invoke-direct {v13, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 723
    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v11       #si:Landroid/content/pm/ServiceInfo;
    :cond_90
    :try_start_90
    const-string v13, "WallpaperService"

    invoke-static {v13, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 727
    .end local v6           #msg:Ljava/lang/String;
    :cond_98
    const/4 v12, 0x0

    .line 729
    .local v12, wi:Landroid/app/WallpaperInfo;
    new-instance v5, Landroid/content/Intent;

    const-string v13, "android.service.wallpaper.WallpaperService"

    invoke-direct {v5, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 730
    .local v5, intent:Landroid/content/Intent;
    if-eqz p1, :cond_13a

    move-object/from16 v0, p4

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_13a

    .line 732
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    const/16 v14, 0x80

    invoke-virtual {v13, v5, v14}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v8

    .line 734
    .local v8, ris:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v4, 0x0

    .local v4, i:I
    :goto_bd
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v13

    if-ge v4, v13, :cond_ee

    .line 735
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/pm/ResolveInfo;

    iget-object v9, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 736
    .local v9, rsi:Landroid/content/pm/ServiceInfo;
    iget-object v13, v9, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    iget-object v14, v11, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_12f

    iget-object v13, v9, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    iget-object v14, v11, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_dc
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_90 .. :try_end_dc} :catch_72

    move-result v13

    if-eqz v13, :cond_12f

    .line 739
    :try_start_df
    new-instance v12, Landroid/app/WallpaperInfo;

    .end local v12           #wi:Landroid/app/WallpaperInfo;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/pm/ResolveInfo;

    invoke-direct {v12, v14, v13}, Landroid/app/WallpaperInfo;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;)V
    :try_end_ee
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_df .. :try_end_ee} :catch_10d
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_ee} :catch_11e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_df .. :try_end_ee} :catch_72

    .line 756
    .end local v9           #rsi:Landroid/content/pm/ServiceInfo;
    .restart local v12       #wi:Landroid/app/WallpaperInfo;
    :cond_ee
    if-nez v12, :cond_13a

    .line 757
    :try_start_f0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Selected service is not a wallpaper: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 759
    .restart local v6       #msg:Ljava/lang/String;
    if-eqz p3, :cond_132

    .line 760
    new-instance v13, Ljava/lang/SecurityException;

    invoke-direct {v13, v6}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 740
    .end local v6           #msg:Ljava/lang/String;
    .end local v12           #wi:Landroid/app/WallpaperInfo;
    .restart local v9       #rsi:Landroid/content/pm/ServiceInfo;
    :catch_10d
    move-exception v3

    .line 741
    .local v3, e:Lorg/xmlpull/v1/XmlPullParserException;
    if-eqz p3, :cond_116

    .line 742
    new-instance v13, Ljava/lang/IllegalArgumentException;

    invoke-direct {v13, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v13

    .line 744
    :cond_116
    const-string v13, "WallpaperService"

    invoke-static {v13, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 745
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 746
    .end local v3           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :catch_11e
    move-exception v3

    .line 747
    .local v3, e:Ljava/io/IOException;
    if-eqz p3, :cond_127

    .line 748
    new-instance v13, Ljava/lang/IllegalArgumentException;

    invoke-direct {v13, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v13

    .line 750
    :cond_127
    const-string v13, "WallpaperService"

    invoke-static {v13, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 751
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 734
    .end local v3           #e:Ljava/io/IOException;
    .restart local v12       #wi:Landroid/app/WallpaperInfo;
    :cond_12f
    add-int/lit8 v4, v4, 0x1

    goto :goto_bd

    .line 762
    .end local v9           #rsi:Landroid/content/pm/ServiceInfo;
    .restart local v6       #msg:Ljava/lang/String;
    :cond_132
    const-string v13, "WallpaperService"

    invoke-static {v13, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 769
    .end local v4           #i:I
    .end local v6           #msg:Ljava/lang/String;
    .end local v8           #ris:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :cond_13a
    new-instance v7, Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v7, v0, v12, v1}, Lcom/android/server/WallpaperManagerService$WallpaperConnection;-><init>(Lcom/android/server/WallpaperManagerService;Landroid/app/WallpaperInfo;Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 770
    .local v7, newConn:Lcom/android/server/WallpaperManagerService$WallpaperConnection;
    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 771
    move-object/from16 v0, p4

    iget v10, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    .line 773
    .local v10, serviceUserId:I
    move-object/from16 v0, p4

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_159

    .line 774
    const/4 v10, 0x0

    .line 776
    :cond_159
    const-string v13, "android.intent.extra.client_label"

    const v14, 0x104049d

    invoke-virtual {v5, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 778
    const-string v13, "android.intent.extra.client_intent"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    const/4 v15, 0x0

    new-instance v16, Landroid/content/Intent;

    const-string v17, "android.intent.action.SET_WALLPAPER"

    invoke-direct/range {v16 .. v17}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    const v18, 0x104049e

    invoke-virtual/range {v17 .. v18}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v16

    const/16 v17, 0x0

    invoke-static/range {v14 .. v17}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 783
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    const/4 v14, 0x1

    invoke-virtual {v13, v5, v7, v14, v10}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z

    move-result v13

    if-nez v13, :cond_1b9

    .line 784
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Unable to bind service: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 786
    .restart local v6       #msg:Ljava/lang/String;
    if-eqz p3, :cond_1b1

    .line 787
    new-instance v13, Ljava/lang/IllegalArgumentException;

    invoke-direct {v13, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 789
    :cond_1b1
    const-string v13, "WallpaperService"

    invoke-static {v13, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 790
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 792
    .end local v6           #msg:Ljava/lang/String;
    :cond_1b9
    move-object/from16 v0, p4

    iget v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/WallpaperManagerService;->mCurrentUserId:I

    if-ne v13, v14, :cond_1d2

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mLastWallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;

    if-eqz v13, :cond_1d2

    .line 793
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mLastWallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/server/WallpaperManagerService;->detachWallpaperLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 795
    :cond_1d2
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    iput-object v0, v1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    .line 796
    move-object/from16 v0, p4

    iput-object v7, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    .line 797
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v13

    move-object/from16 v0, p4

    iput-wide v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->lastDiedTime:J
    :try_end_1e4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_f0 .. :try_end_1e4} :catch_72

    .line 799
    :try_start_1e4
    move-object/from16 v0, p4

    iget v13, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/WallpaperManagerService;->mCurrentUserId:I

    if-ne v13, v14, :cond_1ff

    .line 802
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/WallpaperManagerService;->mIWindowManager:Landroid/view/IWindowManager;

    iget-object v14, v7, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mToken:Landroid/os/Binder;

    const/16 v15, 0x7dd

    invoke-interface {v13, v14, v15}, Landroid/view/IWindowManager;->addWindowToken(Landroid/os/IBinder;I)V

    .line 804
    move-object/from16 v0, p4

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/WallpaperManagerService;->mLastWallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :try_end_1ff
    .catch Landroid/os/RemoteException; {:try_start_1e4 .. :try_end_1ff} :catch_20a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1e4 .. :try_end_1ff} :catch_72

    .line 816
    :cond_1ff
    :goto_1ff
    const/4 v13, 0x1

    goto/16 :goto_11

    .line 813
    .end local v5           #intent:Landroid/content/Intent;
    .end local v7           #newConn:Lcom/android/server/WallpaperManagerService$WallpaperConnection;
    .end local v10           #serviceUserId:I
    .end local v11           #si:Landroid/content/pm/ServiceInfo;
    .end local v12           #wi:Landroid/app/WallpaperInfo;
    .local v3, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v6       #msg:Ljava/lang/String;
    :cond_202
    const-string v13, "WallpaperService"

    invoke-static {v13, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 814
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 806
    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v6           #msg:Ljava/lang/String;
    .restart local v5       #intent:Landroid/content/Intent;
    .restart local v7       #newConn:Lcom/android/server/WallpaperManagerService$WallpaperConnection;
    .restart local v10       #serviceUserId:I
    .restart local v11       #si:Landroid/content/pm/ServiceInfo;
    .restart local v12       #wi:Landroid/app/WallpaperInfo;
    :catch_20a
    move-exception v13

    goto :goto_1ff
.end method

.method public clearWallpaper()V
    .registers 4

    .prologue
    .line 485
    iget-object v1, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 486
    const/4 v0, 0x0

    :try_start_4
    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lcom/android/server/WallpaperManagerService;->clearWallpaperLocked(ZI)V

    .line 487
    monitor-exit v1

    .line 488
    return-void

    .line 487
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_d

    throw v0
.end method

.method clearWallpaperComponentLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 3
    .parameter "wallpaper"

    .prologue
    .line 841
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    .line 842
    invoke-virtual {p0, p1}, Lcom/android/server/WallpaperManagerService;->detachWallpaperLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 843
    return-void
.end method

.method clearWallpaperLocked(ZI)V
    .registers 12
    .parameter "defaultFailed"
    .parameter "userId"

    .prologue
    .line 491
    iget-object v6, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v6, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 492
    .local v5, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    new-instance v2, Ljava/io/File;

    invoke-static {p2}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v6

    const-string v7, "wallpaper"

    invoke-direct {v2, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 493
    .local v2, f:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 494
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 496
    :cond_1c
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v3

    .line 497
    .local v3, ident:J
    const/4 v0, 0x0

    .line 499
    .local v0, e:Ljava/lang/RuntimeException;
    const/4 v6, 0x0

    :try_start_22
    iput-boolean v6, v5, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperPending:Z

    .line 500
    iget v6, p0, Lcom/android/server/WallpaperManagerService;->mCurrentUserId:I
    :try_end_26
    .catchall {:try_start_22 .. :try_end_26} :catchall_4b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22 .. :try_end_26} :catch_48

    if-eq p2, v6, :cond_2c

    .line 509
    :cond_28
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 518
    :goto_2b
    return-void

    .line 501
    :cond_2c
    if-eqz p1, :cond_46

    :try_start_2e
    iget-object v6, v5, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    :goto_30
    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-virtual {p0, v6, v7, v8, v5}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z
    :try_end_35
    .catchall {:try_start_2e .. :try_end_35} :catchall_4b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2e .. :try_end_35} :catch_48

    move-result v6

    if-nez v6, :cond_28

    .line 509
    :goto_38
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 516
    const-string v6, "WallpaperService"

    const-string v7, "Default wallpaper component not found!"

    invoke-static {v6, v7, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 517
    invoke-virtual {p0, v5}, Lcom/android/server/WallpaperManagerService;->clearWallpaperComponentLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    goto :goto_2b

    .line 501
    :cond_46
    const/4 v6, 0x0

    goto :goto_30

    .line 506
    :catch_48
    move-exception v1

    .line 507
    .local v1, e1:Ljava/lang/IllegalArgumentException;
    move-object v0, v1

    goto :goto_38

    .line 509
    .end local v1           #e1:Ljava/lang/IllegalArgumentException;
    :catchall_4b
    move-exception v6

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v6
.end method

.method detachWallpaperLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 5
    .parameter "wallpaper"

    .prologue
    const/4 v2, 0x0

    .line 820
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    if-eqz v0, :cond_2c

    .line 821
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    if-eqz v0, :cond_12

    .line 823
    :try_start_b
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    invoke-interface {v0}, Landroid/service/wallpaper/IWallpaperEngine;->destroy()V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_12} :catch_2f

    .line 827
    :cond_12
    :goto_12
    iget-object v0, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    iget-object v1, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 831
    :try_start_19
    iget-object v0, p0, Lcom/android/server/WallpaperManagerService;->mIWindowManager:Landroid/view/IWindowManager;

    iget-object v1, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iget-object v1, v1, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mToken:Landroid/os/Binder;

    invoke-interface {v0, v1}, Landroid/view/IWindowManager;->removeWindowToken(Landroid/os/IBinder;)V
    :try_end_22
    .catch Landroid/os/RemoteException; {:try_start_19 .. :try_end_22} :catch_2d

    .line 834
    :goto_22
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iput-object v2, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    .line 835
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iput-object v2, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    .line 836
    iput-object v2, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    .line 838
    :cond_2c
    return-void

    .line 832
    :catch_2d
    move-exception v0

    goto :goto_22

    .line 824
    :catch_2f
    move-exception v0

    goto :goto_12
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 13
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 1148
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    const-string v4, "android.permission.DUMP"

    invoke-virtual {v3, v4}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_33

    .line 1151
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Permission Denial: can\'t dump wallpaper service from from pid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", uid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1190
    :goto_32
    return-void

    .line 1157
    :cond_33
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1158
    :try_start_36
    const-string v3, "Current Wallpaper Service state:"

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1159
    const/4 v1, 0x0

    .local v1, i:I
    :goto_3c
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_e8

    .line 1160
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 1161
    .local v2, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " User "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1162
    const-string v3, "  mWidth="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1163
    iget v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(I)V

    .line 1164
    const-string v3, " mHeight="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1165
    iget v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(I)V

    .line 1166
    const-string v3, "  mName="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1167
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1168
    const-string v3, "  mWallpaperComponent="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1169
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1170
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    if-eqz v3, :cond_e4

    .line 1171
    iget-object v0, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    .line 1172
    .local v0, conn:Lcom/android/server/WallpaperManagerService$WallpaperConnection;
    const-string v3, "  Wallpaper connection "

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1173
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 1174
    const-string v3, ":"

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1175
    iget-object v3, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mInfo:Landroid/app/WallpaperInfo;

    if-eqz v3, :cond_b7

    .line 1176
    const-string v3, "    mInfo.component="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1177
    iget-object v3, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mInfo:Landroid/app/WallpaperInfo;

    invoke-virtual {v3}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1179
    :cond_b7
    const-string v3, "    mToken="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1180
    iget-object v3, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mToken:Landroid/os/Binder;

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1181
    const-string v3, "    mService="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1182
    iget-object v3, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1183
    const-string v3, "    mEngine="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1184
    iget-object v3, v0, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1185
    const-string v3, "    mLastDiedTime="

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1186
    iget-wide v5, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->lastDiedTime:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    sub-long/2addr v5, v7

    invoke-virtual {p2, v5, v6}, Ljava/io/PrintWriter;->println(J)V

    .line 1159
    .end local v0           #conn:Lcom/android/server/WallpaperManagerService$WallpaperConnection;
    :cond_e4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_3c

    .line 1189
    .end local v2           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :cond_e8
    monitor-exit v4

    goto/16 :goto_32

    .end local v1           #i:I
    :catchall_eb
    move-exception v3

    monitor-exit v4
    :try_end_ed
    .catchall {:try_start_36 .. :try_end_ed} :catchall_eb

    throw v3
.end method

.method protected finalize()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 403
    invoke-super {p0}, Landroid/app/IWallpaperManager$Stub;->finalize()V

    .line 404
    const/4 v0, 0x0

    .local v0, i:I
    :goto_4
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1c

    .line 405
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 406
    .local v1, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    iget-object v2, v1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperObserver:Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    invoke-virtual {v2}, Lcom/android/server/WallpaperManagerService$WallpaperObserver;->stopWatching()V

    .line 404
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 408
    .end local v1           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :cond_1c
    return-void
.end method

.method public getHeightHint()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 566
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 567
    :try_start_3
    iget-object v1, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 568
    .local v0, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    iget v1, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    monitor-exit v2

    return v1

    .line 569
    .end local v0           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v1
.end method

.method getName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 434
    iget-object v0, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getWallpaper(Landroid/app/IWallpaperManagerCallback;Landroid/os/Bundle;)Landroid/os/ParcelFileDescriptor;
    .registers 12
    .parameter "cb"
    .parameter "outParams"

    .prologue
    const/4 v5, 0x0

    .line 574
    iget-object v6, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 577
    :try_start_4
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 578
    .local v0, callingUid:I
    const/4 v4, 0x0

    .line 579
    .local v4, wallpaperUserId:I
    const/16 v7, 0x3e8

    if-ne v0, v7, :cond_41

    .line 580
    iget v4, p0, Lcom/android/server/WallpaperManagerService;->mCurrentUserId:I

    .line 584
    :goto_f
    iget-object v7, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v7, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/WallpaperManagerService$WallpaperData;
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_4e

    .line 586
    .local v3, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-eqz p2, :cond_27

    .line 587
    :try_start_19
    const-string v7, "width"

    iget v8, v3, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    invoke-virtual {p2, v7, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 588
    const-string v7, "height"

    iget v8, v3, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    invoke-virtual {p2, v7, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 590
    :cond_27
    #getter for: Lcom/android/server/WallpaperManagerService$WallpaperData;->callbacks:Landroid/os/RemoteCallbackList;
    invoke-static {v3}, Lcom/android/server/WallpaperManagerService$WallpaperData;->access$300(Lcom/android/server/WallpaperManagerService$WallpaperData;)Landroid/os/RemoteCallbackList;

    move-result-object v7

    invoke-virtual {v7, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    .line 591
    new-instance v2, Ljava/io/File;

    invoke-static {v4}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v7

    const-string v8, "wallpaper"

    invoke-direct {v2, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 592
    .local v2, f:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    :try_end_3c
    .catchall {:try_start_19 .. :try_end_3c} :catchall_4e
    .catch Ljava/io/FileNotFoundException; {:try_start_19 .. :try_end_3c} :catch_51

    move-result v7

    if-nez v7, :cond_46

    .line 593
    :try_start_3f
    monitor-exit v6

    .line 600
    .end local v2           #f:Ljava/io/File;
    :goto_40
    return-object v5

    .line 582
    .end local v3           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :cond_41
    invoke-static {v0}, Landroid/os/UserId;->getUserId(I)I
    :try_end_44
    .catchall {:try_start_3f .. :try_end_44} :catchall_4e

    move-result v4

    goto :goto_f

    .line 595
    .restart local v2       #f:Ljava/io/File;
    .restart local v3       #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :cond_46
    const/high16 v7, 0x1000

    :try_start_48
    invoke-static {v2, v7}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_4e
    .catch Ljava/io/FileNotFoundException; {:try_start_48 .. :try_end_4b} :catch_51

    move-result-object v5

    :try_start_4c
    monitor-exit v6

    goto :goto_40

    .line 601
    .end local v0           #callingUid:I
    .end local v2           #f:Ljava/io/File;
    .end local v3           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    .end local v4           #wallpaperUserId:I
    :catchall_4e
    move-exception v5

    monitor-exit v6
    :try_end_50
    .catchall {:try_start_4c .. :try_end_50} :catchall_4e

    throw v5

    .line 596
    .restart local v0       #callingUid:I
    .restart local v3       #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    .restart local v4       #wallpaperUserId:I
    :catch_51
    move-exception v1

    .line 598
    .local v1, e:Ljava/io/FileNotFoundException;
    :try_start_52
    const-string v7, "WallpaperService"

    const-string v8, "Error getting wallpaper"

    invoke-static {v7, v8, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 600
    monitor-exit v6
    :try_end_5a
    .catchall {:try_start_52 .. :try_end_5a} :catchall_4e

    goto :goto_40
.end method

.method public getWallpaperInfo()Landroid/app/WallpaperInfo;
    .registers 5

    .prologue
    .line 605
    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v0

    .line 606
    .local v0, userId:I
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 607
    :try_start_7
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 608
    .local v1, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    iget-object v2, v1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    if-eqz v2, :cond_19

    .line 609
    iget-object v2, v1, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iget-object v2, v2, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mInfo:Landroid/app/WallpaperInfo;

    monitor-exit v3

    .line 611
    :goto_18
    return-object v2

    :cond_19
    const/4 v2, 0x0

    monitor-exit v3

    goto :goto_18

    .line 612
    .end local v1           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_7 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public getWidthHint()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 559
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 560
    :try_start_3
    iget-object v1, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 561
    .local v0, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    iget v1, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    monitor-exit v2

    return v1

    .line 562
    .end local v0           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v1
.end method

.method removeUser(I)V
    .registers 8
    .parameter "userId"

    .prologue
    .line 438
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 439
    :try_start_3
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 440
    .local v0, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-eqz v0, :cond_17

    .line 441
    iget-object v3, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperObserver:Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    invoke-virtual {v3}, Lcom/android/server/WallpaperManagerService$WallpaperObserver;->stopWatching()V

    .line 442
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 444
    :cond_17
    new-instance v1, Ljava/io/File;

    invoke-static {p1}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v3

    const-string v5, "wallpaper"

    invoke-direct {v1, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 445
    .local v1, wallpaperFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 446
    new-instance v2, Ljava/io/File;

    invoke-static {p1}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v3

    const-string v5, "wallpaper_info.xml"

    invoke-direct {v2, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 447
    .local v2, wallpaperInfoFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 448
    monitor-exit v4

    .line 449
    return-void

    .line 448
    .end local v0           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    .end local v1           #wallpaperFile:Ljava/io/File;
    .end local v2           #wallpaperInfoFile:Ljava/io/File;
    :catchall_35
    move-exception v3

    monitor-exit v4
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_35

    throw v3
.end method

.method restoreNamedResourceLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)Z
    .registers 23
    .parameter "wallpaper"

    .prologue
    .line 1073
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v18, 0x4

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_14b

    const-string v17, "res:"

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x4

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_14b

    .line 1074
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x4

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 1076
    .local v14, resName:Ljava/lang/String;
    const/4 v10, 0x0

    .line 1077
    .local v10, pkg:Ljava/lang/String;
    const/16 v17, 0x3a

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 1078
    .local v5, colon:I
    if-lez v5, :cond_47

    .line 1079
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v14, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 1082
    :cond_47
    const/4 v9, 0x0

    .line 1083
    .local v9, ident:Ljava/lang/String;
    const/16 v17, 0x2f

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v15

    .line 1084
    .local v15, slash:I
    if-lez v15, :cond_5a

    .line 1085
    add-int/lit8 v17, v15, 0x1

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 1088
    :cond_5a
    const/16 v16, 0x0

    .line 1089
    .local v16, type:Ljava/lang/String;
    if-lez v5, :cond_72

    if-lez v15, :cond_72

    sub-int v17, v15, v5

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_72

    .line 1090
    add-int/lit8 v17, v5, 0x1

    move/from16 v0, v17

    invoke-virtual {v14, v0, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 1093
    :cond_72
    if-eqz v10, :cond_14b

    if-eqz v9, :cond_14b

    if-eqz v16, :cond_14b

    .line 1094
    const/4 v13, -0x1

    .line 1095
    .local v13, resId:I
    const/4 v12, 0x0

    .line 1096
    .local v12, res:Ljava/io/InputStream;
    const/4 v7, 0x0

    .line 1098
    .local v7, fos:Ljava/io/FileOutputStream;
    :try_start_7b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    const/16 v18, 0x4

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v10, v1}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v4

    .line 1099
    .local v4, c:Landroid/content/Context;
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 1100
    .local v11, r:Landroid/content/res/Resources;
    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v11, v14, v0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v13

    .line 1101
    if-nez v13, :cond_e1

    .line 1102
    const-string v17, "WallpaperService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "couldn\'t resolve identifier pkg="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " type="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " ident="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d1
    .catchall {:try_start_7b .. :try_end_d1} :catchall_1c1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7b .. :try_end_d1} :catch_1e9
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_7b .. :try_end_d1} :catch_17c
    .catch Ljava/io/IOException; {:try_start_7b .. :try_end_d1} :catch_1a7

    .line 1104
    const/16 v17, 0x0

    .line 1129
    if-eqz v12, :cond_d8

    .line 1131
    :try_start_d5
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_d8
    .catch Ljava/io/IOException; {:try_start_d5 .. :try_end_d8} :catch_1db

    .line 1134
    :cond_d8
    :goto_d8
    if-eqz v7, :cond_e0

    .line 1135
    invoke-static {v7}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 1137
    :try_start_dd
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_e0
    .catch Ljava/io/IOException; {:try_start_dd .. :try_end_e0} :catch_179

    .line 1143
    .end local v4           #c:Landroid/content/Context;
    .end local v5           #colon:I
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .end local v9           #ident:Ljava/lang/String;
    .end local v10           #pkg:Ljava/lang/String;
    .end local v11           #r:Landroid/content/res/Resources;
    .end local v12           #res:Ljava/io/InputStream;
    .end local v13           #resId:I
    .end local v14           #resName:Ljava/lang/String;
    .end local v15           #slash:I
    .end local v16           #type:Ljava/lang/String;
    :cond_e0
    :goto_e0
    return v17

    .line 1107
    .restart local v4       #c:Landroid/content/Context;
    .restart local v5       #colon:I
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    .restart local v9       #ident:Ljava/lang/String;
    .restart local v10       #pkg:Ljava/lang/String;
    .restart local v11       #r:Landroid/content/res/Resources;
    .restart local v12       #res:Ljava/io/InputStream;
    .restart local v13       #resId:I
    .restart local v14       #resName:Ljava/lang/String;
    .restart local v15       #slash:I
    .restart local v16       #type:Ljava/lang/String;
    :cond_e1
    :try_start_e1
    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v12

    .line 1108
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperFile:Ljava/io/File;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v17

    if-eqz v17, :cond_fa

    .line 1109
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperFile:Ljava/io/File;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 1111
    :cond_fa
    new-instance v8, Ljava/io/FileOutputStream;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperFile:Ljava/io/File;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_107
    .catchall {:try_start_e1 .. :try_end_107} :catchall_1c1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e1 .. :try_end_107} :catch_1e9
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_e1 .. :try_end_107} :catch_17c
    .catch Ljava/io/IOException; {:try_start_e1 .. :try_end_107} :catch_1a7

    .line 1113
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .local v8, fos:Ljava/io/FileOutputStream;
    const v17, 0x8000

    :try_start_10a
    move/from16 v0, v17

    new-array v3, v0, [B

    .line 1115
    .local v3, buffer:[B
    :goto_10e
    invoke-virtual {v12, v3}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, amt:I
    if-lez v2, :cond_14e

    .line 1116
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v8, v3, v0, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_11b
    .catchall {:try_start_10a .. :try_end_11b} :catchall_1e0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_10a .. :try_end_11b} :catch_11c
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_10a .. :try_end_11b} :catch_1e6
    .catch Ljava/io/IOException; {:try_start_10a .. :try_end_11b} :catch_1e3

    goto :goto_10e

    .line 1122
    .end local v2           #amt:I
    .end local v3           #buffer:[B
    :catch_11c
    move-exception v6

    move-object v7, v8

    .line 1123
    .end local v4           #c:Landroid/content/Context;
    .end local v8           #fos:Ljava/io/FileOutputStream;
    .end local v11           #r:Landroid/content/res/Resources;
    .local v6, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    :goto_11e
    :try_start_11e
    const-string v17, "WallpaperService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Package name "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " not found"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13e
    .catchall {:try_start_11e .. :try_end_13e} :catchall_1c1

    .line 1129
    if-eqz v12, :cond_143

    .line 1131
    :try_start_140
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_143
    .catch Ljava/io/IOException; {:try_start_140 .. :try_end_143} :catch_1d4

    .line 1134
    :cond_143
    :goto_143
    if-eqz v7, :cond_14b

    .line 1135
    invoke-static {v7}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 1137
    :try_start_148
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_14b
    .catch Ljava/io/IOException; {:try_start_148 .. :try_end_14b} :catch_1a5

    .line 1143
    .end local v5           #colon:I
    .end local v6           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .end local v9           #ident:Ljava/lang/String;
    .end local v10           #pkg:Ljava/lang/String;
    .end local v12           #res:Ljava/io/InputStream;
    .end local v13           #resId:I
    .end local v14           #resName:Ljava/lang/String;
    .end local v15           #slash:I
    .end local v16           #type:Ljava/lang/String;
    :cond_14b
    :goto_14b
    const/16 v17, 0x0

    goto :goto_e0

    .line 1120
    .restart local v2       #amt:I
    .restart local v3       #buffer:[B
    .restart local v4       #c:Landroid/content/Context;
    .restart local v5       #colon:I
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    .restart local v9       #ident:Ljava/lang/String;
    .restart local v10       #pkg:Ljava/lang/String;
    .restart local v11       #r:Landroid/content/res/Resources;
    .restart local v12       #res:Ljava/io/InputStream;
    .restart local v13       #resId:I
    .restart local v14       #resName:Ljava/lang/String;
    .restart local v15       #slash:I
    .restart local v16       #type:Ljava/lang/String;
    :cond_14e
    :try_start_14e
    const-string v17, "WallpaperService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Restored wallpaper: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_168
    .catchall {:try_start_14e .. :try_end_168} :catchall_1e0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_14e .. :try_end_168} :catch_11c
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_14e .. :try_end_168} :catch_1e6
    .catch Ljava/io/IOException; {:try_start_14e .. :try_end_168} :catch_1e3

    .line 1121
    const/16 v17, 0x1

    .line 1129
    if-eqz v12, :cond_16f

    .line 1131
    :try_start_16c
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_16f
    .catch Ljava/io/IOException; {:try_start_16c .. :try_end_16f} :catch_1de

    .line 1134
    :cond_16f
    :goto_16f
    if-eqz v8, :cond_e0

    .line 1135
    invoke-static {v8}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 1137
    :try_start_174
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_177
    .catch Ljava/io/IOException; {:try_start_174 .. :try_end_177} :catch_179

    goto/16 :goto_e0

    .line 1138
    .end local v2           #amt:I
    .end local v3           #buffer:[B
    .end local v8           #fos:Ljava/io/FileOutputStream;
    :catch_179
    move-exception v18

    goto/16 :goto_e0

    .line 1124
    .end local v4           #c:Landroid/content/Context;
    .end local v11           #r:Landroid/content/res/Resources;
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    :catch_17c
    move-exception v6

    .line 1125
    .local v6, e:Landroid/content/res/Resources$NotFoundException;
    :goto_17d
    :try_start_17d
    const-string v17, "WallpaperService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Resource not found: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_197
    .catchall {:try_start_17d .. :try_end_197} :catchall_1c1

    .line 1129
    if-eqz v12, :cond_19c

    .line 1131
    :try_start_199
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_19c
    .catch Ljava/io/IOException; {:try_start_199 .. :try_end_19c} :catch_1d7

    .line 1134
    :cond_19c
    :goto_19c
    if-eqz v7, :cond_14b

    .line 1135
    invoke-static {v7}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 1137
    :try_start_1a1
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_1a4
    .catch Ljava/io/IOException; {:try_start_1a1 .. :try_end_1a4} :catch_1a5

    goto :goto_14b

    .line 1138
    .end local v6           #e:Landroid/content/res/Resources$NotFoundException;
    :catch_1a5
    move-exception v17

    goto :goto_14b

    .line 1126
    :catch_1a7
    move-exception v6

    .line 1127
    .local v6, e:Ljava/io/IOException;
    :goto_1a8
    :try_start_1a8
    const-string v17, "WallpaperService"

    const-string v18, "IOException while restoring wallpaper "

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1b3
    .catchall {:try_start_1a8 .. :try_end_1b3} :catchall_1c1

    .line 1129
    if-eqz v12, :cond_1b8

    .line 1131
    :try_start_1b5
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_1b8
    .catch Ljava/io/IOException; {:try_start_1b5 .. :try_end_1b8} :catch_1d9

    .line 1134
    :cond_1b8
    :goto_1b8
    if-eqz v7, :cond_14b

    .line 1135
    invoke-static {v7}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 1137
    :try_start_1bd
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_1c0
    .catch Ljava/io/IOException; {:try_start_1bd .. :try_end_1c0} :catch_1a5

    goto :goto_14b

    .line 1129
    .end local v6           #e:Ljava/io/IOException;
    :catchall_1c1
    move-exception v17

    :goto_1c2
    if-eqz v12, :cond_1c7

    .line 1131
    :try_start_1c4
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_1c7
    .catch Ljava/io/IOException; {:try_start_1c4 .. :try_end_1c7} :catch_1d0

    .line 1134
    :cond_1c7
    :goto_1c7
    if-eqz v7, :cond_1cf

    .line 1135
    invoke-static {v7}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 1137
    :try_start_1cc
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_1cf
    .catch Ljava/io/IOException; {:try_start_1cc .. :try_end_1cf} :catch_1d2

    .line 1129
    :cond_1cf
    :goto_1cf
    throw v17

    .line 1132
    :catch_1d0
    move-exception v18

    goto :goto_1c7

    .line 1138
    :catch_1d2
    move-exception v18

    goto :goto_1cf

    .line 1132
    .local v6, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1d4
    move-exception v17

    goto/16 :goto_143

    .local v6, e:Landroid/content/res/Resources$NotFoundException;
    :catch_1d7
    move-exception v17

    goto :goto_19c

    .local v6, e:Ljava/io/IOException;
    :catch_1d9
    move-exception v17

    goto :goto_1b8

    .end local v6           #e:Ljava/io/IOException;
    .restart local v4       #c:Landroid/content/Context;
    .restart local v11       #r:Landroid/content/res/Resources;
    :catch_1db
    move-exception v18

    goto/16 :goto_d8

    .end local v7           #fos:Ljava/io/FileOutputStream;
    .restart local v2       #amt:I
    .restart local v3       #buffer:[B
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    :catch_1de
    move-exception v18

    goto :goto_16f

    .line 1129
    .end local v2           #amt:I
    .end local v3           #buffer:[B
    :catchall_1e0
    move-exception v17

    move-object v7, v8

    .end local v8           #fos:Ljava/io/FileOutputStream;
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    goto :goto_1c2

    .line 1126
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    :catch_1e3
    move-exception v6

    move-object v7, v8

    .end local v8           #fos:Ljava/io/FileOutputStream;
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    goto :goto_1a8

    .line 1124
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    :catch_1e6
    move-exception v6

    move-object v7, v8

    .end local v8           #fos:Ljava/io/FileOutputStream;
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    goto :goto_17d

    .line 1122
    .end local v4           #c:Landroid/content/Context;
    .end local v11           #r:Landroid/content/res/Resources;
    :catch_1e9
    move-exception v6

    goto/16 :goto_11e
.end method

.method public setDimensionHints(II)V
    .registers 9
    .parameter "width"
    .parameter "height"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 521
    const-string v3, "android.permission.SET_WALLPAPER_HINTS"

    invoke-direct {p0, v3}, Lcom/android/server/WallpaperManagerService;->checkPermission(Ljava/lang/String;)V

    .line 523
    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v1

    .line 524
    .local v1, userId:I
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 525
    .local v2, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-nez v2, :cond_2c

    .line 526
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Wallpaper not yet initialized for user "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 528
    :cond_2c
    if-lez p1, :cond_30

    if-gtz p2, :cond_38

    .line 529
    :cond_30
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "width and height must be > 0"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 532
    :cond_38
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x10e0036

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 534
    .local v0, maxWidth:I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_4b

    if-le p1, v0, :cond_4b

    .line 535
    move p1, v0

    .line 538
    :cond_4b
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 539
    :try_start_4e
    iget v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    if-ne p1, v3, :cond_56

    iget v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    if-eq p2, v3, :cond_77

    .line 540
    :cond_56
    iput p1, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->width:I

    .line 541
    iput p2, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->height:I

    .line 542
    invoke-direct {p0, v2}, Lcom/android/server/WallpaperManagerService;->saveSettingsLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 543
    iget v3, p0, Lcom/android/server/WallpaperManagerService;->mCurrentUserId:I

    if-eq v3, v1, :cond_63

    monitor-exit v4

    .line 556
    :goto_62
    return-void

    .line 544
    :cond_63
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    if-eqz v3, :cond_77

    .line 545
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iget-object v3, v3, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;
    :try_end_6b
    .catchall {:try_start_4e .. :try_end_6b} :catchall_79

    if-eqz v3, :cond_77

    .line 547
    :try_start_6d
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->connection:Lcom/android/server/WallpaperManagerService$WallpaperConnection;

    iget-object v3, v3, Lcom/android/server/WallpaperManagerService$WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    invoke-interface {v3, p1, p2}, Landroid/service/wallpaper/IWallpaperEngine;->setDesiredSize(II)V
    :try_end_74
    .catchall {:try_start_6d .. :try_end_74} :catchall_79
    .catch Landroid/os/RemoteException; {:try_start_6d .. :try_end_74} :catch_7c

    .line 551
    :goto_74
    :try_start_74
    invoke-direct {p0, v2}, Lcom/android/server/WallpaperManagerService;->notifyCallbacksLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 555
    :cond_77
    monitor-exit v4

    goto :goto_62

    :catchall_79
    move-exception v3

    monitor-exit v4
    :try_end_7b
    .catchall {:try_start_74 .. :try_end_7b} :catchall_79

    throw v3

    .line 549
    :catch_7c
    move-exception v3

    goto :goto_74
.end method

.method public setWallpaper(Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .registers 10
    .parameter "name"

    .prologue
    .line 617
    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v3

    .line 618
    .local v3, userId:I
    iget-object v5, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 619
    .local v4, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-nez v4, :cond_27

    .line 620
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Wallpaper not yet initialized for user "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 622
    :cond_27
    const-string v5, "android.permission.SET_WALLPAPER"

    invoke-direct {p0, v5}, Lcom/android/server/WallpaperManagerService;->checkPermission(Ljava/lang/String;)V

    .line 623
    iget-object v6, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 624
    :try_start_2f
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_46

    move-result-wide v0

    .line 626
    .local v0, ident:J
    :try_start_33
    invoke-virtual {p0, p1, v4}, Lcom/android/server/WallpaperManagerService;->updateWallpaperBitmapLocked(Ljava/lang/String;Lcom/android/server/WallpaperManagerService$WallpaperData;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 627
    .local v2, pfd:Landroid/os/ParcelFileDescriptor;
    if-eqz v2, :cond_3c

    .line 628
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperPending:Z
    :try_end_3c
    .catchall {:try_start_33 .. :try_end_3c} :catchall_41

    .line 632
    :cond_3c
    :try_start_3c
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 630
    monitor-exit v6

    return-object v2

    .line 632
    .end local v2           #pfd:Landroid/os/ParcelFileDescriptor;
    :catchall_41
    move-exception v5

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5

    .line 634
    .end local v0           #ident:J
    :catchall_46
    move-exception v5

    monitor-exit v6
    :try_end_48
    .catchall {:try_start_3c .. :try_end_48} :catchall_46

    throw v5
.end method

.method public setWallpaperComponent(Landroid/content/ComponentName;)V
    .registers 9
    .parameter "name"

    .prologue
    .line 660
    invoke-static {}, Landroid/os/UserId;->getCallingUserId()I

    move-result v2

    .line 661
    .local v2, userId:I
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 662
    .local v3, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-nez v3, :cond_27

    .line 663
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Wallpaper not yet initialized for user "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 665
    :cond_27
    const-string v4, "android.permission.SET_WALLPAPER_COMPONENT"

    invoke-direct {p0, v4}, Lcom/android/server/WallpaperManagerService;->checkPermission(Ljava/lang/String;)V

    .line 666
    iget-object v5, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 667
    :try_start_2f
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_45

    move-result-wide v0

    .line 669
    .local v0, ident:J
    const/4 v4, 0x0

    :try_start_34
    iput-boolean v4, v3, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperPending:Z

    .line 670
    const/4 v4, 0x0

    const/4 v6, 0x1

    invoke-virtual {p0, p1, v4, v6, v3}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_40

    .line 672
    :try_start_3b
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 674
    monitor-exit v5

    .line 675
    return-void

    .line 672
    :catchall_40
    move-exception v4

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4

    .line 674
    .end local v0           #ident:J
    :catchall_45
    move-exception v4

    monitor-exit v5
    :try_end_47
    .catchall {:try_start_3b .. :try_end_47} :catchall_45

    throw v4
.end method

.method settingsRestored()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 1028
    const/4 v2, 0x0

    .line 1029
    .local v2, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    const/4 v1, 0x0

    .line 1030
    .local v1, success:Z
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1031
    const/4 v3, 0x0

    :try_start_7
    invoke-direct {p0, v3}, Lcom/android/server/WallpaperManagerService;->loadSettingsLocked(I)V

    .line 1032
    iget-object v3, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    move-object v2, v0

    .line 1033
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    if-eqz v3, :cond_6a

    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    iget-object v5, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->imageWallpaperComponent:Landroid/content/ComponentName;

    invoke-virtual {v3, v5}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6a

    .line 1035
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p0, v3, v5, v6, v2}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z

    move-result v3

    if-nez v3, :cond_33

    .line 1040
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p0, v3, v5, v6, v2}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z

    .line 1042
    :cond_33
    const/4 v1, 0x1

    .line 1059
    :cond_34
    :goto_34
    monitor-exit v4
    :try_end_35
    .catchall {:try_start_7 .. :try_end_35} :catchall_7f

    .line 1061
    if-nez v1, :cond_62

    .line 1062
    const-string v3, "WallpaperService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to restore wallpaper: \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1063
    const-string v3, ""

    iput-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    .line 1064
    invoke-static {v7}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 1067
    :cond_62
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1068
    :try_start_65
    invoke-direct {p0, v2}, Lcom/android/server/WallpaperManagerService;->saveSettingsLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 1069
    monitor-exit v4
    :try_end_69
    .catchall {:try_start_65 .. :try_end_69} :catchall_87

    .line 1070
    return-void

    .line 1046
    :cond_6a
    :try_start_6a
    const-string v3, ""

    iget-object v5, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_82

    .line 1048
    const/4 v1, 0x1

    .line 1054
    :goto_75
    if-eqz v1, :cond_34

    .line 1055
    iget-object v3, v2, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p0, v3, v5, v6, v2}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z

    goto :goto_34

    .line 1059
    :catchall_7f
    move-exception v3

    monitor-exit v4
    :try_end_81
    .catchall {:try_start_6a .. :try_end_81} :catchall_7f

    throw v3

    .line 1051
    :cond_82
    :try_start_82
    invoke-virtual {p0, v2}, Lcom/android/server/WallpaperManagerService;->restoreNamedResourceLocked(Lcom/android/server/WallpaperManagerService$WallpaperData;)Z
    :try_end_85
    .catchall {:try_start_82 .. :try_end_85} :catchall_7f

    move-result v1

    goto :goto_75

    .line 1069
    :catchall_87
    move-exception v3

    :try_start_88
    monitor-exit v4
    :try_end_89
    .catchall {:try_start_88 .. :try_end_89} :catchall_87

    throw v3
.end method

.method switchUser(I)V
    .registers 5
    .parameter "userId"

    .prologue
    .line 452
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 453
    :try_start_3
    iput p1, p0, Lcom/android/server/WallpaperManagerService;->mCurrentUserId:I

    .line 454
    iget-object v1, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 455
    .local v0, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    if-nez v0, :cond_28

    .line 456
    new-instance v0, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .end local v0           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    invoke-direct {v0, p1}, Lcom/android/server/WallpaperManagerService$WallpaperData;-><init>(I)V

    .line 457
    .restart local v0       #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    iget-object v1, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 458
    invoke-direct {p0, p1}, Lcom/android/server/WallpaperManagerService;->loadSettingsLocked(I)V

    .line 459
    new-instance v1, Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    invoke-direct {v1, p0, v0}, Lcom/android/server/WallpaperManagerService$WallpaperObserver;-><init>(Lcom/android/server/WallpaperManagerService;Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    iput-object v1, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperObserver:Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    .line 460
    iget-object v1, v0, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperObserver:Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    invoke-virtual {v1}, Lcom/android/server/WallpaperManagerService$WallpaperObserver;->startWatching()V

    .line 462
    :cond_28
    invoke-virtual {p0, v0}, Lcom/android/server/WallpaperManagerService;->switchWallpaper(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 463
    monitor-exit v2

    .line 464
    return-void

    .line 463
    .end local v0           #wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    :catchall_2d
    move-exception v1

    monitor-exit v2
    :try_end_2f
    .catchall {:try_start_3 .. :try_end_2f} :catchall_2d

    throw v1
.end method

.method switchWallpaper(Lcom/android/server/WallpaperManagerService$WallpaperData;)V
    .registers 8
    .parameter "wallpaper"

    .prologue
    .line 467
    iget-object v4, p0, Lcom/android/server/WallpaperManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 468
    const/4 v1, 0x0

    .line 470
    .local v1, e:Ljava/lang/RuntimeException;
    :try_start_4
    iget-object v3, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    if-eqz v3, :cond_14

    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperComponent:Landroid/content/ComponentName;

    .line 472
    .local v0, cname:Landroid/content/ComponentName;
    :goto_a
    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0, v0, v3, v5, p1}, Lcom/android/server/WallpaperManagerService;->bindWallpaperComponentLocked(Landroid/content/ComponentName;ZZLcom/android/server/WallpaperManagerService$WallpaperData;)Z
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_28
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_f} :catch_17

    move-result v3

    if-eqz v3, :cond_19

    .line 473
    :try_start_12
    monitor-exit v4
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_28

    .line 481
    .end local v0           #cname:Landroid/content/ComponentName;
    :goto_13
    return-void

    .line 470
    :cond_14
    :try_start_14
    iget-object v0, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->nextWallpaperComponent:Landroid/content/ComponentName;
    :try_end_16
    .catchall {:try_start_14 .. :try_end_16} :catchall_28
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_16} :catch_17

    goto :goto_a

    .line 475
    :catch_17
    move-exception v2

    .line 476
    .local v2, e1:Ljava/lang/RuntimeException;
    move-object v1, v2

    .line 478
    .end local v2           #e1:Ljava/lang/RuntimeException;
    :cond_19
    :try_start_19
    const-string v3, "WallpaperService"

    const-string v5, "Failure starting previous wallpaper"

    invoke-static {v3, v5, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 479
    const/4 v3, 0x0

    iget v5, p1, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    invoke-virtual {p0, v3, v5}, Lcom/android/server/WallpaperManagerService;->clearWallpaperLocked(ZI)V

    .line 480
    monitor-exit v4

    goto :goto_13

    :catchall_28
    move-exception v3

    monitor-exit v4
    :try_end_2a
    .catchall {:try_start_19 .. :try_end_2a} :catchall_28

    throw v3
.end method

.method public systemReady()V
    .registers 5

    .prologue
    .line 412
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mWallpaperMap:Landroid/util/SparseArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WallpaperManagerService$WallpaperData;

    .line 413
    .local v1, wallpaper:Lcom/android/server/WallpaperManagerService$WallpaperData;
    invoke-virtual {p0, v1}, Lcom/android/server/WallpaperManagerService;->switchWallpaper(Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    .line 414
    new-instance v2, Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    invoke-direct {v2, p0, v1}, Lcom/android/server/WallpaperManagerService$WallpaperObserver;-><init>(Lcom/android/server/WallpaperManagerService;Lcom/android/server/WallpaperManagerService$WallpaperData;)V

    iput-object v2, v1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperObserver:Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    .line 415
    iget-object v2, v1, Lcom/android/server/WallpaperManagerService$WallpaperData;->wallpaperObserver:Lcom/android/server/WallpaperManagerService$WallpaperObserver;

    invoke-virtual {v2}, Lcom/android/server/WallpaperManagerService$WallpaperObserver;->startWatching()V

    .line 417
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 418
    .local v0, userFilter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.USER_SWITCHED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 419
    const-string v2, "android.intent.action.USER_REMOVED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 420
    iget-object v2, p0, Lcom/android/server/WallpaperManagerService;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/android/server/WallpaperManagerService$1;

    invoke-direct {v3, p0}, Lcom/android/server/WallpaperManagerService$1;-><init>(Lcom/android/server/WallpaperManagerService;)V

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 431
    return-void
.end method

.method updateWallpaperBitmapLocked(Ljava/lang/String;Lcom/android/server/WallpaperManagerService$WallpaperData;)Landroid/os/ParcelFileDescriptor;
    .registers 10
    .parameter "name"
    .parameter "wallpaper"

    .prologue
    .line 638
    if-nez p1, :cond_4

    const-string p1, ""

    .line 640
    :cond_4
    :try_start_4
    iget v3, p2, Lcom/android/server/WallpaperManagerService$WallpaperData;->userId:I

    invoke-static {v3}, Lcom/android/server/WallpaperManagerService;->getWallpaperDir(I)Ljava/io/File;

    move-result-object v0

    .line 641
    .local v0, dir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1e

    .line 642
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 643
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x1f9

    const/4 v5, -0x1

    const/4 v6, -0x1

    invoke-static {v3, v4, v5, v6}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 648
    :cond_1e
    new-instance v3, Ljava/io/File;

    const-string v4, "wallpaper"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/high16 v4, 0x3800

    invoke-static {v3, v4}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 650
    .local v2, fd:Landroid/os/ParcelFileDescriptor;
    iput-object p1, p2, Lcom/android/server/WallpaperManagerService$WallpaperData;->name:Ljava/lang/String;
    :try_end_2d
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_2d} :catch_2e

    .line 655
    .end local v0           #dir:Ljava/io/File;
    .end local v2           #fd:Landroid/os/ParcelFileDescriptor;
    :goto_2d
    return-object v2

    .line 652
    :catch_2e
    move-exception v1

    .line 653
    .local v1, e:Ljava/io/FileNotFoundException;
    const-string v3, "WallpaperService"

    const-string v4, "Error setting wallpaper"

    invoke-static {v3, v4, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 655
    const/4 v2, 0x0

    goto :goto_2d
.end method
