.class public Lcom/android/server/DevicePolicyManagerService;
.super Landroid/app/admin/IDevicePolicyManager$Stub;
.source "DevicePolicyManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;,
        Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    }
.end annotation


# static fields
.field protected static final ACTION_EXPIRED_PASSWORD_NOTIFICATION:Ljava/lang/String; = "com.android.server.ACTION_EXPIRED_PASSWORD_NOTIFICATION"

.field private static final EXPIRATION_GRACE_PERIOD_MS:J = 0x19bfcc00L

.field private static final MS_PER_DAY:J = 0x5265c00L

.field private static final REQUEST_EXPIRE_PASSWORD:I = 0x15c3

.field public static final SYSTEM_PROP_DISABLE_CAMERA:Ljava/lang/String; = "sys.secpolicy.camera.disabled"

.field private static final TAG:Ljava/lang/String; = "DevicePolicyManagerService"


# instance fields
.field mActivePasswordLength:I

.field mActivePasswordLetters:I

.field mActivePasswordLowerCase:I

.field mActivePasswordNonLetter:I

.field mActivePasswordNumeric:I

.field mActivePasswordQuality:I

.field mActivePasswordSymbols:I

.field mActivePasswordUpperCase:I

.field final mAdminList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;",
            ">;"
        }
    .end annotation
.end field

.field final mAdminMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/ComponentName;",
            "Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;",
            ">;"
        }
    .end annotation
.end field

.field final mContext:Landroid/content/Context;

.field mFailedPasswordAttempts:I

.field mHandler:Landroid/os/Handler;

.field mIPowerManager:Landroid/os/IPowerManager;

.field mIWindowManager:Landroid/view/IWindowManager;

.field final mMonitor:Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;

.field mPasswordOwner:I

.field mReceiver:Landroid/content/BroadcastReceiver;

.field final mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 451
    invoke-direct {p0}, Landroid/app/admin/IDevicePolicyManager$Stub;-><init>()V

    .line 102
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    .line 103
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    .line 104
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    .line 105
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    .line 106
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    .line 107
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    .line 108
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    .line 109
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    .line 110
    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    .line 112
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    .line 113
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mHandler:Landroid/os/Handler;

    .line 115
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    .line 117
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    .line 120
    new-instance v1, Lcom/android/server/DevicePolicyManagerService$1;

    invoke-direct {v1, p0}, Lcom/android/server/DevicePolicyManagerService$1;-><init>(Lcom/android/server/DevicePolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 452
    iput-object p1, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    .line 453
    new-instance v1, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;

    invoke-direct {v1, p0}, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;-><init>(Lcom/android/server/DevicePolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mMonitor:Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;

    .line 454
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mMonitor:Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;

    invoke-virtual {v1, p1, v3}, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->register(Landroid/content/Context;Z)V

    .line 455
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    const-string v2, "DPM"

    invoke-virtual {v1, v3, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 457
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 458
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 459
    const-string v1, "com.android.server.ACTION_EXPIRED_PASSWORD_NOTIFICATION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 460
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 461
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/DevicePolicyManagerService;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->handlePasswordExpirationNotification()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/DevicePolicyManagerService;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/DevicePolicyManagerService;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->resetGlobalProxy()V

    return-void
.end method

.method private getEncryptionStatus()I
    .registers 4

    .prologue
    .line 2026
    const-string v1, "ro.crypto.state"

    const-string v2, "unsupported"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2027
    .local v0, status:Ljava/lang/String;
    const-string v1, "encrypted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 2028
    const/4 v1, 0x3

    .line 2032
    :goto_11
    return v1

    .line 2029
    :cond_12
    const-string v1, "unencrypted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 2030
    const/4 v1, 0x1

    goto :goto_11

    .line 2032
    :cond_1c
    const/4 v1, 0x0

    goto :goto_11
.end method

.method private getIPowerManager()Landroid/os/IPowerManager;
    .registers 3

    .prologue
    .line 504
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mIPowerManager:Landroid/os/IPowerManager;

    if-nez v1, :cond_10

    .line 505
    const-string v1, "power"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 506
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mIPowerManager:Landroid/os/IPowerManager;

    .line 508
    .end local v0           #b:Landroid/os/IBinder;
    :cond_10
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mIPowerManager:Landroid/os/IPowerManager;

    return-object v1
.end method

.method private getPasswordExpirationLocked(Landroid/content/ComponentName;)J
    .registers 11
    .parameter "who"

    .prologue
    const-wide/16 v5, 0x0

    .line 1183
    if-eqz p1, :cond_d

    .line 1184
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1185
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_c

    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    .line 1197
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_c
    :goto_c
    return-wide v5

    .line 1188
    :cond_d
    const-wide/16 v3, 0x0

    .line 1189
    .local v3, timeout:J
    iget-object v7, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1190
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_16
    if-ge v2, v0, :cond_35

    .line 1191
    iget-object v7, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1192
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    cmp-long v7, v3, v5

    if-eqz v7, :cond_30

    iget-wide v7, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    cmp-long v7, v7, v5

    if-eqz v7, :cond_32

    iget-wide v7, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    cmp-long v7, v3, v7

    if-lez v7, :cond_32

    .line 1194
    :cond_30
    iget-wide v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    .line 1190
    :cond_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_35
    move-wide v5, v3

    .line 1197
    goto :goto_c
.end method

.method private getWindowManager()Landroid/view/IWindowManager;
    .registers 3

    .prologue
    .line 512
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mIWindowManager:Landroid/view/IWindowManager;

    if-nez v1, :cond_10

    .line 513
    const-string v1, "window"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 514
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mIWindowManager:Landroid/view/IWindowManager;

    .line 516
    .end local v0           #b:Landroid/os/IBinder;
    :cond_10
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mIWindowManager:Landroid/view/IWindowManager;

    return-object v1
.end method

.method private handlePasswordExpirationNotification()V
    .registers 12

    .prologue
    const-wide/16 v9, 0x0

    .line 902
    monitor-enter p0

    .line 903
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 904
    .local v3, now:J
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 905
    .local v0, N:I
    if-gtz v0, :cond_11

    .line 906
    monitor-exit p0

    .line 919
    :goto_10
    return-void

    .line 908
    :cond_11
    const/4 v2, 0x0

    .local v2, i:I
    :goto_12
    if-ge v2, v0, :cond_43

    .line 909
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 910
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    const/4 v6, 0x6

    invoke-virtual {v5, v6}, Landroid/app/admin/DeviceAdminInfo;->usesPolicy(I)Z

    move-result v5

    if-eqz v5, :cond_40

    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    cmp-long v5, v5, v9

    if-lez v5, :cond_40

    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    cmp-long v5, v5, v9

    if-lez v5, :cond_40

    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    const-wide/32 v7, 0x19bfcc00

    sub-long/2addr v5, v7

    cmp-long v5, v3, v5

    if-ltz v5, :cond_40

    .line 914
    const-string v5, "android.app.action.ACTION_PASSWORD_EXPIRING"

    invoke-virtual {p0, v1, v5}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;)V

    .line 908
    :cond_40
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 917
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_43
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v5}, Lcom/android/server/DevicePolicyManagerService;->setExpirationAlarmCheckLocked(Landroid/content/Context;)V

    .line 918
    monitor-exit p0

    goto :goto_10

    .end local v0           #N:I
    .end local v2           #i:I
    .end local v3           #now:J
    :catchall_4a
    move-exception v5

    monitor-exit p0
    :try_end_4c
    .catchall {:try_start_3 .. :try_end_4c} :catchall_4a

    throw v5
.end method

.method private isEncryptionSupported()Z
    .registers 2

    .prologue
    .line 2016
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->getEncryptionStatus()I

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private isExtStorageEncrypted()Z
    .registers 3

    .prologue
    .line 1678
    const-string v1, "vold.decrypt"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1679
    .local v0, state:Ljava/lang/String;
    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    const/4 v1, 0x1

    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method private loadSettingsLocked()V
    .registers 21

    .prologue
    .line 716
    invoke-static {}, Lcom/android/server/DevicePolicyManagerService;->makeJournaledFile()Lcom/android/internal/util/JournaledFile;

    move-result-object v6

    .line 717
    .local v6, journal:Lcom/android/internal/util/JournaledFile;
    const/4 v10, 0x0

    .line 718
    .local v10, stream:Ljava/io/FileInputStream;
    invoke-virtual {v6}, Lcom/android/internal/util/JournaledFile;->chooseForRead()Ljava/io/File;

    move-result-object v5

    .line 720
    .local v5, file:Ljava/io/File;
    :try_start_9
    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_e
    .catch Ljava/lang/NullPointerException; {:try_start_9 .. :try_end_e} :catch_3c6
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_e} :catch_3c3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_e} :catch_3c0
    .catch Ljava/io/FileNotFoundException; {:try_start_9 .. :try_end_e} :catch_3bd
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_e} :catch_3ba
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9 .. :try_end_e} :catch_3b8

    .line 721
    .end local v10           #stream:Ljava/io/FileInputStream;
    .local v11, stream:Ljava/io/FileInputStream;
    :try_start_e
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 722
    .local v9, parser:Lorg/xmlpull/v1/XmlPullParser;
    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-interface {v9, v11, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 726
    :cond_19
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v15

    .local v15, type:I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_29

    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v15, v0, :cond_19

    .line 728
    :cond_29
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 729
    .local v12, tag:Ljava/lang/String;
    const-string v17, "policies"

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_132

    .line 730
    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Settings do not start with policies tag: found "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_52
    .catch Ljava/lang/NullPointerException; {:try_start_e .. :try_end_52} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_52} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e .. :try_end_52} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_52} :catch_26e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_52} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_e .. :try_end_52} :catch_37a

    .line 786
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    :catch_52
    move-exception v4

    move-object v10, v11

    .line 787
    .end local v11           #stream:Ljava/io/FileInputStream;
    .local v4, e:Ljava/lang/NullPointerException;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    :goto_54
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "failed parsing "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 800
    .end local v4           #e:Ljava/lang/NullPointerException;
    :goto_7a
    if-eqz v10, :cond_7f

    .line 801
    :try_start_7c
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_7f} :catch_3b5

    .line 811
    :cond_7f
    :goto_7f
    new-instance v16, Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v17}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    .line 812
    .local v16, utils:Lcom/android/internal/widget/LockPatternUtils;
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/widget/LockPatternUtils;->getActivePasswordQuality()I

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_10e

    .line 813
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Active password quality 0x"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " does not match actual quality 0x"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/widget/LockPatternUtils;->getActivePasswordQuality()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 817
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    .line 818
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    .line 819
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    .line 820
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    .line 821
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    .line 822
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    .line 823
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    .line 824
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    .line 827
    :cond_10e
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/DevicePolicyManagerService;->validatePasswordOwnerLocked()V

    .line 828
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/DevicePolicyManagerService;->syncDeviceCapabilitiesLocked()V

    .line 830
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getMaximumTimeToLock(Landroid/content/ComponentName;)J

    move-result-wide v13

    .line 831
    .local v13, timeMs:J
    const-wide/16 v17, 0x0

    cmp-long v17, v13, v17

    if-gtz v17, :cond_127

    .line 832
    const-wide/32 v13, 0x7fffffff

    .line 835
    :cond_127
    :try_start_127
    invoke-direct/range {p0 .. p0}, Lcom/android/server/DevicePolicyManagerService;->getIPowerManager()Landroid/os/IPowerManager;

    move-result-object v17

    long-to-int v0, v13

    move/from16 v18, v0

    invoke-interface/range {v17 .. v18}, Landroid/os/IPowerManager;->setMaximumScreenOffTimeount(I)V
    :try_end_131
    .catch Landroid/os/RemoteException; {:try_start_127 .. :try_end_131} :catch_3a7

    .line 839
    :goto_131
    return-void

    .line 733
    .end local v10           #stream:Ljava/io/FileInputStream;
    .end local v13           #timeMs:J
    .end local v16           #utils:Lcom/android/internal/widget/LockPatternUtils;
    .restart local v9       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11       #stream:Ljava/io/FileInputStream;
    .restart local v12       #tag:Ljava/lang/String;
    .restart local v15       #type:I
    :cond_132
    :try_start_132
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v15

    .line 734
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v8

    .line 736
    .local v8, outerDepth:I
    :cond_13a
    :goto_13a
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v15

    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_3a4

    const/16 v17, 0x3

    move/from16 v0, v17

    if-ne v15, v0, :cond_152

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v17

    move/from16 v0, v17

    if-le v0, v8, :cond_3a4

    .line 737
    :cond_152
    const/16 v17, 0x3

    move/from16 v0, v17

    if-eq v15, v0, :cond_13a

    const/16 v17, 0x4

    move/from16 v0, v17

    if-eq v15, v0, :cond_13a

    .line 740
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 741
    const-string v17, "admin"

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1fa

    .line 742
    const/16 v17, 0x0

    const-string v18, "name"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_177
    .catch Ljava/lang/NullPointerException; {:try_start_132 .. :try_end_177} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_132 .. :try_end_177} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_132 .. :try_end_177} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_132 .. :try_end_177} :catch_26e
    .catch Ljava/io/IOException; {:try_start_132 .. :try_end_177} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_132 .. :try_end_177} :catch_37a

    move-result-object v7

    .line 744
    .local v7, name:Ljava/lang/String;
    :try_start_178
    invoke-static {v7}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->findAdmin(Landroid/content/ComponentName;)Landroid/app/admin/DeviceAdminInfo;

    move-result-object v3

    .line 746
    .local v3, dai:Landroid/app/admin/DeviceAdminInfo;
    if-eqz v3, :cond_13a

    .line 747
    new-instance v2, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    invoke-direct {v2, v3}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;-><init>(Landroid/app/admin/DeviceAdminInfo;)V

    .line 748
    .local v2, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    invoke-virtual {v2, v9}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->readFromXml(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    move-object/from16 v17, v0

    iget-object v0, v2, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1ae
    .catch Ljava/lang/RuntimeException; {:try_start_178 .. :try_end_1ae} :catch_1af
    .catch Ljava/lang/NullPointerException; {:try_start_178 .. :try_end_1ae} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_178 .. :try_end_1ae} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_178 .. :try_end_1ae} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_178 .. :try_end_1ae} :catch_26e
    .catch Ljava/io/IOException; {:try_start_178 .. :try_end_1ae} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_178 .. :try_end_1ae} :catch_37a

    goto :goto_13a

    .line 752
    .end local v2           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v3           #dai:Landroid/app/admin/DeviceAdminInfo;
    :catch_1af
    move-exception v4

    .line 753
    .local v4, e:Ljava/lang/RuntimeException;
    :try_start_1b0
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Failed loading admin "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1ce
    .catch Ljava/lang/NullPointerException; {:try_start_1b0 .. :try_end_1ce} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_1b0 .. :try_end_1ce} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1b0 .. :try_end_1ce} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_1b0 .. :try_end_1ce} :catch_26e
    .catch Ljava/io/IOException; {:try_start_1b0 .. :try_end_1ce} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1b0 .. :try_end_1ce} :catch_37a

    goto/16 :goto_13a

    .line 788
    .end local v4           #e:Ljava/lang/RuntimeException;
    .end local v7           #name:Ljava/lang/String;
    .end local v8           #outerDepth:I
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    :catch_1d0
    move-exception v4

    move-object v10, v11

    .line 789
    .end local v11           #stream:Ljava/io/FileInputStream;
    .local v4, e:Ljava/lang/NumberFormatException;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    :goto_1d2
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "failed parsing "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7a

    .line 755
    .end local v4           #e:Ljava/lang/NumberFormatException;
    .end local v10           #stream:Ljava/io/FileInputStream;
    .restart local v8       #outerDepth:I
    .restart local v9       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11       #stream:Ljava/io/FileInputStream;
    .restart local v12       #tag:Ljava/lang/String;
    .restart local v15       #type:I
    :cond_1fa
    :try_start_1fa
    const-string v17, "failed-password-attempts"

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_249

    .line 756
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    .line 758
    invoke-static {v9}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_21d
    .catch Ljava/lang/NullPointerException; {:try_start_1fa .. :try_end_21d} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_1fa .. :try_end_21d} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1fa .. :try_end_21d} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_1fa .. :try_end_21d} :catch_26e
    .catch Ljava/io/IOException; {:try_start_1fa .. :try_end_21d} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1fa .. :try_end_21d} :catch_37a

    goto/16 :goto_13a

    .line 790
    .end local v8           #outerDepth:I
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    :catch_21f
    move-exception v4

    move-object v10, v11

    .line 791
    .end local v11           #stream:Ljava/io/FileInputStream;
    .local v4, e:Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    :goto_221
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "failed parsing "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7a

    .line 759
    .end local v4           #e:Lorg/xmlpull/v1/XmlPullParserException;
    .end local v10           #stream:Ljava/io/FileInputStream;
    .restart local v8       #outerDepth:I
    .restart local v9       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11       #stream:Ljava/io/FileInputStream;
    .restart local v12       #tag:Ljava/lang/String;
    .restart local v15       #type:I
    :cond_249
    :try_start_249
    const-string v17, "password-owner"

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_272

    .line 760
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    .line 762
    invoke-static {v9}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_13a

    .line 792
    .end local v8           #outerDepth:I
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    :catch_26e
    move-exception v17

    move-object v10, v11

    .end local v11           #stream:Ljava/io/FileInputStream;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    goto/16 :goto_7a

    .line 763
    .end local v10           #stream:Ljava/io/FileInputStream;
    .restart local v8       #outerDepth:I
    .restart local v9       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11       #stream:Ljava/io/FileInputStream;
    .restart local v12       #tag:Ljava/lang/String;
    .restart local v15       #type:I
    :cond_272
    const-string v17, "active-password"

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_35b

    .line 764
    const/16 v17, 0x0

    const-string v18, "quality"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    .line 766
    const/16 v17, 0x0

    const-string v18, "length"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    .line 768
    const/16 v17, 0x0

    const-string v18, "uppercase"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    .line 770
    const/16 v17, 0x0

    const-string v18, "lowercase"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    .line 772
    const/16 v17, 0x0

    const-string v18, "letters"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    .line 774
    const/16 v17, 0x0

    const-string v18, "numeric"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    .line 776
    const/16 v17, 0x0

    const-string v18, "symbols"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    .line 778
    const/16 v17, 0x0

    const-string v18, "nonletter"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    .line 780
    invoke-static {v9}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_32f
    .catch Ljava/lang/NullPointerException; {:try_start_249 .. :try_end_32f} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_249 .. :try_end_32f} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_249 .. :try_end_32f} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_249 .. :try_end_32f} :catch_26e
    .catch Ljava/io/IOException; {:try_start_249 .. :try_end_32f} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_249 .. :try_end_32f} :catch_37a

    goto/16 :goto_13a

    .line 794
    .end local v8           #outerDepth:I
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    :catch_331
    move-exception v4

    move-object v10, v11

    .line 795
    .end local v11           #stream:Ljava/io/FileInputStream;
    .local v4, e:Ljava/io/IOException;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    :goto_333
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "failed parsing "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7a

    .line 782
    .end local v4           #e:Ljava/io/IOException;
    .end local v10           #stream:Ljava/io/FileInputStream;
    .restart local v8       #outerDepth:I
    .restart local v9       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11       #stream:Ljava/io/FileInputStream;
    .restart local v12       #tag:Ljava/lang/String;
    .restart local v15       #type:I
    :cond_35b
    :try_start_35b
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unknown tag: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    invoke-static {v9}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_378
    .catch Ljava/lang/NullPointerException; {:try_start_35b .. :try_end_378} :catch_52
    .catch Ljava/lang/NumberFormatException; {:try_start_35b .. :try_end_378} :catch_1d0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_35b .. :try_end_378} :catch_21f
    .catch Ljava/io/FileNotFoundException; {:try_start_35b .. :try_end_378} :catch_26e
    .catch Ljava/io/IOException; {:try_start_35b .. :try_end_378} :catch_331
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_35b .. :try_end_378} :catch_37a

    goto/16 :goto_13a

    .line 796
    .end local v8           #outerDepth:I
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    :catch_37a
    move-exception v4

    move-object v10, v11

    .line 797
    .end local v11           #stream:Ljava/io/FileInputStream;
    .local v4, e:Ljava/lang/IndexOutOfBoundsException;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    :goto_37c
    const-string v17, "DevicePolicyManagerService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "failed parsing "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7a

    .end local v4           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v10           #stream:Ljava/io/FileInputStream;
    .restart local v8       #outerDepth:I
    .restart local v9       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11       #stream:Ljava/io/FileInputStream;
    .restart local v12       #tag:Ljava/lang/String;
    .restart local v15       #type:I
    :cond_3a4
    move-object v10, v11

    .line 798
    .end local v11           #stream:Ljava/io/FileInputStream;
    .restart local v10       #stream:Ljava/io/FileInputStream;
    goto/16 :goto_7a

    .line 836
    .end local v8           #outerDepth:I
    .end local v9           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v12           #tag:Ljava/lang/String;
    .end local v15           #type:I
    .restart local v13       #timeMs:J
    .restart local v16       #utils:Lcom/android/internal/widget/LockPatternUtils;
    :catch_3a7
    move-exception v4

    .line 837
    .local v4, e:Landroid/os/RemoteException;
    const-string v17, "DevicePolicyManagerService"

    const-string v18, "Failure talking with power manager"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_131

    .line 803
    .end local v4           #e:Landroid/os/RemoteException;
    .end local v13           #timeMs:J
    .end local v16           #utils:Lcom/android/internal/widget/LockPatternUtils;
    :catch_3b5
    move-exception v17

    goto/16 :goto_7f

    .line 796
    :catch_3b8
    move-exception v4

    goto :goto_37c

    .line 794
    :catch_3ba
    move-exception v4

    goto/16 :goto_333

    .line 792
    :catch_3bd
    move-exception v17

    goto/16 :goto_7a

    .line 790
    :catch_3c0
    move-exception v4

    goto/16 :goto_221

    .line 788
    :catch_3c3
    move-exception v4

    goto/16 :goto_1d2

    .line 786
    :catch_3c6
    move-exception v4

    goto/16 :goto_54
