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

    .line 254
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    .line 255
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 239
    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 240
    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    .line 247
    new-instance v8, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler$1;

    invoke-direct {v8, p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler$1;-><init>(Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;)V

    iput-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    .line 256
    new-array v0, v9, [C

    .line 261
    .local v0, buffer:[C
    :try_start_15
    const-string v8, "persist.sys.usb.config"

    const-string v9, "adb"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    .line 264
    const-string v8, "sys.usb.config"

    const-string v9, "none"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 265
    .local v1, config:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_52

    .line 266
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

    .line 267
    const-string v8, "sys.usb.config"

    iget-object v9, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_52} :catch_161

    .line 272
    :cond_52
    :try_start_52
    new-instance v5, Ljava/io/FileReader;

    const-string v8, "/sys/class/switch/usb_connected/state"

    invoke-direct {v5, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 273
    .local v5, file:Ljava/io/FileReader;
    const/4 v8, 0x0

    const/16 v9, 0x400

    invoke-virtual {v5, v0, v8, v9}, Ljava/io/FileReader;->read([CII)I

    move-result v6

    .line 274
    .local v6, len:I
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V

    .line 275
    const-string v8, "1"

    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10, v6}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 277
    new-instance v5, Ljava/io/FileReader;

    .end local v5           #file:Ljava/io/FileReader;
    const-string v8, "/sys/class/switch/usb_configuration/state"

    invoke-direct {v5, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 278
    .restart local v5       #file:Ljava/io/FileReader;
    const/4 v8, 0x0

    const/16 v9, 0x400

    invoke-virtual {v5, v0, v8, v9}, Ljava/io/FileReader;->read([CII)I

    move-result v6

    .line 279
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V

    .line 280
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

    .line 298
    .end local v5           #file:Ljava/io/FileReader;
    .end local v6           #len:I
    :goto_98
    :try_start_98
    iget-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    iput-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 299
    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-nez v8, :cond_178

    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    if-nez v8, :cond_178

    const-string v8, "DISCONNECTED"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    .line 304
    :goto_a9
    iget-object v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v9, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v8, v9}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {p1, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$602(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 306
    const-string v8, "persist.service.adb.enable"

    const-string v9, "0"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 307
    .local v7, value:Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_cf

    .line 308
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 309
    .local v3, enable:C
    const/16 v8, 0x31

    if-ne v3, v8, :cond_19d

    .line 310
    const/4 v8, 0x1

    invoke-direct {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setAdbEnabled(Z)V

    .line 317
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

    .line 321
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

    .line 330
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mLegacy:Z
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$200(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v8

    if-eqz v8, :cond_1a7

    .line 331
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$900(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v8

    const-string v9, "DEVPATH=/devices/virtual/switch/usb_mass_storage"

    invoke-virtual {v8, v9}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 336
    :goto_105
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v10, Landroid/content/IntentFilter;

    const-string v11, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v10, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 342
    .end local v1           #config:Ljava/lang/String;
    .end local v7           #value:Ljava/lang/String;
    :goto_115
    return-void

    .line 281
    .restart local v1       #config:Ljava/lang/String;
    :catch_116
    move-exception v2

    .line 282
    .local v2, e:Ljava/io/FileNotFoundException;
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "This kernel does not have USB configuration switch support"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Trying legacy USB configuration switch support"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_129} :catch_161

    .line 285
    :try_start_129
    new-instance v5, Ljava/io/FileReader;

    const-string v8, "/sys/class/switch/usb_mass_storage/state"

    invoke-direct {v5, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 286
    .restart local v5       #file:Ljava/io/FileReader;
    const/4 v8, 0x0

    const/16 v9, 0x400

    invoke-virtual {v5, v0, v8, v9}, Ljava/io/FileReader;->read([CII)I

    move-result v6

    .line 287
    .restart local v6       #len:I
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V

    .line 288
    const-string v8, "online"

    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10, v6}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 289
    const/4 v8, 0x1

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mLegacy:Z
    invoke-static {p1, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$202(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 290
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z
    :try_end_153
    .catch Ljava/io/FileNotFoundException; {:try_start_129 .. :try_end_153} :catch_155
    .catch Ljava/lang/Exception; {:try_start_129 .. :try_end_153} :catch_16c

    goto/16 :goto_98

    .line 291
    .end local v5           #file:Ljava/io/FileReader;
    .end local v6           #len:I
    :catch_155
    move-exception v4

    .line 292
    .local v4, f:Ljava/io/FileNotFoundException;
    :try_start_156
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "This kernel does not have legacy USB configuration switch support"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15f
    .catch Ljava/lang/Exception; {:try_start_156 .. :try_end_15f} :catch_161

    goto/16 :goto_98

    .line 339
    .end local v1           #config:Ljava/lang/String;
    .end local v2           #e:Ljava/io/FileNotFoundException;
    .end local v4           #f:Ljava/io/FileNotFoundException;
    :catch_161
    move-exception v2

    .line 340
    .local v2, e:Ljava/lang/Exception;
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Error initializing listener"

    invoke-static {v8, v9, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_115

    .line 293
    .restart local v1       #config:Ljava/lang/String;
    .local v2, e:Ljava/io/FileNotFoundException;
    :catch_16c
    move-exception v4

    .line 294
    .local v4, f:Ljava/lang/Exception;
    :try_start_16d
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-static {v8, v9, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_98

    .line 300
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

    .line 301
    :cond_187
    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v8, :cond_196

    iget-boolean v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    if-eqz v8, :cond_196

    const-string v8, "CONFIGURED"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    goto/16 :goto_a9

    .line 302
    :cond_196
    const-string v8, "UNKNOWN"

    invoke-virtual {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateState(Ljava/lang/String;)V

    goto/16 :goto_a9

    .line 311
    .restart local v3       #enable:C
    .restart local v7       #value:Ljava/lang/String;
    :cond_19d
    const/16 v8, 0x30

    if-ne v3, v8, :cond_cf

    .line 312
    const/4 v8, 0x0

    invoke-direct {p0, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setAdbEnabled(Z)V

    goto/16 :goto_cf

    .line 333
    .end local v3           #enable:C
    :cond_1a7
    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;
    invoke-static {p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$900(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v8

    const-string v9, "DEVPATH=/devices/virtual/switch/usb_connected"

    invoke-virtual {v8, v9}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 334
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
    .line 236
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    return-void
.end method

.method private setAdbEnabled(Z)V
    .registers 4
    .parameter "enable"

    .prologue
    .line 423
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v0

    if-eq p1, v0, :cond_16

    .line 424
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$602(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 427
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setEnabledFunctions(Ljava/lang/String;Z)V

    .line 428
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    .line 430
    :cond_16
    const-string v1, "persist.service.adb.enable"

    if-eqz p1, :cond_20

    const-string v0, "1"

    :goto_1c
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    return-void

    .line 430
    :cond_20
    const-string v0, "0"

    goto :goto_1c
.end method

.method private setEnabledFunctions(Ljava/lang/String;Z)V
    .registers 6
    .parameter "functions"
    .parameter "makeDefault"

    .prologue
    .line 434
    if-eqz p1, :cond_6a

    if-eqz p2, :cond_6a

    .line 435
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 436
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 440
    :goto_12
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 441
    const-string v0, "none"

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 442
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Failed to disable USB"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    .line 484
    :cond_30
    :goto_30
    return-void

    .line 438
    :cond_31
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1200(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_12

    .line 449
    :cond_38
    const-string v0, "persist.sys.usb.config"

    invoke-static {v0, p1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    invoke-direct {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->waitForState(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 451
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 452
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    goto :goto_30

    .line 454
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

    .line 456
    const-string v0, "persist.sys.usb.config"

    iget-object v1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30

    .line 460
    :cond_6a
    if-nez p1, :cond_6e

    .line 461
    iget-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    .line 463
    :cond_6e
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_9b

    .line 464
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 468
    :goto_7c
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 469
    const-string v0, "none"

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a2

    .line 470
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Failed to disable USB"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    goto :goto_30

    .line 466
    :cond_9b
    const-string v0, "adb"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1200(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_7c

    .line 475
    :cond_a2
    invoke-direct {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ab

    .line 476
    iput-object p1, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    goto :goto_30

    .line 478
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

    .line 480
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setUsbConfig(Ljava/lang/String;)Z

    goto/16 :goto_30
.end method

.method private setUsbConfig(Ljava/lang/String;)Z
    .registers 3
    .parameter "config"

    .prologue
    .line 417
    const-string v0, "sys.usb.config"

    invoke-static {v0, p1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    invoke-direct {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->waitForState(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private updateAdbNotification()V
    .registers 14

    .prologue
    const/4 v9, 0x0

    const/4 v12, 0x1

    const v11, 0x104046a

    const/4 v10, 0x0

    .line 602
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    if-nez v7, :cond_f

    .line 638
    :cond_e
    :goto_e
    return-void

    .line 603
    :cond_f
    const v0, 0x104046a

    .line 604
    .local v0, id:I
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mAdbEnabled:Z
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$600(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v7

    if-eqz v7, :cond_9d

    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v7, :cond_9d

    .line 605
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

    .line 610
    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    if-nez v7, :cond_e

    .line 611
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 612
    .local v5, r:Landroid/content/res/Resources;
    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 613
    .local v6, title:Ljava/lang/CharSequence;
    const v7, 0x104046b

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 616
    .local v2, message:Ljava/lang/CharSequence;
    new-instance v3, Landroid/app/Notification;

    invoke-direct {v3}, Landroid/app/Notification;-><init>()V

    .line 617
    .local v3, notification:Landroid/app/Notification;
    const v7, 0x1080542

    iput v7, v3, Landroid/app/Notification;->icon:I

    .line 618
    const-wide/16 v7, 0x0

    iput-wide v7, v3, Landroid/app/Notification;->when:J

    .line 619
    const/4 v7, 0x2

    iput v7, v3, Landroid/app/Notification;->flags:I

    .line 620
    iput-object v6, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 621
    iput v10, v3, Landroid/app/Notification;->defaults:I

    .line 622
    iput-object v9, v3, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 623
    iput-object v9, v3, Landroid/app/Notification;->vibrate:[J

    .line 625
    new-instance v7, Landroid/content/ComponentName;

    const-string v8, "com.android.settings"

    const-string v9, "com.android.settings.DevelopmentSettings"

    invoke-direct {v7, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7}, Landroid/content/Intent;->makeRestartActivityTask(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    .line 628
    .local v1, intent:Landroid/content/Intent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v10, v1, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 630
    .local v4, pi:Landroid/app/PendingIntent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v3, v7, v6, v2, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 631
    iput-boolean v12, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    .line 632
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-virtual {v7, v11, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_e

    .line 634
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #message:Ljava/lang/CharSequence;
    .end local v3           #notification:Landroid/app/Notification;
    .end local v4           #pi:Landroid/app/PendingIntent;
    .end local v5           #r:Landroid/content/res/Resources;
    .end local v6           #title:Ljava/lang/CharSequence;
    :cond_9d
    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    if-eqz v7, :cond_e

    .line 635
    iput-boolean v10, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mAdbNotificationShown:Z

    .line 636
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

    .line 548
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

    .line 599
    :cond_12
    :goto_12
    return-void

    .line 553
    :cond_13
    const/4 v0, 0x0

    .line 554
    .local v0, id:I
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 555
    .local v5, r:Landroid/content/res/Resources;
    iget-boolean v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-eqz v7, :cond_2f

    .line 556
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "mtp"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_97

    .line 557
    const v0, 0x1040462

    .line 569
    :cond_2f
    :goto_2f
    iget v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    if-eq v0, v7, :cond_12

    .line 571
    iget v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    if-eqz v7, :cond_44

    .line 572
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    iget v8, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    invoke-virtual {v7, v8}, Landroid/app/NotificationManager;->cancel(I)V

    .line 573
    iput v10, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    .line 575
    :cond_44
    if-eqz v0, :cond_12

    .line 576
    const v7, 0x1040466

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 578
    .local v2, message:Ljava/lang/CharSequence;
    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 580
    .local v6, title:Ljava/lang/CharSequence;
    new-instance v3, Landroid/app/Notification;

    invoke-direct {v3}, Landroid/app/Notification;-><init>()V

    .line 581
    .local v3, notification:Landroid/app/Notification;
    const v7, 0x1080560

    iput v7, v3, Landroid/app/Notification;->icon:I

    .line 582
    const-wide/16 v7, 0x0

    iput-wide v7, v3, Landroid/app/Notification;->when:J

    .line 583
    const/4 v7, 0x2

    iput v7, v3, Landroid/app/Notification;->flags:I

    .line 584
    iput-object v6, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 585
    iput v10, v3, Landroid/app/Notification;->defaults:I

    .line 586
    iput-object v9, v3, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 587
    iput-object v9, v3, Landroid/app/Notification;->vibrate:[J

    .line 589
    new-instance v7, Landroid/content/ComponentName;

    const-string v8, "com.android.settings"

    const-string v9, "com.android.settings.UsbSettings"

    invoke-direct {v7, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7}, Landroid/content/Intent;->makeRestartActivityTask(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    .line 592
    .local v1, intent:Landroid/content/Intent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v10, v1, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 594
    .local v4, pi:Landroid/app/PendingIntent;
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v3, v7, v6, v2, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 595
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1500(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-virtual {v7, v0, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 596
    iput v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mUsbNotificationId:I

    goto/16 :goto_12

    .line 558
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

    .line 559
    const v0, 0x1040463

    goto :goto_2f

    .line 560
    :cond_a5
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "accessory"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b4

    .line 561
    const v0, 0x1040465

    goto/16 :goto_2f

    .line 564
    :cond_b4
    iget-object v7, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v8, "rndis"

    #calls: Lcom/android/server/usb/LegacyUsbDeviceManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v7, v8}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$700(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2f

    .line 565
    invoke-static {}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$500()Ljava/lang/String;

    move-result-object v7

    const-string v8, "No known USB function in updateUsbNotification"

    invoke-static {v7, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2f
.end method

.method private updateUsbState()V
    .registers 6

    .prologue
    .line 488
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.hardware.usb.action.USB_STATE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 489
    .local v2, intent:Landroid/content/Intent;
    const/high16 v3, 0x2000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 490
    const-string v3, "connected"

    iget-boolean v4, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 491
    const-string v3, "configured"

    iget-boolean v4, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 493
    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    if-eqz v3, :cond_33

    .line 494
    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 495
    .local v0, functions:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_27
    array-length v3, v0

    if-ge v1, v3, :cond_33

    .line 496
    aget-object v3, v0, v1

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 495
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 500
    .end local v0           #functions:[Ljava/lang/String;
    .end local v1           #i:I
    :cond_33
    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1000(Lcom/android/server/usb/LegacyUsbDeviceManager;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    .line 501
    return-void
.end method

.method private waitForState(Ljava/lang/String;)Z
    .registers 6
    .parameter "state"

    .prologue
    .line 401
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    const/16 v1, 0x14

    if-ge v0, v1, :cond_1b

    .line 403
    const-string v1, "sys.usb.state"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    const/4 v1, 0x1

    .line 411
    :goto_12
    return v1

    .line 406
    :cond_13
    const-wide/16 v1, 0x32

    :try_start_15
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_18
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_18} :catch_3d

    .line 401
    :goto_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 410
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

    .line 411
    const/4 v1, 0x0

    goto :goto_12

    .line 407
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
    .line 641
    const-string v1, "  USB Device State:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 642
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

    .line 643
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

    .line 644
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

    .line 645
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

    .line 646
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

    .line 648
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

    .line 650
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

    .line 655
    :goto_cb
    return-void

    .line 652
    :catch_cc
    move-exception v0

    .line 653
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
    .line 544
    iget-object v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 7
    .parameter "msg"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 505
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_6c

    .line 541
    :cond_7
    :goto_7
    return-void

    .line 508
    :pswitch_8
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_30

    move v2, v3

    :goto_d
    iput-boolean v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    .line 509
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v2, v3, :cond_32

    :goto_13
    iput-boolean v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    .line 510
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbNotification()V

    .line 511
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    .line 513
    iget-boolean v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    if-nez v2, :cond_24

    .line 515
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mDefaultFunctions:Ljava/lang/String;

    invoke-direct {p0, v2, v4}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setEnabledFunctions(Ljava/lang/String;Z)V

    .line 517
    :cond_24
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mBootCompleted:Z
    invoke-static {v2}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1300(Lcom/android/server/usb/LegacyUsbDeviceManager;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 518
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbState()V

    goto :goto_7

    :cond_30
    move v2, v4

    .line 508
    goto :goto_d

    :cond_32
    move v3, v4

    .line 509
    goto :goto_13

    .line 522
    :pswitch_34
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_3c

    :goto_38
    invoke-direct {p0, v3}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setAdbEnabled(Z)V

    goto :goto_7

    :cond_3c
    move v3, v4

    goto :goto_38

    .line 525
    :pswitch_3e
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 526
    .local v0, function:Ljava/lang/String;
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_4b

    move v1, v3

    .line 527
    .local v1, makeDefault:Z
    :goto_47
    invoke-direct {p0, v0, v1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->setEnabledFunctions(Ljava/lang/String;Z)V

    goto :goto_7

    .end local v1           #makeDefault:Z
    :cond_4b
    move v1, v4

    .line 526
    goto :goto_47

    .line 530
    .end local v0           #function:Ljava/lang/String;
    :pswitch_4d
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbNotification()V

    .line 531
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateAdbNotification()V

    .line 532
    invoke-direct {p0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->updateUsbState()V

    goto :goto_7

    .line 535
    :pswitch_57
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #setter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mBootCompleted:Z
    invoke-static {v2, v3}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1302(Lcom/android/server/usb/LegacyUsbDeviceManager;Z)Z

    .line 536
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    if-eqz v2, :cond_7

    .line 537
    iget-object v2, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->this$0:Lcom/android/server/usb/LegacyUsbDeviceManager;

    #getter for: Lcom/android/server/usb/LegacyUsbDeviceManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;
    invoke-static {v2}, Lcom/android/server/usb/LegacyUsbDeviceManager;->access$1400(Lcom/android/server/usb/LegacyUsbDeviceManager;)Lcom/android/server/usb/UsbSettingsManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v2, v3}, Lcom/android/server/usb/UsbSettingsManager;->accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V

    goto :goto_7

    .line 505
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
    .line 349
    iget-boolean v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConfigured:Z

    return v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 345
    iget-boolean v0, p0, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->mConnected:Z

    return v0
.end method

.method public sendMessage(ILjava/lang/Object;)V
    .registers 4
    .parameter "what"
    .parameter "arg"

    .prologue
    .line 360
    invoke-virtual {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 361
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 362
    .local v0, m:Landroid/os/Message;
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 363
    invoke-virtual {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 364
    return-void
.end method

.method public sendMessage(ILjava/lang/Object;Z)V
    .registers 6
    .parameter "what"
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 367
    invoke-virtual {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 368
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 369
    .local v0, m:Landroid/os/Message;
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 370
    if-eqz p3, :cond_12

    const/4 v1, 0x1

    :goto_c
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 371
    invoke-virtual {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 372
    return-void

    .line 370
    :cond_12
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public sendMessage(IZ)V
    .registers 5
    .parameter "what"
    .parameter "arg"

    .prologue
    .line 353
    invoke-virtual {p0, p1}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 354
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 355
    .local v0, m:Landroid/os/Message;
    if-eqz p2, :cond_10

    const/4 v1, 0x1

    :goto_a
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 356
    invoke-virtual {p0, v0}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 357
    return-void

    .line 355
    :cond_10
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public updateState(Ljava/lang/String;)V
    .registers 8
    .parameter "state"

    .prologue
    const/4 v4, 0x0

    .line 377
    const-string v3, "DISCONNECTED"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 378
    const/4 v1, 0x0

    .line 379
    .local v1, connected:I
    const/4 v0, 0x0

    .line 390
    .local v0, configured:I
    :goto_b
    invoke-virtual {p0, v4}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->removeMessages(I)V

    .line 391
    invoke-static {p0, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 392
    .local v2, msg:Landroid/os/Message;
    iput v1, v2, Landroid/os/Message;->arg1:I

    .line 393
    iput v0, v2, Landroid/os/Message;->arg2:I

    .line 395
    if-nez v1, :cond_4f

    const-wide/16 v3, 0x3e8

    :goto_1a
    invoke-virtual {p0, v2, v3, v4}, Lcom/android/server/usb/LegacyUsbDeviceManager$LegacyUsbHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 396
    .end local v0           #configured:I
    .end local v1           #connected:I
    .end local v2           #msg:Landroid/os/Message;
    :goto_1d
    return-void

    .line 380
    :cond_1e
    const-string v3, "CONNECTED"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 381
    const/4 v1, 0x1

    .line 382
    .restart local v1       #connected:I
    const/4 v0, 0x0

    .restart local v0       #configured:I
    goto :goto_b

    .line 383
    .end local v0           #configured:I
    .end local v1           #connected:I
    :cond_29
    const-string v3, "CONFIGURED"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 384
    const/4 v1, 0x1

    .line 385
    .restart local v1       #connected:I
    const/4 v0, 0x1

    .restart local v0       #configured:I
    goto :goto_b

    .line 387
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

    .line 395
    .restart local v0       #configured:I
    .restart local v1       #connected:I
    .restart local v2       #msg:Landroid/os/Message;
    :cond_4f
    const-wide/16 v3, 0x0

    goto :goto_1a
.end method
