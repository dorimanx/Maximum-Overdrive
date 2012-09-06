.class final Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;
.super Landroid/os/Handler;
.source "LegacyUsbDeviceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/LegacyUsbDeviceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "LegacyUsbHandler"
.end annotation


# instance fields
.field private mAdbNotificationShown:Z

.field final mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

.field private mConfigured:Z

.field private mConnected:Z

.field private mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

.field private mCurrentFunctions:Ljava/lang/String;

.field private mDefaultFunctions:Ljava/lang/String;

.field private mUsbNotificationId:I

.field final synthetic this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;


# direct methods
.method public constructor <init>(Lcom/android/server/usb/LegacyUsbDeviceManager;Landroid/os/Looper;)V
    .registers 16
    .parameter
    .parameter "looper"

    .prologue
    const/16 v9, 0x400

    const/4 v8, 0x0

    .line 248
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    .line 249
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 233
    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 234
    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    .line 241
    new-instance v8, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler$1;

    invoke-direct {v8, p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler$1;-><init>(Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;)V

    iput-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    .line 250
    new-array v0, v9, [C

    .line 255
    .local v0, buffer:[C
    :try_start_15
    const-string v8, "persist.sys.usb.config"

    const-string v9, "adb"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    .line 258
    const-string v8, "sys.usb.config"

    const-string v9, "none"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 259
    .local v1, config:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_52

    .line 260
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "resetting config to persistent property: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const-string v8, "sys.usb.config"

    iget-object v9, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_52} :catch_161

    .line 266
    :cond_52
    :try_start_52
    new-instance v5, Ljava/io/FileReader;

    const-string v8, "/sys/class/switch/usb_connected/state"

    invoke-direct {v5, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 267
    .local v5, file:Ljava/io/FileReader;
    const/4 v8, 0x0

    const/16 v9, 0x400

    invoke-virtual {v5, v0, v8, v9}, Ljava/io/FileReader;->read([CII)I

    move-result v6

    .line 268
    .local v6, len:I
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V

    .line 269
    const-string v8, "1"

    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10, v6}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 271
    new-instance v5, Ljava/io/FileReader;

    .end local v5           #file:Ljava/io/FileReader;
    const-string v8, "/sys/class/switch/usb_configuration/state"

    invoke-direct {v5, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 272
    .restart local v5       #file:Ljava/io/FileReader;
    const/4 v8, 0x0

    const/16 v9, 0x400

    invoke-virtual {v5, v0, v8, v9}, Ljava/io/FileReader;->read([CII)I

    move-result v6

    .line 273
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V

    .line 274
    const-string v8, "1"

    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10, v6}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z
    :try_end_98
    .catch Ljava/io/FileNotFoundException; {:try_start_52 .. :try_end_98} :catch_116
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_98} :catch_161

    .line 292
    .end local v5           #file:Ljava/io/FileReader;
    .end local v6           #len:I
    :goto_98
    :try_start_98
    iget-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    iput-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 293
    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-nez v8, :cond_178

    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    if-nez v8, :cond_178

    const-string v8, "DISCONNECTED"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    .line 298
    :goto_a9
    iget-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v9, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v8, v9}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {p1, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$602(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 300
    const-string v8, "persist.service.adb.enable"

    const-string v9, "0"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 301
    .local v7, value:Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_cf

    .line 302
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 303
    .local v3, enable:C
    const/16 v8, 0x31

    if-ne v3, v8, :cond_19d

    .line 304
    const/4 v8, 0x1

    invoke-direct {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setAdbEnabled(Z)V

    .line 311
    .end local v3           #enable:C
    :cond_cf
    :goto_cf
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "adb_enabled"

    invoke-static {v9}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    const/4 v10, 0x0

    new-instance v11, Lcom/android/server/usb/LegacyUsbDeviceManager$AdbSettingsObserver;

    invoke-direct {v11, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$AdbSettingsObserver;-><init>(Lcom/android/server/usb/LegacyUsbDeviceManager;)V

    invoke-virtual {v8, v9, v10, v11}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 315
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "adb_notify"

    invoke-static {v9}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    const/4 v10, 0x0

    new-instance v11, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler$2;

    const/4 v12, 0x0

    invoke-direct {v11, p0, v12, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler$2;-><init>(Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;Landroid/os/Handler;Lcom/android/server/usb/LegacyUsbDeviceManager;)V

    invoke-virtual {v8, v9, v10, v11}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 324
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mLegacy:Z
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$200(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v8

    if-eqz v8, :cond_1a7

    .line 325
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$900(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v8

    const-string v9, "DEVPATH=/devices/virtual/switch/usb_mass_storage"

    invoke-virtual {v8, v9}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 330
    :goto_105
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v10, Landroid/content/IntentFilter;

    const-string v11, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v10, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 336
    .end local v1           #config:Ljava/lang/String;
    .end local v7           #value:Ljava/lang/String;
    :goto_115
    return-void

    .line 275
    .restart local v1       #config:Ljava/lang/String;
    :catch_116
    move-exception v2

    .line 276
    .local v2, e:Ljava/io/FileNotFoundException;
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "This kernel does not have USB configuration switch support"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Trying legacy USB configuration switch support"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_129} :catch_161

    .line 279
    :try_start_129
    new-instance v5, Ljava/io/FileReader;

    const-string v8, "/sys/class/switch/usb_mass_storage/state"

    invoke-direct {v5, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 280
    .restart local v5       #file:Ljava/io/FileReader;
    const/4 v8, 0x0

    const/16 v9, 0x400

    invoke-virtual {v5, v0, v8, v9}, Ljava/io/FileReader;->read([CII)I

    move-result v6

    .line 281
    .restart local v6       #len:I
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V

    .line 282
    const-string v8, "online"

    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10, v6}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 283
    const/4 v8, 0x1

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mLegacy:Z
    invoke-static {p1, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$202(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 284
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z
    :try_end_153
    .catch Ljava/io/FileNotFoundException; {:try_start_129 .. :try_end_153} :catch_155
    .catch Ljava/lang/Exception; {:try_start_129 .. :try_end_153} :catch_16c

    goto/16 :goto_98

    .line 285
    .end local v5           #file:Ljava/io/FileReader;
    .end local v6           #len:I
    :catch_155
    move-exception v4

    .line 286
    .local v4, f:Ljava/io/FileNotFoundException;
    :try_start_156
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "This kernel does not have legacy USB configuration switch support"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15f
    .catch Ljava/lang/Exception; {:try_start_156 .. :try_end_15f} :catch_161

    goto/16 :goto_98

    .line 333
    .end local v1           #config:Ljava/lang/String;
    .end local v2           #e:Ljava/io/FileNotFoundException;
    .end local v4           #f:Ljava/io/FileNotFoundException;
    :catch_161
    move-exception v2

    .line 334
    .local v2, e:Ljava/lang/Exception;
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Error initializing listener"

    invoke-static {v8, v9, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_115

    .line 287
    .restart local v1       #config:Ljava/lang/String;
    .local v2, e:Ljava/io/FileNotFoundException;
    :catch_16c
    move-exception v4

    .line 288
    .local v4, f:Ljava/lang/Exception;
    :try_start_16d
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-static {v8, v9, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_98

    .line 294
    .end local v2           #e:Ljava/io/FileNotFoundException;
    .end local v4           #f:Ljava/lang/Exception;
    :cond_178
    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v8, :cond_187

    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    if-nez v8, :cond_187

    const-string v8, "CONNECTED"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    goto/16 :goto_a9

    .line 295
    :cond_187
    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v8, :cond_196

    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    if-eqz v8, :cond_196

    const-string v8, "CONFIGURED"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    goto/16 :goto_a9

    .line 296
    :cond_196
    const-string v8, "UNKNOWN"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    goto/16 :goto_a9

    .line 305
    .restart local v3       #enable:C
    .restart local v7       #value:Ljava/lang/String;
    :cond_19d
    const/16 v8, 0x30

    if-ne v3, v8, :cond_cf

    .line 306
    const/4 v8, 0x0

    invoke-direct {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setAdbEnabled(Z)V

    goto/16 :goto_cf

    .line 327
    .end local v3           #enable:C
    :cond_1a7
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$900(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v8

    const-string v9, "DEVPATH=/devices/virtual/switch/usb_connected"

    invoke-virtual {v8, v9}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 328
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$900(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v8

    const-string v9, "DEVPATH=/devices/virtual/switch/usb_configuration"

    invoke-virtual {v8, v9}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V
    :try_end_1b9
    .catch Ljava/lang/Exception; {:try_start_16d .. :try_end_1b9} :catch_161

    goto/16 :goto_105
.end method

.method static synthetic access$800(Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 230
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    return-void
.end method

.method private setAdbEnabled(Z)V
    .registers 4
    .parameter "enable"

    .prologue
    .line 417
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v0

    if-eq p1, v0, :cond_16

    .line 418
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$602(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 421
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setEnabledFunctions(Ljava/lang/String;Z)V

    .line 422
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    .line 424
    :cond_16
    const-string v1, "persist.service.adb.enable"

    if-eqz p1, :cond_20

    const-string v0, "1"

    :goto_1c
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    return-void

    .line 424
    :cond_20
    const-string v0, "0"

    goto :goto_1c
.end method

.method private setEnabledFunctions(Ljava/lang/String;Z)V
    .registers 6
    .parameter "functions"
    .parameter "makeDefault"

    .prologue
    .line 428
    if-eqz p1, :cond_6a

    if-eqz p2, :cond_6a

    .line 429
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 430
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 434
    :goto_12
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 435
    const-string v0, "none"

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 436
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Failed to disable USB"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    .line 478
    :cond_30
    :goto_30
    return-void

    .line 432
    :cond_31
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1200(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_12

    .line 443
    :cond_38
    const-string v0, "persist.sys.usb.config"

    invoke-static {v0, p1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    invoke-direct {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->waitForState(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 445
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 446
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    goto :goto_30

    .line 448
    :cond_48
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to switch persistent USB config to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    const-string v0, "persist.sys.usb.config"

    iget-object v1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30

    .line 454
    :cond_6a
    if-nez p1, :cond_6e

    .line 455
    iget-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    .line 457
    :cond_6e
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_9b

    .line 458
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 462
    :goto_7c
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 463
    const-string v0, "none"

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a2

    .line 464
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Failed to disable USB"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    goto :goto_30

    .line 460
    :cond_9b
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1200(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_7c

    .line 469
    :cond_a2
    invoke-direct {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ab

    .line 470
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    goto :goto_30

    .line 472
    :cond_ab
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to switch USB config to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    goto/16 :goto_30
.end method

.method private setUsbConfig(Ljava/lang/String;)Z
    .registers 3
    .parameter "config"

    .prologue
    .line 411
    const-string v0, "sys.usb.config"

    invoke-static {v0, p1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    invoke-direct {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->waitForState(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private updateAdbNotification()V
    .registers 14

    .prologue
    const/4 v9, 0x0

    const/4 v12, 0x1

    const v11, 0x1040454

    const/4 v10, 0x0

    .line 599
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    if-nez v7, :cond_f

    .line 635
    :cond_e
    :goto_e
    return-void

    .line 600
    :cond_f
    const v0, 0x1040454

    .line 601
    .local v0, id:I
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v7

    if-eqz v7, :cond_9d

    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v7, :cond_9d

    .line 602
    const-string v7, "0"

    const-string v8, "persist.adb.notify"

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_e

    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "adb_notify"

    invoke-static {v7, v8, v12}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-eqz v7, :cond_e

    .line 607
    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    if-nez v7, :cond_e

    .line 608
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 609
    .local v5, r:Landroid/content/res/Resources;
    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 610
    .local v6, title:Ljava/lang/CharSequence;
    const v7, 0x1040455

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 613
    .local v2, message:Ljava/lang/CharSequence;
    new-instance v3, Landroid/app/Notification;

    invoke-direct {v3}, Landroid/app/Notification;-><init>()V

    .line 614
    .local v3, notification:Landroid/app/Notification;
    const v7, 0x1080512

    iput v7, v3, Landroid/app/Notification;->icon:I

    .line 615
    const-wide/16 v7, 0x0

    iput-wide v7, v3, Landroid/app/Notification;->when:J

    .line 616
    const/4 v7, 0x2

    iput v7, v3, Landroid/app/Notification;->flags:I

    .line 617
    iput-object v6, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 618
    iput v10, v3, Landroid/app/Notification;->defaults:I

    .line 619
    iput-object v9, v3, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 620
    iput-object v9, v3, Landroid/app/Notification;->vibrate:[J

    .line 622
    new-instance v7, Landroid/content/ComponentName;

    const-string v8, "com.android.settings"

    const-string v9, "com.android.settings.DevelopmentSettings"

    invoke-direct {v7, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7}, Landroid/content/Intent;->makeRestartActivityTask(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    .line 625
    .local v1, intent:Landroid/content/Intent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v10, v1, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 627
    .local v4, pi:Landroid/app/PendingIntent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v3, v7, v6, v2, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 628
    iput-boolean v12, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    .line 629
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-virtual {v7, v11, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_e

    .line 631
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #message:Ljava/lang/CharSequence;
    .end local v3           #notification:Landroid/app/Notification;
    .end local v4           #pi:Landroid/app/PendingIntent;
    .end local v5           #r:Landroid/content/res/Resources;
    .end local v6           #title:Ljava/lang/CharSequence;
    :cond_9d
    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    if-eqz v7, :cond_e

    .line 632
    iput-boolean v10, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    .line 633
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-virtual {v7, v11}, Landroid/app/NotificationManager;->cancel(I)V

    goto/16 :goto_e
.end method

.method private updateUsbNotification()V
    .registers 12

    .prologue
    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 542
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    if-eqz v7, :cond_12

    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mUseUsbNotification:Z
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v7

    if-nez v7, :cond_13

    .line 596
    :cond_12
    :goto_12
    return-void

    .line 547
    :cond_13
    const/4 v0, 0x0

    .line 548
    .local v0, id:I
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 549
    .local v5, r:Landroid/content/res/Resources;
    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v7, :cond_2f

    .line 550
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "mtp"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_97

    .line 551
    const v0, 0x104044c

    .line 566
    :cond_2f
    :goto_2f
    iget v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    if-eq v0, v7, :cond_12

    .line 568
    iget v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    if-eqz v7, :cond_44

    .line 569
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    iget v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    invoke-virtual {v7, v8}, Landroid/app/NotificationManager;->cancel(I)V

    .line 570
    iput v10, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    .line 572
    :cond_44
    if-eqz v0, :cond_12

    .line 573
    const v7, 0x1040450

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 575
    .local v2, message:Ljava/lang/CharSequence;
    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 577
    .local v6, title:Ljava/lang/CharSequence;
    new-instance v3, Landroid/app/Notification;

    invoke-direct {v3}, Landroid/app/Notification;-><init>()V

    .line 578
    .local v3, notification:Landroid/app/Notification;
    const v7, 0x1080530

    iput v7, v3, Landroid/app/Notification;->icon:I

    .line 579
    const-wide/16 v7, 0x0

    iput-wide v7, v3, Landroid/app/Notification;->when:J

    .line 580
    const/4 v7, 0x2

    iput v7, v3, Landroid/app/Notification;->flags:I

    .line 581
    iput-object v6, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 582
    iput v10, v3, Landroid/app/Notification;->defaults:I

    .line 583
    iput-object v9, v3, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 584
    iput-object v9, v3, Landroid/app/Notification;->vibrate:[J

    .line 586
    new-instance v7, Landroid/content/ComponentName;

    const-string v8, "com.android.settings"

    const-string v9, "com.android.settings.UsbSettings"

    invoke-direct {v7, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7}, Landroid/content/Intent;->makeRestartActivityTask(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    .line 589
    .local v1, intent:Landroid/content/Intent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v10, v1, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 591
    .local v4, pi:Landroid/app/PendingIntent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v3, v7, v6, v2, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 592
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-virtual {v7, v0, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 593
    iput v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    goto/16 :goto_12

    .line 552
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #message:Ljava/lang/CharSequence;
    .end local v3           #notification:Landroid/app/Notification;
    .end local v4           #pi:Landroid/app/PendingIntent;
    .end local v6           #title:Ljava/lang/CharSequence;
    :cond_97
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "ptp"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a5

    .line 553
    const v0, 0x104044d

    goto :goto_2f

    .line 554
    :cond_a5
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "mass_storage"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b4

    .line 556
    const v0, 0x104044e

    goto/16 :goto_2f

    .line 557
    :cond_b4
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "accessory"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c3

    .line 558
    const v0, 0x104044f

    goto/16 :goto_2f

    .line 561
    :cond_c3
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "rndis"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2f

    .line 562
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v7

    const-string v8, "No known USB function in updateUsbNotification"

    invoke-static {v7, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2f
.end method

.method private updateUsbState()V
    .registers 6

    .prologue
    .line 482
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.hardware.usb.action.USB_STATE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 483
    .local v2, intent:Landroid/content/Intent;
    const/high16 v3, 0x2000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 484
    const-string v3, "connected"

    iget-boolean v4, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 485
    const-string v3, "configured"

    iget-boolean v4, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 487
    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    if-eqz v3, :cond_33

    .line 488
    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 489
    .local v0, functions:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_27
    array-length v3, v0

    if-ge v1, v3, :cond_33

    .line 490
    aget-object v3, v0, v1

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 489
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 494
    .end local v0           #functions:[Ljava/lang/String;
    .end local v1           #i:I
    :cond_33
    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    .line 495
    return-void
.end method

.method private waitForState(Ljava/lang/String;)Z
    .registers 6
    .parameter "state"

    .prologue
    .line 395
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    const/16 v1, 0x14

    if-ge v0, v1, :cond_1b

    .line 397
    const-string v1, "sys.usb.state"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    const/4 v1, 0x1

    .line 405
    :goto_12
    return v1

    .line 400
    :cond_13
    const-wide/16 v1, 0x32

    :try_start_15
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_18
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_18} :catch_3d

    .line 395
    :goto_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 404
    :cond_1b
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "waitForState("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") FAILED"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    const/4 v1, 0x0

    goto :goto_12

    .line 401
    :catch_3d
    move-exception v1

    goto :goto_18
.end method


# virtual methods
.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)V
    .registers 8
    .parameter "fd"
    .parameter "pw"

    .prologue
    .line 638
    const-string v1, "  USB Device State:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 639
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    Current Functions: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 640
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    Default Functions: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 641
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    mConnected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 642
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    mConfigured: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 643
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    mCurrentAccessory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 645
    :try_start_7d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    Kernel function list: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    const-string v3, "/sys/devices/virtual/usb_composite/"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 647
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    Mass storage backing file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1700()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_7d .. :try_end_cb} :catch_cc

    .line 652
    :goto_cb
    return-void

    .line 649
    :catch_cc
    move-exception v0

    .line 650
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IOException: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_cb
.end method

.method public getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;
    .registers 2

    .prologue
    .line 538
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 7
    .parameter "msg"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 499
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_6c

    .line 535
    :cond_7
    :goto_7
    return-void

    .line 502
    :pswitch_8
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_30

    move v2, v3

    :goto_d
    iput-boolean v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 503
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v2, v3, :cond_32

    :goto_13
    iput-boolean v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    .line 504
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbNotification()V

    .line 505
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    .line 507
    iget-boolean v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-nez v2, :cond_24

    .line 509
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-direct {p0, v2, v4}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setEnabledFunctions(Ljava/lang/String;Z)V

    .line 511
    :cond_24
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mBootCompleted:Z
    invoke-static {v2}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1300(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 512
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbState()V

    goto :goto_7

    :cond_30
    move v2, v4

    .line 502
    goto :goto_d

    :cond_32
    move v3, v4

    .line 503
    goto :goto_13

    .line 516
    :pswitch_34
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_3c

    :goto_38
    invoke-direct {p0, v3}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setAdbEnabled(Z)V

    goto :goto_7

    :cond_3c
    move v3, v4

    goto :goto_38

    .line 519
    :pswitch_3e
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 520
    .local v0, function:Ljava/lang/String;
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_4b

    move v1, v3

    .line 521
    .local v1, makeDefault:Z
    :goto_47
    invoke-direct {p0, v0, v1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setEnabledFunctions(Ljava/lang/String;Z)V

    goto :goto_7

    .end local v1           #makeDefault:Z
    :cond_4b
    move v1, v4

    .line 520
    goto :goto_47

    .line 524
    .end local v0           #function:Ljava/lang/String;
    :pswitch_4d
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbNotification()V

    .line 525
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    .line 526
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbState()V

    goto :goto_7

    .line 529
    :pswitch_57
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mBootCompleted:Z
    invoke-static {v2, v3}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1302(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 530
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    if-eqz v2, :cond_7

    .line 531
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;
    invoke-static {v2}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1400(Lcom/android/server/usb/LegacyUsbDeviceManager;)Lcom/android/server/usb/UsbSettingsManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v2, v3}, Lcom/android/server/usb/UsbSettingsManager;->accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V

    goto :goto_7

    .line 499
    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_8
        :pswitch_34
        :pswitch_3e
        :pswitch_4d
        :pswitch_57
    .end packed-switch
.end method

.method public isConfigured()Z
    .registers 2

    .prologue
    .line 343
    iget-boolean v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    return v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 339
    iget-boolean v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    return v0
.end method

.method public sendMessage(ILjava/lang/Object;)V
    .registers 4
    .parameter "what"
    .parameter "arg"

    .prologue
    .line 354
    invoke-virtual {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 355
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 356
    .local v0, m:Landroid/os/Message;
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 357
    invoke-virtual {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 358
    return-void
.end method

.method public sendMessage(ILjava/lang/Object;Z)V
    .registers 6
    .parameter "what"
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 361
    invoke-virtual {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 362
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 363
    .local v0, m:Landroid/os/Message;
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 364
    if-eqz p3, :cond_12

    const/4 v1, 0x1

    :goto_c
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 365
    invoke-virtual {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 366
    return-void

    .line 364
    :cond_12
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public sendMessage(IZ)V
    .registers 5
    .parameter "what"
    .parameter "arg"

    .prologue
    .line 347
    invoke-virtual {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 348
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 349
    .local v0, m:Landroid/os/Message;
    if-eqz p2, :cond_10

    const/4 v1, 0x1

    :goto_a
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 350
    invoke-virtual {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 351
    return-void

    .line 349
    :cond_10
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public updateState(Ljava/lang/String;)V
    .registers 8
    .parameter "state"

    .prologue
    const/4 v4, 0x0

    .line 371
    const-string v3, "DISCONNECTED"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 372
    const/4 v1, 0x0

    .line 373
    .local v1, connected:I
    const/4 v0, 0x0

    .line 384
    .local v0, configured:I
    :goto_b
    invoke-virtual {p0, v4}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 385
    invoke-static {p0, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 386
    .local v2, msg:Landroid/os/Message;
    iput v1, v2, Landroid/os/Message;->arg1:I

    .line 387
    iput v0, v2, Landroid/os/Message;->arg2:I

    .line 389
    if-nez v1, :cond_4f

    const-wide/16 v3, 0x3e8

    :goto_1a
    invoke-virtual {p0, v2, v3, v4}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 390
    .end local v0           #configured:I
    .end local v1           #connected:I
    .end local v2           #msg:Landroid/os/Message;
    :goto_1d
    return-void

    .line 374
    :cond_1e
    const-string v3, "CONNECTED"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 375
    const/4 v1, 0x1

    .line 376
    .restart local v1       #connected:I
    const/4 v0, 0x0

    .restart local v0       #configured:I
    goto :goto_b

    .line 377
    .end local v0           #configured:I
    .end local v1           #connected:I
    :cond_29
    const-string v3, "CONFIGURED"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 378
    const/4 v1, 0x1

    .line 379
    .restart local v1       #connected:I
    const/4 v0, 0x1

    .restart local v0       #configured:I
    goto :goto_b

    .line 381
    .end local v0           #configured:I
    .end local v1           #connected:I
    :cond_34
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unknown state "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    .line 389
    .restart local v0       #configured:I
    .restart local v1       #connected:I
    .restart local v2       #msg:Landroid/os/Message;
    :cond_4f
    const-wide/16 v3, 0x0

    goto :goto_1a
.end method