.end method

.method private static makeJournaledFile()Lcom/android/internal/util/JournaledFile;
    .registers 5

    .prologue
    .line 636
    const-string v0, "/data/system/device_policies.xml"

    .line 637
    .local v0, base:Ljava/lang/String;
    new-instance v1, Lcom/android/internal/util/JournaledFile;

    new-instance v2, Ljava/io/File;

    const-string v3, "/data/system/device_policies.xml"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    const-string v4, "/data/system/device_policies.xml.tmp"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lcom/android/internal/util/JournaledFile;-><init>(Ljava/io/File;Ljava/io/File;)V

    return-object v1
.end method

.method private resetGlobalProxy()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 1899
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1900
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_8
    if-ge v2, v0, :cond_21

    .line 1901
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1902
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-boolean v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->specifiesGlobalProxy:Z

    if-eqz v3, :cond_1e

    .line 1903
    iget-object v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->globalProxySpec:Ljava/lang/String;

    iget-object v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->globalProxyExclusionList:Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/android/server/DevicePolicyManagerService;->saveGlobalProxy(Ljava/lang/String;Ljava/lang/String;)V

    .line 1909
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_1d
    return-void

    .line 1900
    .restart local v1       #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 1908
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_21
    invoke-direct {p0, v4, v4}, Lcom/android/server/DevicePolicyManagerService;->saveGlobalProxy(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d
.end method

.method private saveGlobalProxy(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .parameter "proxySpec"
    .parameter "exclusionList"

    .prologue
    const/4 v4, 0x1

    .line 1912
    if-nez p2, :cond_5

    .line 1913
    const-string p2, ""

    .line 1915
    :cond_5
    if-nez p1, :cond_9

    .line 1916
    const-string p1, ""

    .line 1919
    :cond_9
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1920
    const-string v3, ":"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1921
    .local v0, data:[Ljava/lang/String;
    const/16 v1, 0x1f90

    .line 1922
    .local v1, proxyPort:I
    array-length v3, v0

    if-le v3, v4, :cond_1f

    .line 1924
    const/4 v3, 0x1

    :try_start_19
    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1e
    .catch Ljava/lang/NumberFormatException; {:try_start_19 .. :try_end_1e} :catch_3c

    move-result v1

    .line 1927
    :cond_1f
    :goto_1f
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 1928
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 1929
    .local v2, res:Landroid/content/ContentResolver;
    const-string v3, "global_http_proxy_host"

    const/4 v4, 0x0

    aget-object v4, v0, v4

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1930
    const-string v3, "global_http_proxy_port"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1931
    const-string v3, "global_http_proxy_exclusion_list"

    invoke-static {v2, v3, p2}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1933
    return-void

    .line 1925
    .end local v2           #res:Landroid/content/ContentResolver;
    :catch_3c
    move-exception v3

    goto :goto_1f
.end method

.method private saveSettingsLocked()V
    .registers 12

    .prologue
    .line 641
    invoke-static {}, Lcom/android/server/DevicePolicyManagerService;->makeJournaledFile()Lcom/android/internal/util/JournaledFile;

    move-result-object v4

    .line 642
    .local v4, journal:Lcom/android/internal/util/JournaledFile;
    const/4 v6, 0x0

    .line 644
    .local v6, stream:Ljava/io/FileOutputStream;
    :try_start_5
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-virtual {v4}, Lcom/android/internal/util/JournaledFile;->chooseForWrite()Ljava/io/File;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_f} :catch_135

    .line 645
    .end local v6           #stream:Ljava/io/FileOutputStream;
    .local v7, stream:Ljava/io/FileOutputStream;
    :try_start_f
    new-instance v5, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v5}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 646
    .local v5, out:Lorg/xmlpull/v1/XmlSerializer;
    const-string v8, "utf-8"

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 647
    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 649
    const/4 v8, 0x0

    const-string v9, "policies"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 651
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 652
    .local v0, N:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_2f
    if-ge v3, v0, :cond_5d

    .line 653
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 654
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_5a

    .line 655
    const/4 v8, 0x0

    const-string v9, "admin"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 656
    const/4 v8, 0x0

    const-string v9, "name"

    iget-object v10, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v10}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 657
    invoke-virtual {v1, v5}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->writeToXml(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 658
    const/4 v8, 0x0

    const-string v9, "admin"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 652
    :cond_5a
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f

    .line 662
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_5d
    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    if-ltz v8, :cond_79

    .line 663
    const/4 v8, 0x0

    const-string v9, "password-owner"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 664
    const/4 v8, 0x0

    const-string v9, "value"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 665
    const/4 v8, 0x0

    const-string v9, "password-owner"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 668
    :cond_79
    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    if-eqz v8, :cond_95

    .line 669
    const/4 v8, 0x0

    const-string v9, "failed-password-attempts"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 670
    const/4 v8, 0x0

    const-string v9, "value"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 671
    const/4 v8, 0x0

    const-string v9, "failed-password-attempts"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 674
    :cond_95
    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    if-nez v8, :cond_b5

    iget v8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    if-eqz v8, :cond_121

    .line 678
    :cond_b5
    const/4 v8, 0x0

    const-string v9, "active-password"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 679
    const/4 v8, 0x0

    const-string v9, "quality"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 680
    const/4 v8, 0x0

    const-string v9, "length"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 681
    const/4 v8, 0x0

    const-string v9, "uppercase"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 682
    const/4 v8, 0x0

    const-string v9, "lowercase"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 683
    const/4 v8, 0x0

    const-string v9, "letters"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 684
    const/4 v8, 0x0

    const-string v9, "numeric"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 686
    const/4 v8, 0x0

    const-string v9, "symbols"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 687
    const/4 v8, 0x0

    const-string v9, "nonletter"

    iget v10, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v5, v8, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 688
    const/4 v8, 0x0

    const-string v9, "active-password"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 691
    :cond_121
    const/4 v8, 0x0

    const-string v9, "policies"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 693
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 694
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 695
    invoke-virtual {v4}, Lcom/android/internal/util/JournaledFile;->commit()V

    .line 696
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->sendChangedNotification()V
    :try_end_133
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_133} :catch_141

    move-object v6, v7

    .line 707
    .end local v0           #N:I
    .end local v3           #i:I
    .end local v5           #out:Lorg/xmlpull/v1/XmlSerializer;
    .end local v7           #stream:Ljava/io/FileOutputStream;
    .restart local v6       #stream:Ljava/io/FileOutputStream;
    :goto_134
    return-void

    .line 697
    :catch_135
    move-exception v2

    .line 699
    .local v2, e:Ljava/io/IOException;
    :goto_136
    if-eqz v6, :cond_13b

    .line 700
    :try_start_138
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_13b
    .catch Ljava/io/IOException; {:try_start_138 .. :try_end_13b} :catch_13f

    .line 705
    :cond_13b
    :goto_13b
    invoke-virtual {v4}, Lcom/android/internal/util/JournaledFile;->rollback()V

    goto :goto_134

    .line 702
    :catch_13f
    move-exception v8

    goto :goto_13b

    .line 697
    .end local v2           #e:Ljava/io/IOException;
    .end local v6           #stream:Ljava/io/FileOutputStream;
    .restart local v7       #stream:Ljava/io/FileOutputStream;
    :catch_141
    move-exception v2

    move-object v6, v7

    .end local v7           #stream:Ljava/io/FileOutputStream;
    .restart local v6       #stream:Ljava/io/FileOutputStream;
    goto :goto_136
.end method

.method private sendChangedNotification()V
    .registers 3

    .prologue
    .line 710
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 711
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x4000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 712
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 713
    return-void
.end method

.method private setEncryptionRequested(Z)V
    .registers 2
    .parameter "encrypt"

    .prologue
    .line 2040
    return-void
.end method

.method private updatePasswordExpirationsLocked()V
    .registers 12

    .prologue
    const-wide/16 v7, 0x0

    .line 1784
    iget-object v9, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1785
    .local v0, N:I
    if-lez v0, :cond_34

    .line 1786
    const/4 v4, 0x0

    .local v4, i:I
    :goto_b
    if-ge v4, v0, :cond_31

    .line 1787
    iget-object v9, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1788
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v9, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    const/4 v10, 0x6

    invoke-virtual {v9, v10}, Landroid/app/admin/DeviceAdminInfo;->usesPolicy(I)Z

    move-result v9

    if-eqz v9, :cond_2c

    .line 1789
    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    .line 1790
    .local v5, timeout:J
    cmp-long v9, v5, v7

    if-lez v9, :cond_2f

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    add-long v2, v5, v9

    .line 1791
    .local v2, expiration:J
    :goto_2a
    iput-wide v2, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    .line 1786
    .end local v2           #expiration:J
    .end local v5           #timeout:J
    :cond_2c
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .restart local v5       #timeout:J
    :cond_2f
    move-wide v2, v7

    .line 1790
    goto :goto_2a

    .line 1794
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v5           #timeout:J
    :cond_31
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1796
    .end local v4           #i:I
    :cond_34
    return-void
.end method

.method static validateQualityConstant(I)V
    .registers 4
    .parameter "quality"

    .prologue
    .line 842
    sparse-switch p0, :sswitch_data_22

    .line 852
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid quality constant: 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 850
    :sswitch_20
    return-void

    .line 842
    nop

    :sswitch_data_22
    .sparse-switch
        0x0 -> :sswitch_20
        0x8000 -> :sswitch_20
        0x10000 -> :sswitch_20
        0x20000 -> :sswitch_20
        0x40000 -> :sswitch_20
        0x50000 -> :sswitch_20
        0x60000 -> :sswitch_20
    .end sparse-switch
.end method


# virtual methods
.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 10
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 2091
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.DUMP"

    invoke-virtual {v4, v5}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_33

    .line 2094
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Permission Denial: can\'t dump DevicePolicyManagerService from from pid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", uid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2129
    :goto_32
    return-void

    .line 2100
    :cond_33
    new-instance v3, Landroid/util/PrintWriterPrinter;

    invoke-direct {v3, p2}, Landroid/util/PrintWriterPrinter;-><init>(Ljava/io/PrintWriter;)V

    .line 2102
    .local v3, p:Landroid/util/Printer;
    monitor-enter p0

    .line 2103
    :try_start_39
    const-string v4, "Current Device Policy Manager state:"

    invoke-interface {v3, v4}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 2105
    const-string v4, "  Enabled Device Admins:"

    invoke-interface {v3, v4}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 2106
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2107
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_4a
    if-ge v2, v0, :cond_75

    .line 2108
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 2109
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_72

    .line 2110
    const-string v4, "  "

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v4}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2111
    const-string v4, ":"

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2112
    const-string v4, "    "

    invoke-virtual {v1, v4, p2}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 2107
    :cond_72
    add-int/lit8 v2, v2, 0x1

    goto :goto_4a

    .line 2116
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_75
    const-string v4, " "

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2117
    const-string v4, "  mActivePasswordQuality=0x"

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2118
    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2119
    const-string v4, "  mActivePasswordLength="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2120
    const-string v4, "  mActivePasswordUpperCase="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2121
    const-string v4, "  mActivePasswordLowerCase="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2122
    const-string v4, "  mActivePasswordLetters="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2123
    const-string v4, "  mActivePasswordNumeric="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2124
    const-string v4, "  mActivePasswordSymbols="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2125
    const-string v4, "  mActivePasswordNonLetter="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2126
    const-string v4, "  mFailedPasswordAttempts="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2127
    const-string v4, "  mPasswordOwner="

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(I)V

    .line 2128
    monitor-exit p0

    goto/16 :goto_32

    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_e5
    move-exception v4

    monitor-exit p0
    :try_end_e7
    .catchall {:try_start_39 .. :try_end_e7} :catchall_e5

    throw v4
.end method

.method public findAdmin(Landroid/content/ComponentName;)Landroid/app/admin/DeviceAdminInfo;
    .registers 9
    .parameter "adminName"

    .prologue
    const/4 v5, 0x0

    .line 616
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 617
    .local v2, resolveIntent:Landroid/content/Intent;
    invoke-virtual {v2, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 618
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 620
    .local v1, infos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v1, :cond_1d

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-gtz v3, :cond_36

    .line 621
    :cond_1d
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown admin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 625
    :cond_36
    :try_start_36
    new-instance v4, Landroid/app/admin/DeviceAdminInfo;

    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    invoke-direct {v4, v6, v3}, Landroid/app/admin/DeviceAdminInfo;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;)V
    :try_end_44
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_36 .. :try_end_44} :catch_46
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_44} :catch_61

    move-object v3, v4

    .line 631
    :goto_45
    return-object v3

    .line 626
    :catch_46
    move-exception v0

    .line 627
    .local v0, e:Lorg/xmlpull/v1/XmlPullParserException;
    const-string v3, "DevicePolicyManagerService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad device admin requested: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v3, v5

    .line 628
    goto :goto_45

    .line 629
    .end local v0           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :catch_61
    move-exception v0

    .line 630
    .local v0, e:Ljava/io/IOException;
    const-string v3, "DevicePolicyManagerService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad device admin requested: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v3, v5

    .line 631
    goto :goto_45
.end method

.method getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .registers 10
    .parameter "who"
    .parameter "reqPolicy"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 531
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 532
    .local v2, callingUid:I
    if-eqz p1, :cond_8d

    .line 533
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 534
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-nez v1, :cond_29

    .line 535
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No active admin "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 537
    :cond_29
    invoke-virtual {v1}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->getUid()I

    move-result v4

    if-eq v4, v2, :cond_56

    .line 538
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Admin "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not owned by uid "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 541
    :cond_56
    iget-object v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v4, p2}, Landroid/app/admin/DeviceAdminInfo;->usesPolicy(I)Z

    move-result v4

    if-nez v4, :cond_ac

    .line 542
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Admin "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v6}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " did not specify uses-policy for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v6, p2}, Landroid/app/admin/DeviceAdminInfo;->getTagForPolicy(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 548
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_8d
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 549
    .local v0, N:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_94
    if-ge v3, v0, :cond_b0

    .line 550
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 551
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    invoke-virtual {v1}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->getUid()I

    move-result v4

    if-ne v4, v2, :cond_ad

    iget-object v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v4, p2}, Landroid/app/admin/DeviceAdminInfo;->usesPolicy(I)Z

    move-result v4

    if-eqz v4, :cond_ad

    .line 552
    .end local v0           #N:I
    .end local v3           #i:I
    :cond_ac
    return-object v1

    .line 549
    .restart local v0       #N:I
    .restart local v3       #i:I
    :cond_ad
    add-int/lit8 v3, v3, 0x1

    goto :goto_94

    .line 555
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_b0
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No active admin owned by uid "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for policy #"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .registers 5
    .parameter "who"

    .prologue
    .line 520
    iget-object v1, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 521
    .local v0, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v0, :cond_2f

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v2}, Landroid/app/admin/DeviceAdminInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v2}, Landroid/app/admin/DeviceAdminInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 526
    .end local v0           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_2e
    return-object v0

    .restart local v0       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2f
    const/4 v0, 0x0

    goto :goto_2e
.end method

.method public getActiveAdmins()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .prologue
    .line 982
    monitor-enter p0

    .line 983
    :try_start_1
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 984
    .local v0, N:I
    if-gtz v0, :cond_c

    .line 985
    const/4 v2, 0x0

    monitor-exit p0

    .line 991
    :goto_b
    return-object v2

    .line 987
    :cond_c
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 988
    .local v2, res:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ComponentName;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_12
    if-ge v1, v0, :cond_28

    .line 989
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    iget-object v3, v3, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v3}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 988
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 991
    :cond_28
    monitor-exit p0

    goto :goto_b

    .line 992
    .end local v0           #N:I
    .end local v1           #i:I
    .end local v2           #res:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ComponentName;>;"
    :catchall_2a
    move-exception v3

    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_1 .. :try_end_2c} :catchall_2a

    throw v3
.end method

.method public getCameraDisabled(Landroid/content/ComponentName;)Z
    .registers 7
    .parameter "who"

    .prologue
    const/4 v3, 0x0

    .line 2071
    monitor-enter p0

    .line 2072
    if-eqz p1, :cond_e

    .line 2073
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 2074
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_c

    iget-boolean v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->disableCamera:Z

    :cond_c
    monitor-exit p0

    .line 2085
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v3

    .line 2078
    :cond_e
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2079
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_15
    if-ge v2, v0, :cond_2c

    .line 2080
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 2081
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-boolean v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->disableCamera:Z

    if-eqz v4, :cond_29

    .line 2082
    const/4 v3, 0x1

    monitor-exit p0

    goto :goto_d

    .line 2086
    .end local v0           #N:I
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v2           #i:I
    :catchall_26
    move-exception v3

    monitor-exit p0
    :try_end_28
    .catchall {:try_start_4 .. :try_end_28} :catchall_26

    throw v3

    .line 2079
    .restart local v0       #N:I
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .restart local v2       #i:I
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 2085
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2c
    :try_start_2c
    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_26

    goto :goto_d
.end method

.method public getCurrentFailedPasswordAttempts()I
    .registers 3

    .prologue
    .line 1433
    monitor-enter p0

    .line 1436
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_3
    invoke-virtual {p0, v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1438
    iget v0, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    monitor-exit p0

    return v0

    .line 1439
    :catchall_a
    move-exception v0

    monitor-exit p0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public getGlobalProxyAdmin()Landroid/content/ComponentName;
    .registers 5

    .prologue
    .line 1881
    monitor-enter p0

    .line 1884
    :try_start_1
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1885
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_8
    if-ge v2, v0, :cond_21

    .line 1886
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1887
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-boolean v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->specifiesGlobalProxy:Z

    if-eqz v3, :cond_1e

    .line 1890
    iget-object v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v3}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    monitor-exit p0

    .line 1895
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_1d
    return-object v3

    .line 1885
    .restart local v1       #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 1893
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_21
    monitor-exit p0

    .line 1895
    const/4 v3, 0x0

    goto :goto_1d

    .line 1893
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_24
    move-exception v3

    monitor-exit p0
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_24

    throw v3
.end method

.method public getMaximumFailedPasswordsForWipe(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1458
    monitor-enter p0

    .line 1459
    const/4 v2, 0x0

    .line 1461
    .local v2, count:I
    if-eqz p1, :cond_10

    .line 1462
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1463
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    :goto_c
    monitor-exit p0

    .line 1476
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v2

    .line 1463
    goto :goto_c

    .line 1466
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1467
    .local v0, N:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_17
    if-ge v3, v0, :cond_33

    .line 1468
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1469
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-nez v2, :cond_28

    .line 1470
    iget v2, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    .line 1467
    :cond_25
    :goto_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    .line 1471
    :cond_28
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    if-eqz v4, :cond_25

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    if-le v2, v4, :cond_25

    .line 1473
    iget v2, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    goto :goto_25

    .line 1476
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_33
    monitor-exit p0

    move v4, v2

    goto :goto_d

    .line 1477
    .end local v0           #N:I
    .end local v3           #i:I
    :catchall_36
    move-exception v4

    monitor-exit p0
    :try_end_38
    .catchall {:try_start_4 .. :try_end_38} :catchall_36

    throw v4
.end method

.method public getMaximumTimeToLock(Landroid/content/ComponentName;)J
    .registers 11
    .parameter "who"

    .prologue
    const-wide/16 v7, 0x0

    .line 1632
    monitor-enter p0

    .line 1633
    const-wide/16 v3, 0x0

    .line 1635
    .local v3, time:J
    if-eqz p1, :cond_13

    .line 1636
    :try_start_7
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1637
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_11

    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    :goto_f
    monitor-exit p0

    .line 1650
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_10
    return-wide v5

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_11
    move-wide v5, v3

    .line 1637
    goto :goto_f

    .line 1640
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_13
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1641
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1a
    if-ge v2, v0, :cond_3c

    .line 1642
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1643
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    cmp-long v5, v3, v7

    if-nez v5, :cond_2d

    .line 1644
    iget-wide v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    .line 1641
    :cond_2a
    :goto_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 1645
    :cond_2d
    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_2a

    iget-wide v5, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    cmp-long v5, v3, v5

    if-lez v5, :cond_2a

    .line 1647
    iget-wide v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    goto :goto_2a

    .line 1650
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_3c
    monitor-exit p0

    move-wide v5, v3

    goto :goto_10

    .line 1651
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_3f
    move-exception v5

    monitor-exit p0
    :try_end_41
    .catchall {:try_start_7 .. :try_end_41} :catchall_3f

    throw v5
.end method

.method public getPasswordExpiration(Landroid/content/ComponentName;)J
    .registers 4
    .parameter "who"

    .prologue
    .line 1201
    monitor-enter p0

    .line 1202
    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordExpirationLocked(Landroid/content/ComponentName;)J

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    .line 1203
    :catchall_7
    move-exception v0

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public getPasswordExpirationTimeout(Landroid/content/ComponentName;)J
    .registers 11
    .parameter "who"

    .prologue
    const-wide/16 v5, 0x0

    .line 1159
    monitor-enter p0

    .line 1160
    if-eqz p1, :cond_11

    .line 1161
    :try_start_5
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1162
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_f

    iget-wide v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    :goto_d
    monitor-exit p0

    .line 1174
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_e
    return-wide v3

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_f
    move-wide v3, v5

    .line 1162
    goto :goto_d

    .line 1165
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_11
    const-wide/16 v3, 0x0

    .line 1166
    .local v3, timeout:J
    iget-object v7, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1167
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1a
    if-ge v2, v0, :cond_39

    .line 1168
    iget-object v7, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1169
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    cmp-long v7, v3, v5

    if-eqz v7, :cond_34

    iget-wide v7, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    cmp-long v7, v7, v5

    if-eqz v7, :cond_36

    iget-wide v7, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    cmp-long v7, v3, v7

    if-lez v7, :cond_36

    .line 1171
    :cond_34
    iget-wide v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    .line 1167
    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 1174
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_39
    monitor-exit p0

    goto :goto_e

    .line 1175
    .end local v0           #N:I
    .end local v2           #i:I
    .end local v3           #timeout:J
    :catchall_3b
    move-exception v5

    monitor-exit p0
    :try_end_3d
    .catchall {:try_start_5 .. :try_end_3d} :catchall_3b

    throw v5
.end method

.method public getPasswordHistoryLength(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1111
    monitor-enter p0

    .line 1112
    const/4 v3, 0x0

    .line 1114
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1115
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1116
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordHistoryLength:I

    :goto_c
    monitor-exit p0

    .line 1126
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1116
    goto :goto_c

    .line 1119
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1120
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1121
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1122
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordHistoryLength:I

    if-ge v3, v4, :cond_27

    .line 1123
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordHistoryLength:I

    .line 1120
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1126
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1127
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumLength(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1077
    monitor-enter p0

    .line 1078
    const/4 v3, 0x0

    .line 1080
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1081
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1082
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLength:I

    :goto_c
    monitor-exit p0

    .line 1092
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1082
    goto :goto_c

    .line 1085
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1086
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1087
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1088
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLength:I

    if-ge v3, v4, :cond_27

    .line 1089
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLength:I

    .line 1086
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1092
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1093
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumLetters(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1289
    monitor-enter p0

    .line 1290
    const/4 v3, 0x0

    .line 1292
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1293
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1294
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLetters:I

    :goto_c
    monitor-exit p0

    .line 1304
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1294
    goto :goto_c

    .line 1297
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1298
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1299
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1300
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLetters:I

    if-ge v3, v4, :cond_27

    .line 1301
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLetters:I

    .line 1298
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1304
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1305
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumLowerCase(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1255
    monitor-enter p0

    .line 1256
    const/4 v3, 0x0

    .line 1258
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1259
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1260
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLowerCase:I

    :goto_c
    monitor-exit p0

    .line 1270
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1260
    goto :goto_c

    .line 1263
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1264
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1265
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1266
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLowerCase:I

    if-ge v3, v4, :cond_27

    .line 1267
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLowerCase:I

    .line 1264
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1270
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1271
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumNonLetter(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1391
    monitor-enter p0

    .line 1392
    const/4 v3, 0x0

    .line 1394
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1395
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1396
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNonLetter:I

    :goto_c
    monitor-exit p0

    .line 1406
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1396
    goto :goto_c

    .line 1399
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1400
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1401
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1402
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNonLetter:I

    if-ge v3, v4, :cond_27

    .line 1403
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNonLetter:I

    .line 1400
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1406
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1407
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumNumeric(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1323
    monitor-enter p0

    .line 1324
    const/4 v3, 0x0

    .line 1326
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1327
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1328
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNumeric:I

    :goto_c
    monitor-exit p0

    .line 1338
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1328
    goto :goto_c

    .line 1331
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1332
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1333
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1334
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNumeric:I

    if-ge v3, v4, :cond_27

    .line 1335
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNumeric:I

    .line 1332
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1338
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1339
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumSymbols(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1357
    monitor-enter p0

    .line 1358
    const/4 v3, 0x0

    .line 1360
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1361
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1362
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordSymbols:I

    :goto_c
    monitor-exit p0

    .line 1372
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1362
    goto :goto_c

    .line 1365
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1366
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1367
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1368
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordSymbols:I

    if-ge v3, v4, :cond_27

    .line 1369
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordSymbols:I

    .line 1366
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1372
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1373
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordMinimumUpperCase(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1221
    monitor-enter p0

    .line 1222
    const/4 v3, 0x0

    .line 1224
    .local v3, length:I
    if-eqz p1, :cond_10

    .line 1225
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1226
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordUpperCase:I

    :goto_c
    monitor-exit p0

    .line 1236
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1226
    goto :goto_c

    .line 1229
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1230
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1231
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1232
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordUpperCase:I

    if-ge v3, v4, :cond_27

    .line 1233
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordUpperCase:I

    .line 1230
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1236
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1237
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getPasswordQuality(Landroid/content/ComponentName;)I
    .registers 7
    .parameter "who"

    .prologue
    .line 1043
    monitor-enter p0

    .line 1044
    const/4 v3, 0x0

    .line 1046
    .local v3, mode:I
    if-eqz p1, :cond_10

    .line 1047
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1048
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordQuality:I

    :goto_c
    monitor-exit p0

    .line 1058
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v4

    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v4, v3

    .line 1048
    goto :goto_c

    .line 1051
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1052
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2a

    .line 1053
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1054
    .restart local v1       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordQuality:I

    if-ge v3, v4, :cond_27

    .line 1055
    iget v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordQuality:I

    .line 1052
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1058
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_2a
    monitor-exit p0

    move v4, v3

    goto :goto_d

    .line 1059
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_2d
    move-exception v4

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_4 .. :try_end_2f} :catchall_2d

    throw v4
.end method

.method public getRemoveWarning(Landroid/content/ComponentName;Landroid/os/RemoteCallback;)V
    .registers 12
    .parameter "comp"
    .parameter "result"

    .prologue
    const/4 v3, 0x0

    .line 1718
    iget-object v0, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.BIND_DEVICE_ADMIN"

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1721
    monitor-enter p0

    .line 1722
    :try_start_9
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_36

    move-result-object v8

    .line 1723
    .local v8, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-nez v8, :cond_15

    .line 1725
    const/4 v0, 0x0

    :try_start_10
    invoke-virtual {p2, v0}, Landroid/os/RemoteCallback;->sendResult(Landroid/os/Bundle;)V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_36
    .catch Landroid/os/RemoteException; {:try_start_10 .. :try_end_13} :catch_39

    .line 1728
    :goto_13
    :try_start_13
    monitor-exit p0

    .line 1742
    :goto_14
    return-void

    .line 1730
    :cond_15
    new-instance v1, Landroid/content/Intent;

    const-string v0, "android.app.action.DEVICE_ADMIN_DISABLE_REQUESTED"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1731
    .local v1, intent:Landroid/content/Intent;
    iget-object v0, v8, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v0}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1732
    iget-object v0, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    new-instance v3, Lcom/android/server/DevicePolicyManagerService$3;

    invoke-direct {v3, p0, p2}, Lcom/android/server/DevicePolicyManagerService$3;-><init>(Lcom/android/server/DevicePolicyManagerService;Landroid/os/RemoteCallback;)V

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 1741
    monitor-exit p0

    goto :goto_14

    .end local v1           #intent:Landroid/content/Intent;
    .end local v8           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :catchall_36
    move-exception v0

    monitor-exit p0
    :try_end_38
    .catchall {:try_start_13 .. :try_end_38} :catchall_36

    throw v0

    .line 1726
    .restart local v8       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :catch_39
    move-exception v0

    goto :goto_13
.end method

.method public getStorageEncryption(Landroid/content/ComponentName;)Z
    .registers 7
    .parameter "who"

    .prologue
    const/4 v4, 0x0

    .line 1981
    monitor-enter p0

    .line 1983
    if-eqz p1, :cond_10

    .line 1985
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1986
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v1, :cond_e

    iget-boolean v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->encryptionRequested:Z

    :goto_c
    monitor-exit p0

    .line 1997
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :goto_d
    return v3

    .restart local v1       #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_e
    move v3, v4

    .line 1986
    goto :goto_c

    .line 1991
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_10
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1992
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_2e

    .line 1993
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    iget-boolean v3, v3, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->encryptionRequested:Z

    if-eqz v3, :cond_2b

    .line 1994
    const/4 v3, 0x1

    monitor-exit p0

    goto :goto_d

    .line 1998
    .end local v0           #N:I
    .end local v2           #i:I
    :catchall_28
    move-exception v3

    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_4 .. :try_end_2a} :catchall_28

    throw v3

    .line 1992
    .restart local v0       #N:I
    .restart local v2       #i:I
    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 1997
    :cond_2e
    :try_start_2e
    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_28

    move v3, v4

    goto :goto_d
.end method

.method public getStorageEncryptionStatus()I
    .registers 2

    .prologue
    .line 2005
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->getEncryptionStatus()I

    move-result v0

    return v0
.end method

.method public hasGrantedPolicy(Landroid/content/ComponentName;I)Z
    .registers 7
    .parameter "adminReceiver"
    .parameter "policyId"

    .prologue
    .line 972
    monitor-enter p0

    .line 973
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 974
    .local v0, administrator:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-nez v0, :cond_23

    .line 975
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No active admin "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 978
    .end local v0           #administrator:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :catchall_20
    move-exception v1

    monitor-exit p0
    :try_end_22
    .catchall {:try_start_1 .. :try_end_22} :catchall_20

    throw v1

    .line 977
    .restart local v0       #administrator:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_23
    :try_start_23
    iget-object v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v1, p2}, Landroid/app/admin/DeviceAdminInfo;->usesPolicy(I)Z

    move-result v1

    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_23 .. :try_end_2a} :catchall_20

    return v1
.end method

.method public isActivePasswordSufficient()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1411
    monitor-enter p0

    .line 1414
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_5
    invoke-virtual {p0, v2, v3}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1416
    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordQuality(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_1a

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumLength(Landroid/content/ComponentName;)I

    move-result v3

    if-ge v2, v3, :cond_1d

    .line 1418
    :cond_1a
    monitor-exit p0

    move v0, v1

    .line 1423
    :goto_1c
    return v0

    .line 1420
    :cond_1d
    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    const/high16 v3, 0x6

    if-eq v2, v3, :cond_28

    .line 1421
    monitor-exit p0

    goto :goto_1c

    .line 1429
    :catchall_25
    move-exception v0

    monitor-exit p0
    :try_end_27
    .catchall {:try_start_5 .. :try_end_27} :catchall_25

    throw v0

    .line 1423
    :cond_28
    :try_start_28
    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumUpperCase(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_60

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumLowerCase(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_60

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumLetters(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_60

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumNumeric(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_60

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumSymbols(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_60

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumNonLetter(Landroid/content/ComponentName;)I

    move-result v3

    if-lt v2, v3, :cond_60

    :goto_5e
    monitor-exit p0
    :try_end_5f
    .catchall {:try_start_28 .. :try_end_5f} :catchall_25

    goto :goto_1c

    :cond_60
    move v0, v1

    goto :goto_5e
.end method

.method public isAdminActive(Landroid/content/ComponentName;)Z
    .registers 3
    .parameter "adminReceiver"

    .prologue
    .line 966
    monitor-enter p0

    .line 967
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_8
    monitor-exit p0

    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_8

    .line 968
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public lockNow()V
    .registers 7

    .prologue
    .line 1655
    monitor-enter p0

    .line 1658
    const/4 v2, 0x0

    const/4 v3, 0x3

    :try_start_3
    invoke-virtual {p0, v2, v3}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1660
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_2e

    move-result-wide v0

    .line 1662
    .local v0, ident:J
    :try_start_a
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mIPowerManager:Landroid/os/IPowerManager;

    invoke-interface {v2}, Landroid/os/IPowerManager;->isScreenOn()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 1664
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mIPowerManager:Landroid/os/IPowerManager;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x1

    invoke-interface {v2, v3, v4, v5}, Landroid/os/IPowerManager;->goToSleepWithReason(JI)V
    :try_end_1c
    .catchall {:try_start_a .. :try_end_1c} :catchall_31
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_1c} :catch_29

    .line 1672
    :goto_1c
    :try_start_1c
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1674
    :goto_1f
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_1c .. :try_end_20} :catchall_2e

    .line 1675
    return-void

    .line 1668
    :cond_21
    :try_start_21
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->getWindowManager()Landroid/view/IWindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/IWindowManager;->lockNow()V
    :try_end_28
    .catchall {:try_start_21 .. :try_end_28} :catchall_31
    .catch Landroid/os/RemoteException; {:try_start_21 .. :try_end_28} :catch_29

    goto :goto_1c

    .line 1670
    :catch_29
    move-exception v2

    .line 1672
    :try_start_2a
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_1f

    .line 1674
    .end local v0           #ident:J
    :catchall_2e
    move-exception v2

    monitor-exit p0
    :try_end_30
    .catchall {:try_start_2a .. :try_end_30} :catchall_2e

    throw v2

    .line 1672
    .restart local v0       #ident:J
    :catchall_31
    move-exception v2

    :try_start_32
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
    :try_end_36
    .catchall {:try_start_32 .. :try_end_36} :catchall_2e
.end method

.method public packageHasActiveAdmins(Ljava/lang/String;)Z
    .registers 5
    .parameter "packageName"

    .prologue
    .line 996
    monitor-enter p0

    .line 997
    :try_start_1
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 998
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_8
    if-ge v1, v0, :cond_24

    .line 999
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    iget-object v2, v2, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v2}, Landroid/app/admin/DeviceAdminInfo;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 1000
    const/4 v2, 0x1

    monitor-exit p0

    .line 1003
    :goto_20
    return v2

    .line 998
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1003
    :cond_24
    const/4 v2, 0x0

    monitor-exit p0

    goto :goto_20

    .line 1004
    .end local v0           #N:I
    .end local v1           #i:I
    :catchall_27
    move-exception v2

    monitor-exit p0
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_27

    throw v2
.end method

.method public removeActiveAdmin(Landroid/content/ComponentName;)V
    .registers 8
    .parameter "adminReceiver"

    .prologue
    .line 1008
    monitor-enter p0

    .line 1009
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1010
    .local v0, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-nez v0, :cond_9

    .line 1011
    monitor-exit p0

    .line 1024
    :goto_8
    return-void

    .line 1013
    :cond_9
    invoke-virtual {v0}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->getUid()I

    move-result v3

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v4

    if-eq v3, v4, :cond_1b

    .line 1014
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v4, "android.permission.BIND_DEVICE_ADMIN"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1017
    :cond_1b
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_27

    move-result-wide v1

    .line 1019
    .local v1, ident:J
    :try_start_1f
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->removeActiveAdminLocked(Landroid/content/ComponentName;)V
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_2a

    .line 1021
    :try_start_22
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1023
    monitor-exit p0

    goto :goto_8

    .end local v0           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v1           #ident:J
    :catchall_27
    move-exception v3

    monitor-exit p0
    :try_end_29
    .catchall {:try_start_22 .. :try_end_29} :catchall_27

    throw v3

    .line 1021
    .restart local v0       #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .restart local v1       #ident:J
    :catchall_2a
    move-exception v3

    :try_start_2b
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3
    :try_end_2f
    .catchall {:try_start_2b .. :try_end_2f} :catchall_27
.end method

.method removeActiveAdminLocked(Landroid/content/ComponentName;)V
    .registers 5
    .parameter "adminReceiver"

    .prologue
    .line 591
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 592
    .local v0, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    if-eqz v0, :cond_10

    .line 593
    const-string v1, "android.app.action.DEVICE_ADMIN_DISABLED"

    new-instance v2, Lcom/android/server/DevicePolicyManagerService$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/android/server/DevicePolicyManagerService$2;-><init>(Lcom/android/server/DevicePolicyManagerService;Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Landroid/content/ComponentName;)V

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;Landroid/content/BroadcastReceiver;)V

    .line 613
    :cond_10
    return-void
.end method

.method public reportFailedPasswordAttempt()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 1799
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v4, "android.permission.BIND_DEVICE_ADMIN"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1802
    monitor-enter p0

    .line 1803
    :try_start_9
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_35

    move-result-wide v0

    .line 1805
    .local v0, ident:J
    :try_start_d
    iget v3, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    .line 1806
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1807
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->getMaximumFailedPasswordsForWipe(Landroid/content/ComponentName;)I

    move-result v2

    .line 1808
    .local v2, max:I
    if-lez v2, :cond_25

    iget v3, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    if-lt v3, v2, :cond_25

    .line 1809
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->wipeDataLocked(I)V

    .line 1811
    :cond_25
    const-string v3, "android.app.action.ACTION_PASSWORD_FAILED"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Ljava/lang/String;I)V
    :try_end_2b
    .catchall {:try_start_d .. :try_end_2b} :catchall_30

    .line 1814
    :try_start_2b
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1816
    monitor-exit p0

    .line 1817
    return-void

    .line 1814
    .end local v2           #max:I
    :catchall_30
    move-exception v3

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3

    .line 1816
    .end local v0           #ident:J
    :catchall_35
    move-exception v3

    monitor-exit p0
    :try_end_37
    .catchall {:try_start_2b .. :try_end_37} :catchall_35

    throw v3
.end method

.method public reportSuccessfulPasswordAttempt()V
    .registers 6

    .prologue
    .line 1820
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v3, "android.permission.BIND_DEVICE_ADMIN"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1823
    monitor-enter p0

    .line 1824
    :try_start_9
    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    if-nez v2, :cond_11

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    if-ltz v2, :cond_27

    .line 1825
    :cond_11
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_14
    .catchall {:try_start_9 .. :try_end_14} :catchall_2e

    move-result-wide v0

    .line 1827
    .local v0, ident:J
    const/4 v2, 0x0

    :try_start_16
    iput v2, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    .line 1828
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    .line 1829
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1830
    const-string v2, "android.app.action.ACTION_PASSWORD_SUCCEEDED"

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Ljava/lang/String;I)V
    :try_end_24
    .catchall {:try_start_16 .. :try_end_24} :catchall_29

    .line 1833
    :try_start_24
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1836
    .end local v0           #ident:J
    :cond_27
    monitor-exit p0

    .line 1837
    return-void

    .line 1833
    .restart local v0       #ident:J
    :catchall_29
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 1836
    .end local v0           #ident:J
    :catchall_2e
    move-exception v2

    monitor-exit p0
    :try_end_30
    .catchall {:try_start_24 .. :try_end_30} :catchall_2e

    throw v2
.end method

.method public resetPassword(Ljava/lang/String;I)Z
    .registers 31
    .parameter "password"
    .parameter "flags"

    .prologue
    .line 1482
    monitor-enter p0

    .line 1485
    const/16 v25, 0x0

    const/16 v26, 0x2

    :try_start_5
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1487
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordQuality(Landroid/content/ComponentName;)I

    move-result v20

    .line 1488
    .local v20, quality:I
    if-eqz v20, :cond_62

    .line 1489
    invoke-static/range {p1 .. p1}, Lcom/android/internal/widget/LockPatternUtils;->computePasswordQuality(Ljava/lang/String;)I

    move-result v21

    .line 1490
    .local v21, realQuality:I
    move/from16 v0, v21

    move/from16 v1, v20

    if-ge v0, v1, :cond_5a

    const/high16 v25, 0x6

    move/from16 v0, v20

    move/from16 v1, v25

    if-eq v0, v1, :cond_5a

    .line 1492
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: password quality 0x"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required quality 0x"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1496
    const/16 v25, 0x0

    monitor-exit p0

    .line 1597
    .end local v21           #realQuality:I
    :goto_59
    return v25

    .line 1498
    .restart local v21       #realQuality:I
    :cond_5a
    move/from16 v0, v21

    move/from16 v1, v20

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 1500
    .end local v21           #realQuality:I
    :cond_62
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumLength(Landroid/content/ComponentName;)I

    move-result v8

    .line 1501
    .local v8, length:I
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v25

    move/from16 v0, v25

    if-ge v0, v8, :cond_a3

    .line 1502
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: password length "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required length "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1504
    const/16 v25, 0x0

    monitor-exit p0

    goto :goto_59

    .line 1571
    .end local v8           #length:I
    .end local v20           #quality:I
    :catchall_a0
    move-exception v25

    monitor-exit p0
    :try_end_a2
    .catchall {:try_start_5 .. :try_end_a2} :catchall_a0

    throw v25

    .line 1506
    .restart local v8       #length:I
    .restart local v20       #quality:I
    :cond_a3
    const/high16 v25, 0x6

    move/from16 v0, v20

    move/from16 v1, v25

    if-ne v0, v1, :cond_25c

    .line 1507
    const/4 v9, 0x0

    .line 1508
    .local v9, letters:I
    const/16 v23, 0x0

    .line 1509
    .local v23, uppercase:I
    const/4 v10, 0x0

    .line 1510
    .local v10, lowercase:I
    const/16 v19, 0x0

    .line 1511
    .local v19, numbers:I
    const/16 v22, 0x0

    .line 1512
    .local v22, symbols:I
    const/16 v18, 0x0

    .line 1513
    .local v18, nonletter:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_b6
    :try_start_b6
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v25

    move/from16 v0, v25

    if-ge v5, v0, :cond_fe

    .line 1514
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 1515
    .local v3, c:C
    const/16 v25, 0x41

    move/from16 v0, v25

    if-lt v3, v0, :cond_d7

    const/16 v25, 0x5a

    move/from16 v0, v25

    if-gt v3, v0, :cond_d7

    .line 1516
    add-int/lit8 v9, v9, 0x1

    .line 1517
    add-int/lit8 v23, v23, 0x1

    .line 1513
    :goto_d4
    add-int/lit8 v5, v5, 0x1

    goto :goto_b6

    .line 1518
    :cond_d7
    const/16 v25, 0x61

    move/from16 v0, v25

    if-lt v3, v0, :cond_e8

    const/16 v25, 0x7a

    move/from16 v0, v25

    if-gt v3, v0, :cond_e8

    .line 1519
    add-int/lit8 v9, v9, 0x1

    .line 1520
    add-int/lit8 v10, v10, 0x1

    goto :goto_d4

    .line 1521
    :cond_e8
    const/16 v25, 0x30

    move/from16 v0, v25

    if-lt v3, v0, :cond_f9

    const/16 v25, 0x39

    move/from16 v0, v25

    if-gt v3, v0, :cond_f9

    .line 1522
    add-int/lit8 v19, v19, 0x1

    .line 1523
    add-int/lit8 v18, v18, 0x1

    goto :goto_d4

    .line 1525
    :cond_f9
    add-int/lit8 v22, v22, 0x1

    .line 1526
    add-int/lit8 v18, v18, 0x1

    goto :goto_d4

    .line 1529
    .end local v3           #c:C
    :cond_fe
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumLetters(Landroid/content/ComponentName;)I

    move-result v11

    .line 1530
    .local v11, neededLetters:I
    if-ge v9, v11, :cond_135

    .line 1531
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: number of letters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required number of letters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1533
    const/16 v25, 0x0

    monitor-exit p0

    goto/16 :goto_59

    .line 1535
    :cond_135
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumNumeric(Landroid/content/ComponentName;)I

    move-result v14

    .line 1536
    .local v14, neededNumbers:I
    move/from16 v0, v19

    if-ge v0, v14, :cond_170

    .line 1537
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: number of numerical digits "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required number of numerical digits "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1541
    const/16 v25, 0x0

    monitor-exit p0

    goto/16 :goto_59

    .line 1543
    :cond_170
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumLowerCase(Landroid/content/ComponentName;)I

    move-result v12

    .line 1544
    .local v12, neededLowerCase:I
    if-ge v10, v12, :cond_1a7

    .line 1545
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: number of lowercase letters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required number of lowercase letters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1548
    const/16 v25, 0x0

    monitor-exit p0

    goto/16 :goto_59

    .line 1550
    :cond_1a7
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumUpperCase(Landroid/content/ComponentName;)I

    move-result v16

    .line 1551
    .local v16, neededUpperCase:I
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_1e6

    .line 1552
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: number of uppercase letters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required number of uppercase letters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1555
    const/16 v25, 0x0

    monitor-exit p0

    goto/16 :goto_59

    .line 1557
    :cond_1e6
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumSymbols(Landroid/content/ComponentName;)I

    move-result v15

    .line 1558
    .local v15, neededSymbols:I
    move/from16 v0, v22

    if-ge v0, v15, :cond_221

    .line 1559
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: number of special symbols "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required number of special symbols "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1561
    const/16 v25, 0x0

    monitor-exit p0

    goto/16 :goto_59

    .line 1563
    :cond_221
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordMinimumNonLetter(Landroid/content/ComponentName;)I

    move-result v13

    .line 1564
    .local v13, neededNonLetter:I
    move/from16 v0, v18

    if-ge v0, v13, :cond_25c

    .line 1565
    const-string v25, "DevicePolicyManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "resetPassword: number of non-letter characters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " does not meet required number of non-letter characters "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1568
    const/16 v25, 0x0

    monitor-exit p0

    goto/16 :goto_59

    .line 1571
    .end local v5           #i:I
    .end local v9           #letters:I
    .end local v10           #lowercase:I
    .end local v11           #neededLetters:I
    .end local v12           #neededLowerCase:I
    .end local v13           #neededNonLetter:I
    .end local v14           #neededNumbers:I
    .end local v15           #neededSymbols:I
    .end local v16           #neededUpperCase:I
    .end local v18           #nonletter:I
    .end local v19           #numbers:I
    .end local v22           #symbols:I
    .end local v23           #uppercase:I
    :cond_25c
    monitor-exit p0
    :try_end_25d
    .catchall {:try_start_b6 .. :try_end_25d} :catchall_a0

    .line 1573
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v4

    .line 1574
    .local v4, callingUid:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    move/from16 v25, v0

    if-ltz v25, :cond_27e

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    move/from16 v25, v0

    move/from16 v0, v25

    if-eq v0, v4, :cond_27e

    .line 1575
    const-string v25, "DevicePolicyManagerService"

    const-string v26, "resetPassword: already set by another uid and not entered by user"

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1576
    const/16 v25, 0x0

    goto/16 :goto_59

    .line 1581
    :cond_27e
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v6

    .line 1583
    .local v6, ident:J
    :try_start_282
    new-instance v24, Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    .line 1584
    .local v24, utils:Lcom/android/internal/widget/LockPatternUtils;
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/widget/LockPatternUtils;->saveLockPassword(Ljava/lang/String;I)V

    .line 1585
    monitor-enter p0
    :try_end_297
    .catchall {:try_start_282 .. :try_end_297} :catchall_2c0

    .line 1586
    and-int/lit8 v25, p2, 0x1

    if-eqz v25, :cond_2ba

    move/from16 v17, v4

    .line 1588
    .local v17, newOwner:I
    :goto_29d
    :try_start_29d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    move/from16 v25, v0

    move/from16 v0, v25

    move/from16 v1, v17

    if-eq v0, v1, :cond_2b2

    .line 1589
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    .line 1590
    invoke-direct/range {p0 .. p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1592
    :cond_2b2
    monitor-exit p0
    :try_end_2b3
    .catchall {:try_start_29d .. :try_end_2b3} :catchall_2bd

    .line 1594
    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1597
    const/16 v25, 0x1

    goto/16 :goto_59

    .line 1586
    .end local v17           #newOwner:I
    :cond_2ba
    const/16 v17, -0x1

    goto :goto_29d

    .line 1592
    .restart local v17       #newOwner:I
    :catchall_2bd
    move-exception v25

    :try_start_2be
    monitor-exit p0
    :try_end_2bf
    .catchall {:try_start_2be .. :try_end_2bf} :catchall_2bd

    :try_start_2bf
    throw v25
    :try_end_2c0
    .catchall {:try_start_2bf .. :try_end_2c0} :catchall_2c0

    .line 1594
    .end local v17           #newOwner:I
    .end local v24           #utils:Lcom/android/internal/widget/LockPatternUtils;
    :catchall_2c0
    move-exception v25

    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v25
.end method

.method sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;)V
    .registers 4
    .parameter "admin"
    .parameter "action"

    .prologue
    .line 561
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;Landroid/content/BroadcastReceiver;)V

    .line 562
    return-void
.end method

.method sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;Landroid/content/BroadcastReceiver;)V
    .registers 12
    .parameter "admin"
    .parameter "action"
    .parameter "result"

    .prologue
    const/4 v2, 0x0

    .line 565
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 566
    .local v1, intent:Landroid/content/Intent;
    iget-object v0, p1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v0}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 567
    const-string v0, "android.app.action.ACTION_PASSWORD_EXPIRING"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 568
    const-string v0, "expiration"

    iget-wide v3, p1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    invoke-virtual {v1, v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 570
    :cond_1e
    if-eqz p3, :cond_2c

    .line 571
    iget-object v0, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mHandler:Landroid/os/Handler;

    const/4 v5, -0x1

    move-object v3, p3

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 576
    :goto_2b
    return-void

    .line 574
    :cond_2c
    iget-object v0, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_2b
.end method

.method sendAdminCommandLocked(Ljava/lang/String;I)V
    .registers 7
    .parameter "action"
    .parameter "reqPolicy"

    .prologue
    .line 579
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 580
    .local v0, N:I
    if-lez v0, :cond_21

    .line 581
    const/4 v2, 0x0

    .local v2, i:I
    :goto_9
    if-ge v2, v0, :cond_21

    .line 582
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 583
    .local v1, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v3, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v3, p2}, Landroid/app/admin/DeviceAdminInfo;->usesPolicy(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 584
    invoke-virtual {p0, v1, p1}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;)V

    .line 581
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 588
    .end local v1           #admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v2           #i:I
    :cond_21
    return-void
.end method

.method public setActiveAdmin(Landroid/content/ComponentName;Z)V
    .registers 14
    .parameter "adminReceiver"
    .parameter "refreshing"

    .prologue
    .line 926
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v9, "android.permission.BIND_DEVICE_ADMIN"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->findAdmin(Landroid/content/ComponentName;)Landroid/app/admin/DeviceAdminInfo;

    move-result-object v4

    .line 930
    .local v4, info:Landroid/app/admin/DeviceAdminInfo;
    if-nez v4, :cond_27

    .line 931
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Bad admin: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 933
    :cond_27
    monitor-enter p0

    .line 934
    :try_start_28
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_41

    move-result-wide v2

    .line 936
    .local v2, ident:J
    if-nez p2, :cond_44

    :try_start_2e
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminUncheckedLocked(Landroid/content/ComponentName;)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v8

    if-eqz v8, :cond_44

    .line 937
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Admin is already added"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_3c
    .catchall {:try_start_2e .. :try_end_3c} :catchall_3c

    .line 960
    :catchall_3c
    move-exception v8

    :try_start_3d
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v8

    .line 962
    .end local v2           #ident:J
    :catchall_41
    move-exception v8

    monitor-exit p0
    :try_end_43
    .catchall {:try_start_3d .. :try_end_43} :catchall_41

    throw v8

    .line 939
    .restart local v2       #ident:J
    :cond_44
    :try_start_44
    new-instance v5, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    invoke-direct {v5, v4}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;-><init>(Landroid/app/admin/DeviceAdminInfo;)V

    .line 940
    .local v5, newAdmin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    invoke-virtual {v8, p1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 941
    const/4 v7, -0x1

    .line 942
    .local v7, replaceIndex:I
    if-eqz p2, :cond_6f

    .line 943
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 944
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_58
    if-ge v1, v0, :cond_6f

    .line 945
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 946
    .local v6, oldAdmin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v8, v6, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v8}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v8, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_84

    .line 947
    move v7, v1

    .line 952
    .end local v0           #N:I
    .end local v1           #i:I
    .end local v6           #oldAdmin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_6f
    const/4 v8, -0x1

    if-ne v7, v8, :cond_87

    .line 953
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 957
    :goto_77
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 958
    const-string v8, "android.app.action.DEVICE_ADMIN_ENABLED"

    invoke-virtual {p0, v5, v8}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;Ljava/lang/String;)V
    :try_end_7f
    .catchall {:try_start_44 .. :try_end_7f} :catchall_3c

    .line 960
    :try_start_7f
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 962
    monitor-exit p0
    :try_end_83
    .catchall {:try_start_7f .. :try_end_83} :catchall_41

    .line 963
    return-void

    .line 944
    .restart local v0       #N:I
    .restart local v1       #i:I
    .restart local v6       #oldAdmin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_84
    add-int/lit8 v1, v1, 0x1

    goto :goto_58

    .line 955
    .end local v0           #N:I
    .end local v1           #i:I
    .end local v6           #oldAdmin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :cond_87
    :try_start_87
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v8, v7, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_8c
    .catchall {:try_start_87 .. :try_end_8c} :catchall_3c

    goto :goto_77
.end method

.method public setActivePasswordState(IIIIIIII)V
    .registers 14
    .parameter "quality"
    .parameter "length"
    .parameter "letters"
    .parameter "uppercase"
    .parameter "lowercase"
    .parameter "numbers"
    .parameter "symbols"
    .parameter "nonletter"

    .prologue
    .line 1746
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    const-string v3, "android.permission.BIND_DEVICE_ADMIN"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1749
    invoke-static {p1}, Lcom/android/server/DevicePolicyManagerService;->validateQualityConstant(I)V

    .line 1751
    monitor-enter p0

    .line 1752
    :try_start_c
    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    if-ne v2, p1, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    if-ne v2, p2, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    if-nez v2, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    if-ne v2, p3, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    if-ne v2, p4, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    if-ne v2, p5, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    if-ne v2, p6, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    if-ne v2, p7, :cond_30

    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    if-eq v2, p8, :cond_5b

    .line 1757
    :cond_30
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_33
    .catchall {:try_start_c .. :try_end_33} :catchall_62

    move-result-wide v0

    .line 1759
    .local v0, ident:J
    :try_start_34
    iput p1, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordQuality:I

    .line 1760
    iput p2, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLength:I

    .line 1761
    iput p3, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLetters:I

    .line 1762
    iput p5, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordLowerCase:I

    .line 1763
    iput p4, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordUpperCase:I

    .line 1764
    iput p6, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNumeric:I

    .line 1765
    iput p7, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordSymbols:I

    .line 1766
    iput p8, p0, Lcom/android/server/DevicePolicyManagerService;->mActivePasswordNonLetter:I

    .line 1767
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/server/DevicePolicyManagerService;->mFailedPasswordAttempts:I

    .line 1768
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1769
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->updatePasswordExpirationsLocked()V

    .line 1770
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v2}, Lcom/android/server/DevicePolicyManagerService;->setExpirationAlarmCheckLocked(Landroid/content/Context;)V

    .line 1771
    const-string v2, "android.app.action.ACTION_PASSWORD_CHANGED"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/android/server/DevicePolicyManagerService;->sendAdminCommandLocked(Ljava/lang/String;I)V
    :try_end_58
    .catchall {:try_start_34 .. :try_end_58} :catchall_5d

    .line 1774
    :try_start_58
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1777
    .end local v0           #ident:J
    :cond_5b
    monitor-exit p0

    .line 1778
    return-void

    .line 1774
    .restart local v0       #ident:J
    :catchall_5d
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 1777
    .end local v0           #ident:J
    :catchall_62
    move-exception v2

    monitor-exit p0
    :try_end_64
    .catchall {:try_start_58 .. :try_end_64} :catchall_62

    throw v2
.end method

.method public setCameraDisabled(Landroid/content/ComponentName;Z)V
    .registers 6
    .parameter "who"
    .parameter "disabled"

    .prologue
    .line 2052
    monitor-enter p0

    .line 2053
    if-nez p1, :cond_e

    .line 2054
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2063
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 2056
    :cond_e
    const/16 v1, 0x8

    :try_start_10
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 2058
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-boolean v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->disableCamera:Z

    if-eq v1, p2, :cond_1d

    .line 2059
    iput-boolean p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->disableCamera:Z

    .line 2060
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 2062
    :cond_1d
    invoke-virtual {p0}, Lcom/android/server/DevicePolicyManagerService;->syncDeviceCapabilitiesLocked()V

    .line 2063
    monitor-exit p0
    :try_end_21
    .catchall {:try_start_10 .. :try_end_21} :catchall_b

    .line 2064
    return-void
.end method

.method protected setExpirationAlarmCheckLocked(Landroid/content/Context;)V
    .registers 23
    .parameter "context"

    .prologue
    .line 468
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/server/DevicePolicyManagerService;->getPasswordExpirationLocked(Landroid/content/ComponentName;)J

    move-result-wide v9

    .line 469
    .local v9, expiration:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 470
    .local v11, now:J
    sub-long v14, v9, v11

    .line 472
    .local v14, timeToExpire:J
    const-wide/16 v18, 0x0

    cmp-long v18, v9, v18

    if-nez v18, :cond_53

    .line 474
    const-wide/16 v6, 0x0

    .line 488
    .local v6, alarmTime:J
    :goto_18
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v16

    .line 490
    .local v16, token:J
    :try_start_1c
    const-string v18, "alarm"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/AlarmManager;

    .line 491
    .local v8, am:Landroid/app/AlarmManager;
    const/16 v18, 0x15c3

    new-instance v19, Landroid/content/Intent;

    const-string v20, "com.android.server.ACTION_EXPIRED_PASSWORD_NOTIFICATION"

    invoke-direct/range {v19 .. v20}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v20, 0x4800

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    .line 494
    .local v13, pi:Landroid/app/PendingIntent;
    invoke-virtual {v8, v13}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 495
    const-wide/16 v18, 0x0

    cmp-long v18, v6, v18

    if-eqz v18, :cond_4f

    .line 496
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v8, v0, v6, v7, v13}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_4f
    .catchall {:try_start_1c .. :try_end_4f} :catchall_70

    .line 499
    :cond_4f
    invoke-static/range {v16 .. v17}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 501
    return-void

    .line 475
    .end local v6           #alarmTime:J
    .end local v8           #am:Landroid/app/AlarmManager;
    .end local v13           #pi:Landroid/app/PendingIntent;
    .end local v16           #token:J
    :cond_53
    const-wide/16 v18, 0x0

    cmp-long v18, v14, v18

    if-gtz v18, :cond_5f

    .line 477
    const-wide/32 v18, 0x5265c00

    add-long v6, v11, v18

    .restart local v6       #alarmTime:J
    goto :goto_18

    .line 481
    .end local v6           #alarmTime:J
    :cond_5f
    const-wide/32 v18, 0x5265c00

    rem-long v4, v14, v18

    .line 482
    .local v4, alarmInterval:J
    const-wide/16 v18, 0x0

    cmp-long v18, v4, v18

    if-nez v18, :cond_6d

    .line 483
    const-wide/32 v4, 0x5265c00

    .line 485
    :cond_6d
    add-long v6, v11, v4

    .restart local v6       #alarmTime:J
    goto :goto_18

    .line 499
    .end local v4           #alarmInterval:J
    .restart local v16       #token:J
    :catchall_70
    move-exception v18

    invoke-static/range {v16 .. v17}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v18
.end method

.method public setGlobalProxy(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Landroid/content/ComponentName;
    .registers 13
    .parameter "who"
    .parameter "proxySpec"
    .parameter "exclusionList"

    .prologue
    const/4 v7, 0x0

    .line 1841
    monitor-enter p0

    .line 1842
    if-nez p1, :cond_f

    .line 1843
    :try_start_4
    new-instance v7, Ljava/lang/NullPointerException;

    const-string v8, "ComponentName is null"

    invoke-direct {v7, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1877
    :catchall_c
    move-exception v7

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_c

    throw v7

    .line 1846
    :cond_f
    const/4 v8, 0x5

    :try_start_10
    invoke-virtual {p0, p1, v8}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1851
    .local v0, admin:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 1852
    .local v2, compSet:Ljava/util/Set;,"Ljava/util/Set<Landroid/content/ComponentName;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_1e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ComponentName;

    .line 1853
    .local v3, component:Landroid/content/ComponentName;
    iget-object v8, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminMap:Ljava/util/HashMap;

    invoke-virtual {v8, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1854
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-boolean v8, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->specifiesGlobalProxy:Z

    if-eqz v8, :cond_1e

    invoke-virtual {v3, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1e

    .line 1857
    monitor-exit p0

    .line 1876
    .end local v1           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    .end local v3           #component:Landroid/content/ComponentName;
    :goto_3d
    return-object v3

    .line 1860
    :cond_3e
    if-nez p2, :cond_56

    .line 1861
    const/4 v8, 0x0

    iput-boolean v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->specifiesGlobalProxy:Z

    .line 1862
    const/4 v8, 0x0

    iput-object v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->globalProxySpec:Ljava/lang/String;

    .line 1863
    const/4 v8, 0x0

    iput-object v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->globalProxyExclusionList:Ljava/lang/String;

    .line 1873
    :goto_49
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v5

    .line 1874
    .local v5, origId:J
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->resetGlobalProxy()V

    .line 1875
    invoke-static {v5, v6}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1876
    monitor-exit p0

    move-object v3, v7

    goto :goto_3d

    .line 1866
    .end local v5           #origId:J
    :cond_56
    const/4 v8, 0x1

    iput-boolean v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->specifiesGlobalProxy:Z

    .line 1867
    iput-object p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->globalProxySpec:Ljava/lang/String;

    .line 1868
    iput-object p3, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->globalProxyExclusionList:Ljava/lang/String;
    :try_end_5d
    .catchall {:try_start_10 .. :try_end_5d} :catchall_c

    goto :goto_49
.end method

.method public setMaximumFailedPasswordsForWipe(Landroid/content/ComponentName;I)V
    .registers 5
    .parameter "who"
    .parameter "num"

    .prologue
    .line 1443
    monitor-enter p0

    .line 1446
    const/4 v1, 0x4

    :try_start_2
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1448
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1450
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    if-eq v1, p2, :cond_13

    .line 1451
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumFailedPasswordsForWipe:I

    .line 1452
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1454
    :cond_13
    monitor-exit p0

    .line 1455
    return-void

    .line 1454
    .end local v0           #ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    :catchall_15
    move-exception v1

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_2 .. :try_end_17} :catchall_15

    throw v1
.end method

.method public setMaximumTimeToLock(Landroid/content/ComponentName;J)V
    .registers 10
    .parameter "who"
    .parameter "timeMs"

    .prologue
    .line 1601
    monitor-enter p0

    .line 1602
    if-nez p1, :cond_e

    .line 1603
    :try_start_3
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "ComponentName is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1628
    :catchall_b
    move-exception v4

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v4

    .line 1605
    :cond_e
    const/4 v4, 0x3

    :try_start_f
    invoke-virtual {p0, p1, v4}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1607
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget-wide v4, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    cmp-long v4, v4, p2

    if-eqz v4, :cond_3b

    .line 1608
    iput-wide p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->maximumTimeToUnlock:J

    .line 1610
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_1e
    .catchall {:try_start_f .. :try_end_1e} :catchall_b

    move-result-wide v2

    .line 1612
    .local v2, ident:J
    :try_start_1f
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1614
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/android/server/DevicePolicyManagerService;->getMaximumTimeToLock(Landroid/content/ComponentName;)J
    :try_end_26
    .catchall {:try_start_1f .. :try_end_26} :catchall_46

    move-result-wide p2

    .line 1615
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-gtz v4, :cond_30

    .line 1616
    const-wide/32 p2, 0x7fffffff

    .line 1620
    :cond_30
    :try_start_30
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->getIPowerManager()Landroid/os/IPowerManager;

    move-result-object v4

    long-to-int v5, p2

    invoke-interface {v4, v5}, Landroid/os/IPowerManager;->setMaximumScreenOffTimeount(I)V
    :try_end_38
    .catchall {:try_start_30 .. :try_end_38} :catchall_46
    .catch Landroid/os/RemoteException; {:try_start_30 .. :try_end_38} :catch_3d

    .line 1625
    :goto_38
    :try_start_38
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1628
    .end local v2           #ident:J
    :cond_3b
    monitor-exit p0
    :try_end_3c
    .catchall {:try_start_38 .. :try_end_3c} :catchall_b

    .line 1629
    return-void

    .line 1621
    .restart local v2       #ident:J
    :catch_3d
    move-exception v1

    .line 1622
    .local v1, e:Landroid/os/RemoteException;
    :try_start_3e
    const-string v4, "DevicePolicyManagerService"

    const-string v5, "Failure talking with power manager"

    invoke-static {v4, v5, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_45
    .catchall {:try_start_3e .. :try_end_45} :catchall_46

    goto :goto_38

    .line 1625
    .end local v1           #e:Landroid/os/RemoteException;
    :catchall_46
    move-exception v4

    :try_start_47
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4
    :try_end_4b
    .catchall {:try_start_47 .. :try_end_4b} :catchall_b
.end method

.method public setPasswordExpirationTimeout(Landroid/content/ComponentName;J)V
    .registers 11
    .parameter "who"
    .parameter "timeout"

    .prologue
    const-wide/16 v3, 0x0

    .line 1131
    monitor-enter p0

    .line 1132
    if-nez p1, :cond_10

    .line 1133
    :try_start_5
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "ComponentName is null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1151
    :catchall_d
    move-exception v3

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_d

    throw v3

    .line 1135
    :cond_10
    cmp-long v5, p2, v3

    if-gez v5, :cond_1c

    .line 1136
    :try_start_14
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Timeout must be >= 0 ms"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1138
    :cond_1c
    const/4 v5, 0x6

    invoke-virtual {p0, p1, v5}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1141
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    cmp-long v5, p2, v3

    if-lez v5, :cond_64

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    add-long v1, p2, v5

    .line 1142
    .local v1, expiration:J
    :goto_2b
    iput-wide v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationDate:J

    .line 1143
    iput-wide p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordExpirationTimeout:J

    .line 1144
    cmp-long v3, p2, v3

    if-lez v3, :cond_5a

    .line 1145
    const-string v3, "DevicePolicyManagerService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setPasswordExpiration(): password will expire on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    const/4 v6, 0x2

    invoke-static {v5, v6}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1149
    :cond_5a
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1150
    iget-object v3, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->setExpirationAlarmCheckLocked(Landroid/content/Context;)V

    .line 1151
    monitor-exit p0
    :try_end_63
    .catchall {:try_start_14 .. :try_end_63} :catchall_d

    .line 1152
    return-void

    .end local v1           #expiration:J
    :cond_64
    move-wide v1, v3

    .line 1141
    goto :goto_2b
.end method

.method public setPasswordHistoryLength(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1097
    monitor-enter p0

    .line 1098
    if-nez p1, :cond_e

    .line 1099
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1107
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1101
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1103
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordHistoryLength:I

    if-eq v1, p2, :cond_1c

    .line 1104
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordHistoryLength:I

    .line 1105
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1107
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1108
    return-void
.end method

.method public setPasswordMinimumLength(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1063
    monitor-enter p0

    .line 1064
    if-nez p1, :cond_e

    .line 1065
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1073
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1067
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1069
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLength:I

    if-eq v1, p2, :cond_1c

    .line 1070
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLength:I

    .line 1071
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1073
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1074
    return-void
.end method

.method public setPasswordMinimumLetters(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1275
    monitor-enter p0

    .line 1276
    if-nez p1, :cond_e

    .line 1277
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1285
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1279
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1281
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLetters:I

    if-eq v1, p2, :cond_1c

    .line 1282
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLetters:I

    .line 1283
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1285
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1286
    return-void
.end method

.method public setPasswordMinimumLowerCase(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1241
    monitor-enter p0

    .line 1242
    if-nez p1, :cond_e

    .line 1243
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1251
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1245
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1247
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLowerCase:I

    if-eq v1, p2, :cond_1c

    .line 1248
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordLowerCase:I

    .line 1249
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1251
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1252
    return-void
.end method

.method public setPasswordMinimumNonLetter(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1377
    monitor-enter p0

    .line 1378
    if-nez p1, :cond_e

    .line 1379
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1387
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1381
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1383
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNonLetter:I

    if-eq v1, p2, :cond_1c

    .line 1384
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNonLetter:I

    .line 1385
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1387
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1388
    return-void
.end method

.method public setPasswordMinimumNumeric(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1309
    monitor-enter p0

    .line 1310
    if-nez p1, :cond_e

    .line 1311
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1319
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1313
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1315
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNumeric:I

    if-eq v1, p2, :cond_1c

    .line 1316
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordNumeric:I

    .line 1317
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1319
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1320
    return-void
.end method

.method public setPasswordMinimumSymbols(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1343
    monitor-enter p0

    .line 1344
    if-nez p1, :cond_e

    .line 1345
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1353
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1347
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1349
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordSymbols:I

    if-eq v1, p2, :cond_1c

    .line 1350
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordSymbols:I

    .line 1351
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1353
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1354
    return-void
.end method

.method public setPasswordMinimumUpperCase(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "length"

    .prologue
    .line 1207
    monitor-enter p0

    .line 1208
    if-nez p1, :cond_e

    .line 1209
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1217
    :catchall_b
    move-exception v1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1

    .line 1211
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1213
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordUpperCase:I

    if-eq v1, p2, :cond_1c

    .line 1214
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->minimumPasswordUpperCase:I

    .line 1215
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1217
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_f .. :try_end_1d} :catchall_b

    .line 1218
    return-void
.end method

.method public setPasswordQuality(Landroid/content/ComponentName;I)V
    .registers 6
    .parameter "who"
    .parameter "quality"

    .prologue
    .line 1027
    invoke-static {p2}, Lcom/android/server/DevicePolicyManagerService;->validateQualityConstant(I)V

    .line 1029
    monitor-enter p0

    .line 1030
    if-nez p1, :cond_11

    .line 1031
    :try_start_6
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "ComponentName is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1039
    :catchall_e
    move-exception v1

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_e

    throw v1

    .line 1033
    :cond_11
    const/4 v1, 0x0

    :try_start_12
    invoke-virtual {p0, p1, v1}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v0

    .line 1035
    .local v0, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    iget v1, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordQuality:I

    if-eq v1, p2, :cond_1f

    .line 1036
    iput p2, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->passwordQuality:I

    .line 1037
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1039
    :cond_1f
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_12 .. :try_end_20} :catchall_e

    .line 1040
    return-void
.end method

.method public setStorageEncryption(Landroid/content/ComponentName;Z)I
    .registers 9
    .parameter "who"
    .parameter "encrypt"

    .prologue
    .line 1940
    monitor-enter p0

    .line 1942
    if-nez p1, :cond_e

    .line 1943
    :try_start_3
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "ComponentName is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1973
    :catchall_b
    move-exception v4

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v4

    .line 1945
    :cond_e
    const/4 v4, 0x7

    :try_start_f
    invoke-virtual {p0, p1, v4}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    move-result-object v1

    .line 1949
    .local v1, ap:Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->isEncryptionSupported()Z

    move-result v4

    if-nez v4, :cond_1c

    .line 1950
    const/4 v4, 0x0

    monitor-exit p0

    .line 1970
    :goto_1b
    return v4

    .line 1954
    :cond_1c
    iget-boolean v4, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->encryptionRequested:Z

    if-eq v4, p2, :cond_25

    .line 1955
    iput-boolean p2, v1, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->encryptionRequested:Z

    .line 1956
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V

    .line 1960
    :cond_25
    const/4 v3, 0x0

    .line 1961
    .local v3, newRequested:Z
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1962
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2d
    if-ge v2, v0, :cond_3d

    .line 1963
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    iget-boolean v4, v4, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->encryptionRequested:Z

    or-int/2addr v3, v4

    .line 1962
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 1967
    :cond_3d
    invoke-direct {p0, v3}, Lcom/android/server/DevicePolicyManagerService;->setEncryptionRequested(Z)V

    .line 1970
    if-eqz v3, :cond_45

    const/4 v4, 0x3

    :goto_43
    monitor-exit p0
    :try_end_44
    .catchall {:try_start_f .. :try_end_44} :catchall_b

    goto :goto_1b

    :cond_45
    const/4 v4, 0x1

    goto :goto_43
.end method

.method syncDeviceCapabilitiesLocked()V
    .registers 9

    .prologue
    .line 880
    const-string v5, "sys.secpolicy.camera.disabled"

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 881
    .local v1, systemState:Z
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/android/server/DevicePolicyManagerService;->getCameraDisabled(Landroid/content/ComponentName;)Z

    move-result v0

    .line 882
    .local v0, cameraDisabled:Z
    if-eq v0, v1, :cond_36

    .line 883
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 885
    .local v2, token:J
    if-eqz v0, :cond_37

    :try_start_14
    const-string v4, "1"

    .line 886
    .local v4, value:Ljava/lang/String;
    :goto_16
    const-string v5, "DevicePolicyManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Change in camera state [sys.secpolicy.camera.disabled] = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 888
    const-string v5, "sys.secpolicy.camera.disabled"

    invoke-static {v5, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_33
    .catchall {:try_start_14 .. :try_end_33} :catchall_3a

    .line 890
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 893
    .end local v2           #token:J
    .end local v4           #value:Ljava/lang/String;
    :cond_36
    return-void

    .line 885
    .restart local v2       #token:J
    :cond_37
    :try_start_37
    const-string v4, "0"
    :try_end_39
    .catchall {:try_start_37 .. :try_end_39} :catchall_3a

    goto :goto_16

    .line 890
    :catchall_3a
    move-exception v5

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public systemReady()V
    .registers 2

    .prologue
    .line 896
    monitor-enter p0

    .line 897
    :try_start_1
    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->loadSettingsLocked()V

    .line 898
    monitor-exit p0

    .line 899
    return-void

    .line 898
    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_6

    throw v0
.end method

.method validatePasswordOwnerLocked()V
    .registers 6

    .prologue
    .line 857
    iget v2, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    if-ltz v2, :cond_45

    .line 858
    const/4 v0, 0x0

    .line 859
    .local v0, haveOwner:Z
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_d
    if-ltz v1, :cond_20

    .line 860
    iget-object v2, p0, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    invoke-virtual {v2}, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->getUid()I

    move-result v2

    iget v3, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    if-ne v2, v3, :cond_46

    .line 861
    const/4 v0, 0x1

    .line 865
    :cond_20
    if-nez v0, :cond_45

    .line 866
    const-string v2, "DevicePolicyManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Previous password owner "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " no longer active; disabling"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 868
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/server/DevicePolicyManagerService;->mPasswordOwner:I

    .line 871
    .end local v0           #haveOwner:Z
    .end local v1           #i:I
    :cond_45
    return-void

    .line 859
    .restart local v0       #haveOwner:Z
    .restart local v1       #i:I
    :cond_46
    add-int/lit8 v1, v1, -0x1

    goto :goto_d
.end method

.method public wipeData(I)V
    .registers 6
    .parameter "flags"

    .prologue
    .line 1703
    monitor-enter p0

    .line 1706
    const/4 v2, 0x0

    const/4 v3, 0x4

    :try_start_3
    invoke-virtual {p0, v2, v3}, Lcom/android/server/DevicePolicyManagerService;->getActiveAdminForCallerLocked(Landroid/content/ComponentName;I)Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    .line 1708
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_17

    move-result-wide v0

    .line 1710
    .local v0, ident:J
    :try_start_a
    invoke-virtual {p0, p1}, Lcom/android/server/DevicePolicyManagerService;->wipeDataLocked(I)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_12

    .line 1712
    :try_start_d
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1714
    monitor-exit p0

    .line 1715
    return-void

    .line 1712
    :catchall_12
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 1714
    .end local v0           #ident:J
    :catchall_17
    move-exception v2

    monitor-exit p0
    :try_end_19
    .catchall {:try_start_d .. :try_end_19} :catchall_17

    throw v2
.end method

.method wipeDataLocked(I)V
    .registers 9
    .parameter "flags"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1684
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v5

    if-nez v5, :cond_36

    invoke-direct {p0}, Lcom/android/server/DevicePolicyManagerService;->isExtStorageEncrypted()Z

    move-result v5

    if-eqz v5, :cond_36

    move v1, v3

    .line 1685
    .local v1, forceExtWipe:Z
    :goto_f
    and-int/lit8 v5, p1, 0x1

    if-eqz v5, :cond_38

    .line 1688
    .local v3, wipeExtRequested:Z
    :goto_13
    if-nez v1, :cond_17

    if-eqz v3, :cond_3a

    :cond_17
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v4

    if-nez v4, :cond_3a

    .line 1689
    new-instance v2, Landroid/content/Intent;

    const-string v4, "com.android.internal.os.storage.FORMAT_AND_FACTORY_RESET"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1690
    .local v2, intent:Landroid/content/Intent;
    sget-object v4, Lcom/android/internal/os/storage/ExternalStorageFormatter;->COMPONENT_NAME:Landroid/content/ComponentName;

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1691
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const-wide/16 v5, 0x2710

    invoke-virtual {v4, v5, v6}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 1692
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1700
    .end local v2           #intent:Landroid/content/Intent;
    :goto_35
    return-void

    .end local v1           #forceExtWipe:Z
    .end local v3           #wipeExtRequested:Z
    :cond_36
    move v1, v4

    .line 1684
    goto :goto_f

    .restart local v1       #forceExtWipe:Z
    :cond_38
    move v3, v4

    .line 1685
    goto :goto_13

    .line 1695
    .restart local v3       #wipeExtRequested:Z
    :cond_3a
    :try_start_3a
    iget-object v4, p0, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/os/RecoverySystem;->rebootWipeUserData(Landroid/content/Context;)V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3f} :catch_40

    goto :goto_35

    .line 1696
    :catch_40
    move-exception v0

    .line 1697
    .local v0, e:Ljava/io/IOException;
    const-string v4, "DevicePolicyManagerService"

    const-string v5, "Failed requesting data wipe"

    invoke-static {v4, v5, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_35
.end method
