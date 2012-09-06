.class Lcom/android/server/ServerThread;
.super Ljava/lang/Thread;
.source "SystemServer.java"


# static fields
.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field mContentResolver:Landroid/content/ContentResolver;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 800
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 801
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 803
    const-string v1, "SystemServer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting service: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 805
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 82
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const-string v0, "SystemServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 84
    return-void
.end method

.method public run()V
    .registers 104

    .prologue
    .line 88
    const/16 v3, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v3, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 91
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 93
    const/4 v3, -0x2

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 96
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 97
    const/4 v3, 0x0

    invoke-static {v3}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 101
    const-string v3, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v3, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v84

    .line 103
    .local v84, shutdownAction:Ljava/lang/String;
    if-eqz v84, :cond_4e

    invoke-virtual/range {v84 .. v84}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4e

    .line 104
    const/4 v3, 0x0

    move-object/from16 v0, v84

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v9, 0x31

    if-ne v3, v9, :cond_5ad

    const/16 v81, 0x1

    .line 107
    .local v81, reboot:Z
    :goto_35
    invoke-virtual/range {v84 .. v84}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v9, 0x1

    if-le v3, v9, :cond_5b1

    .line 108
    const/4 v3, 0x1

    invoke-virtual/range {v84 .. v84}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v84

    invoke-virtual {v0, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v80

    .line 113
    .local v80, reason:Ljava/lang/String;
    :goto_47
    move/from16 v0, v81

    move-object/from16 v1, v80

    invoke-static {v0, v1}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 117
    .end local v80           #reason:Ljava/lang/String;
    .end local v81           #reboot:Z
    :cond_4e
    const-string v3, "ro.factorytest"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v59

    .line 118
    .local v59, factoryTestStr:Ljava/lang/String;
    const-string v3, ""

    move-object/from16 v0, v59

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5b5

    const/16 v58, 0x0

    .line 121
    .local v58, factoryTest:I
    :goto_60
    const/16 v64, 0x0

    .line 122
    .local v64, lights:Lcom/android/server/LightsService;
    const/16 v77, 0x0

    .line 123
    .local v77, power:Lcom/android/server/PowerManagerService;
    const/16 v41, 0x0

    .line 124
    .local v41, battery:Lcom/android/server/BatteryService;
    const/16 v38, 0x0

    .line 125
    .local v38, alarm:Lcom/android/server/AlarmManagerService;
    const/4 v13, 0x0

    .line 126
    .local v13, networkManagement:Lcom/android/server/NetworkManagementService;
    const/4 v12, 0x0

    .line 127
    .local v12, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v69, 0x0

    .line 128
    .local v69, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v48, 0x0

    .line 129
    .local v48, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v100, 0x0

    .line 130
    .local v100, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v98, 0x0

    .line 131
    .local v98, wifi:Lcom/android/server/WifiService;
    const/16 v76, 0x0

    .line 132
    .local v76, pm:Landroid/content/pm/IPackageManager;
    const/4 v4, 0x0

    .line 133
    .local v4, context:Landroid/content/Context;
    const/16 v102, 0x0

    .line 134
    .local v102, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v42, 0x0

    .line 135
    .local v42, bluetooth:Landroid/server/BluetoothService;
    const/16 v44, 0x0

    .line 136
    .local v44, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v55, 0x0

    .line 137
    .local v55, dock:Lcom/android/server/DockObserver;
    const/16 v93, 0x0

    .line 138
    .local v93, usb:Lcom/android/server/usb/UsbService;
    const/16 v91, 0x0

    .line 139
    .local v91, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v82, 0x0

    .line 140
    .local v82, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v87, 0x0

    .line 141
    .local v87, throttle:Lcom/android/server/ThrottleService;
    const/16 v71, 0x0

    .line 145
    .local v71, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :try_start_87
    const-string v3, "SystemServer"

    const-string v9, "Entropy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    const-string v3, "entropy"

    new-instance v9, Lcom/android/server/EntropyService;

    invoke-direct {v9}, Lcom/android/server/EntropyService;-><init>()V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 148
    const-string v3, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    new-instance v6, Lcom/android/server/PowerManagerService;

    invoke-direct {v6}, Lcom/android/server/PowerManagerService;-><init>()V
    :try_end_a4
    .catch Ljava/lang/RuntimeException; {:try_start_87 .. :try_end_a4} :catch_8ab

    .line 150
    .end local v77           #power:Lcom/android/server/PowerManagerService;
    .local v6, power:Lcom/android/server/PowerManagerService;
    :try_start_a4
    const-string v3, "power"

    invoke-static {v3, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 152
    const-string v3, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    invoke-static/range {v58 .. v58}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v4

    .line 155
    const-string v3, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const-string v3, "telephony.registry"

    new-instance v9, Lcom/android/server/TelephonyRegistry;

    invoke-direct {v9, v4}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 158
    invoke-static {v4}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 160
    const-string v3, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    const-string v3, "vold.decrypt"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v52

    .line 163
    .local v52, cryptState:Ljava/lang/String;
    const/16 v75, 0x0

    .line 164
    .local v75, onlyCore:Z
    const-string v3, "trigger_restart_min_framework"

    move-object/from16 v0, v52

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5bb

    .line 165
    const-string v3, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    const/16 v75, 0x1

    .line 172
    :cond_ea
    :goto_ea
    if-eqz v58, :cond_5d0

    const/4 v3, 0x1

    :goto_ed
    move/from16 v0, v75

    invoke-static {v4, v3, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_f2
    .catch Ljava/lang/RuntimeException; {:try_start_a4 .. :try_end_f2} :catch_5df

    move-result-object v76

    .line 175
    const/16 v61, 0x0

    .line 177
    .local v61, firstBoot:Z
    :try_start_f5
    invoke-interface/range {v76 .. v76}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_f8
    .catch Landroid/os/RemoteException; {:try_start_f5 .. :try_end_f8} :catch_857
    .catch Ljava/lang/RuntimeException; {:try_start_f5 .. :try_end_f8} :catch_5df

    move-result v61

    .line 181
    :goto_f9
    :try_start_f9
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 183
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_104
    .catch Ljava/lang/RuntimeException; {:try_start_f9 .. :try_end_104} :catch_5df

    .line 187
    :try_start_104
    const-string v3, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const-string v3, "account"

    new-instance v9, Landroid/accounts/AccountManagerService;

    invoke-direct {v9, v4}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_115
    .catch Ljava/lang/Throwable; {:try_start_104 .. :try_end_115} :catch_5d3
    .catch Ljava/lang/RuntimeException; {:try_start_104 .. :try_end_115} :catch_5df

    .line 195
    :goto_115
    :try_start_115
    const-string v3, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const/4 v3, 0x1

    move/from16 v0, v58

    if-ne v0, v3, :cond_5f6

    const/4 v3, 0x1

    :goto_122
    invoke-static {v4, v3}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/IContentService;

    .line 200
    const-string v3, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 203
    const-string v3, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    new-instance v65, Lcom/android/server/LightsService;

    move-object/from16 v0, v65

    invoke-direct {v0, v4}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_13d
    .catch Ljava/lang/RuntimeException; {:try_start_115 .. :try_end_13d} :catch_5df

    .line 206
    .end local v64           #lights:Lcom/android/server/LightsService;
    .local v65, lights:Lcom/android/server/LightsService;
    :try_start_13d
    const-string v3, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    new-instance v5, Lcom/android/server/BatteryService;

    move-object/from16 v0, v65

    invoke-direct {v5, v4, v0}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_14b
    .catch Ljava/lang/RuntimeException; {:try_start_13d .. :try_end_14b} :catch_8b4

    .line 208
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .local v5, battery:Lcom/android/server/BatteryService;
    :try_start_14b
    const-string v3, "battery"

    invoke-static {v3, v5}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 210
    const-string v3, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    const-string v3, "vibrator"

    new-instance v9, Lcom/android/server/VibratorService;

    invoke-direct {v9, v4}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 215
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v65

    invoke-virtual {v6, v4, v0, v3, v5}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    .line 217
    const-string v3, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    new-instance v7, Lcom/android/server/AlarmManagerService;

    invoke-direct {v7, v4}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_176
    .catch Ljava/lang/RuntimeException; {:try_start_14b .. :try_end_176} :catch_8bd

    .line 219
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .local v7, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_176
    const-string v3, "alarm"

    invoke-static {v3, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 221
    const-string v3, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v3

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 225
    const-string v3, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    const/4 v3, 0x1

    move/from16 v0, v58

    if-eq v0, v3, :cond_5f9

    const/4 v3, 0x1

    move v9, v3

    :goto_19b
    if-nez v61, :cond_5fd

    const/4 v3, 0x1

    :goto_19e
    invoke-static {v4, v6, v9, v3}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v102

    .line 229
    const-string v3, "window"

    move-object/from16 v0, v102

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 231
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v102

    invoke-virtual {v3, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 236
    const-string v3, "ro.kernel.qemu"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "1"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_600

    .line 237
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1c7
    .catch Ljava/lang/RuntimeException; {:try_start_176 .. :try_end_1c7} :catch_60e

    :goto_1c7
    move-object/from16 v64, v65

    .line 264
    .end local v52           #cryptState:Ljava/lang/String;
    .end local v61           #firstBoot:Z
    .end local v65           #lights:Lcom/android/server/LightsService;
    .end local v75           #onlyCore:Z
    .restart local v64       #lights:Lcom/android/server/LightsService;
    :goto_1c9
    const/16 v53, 0x0

    .line 265
    .local v53, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v85, 0x0

    .line 266
    .local v85, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v62, 0x0

    .line 267
    .local v62, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v39, 0x0

    .line 268
    .local v39, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v73, 0x0

    .line 269
    .local v73, notification:Lcom/android/server/NotificationManagerService;
    const/16 v96, 0x0

    .line 270
    .local v96, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v66, 0x0

    .line 271
    .local v66, location:Lcom/android/server/LocationManagerService;
    const/16 v50, 0x0

    .line 272
    .local v50, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v89, 0x0

    .line 273
    .local v89, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v78, 0x0

    .line 276
    .local v78, powerSaver:Landroid/server/PowerSaverService;
    const/4 v3, 0x1

    move/from16 v0, v58

    if-eq v0, v3, :cond_20a

    .line 278
    :try_start_1e2
    const-string v3, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    new-instance v63, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v63

    invoke-direct {v0, v4}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1f0
    .catch Ljava/lang/Throwable; {:try_start_1e2 .. :try_end_1f0} :catch_660

    .line 280
    .end local v62           #imm:Lcom/android/server/InputMethodManagerService;
    .local v63, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_1f0
    const-string v3, "input_method"

    move-object/from16 v0, v63

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1f7
    .catch Ljava/lang/Throwable; {:try_start_1f0 .. :try_end_1f7} :catch_8a6

    move-object/from16 v62, v63

    .line 286
    .end local v63           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v62       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_1f9
    :try_start_1f9
    const-string v3, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    const-string v3, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_20a
    .catch Ljava/lang/Throwable; {:try_start_1f9 .. :try_end_20a} :catch_66c

    .line 295
    :cond_20a
    :goto_20a
    :try_start_20a
    invoke-virtual/range {v102 .. v102}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_20d
    .catch Ljava/lang/Throwable; {:try_start_20a .. :try_end_20d} :catch_678

    .line 301
    :goto_20d
    :try_start_20d
    invoke-interface/range {v76 .. v76}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_210
    .catch Ljava/lang/Throwable; {:try_start_20d .. :try_end_210} :catch_684

    .line 307
    :goto_210
    :try_start_210
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x10403c7

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_223
    .catch Landroid/os/RemoteException; {:try_start_210 .. :try_end_223} :catch_8a3

    .line 314
    :goto_223
    const/4 v3, 0x1

    move/from16 v0, v58

    if-eq v0, v3, :cond_8d4

    .line 316
    :try_start_228
    const-string v3, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    new-instance v54, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v54

    invoke-direct {v0, v4}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_236
    .catch Ljava/lang/Throwable; {:try_start_228 .. :try_end_236} :catch_690

    .line 318
    .end local v53           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v54, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_236
    const-string v3, "device_policy"

    move-object/from16 v0, v54

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_23d
    .catch Ljava/lang/Throwable; {:try_start_236 .. :try_end_23d} :catch_89e

    move-object/from16 v53, v54

    .line 324
    .end local v54           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v53       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_23f
    :try_start_23f
    const-string v3, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    new-instance v86, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v86

    move-object/from16 v1, v102

    invoke-direct {v0, v4, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_24f
    .catch Ljava/lang/Throwable; {:try_start_23f .. :try_end_24f} :catch_69c

    .line 326
    .end local v85           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v86, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_24f
    const-string v3, "statusbar"

    move-object/from16 v0, v86

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_256
    .catch Ljava/lang/Throwable; {:try_start_24f .. :try_end_256} :catch_899

    move-object/from16 v85, v86

    .line 332
    .end local v86           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v85       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_258
    :try_start_258
    const-string v3, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    const-string v3, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v4}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_269
    .catch Ljava/lang/Throwable; {:try_start_258 .. :try_end_269} :catch_6a8

    .line 340
    :goto_269
    :try_start_269
    const-string v3, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    invoke-static {v4}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v13

    .line 342
    const-string v3, "network_management"

    invoke-static {v3, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_279
    .catch Ljava/lang/Throwable; {:try_start_269 .. :try_end_279} :catch_6b4

    .line 348
    :goto_279
    :try_start_279
    const-string v3, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    new-instance v90, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v90

    invoke-direct {v0, v4}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_287
    .catch Ljava/lang/Throwable; {:try_start_279 .. :try_end_287} :catch_6c0

    .line 350
    .end local v89           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v90, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_287
    const-string v3, "textservices"

    move-object/from16 v0, v90

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28e
    .catch Ljava/lang/Throwable; {:try_start_287 .. :try_end_28e} :catch_894

    move-object/from16 v89, v90

    .line 356
    .end local v90           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v89       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_290
    :try_start_290
    const-string v3, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    new-instance v70, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v70

    invoke-direct {v0, v4, v13, v7}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_29e
    .catch Ljava/lang/Throwable; {:try_start_290 .. :try_end_29e} :catch_6cc

    .line 358
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v70, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_29e
    const-string v3, "netstats"

    move-object/from16 v0, v70

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a5
    .catch Ljava/lang/Throwable; {:try_start_29e .. :try_end_2a5} :catch_88f

    move-object/from16 v12, v70

    .line 364
    .end local v70           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_2a7
    :try_start_2a7
    const-string v3, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    new-instance v8, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    move-object v9, v4

    move-object v11, v6

    invoke-direct/range {v8 .. v13}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_2b9
    .catch Ljava/lang/Throwable; {:try_start_2a7 .. :try_end_2b9} :catch_6d8

    .line 368
    .end local v69           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v8, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_2b9
    const-string v3, "netpolicy"

    invoke-static {v3, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2be
    .catch Ljava/lang/Throwable; {:try_start_2b9 .. :try_end_2be} :catch_88c

    .line 374
    :goto_2be
    :try_start_2be
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    new-instance v101, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v101

    invoke-direct {v0, v4}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_2cc
    .catch Ljava/lang/Throwable; {:try_start_2be .. :try_end_2cc} :catch_6e6

    .line 376
    .end local v100           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v101, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_2cc
    const-string v3, "wifip2p"

    move-object/from16 v0, v101

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d3
    .catch Ljava/lang/Throwable; {:try_start_2cc .. :try_end_2d3} :catch_887

    move-object/from16 v100, v101

    .line 382
    .end local v101           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v100       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_2d5
    :try_start_2d5
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    new-instance v99, Lcom/android/server/WifiService;

    move-object/from16 v0, v99

    invoke-direct {v0, v4}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_2e3
    .catch Ljava/lang/Throwable; {:try_start_2d5 .. :try_end_2e3} :catch_6f2

    .line 384
    .end local v98           #wifi:Lcom/android/server/WifiService;
    .local v99, wifi:Lcom/android/server/WifiService;
    :try_start_2e3
    const-string v3, "wifi"

    move-object/from16 v0, v99

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2ea
    .catch Ljava/lang/Throwable; {:try_start_2e3 .. :try_end_2ea} :catch_882

    move-object/from16 v98, v99

    .line 390
    .end local v99           #wifi:Lcom/android/server/WifiService;
    .restart local v98       #wifi:Lcom/android/server/WifiService;
    :goto_2ec
    :try_start_2ec
    const-string v3, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    new-instance v49, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v49

    invoke-direct {v0, v4, v13, v12, v8}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_2fa
    .catch Ljava/lang/Throwable; {:try_start_2ec .. :try_end_2fa} :catch_6fe

    .line 393
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .local v49, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_2fa
    const-string v3, "connectivity"

    move-object/from16 v0, v49

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 394
    move-object/from16 v0, v49

    invoke-virtual {v12, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 395
    move-object/from16 v0, v49

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 396
    invoke-virtual/range {v98 .. v98}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 397
    invoke-virtual/range {v100 .. v100}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_311
    .catch Ljava/lang/Throwable; {:try_start_2fa .. :try_end_311} :catch_87d

    move-object/from16 v48, v49

    .line 403
    .end local v49           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_313
    :try_start_313
    const-string v3, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 404
    new-instance v88, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v88

    invoke-direct {v0, v4}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_321
    .catch Ljava/lang/Throwable; {:try_start_313 .. :try_end_321} :catch_70a

    .line 405
    .end local v87           #throttle:Lcom/android/server/ThrottleService;
    .local v88, throttle:Lcom/android/server/ThrottleService;
    :try_start_321
    const-string v3, "throttle"

    move-object/from16 v0, v88

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_328
    .catch Ljava/lang/Throwable; {:try_start_321 .. :try_end_328} :catch_878

    move-object/from16 v87, v88

    .line 416
    .end local v88           #throttle:Lcom/android/server/ThrottleService;
    .restart local v87       #throttle:Lcom/android/server/ThrottleService;
    :goto_32a
    :try_start_32a
    const-string v3, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    const-string v3, "mount"

    new-instance v9, Lcom/android/server/MountService;

    invoke-direct {v9, v4}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33b
    .catch Ljava/lang/Throwable; {:try_start_32a .. :try_end_33b} :catch_716

    .line 423
    :goto_33b
    :try_start_33b
    const-string v3, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    new-instance v74, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v74

    move-object/from16 v1, v85

    move-object/from16 v2, v64

    invoke-direct {v0, v4, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_34d
    .catch Ljava/lang/Throwable; {:try_start_33b .. :try_end_34d} :catch_722

    .line 425
    .end local v73           #notification:Lcom/android/server/NotificationManagerService;
    .local v74, notification:Lcom/android/server/NotificationManagerService;
    :try_start_34d
    const-string v3, "notification"

    move-object/from16 v0, v74

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 426
    move-object/from16 v0, v74

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_359
    .catch Ljava/lang/Throwable; {:try_start_34d .. :try_end_359} :catch_873

    move-object/from16 v73, v74

    .line 432
    .end local v74           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v73       #notification:Lcom/android/server/NotificationManagerService;
    :goto_35b
    sget-boolean v3, Landroid/os/SystemProperties;->QCOM_HDMI_OUT:Z

    if-eqz v3, :cond_370

    .line 434
    :try_start_35f
    const-string v3, "SystemServer"

    const-string v9, "HDMI Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    const-string v3, "hdmi"

    new-instance v9, Lcom/android/server/HDMIService;

    invoke-direct {v9, v4}, Lcom/android/server/HDMIService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_370
    .catch Ljava/lang/Throwable; {:try_start_35f .. :try_end_370} :catch_72e

    .line 442
    :cond_370
    :goto_370
    :try_start_370
    const-string v3, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    const-string v3, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v4}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_381
    .catch Ljava/lang/Throwable; {:try_start_370 .. :try_end_381} :catch_73a

    .line 450
    :goto_381
    :try_start_381
    const-string v3, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    new-instance v67, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v67

    invoke-direct {v0, v4}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_38f
    .catch Ljava/lang/Throwable; {:try_start_381 .. :try_end_38f} :catch_746

    .line 452
    .end local v66           #location:Lcom/android/server/LocationManagerService;
    .local v67, location:Lcom/android/server/LocationManagerService;
    :try_start_38f
    const-string v3, "location"

    move-object/from16 v0, v67

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_396
    .catch Ljava/lang/Throwable; {:try_start_38f .. :try_end_396} :catch_86e

    move-object/from16 v66, v67

    .line 458
    .end local v67           #location:Lcom/android/server/LocationManagerService;
    .restart local v66       #location:Lcom/android/server/LocationManagerService;
    :goto_398
    :try_start_398
    const-string v3, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    new-instance v51, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v51

    invoke-direct {v0, v4}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_3a6
    .catch Ljava/lang/Throwable; {:try_start_398 .. :try_end_3a6} :catch_752

    .line 460
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v51, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_3a6
    const-string v3, "country_detector"

    move-object/from16 v0, v51

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3ad
    .catch Ljava/lang/Throwable; {:try_start_3a6 .. :try_end_3ad} :catch_869

    move-object/from16 v50, v51

    .line 466
    .end local v51           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_3af
    :try_start_3af
    const-string v3, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    const-string v3, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v4}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3c0
    .catch Ljava/lang/Throwable; {:try_start_3af .. :try_end_3c0} :catch_75e

    .line 474
    :goto_3c0
    :try_start_3c0
    const-string v3, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    const-string v3, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v4, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3d8
    .catch Ljava/lang/Throwable; {:try_start_3c0 .. :try_end_3d8} :catch_76a

    .line 482
    :goto_3d8
    :try_start_3d8
    const-string v3, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    new-instance v97, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v97

    invoke-direct {v0, v4}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3e6
    .catch Ljava/lang/Throwable; {:try_start_3d8 .. :try_end_3e6} :catch_776

    .line 484
    .end local v96           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v97, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_3e6
    const-string v3, "wallpaper"

    move-object/from16 v0, v97

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3ed
    .catch Ljava/lang/Throwable; {:try_start_3e6 .. :try_end_3ed} :catch_864

    move-object/from16 v96, v97

    .line 490
    .end local v97           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v96       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :goto_3ef
    :try_start_3ef
    const-string v3, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    const-string v3, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v4}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_400
    .catch Ljava/lang/Throwable; {:try_start_3ef .. :try_end_400} :catch_782

    .line 497
    :goto_400
    :try_start_400
    const-string v3, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    new-instance v56, Lcom/android/server/DockObserver;

    move-object/from16 v0, v56

    invoke-direct {v0, v4, v6}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_40e
    .catch Ljava/lang/Throwable; {:try_start_400 .. :try_end_40e} :catch_78e

    .end local v55           #dock:Lcom/android/server/DockObserver;
    .local v56, dock:Lcom/android/server/DockObserver;
    move-object/from16 v55, v56

    .line 505
    .end local v56           #dock:Lcom/android/server/DockObserver;
    .restart local v55       #dock:Lcom/android/server/DockObserver;
    :goto_410
    :try_start_410
    const-string v3, "SystemServer"

    const-string v9, "Wired Accessory Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    new-instance v3, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v3, v4}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_41c
    .catch Ljava/lang/Throwable; {:try_start_410 .. :try_end_41c} :catch_79a

    .line 513
    :goto_41c
    :try_start_41c
    const-string v3, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    new-instance v94, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v94

    invoke-direct {v0, v4}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_42a
    .catch Ljava/lang/Throwable; {:try_start_41c .. :try_end_42a} :catch_7a6

    .line 516
    .end local v93           #usb:Lcom/android/server/usb/UsbService;
    .local v94, usb:Lcom/android/server/usb/UsbService;
    :try_start_42a
    const-string v3, "usb"

    move-object/from16 v0, v94

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_431
    .catch Ljava/lang/Throwable; {:try_start_42a .. :try_end_431} :catch_85f

    move-object/from16 v93, v94

    .line 522
    .end local v94           #usb:Lcom/android/server/usb/UsbService;
    .restart local v93       #usb:Lcom/android/server/usb/UsbService;
    :goto_433
    :try_start_433
    const-string v3, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    new-instance v92, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v92

    invoke-direct {v0, v4}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_441
    .catch Ljava/lang/Throwable; {:try_start_433 .. :try_end_441} :catch_7b2

    .end local v91           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v92, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v91, v92

    .line 530
    .end local v92           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v91       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_443
    :try_start_443
    const-string v3, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    const-string v3, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_454
    .catch Ljava/lang/Throwable; {:try_start_443 .. :try_end_454} :catch_7be

    .line 538
    :goto_454
    :try_start_454
    const-string v3, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    new-instance v40, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v40

    invoke-direct {v0, v4}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_462
    .catch Ljava/lang/Throwable; {:try_start_454 .. :try_end_462} :catch_7ca

    .line 540
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .local v40, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_462
    const-string v3, "appwidget"

    move-object/from16 v0, v40

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_469
    .catch Ljava/lang/Throwable; {:try_start_462 .. :try_end_469} :catch_85a

    move-object/from16 v39, v40

    .line 546
    .end local v40           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_46b
    :try_start_46b
    const-string v3, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    new-instance v83, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v83

    invoke-direct {v0, v4}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_479
    .catch Ljava/lang/Throwable; {:try_start_46b .. :try_end_479} :catch_7d6

    .end local v82           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v83, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v82, v83

    .line 553
    .end local v83           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v82       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_47b
    :try_start_47b
    const-string v3, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    const-string v3, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v4}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_48c
    .catch Ljava/lang/Throwable; {:try_start_47b .. :try_end_48c} :catch_7e2

    .line 564
    :goto_48c
    :try_start_48c
    const-string v3, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 565
    const-string v3, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v4}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_49d
    .catch Ljava/lang/Throwable; {:try_start_48c .. :try_end_49d} :catch_7ee

    .line 572
    :goto_49d
    :try_start_49d
    const-string v3, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    new-instance v72, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v72

    invoke-direct {v0, v4}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_4ab
    .catch Ljava/lang/Throwable; {:try_start_49d .. :try_end_4ab} :catch_7fa

    .end local v71           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v72, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v71, v72

    .line 579
    .end local v72           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v71       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_4ad
    :try_start_4ad
    const-string v3, "SystemServer"

    const-string v9, "PowerSaverService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 580
    new-instance v79, Landroid/server/PowerSaverService;

    move-object/from16 v0, v79

    invoke-direct {v0, v4}, Landroid/server/PowerSaverService;-><init>(Landroid/content/Context;)V
    :try_end_4bb
    .catch Ljava/lang/Throwable; {:try_start_4ad .. :try_end_4bb} :catch_806

    .end local v78           #powerSaver:Landroid/server/PowerSaverService;
    .local v79, powerSaver:Landroid/server/PowerSaverService;
    move-object/from16 v78, v79

    .line 586
    .end local v79           #powerSaver:Landroid/server/PowerSaverService;
    .restart local v78       #powerSaver:Landroid/server/PowerSaverService;
    :goto_4bd
    :try_start_4bd
    const-string v3, "SystemServer"

    const-string v9, "AssetRedirectionManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 587
    const-string v3, "assetredirection"

    new-instance v9, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4ce
    .catch Ljava/lang/Throwable; {:try_start_4bd .. :try_end_4ce} :catch_812

    .line 595
    :goto_4ce
    invoke-virtual/range {v102 .. v102}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v27

    .line 596
    .local v27, safeMode:Z
    if-eqz v27, :cond_81e

    .line 597
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 599
    const/4 v3, 0x1

    sput-boolean v3, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 601
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 609
    :goto_4e5
    if-eqz v53, :cond_4ea

    .line 611
    :try_start_4e7
    invoke-virtual/range {v53 .. v53}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_4ea
    .catch Ljava/lang/Throwable; {:try_start_4e7 .. :try_end_4ea} :catch_827

    .line 617
    :cond_4ea
    :goto_4ea
    if-eqz v73, :cond_4ef

    .line 619
    :try_start_4ec
    invoke-virtual/range {v73 .. v73}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_4ef
    .catch Ljava/lang/Throwable; {:try_start_4ec .. :try_end_4ef} :catch_833

    .line 626
    :cond_4ef
    :goto_4ef
    :try_start_4ef
    invoke-virtual/range {v102 .. v102}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_4f2
    .catch Ljava/lang/Throwable; {:try_start_4ef .. :try_end_4f2} :catch_83f

    .line 631
    :goto_4f2
    if-eqz v27, :cond_4fb

    .line 632
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 638
    :cond_4fb
    invoke-virtual/range {v102 .. v102}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v47

    .line 639
    .local v47, config:Landroid/content/res/Configuration;
    new-instance v68, Landroid/util/DisplayMetrics;

    invoke-direct/range {v68 .. v68}, Landroid/util/DisplayMetrics;-><init>()V

    .line 640
    .local v68, metrics:Landroid/util/DisplayMetrics;
    const-string v3, "window"

    invoke-virtual {v4, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v95

    check-cast v95, Landroid/view/WindowManager;

    .line 641
    .local v95, w:Landroid/view/WindowManager;
    invoke-interface/range {v95 .. v95}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    move-object/from16 v0, v68

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 642
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v0, v47

    move-object/from16 v1, v68

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 644
    invoke-virtual {v6}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 646
    :try_start_523
    invoke-interface/range {v76 .. v76}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_526
    .catch Ljava/lang/Throwable; {:try_start_523 .. :try_end_526} :catch_84b

    .line 651
    :goto_526
    new-instance v60, Landroid/content/IntentFilter;

    invoke-direct/range {v60 .. v60}, Landroid/content/IntentFilter;-><init>()V

    .line 652
    .local v60, filter:Landroid/content/IntentFilter;
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 653
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 654
    const-string v3, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 655
    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 656
    const-string v3, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 657
    const-string v3, "package"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 658
    new-instance v3, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v3}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v60

    invoke-virtual {v4, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 661
    move-object/from16 v16, v4

    .line 662
    .local v16, contextF:Landroid/content/Context;
    move-object/from16 v17, v5

    .line 663
    .local v17, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v18, v13

    .line 664
    .local v18, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v19, v12

    .line 665
    .local v19, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v20, v8

    .line 666
    .local v20, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v21, v48

    .line 667
    .local v21, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v22, v55

    .line 668
    .local v22, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v23, v93

    .line 669
    .local v23, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v33, v87

    .line 670
    .local v33, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v24, v91

    .line 671
    .local v24, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v26, v39

    .line 672
    .local v26, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v28, v96

    .line 673
    .local v28, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v29, v62

    .line 674
    .local v29, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v25, v82

    .line 675
    .local v25, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v31, v66

    .line 676
    .local v31, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v32, v50

    .line 677
    .local v32, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v34, v71

    .line 678
    .local v34, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v35, v89

    .line 679
    .local v35, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v30, v85

    .line 680
    .local v30, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v36, v78

    .line 687
    .local v36, powerSaverF:Landroid/server/PowerSaverService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    new-instance v14, Lcom/android/server/ServerThread$1;

    move-object/from16 v15, p0

    invoke-direct/range {v14 .. v36}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/TextServicesManagerService;Landroid/server/PowerSaverService;)V

    invoke-virtual {v3, v14}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 791
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v3

    if-eqz v3, :cond_5a2

    .line 792
    const-string v3, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 795
    :cond_5a2
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 796
    const-string v3, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    return-void

    .line 104
    .end local v4           #context:Landroid/content/Context;
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v6           #power:Lcom/android/server/PowerManagerService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .end local v13           #networkManagement:Lcom/android/server/NetworkManagementService;
    .end local v16           #contextF:Landroid/content/Context;
    .end local v17           #batteryF:Lcom/android/server/BatteryService;
    .end local v18           #networkManagementF:Lcom/android/server/NetworkManagementService;
    .end local v19           #networkStatsF:Lcom/android/server/net/NetworkStatsService;
    .end local v20           #networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v21           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v22           #dockF:Lcom/android/server/DockObserver;
    .end local v23           #usbF:Lcom/android/server/usb/UsbService;
    .end local v24           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v25           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v26           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v27           #safeMode:Z
    .end local v28           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v29           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v30           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v31           #locationF:Lcom/android/server/LocationManagerService;
    .end local v32           #countryDetectorF:Lcom/android/server/CountryDetectorService;
    .end local v33           #throttleF:Lcom/android/server/ThrottleService;
    .end local v34           #networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    .end local v35           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    .end local v36           #powerSaverF:Landroid/server/PowerSaverService;
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v47           #config:Landroid/content/res/Configuration;
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v53           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v55           #dock:Lcom/android/server/DockObserver;
    .end local v58           #factoryTest:I
    .end local v59           #factoryTestStr:Ljava/lang/String;
    .end local v60           #filter:Landroid/content/IntentFilter;
    .end local v62           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v64           #lights:Lcom/android/server/LightsService;
    .end local v66           #location:Lcom/android/server/LocationManagerService;
    .end local v68           #metrics:Landroid/util/DisplayMetrics;
    .end local v71           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v73           #notification:Lcom/android/server/NotificationManagerService;
    .end local v76           #pm:Landroid/content/pm/IPackageManager;
    .end local v78           #powerSaver:Landroid/server/PowerSaverService;
    .end local v82           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v85           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v87           #throttle:Lcom/android/server/ThrottleService;
    .end local v89           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v91           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v93           #usb:Lcom/android/server/usb/UsbService;
    .end local v95           #w:Landroid/view/WindowManager;
    .end local v96           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v98           #wifi:Lcom/android/server/WifiService;
    .end local v100           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v102           #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_5ad
    const/16 v81, 0x0

    goto/16 :goto_35

    .line 110
    .restart local v81       #reboot:Z
    :cond_5b1
    const/16 v80, 0x0

    .restart local v80       #reason:Ljava/lang/String;
    goto/16 :goto_47

    .line 118
    .end local v80           #reason:Ljava/lang/String;
    .end local v81           #reboot:Z
    .restart local v59       #factoryTestStr:Ljava/lang/String;
    :cond_5b5
    invoke-static/range {v59 .. v59}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v58

    goto/16 :goto_60

    .line 167
    .restart local v4       #context:Landroid/content/Context;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v13       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v52       #cryptState:Ljava/lang/String;
    .restart local v55       #dock:Lcom/android/server/DockObserver;
    .restart local v58       #factoryTest:I
    .restart local v64       #lights:Lcom/android/server/LightsService;
    .restart local v69       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v71       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v75       #onlyCore:Z
    .restart local v76       #pm:Landroid/content/pm/IPackageManager;
    .restart local v82       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v87       #throttle:Lcom/android/server/ThrottleService;
    .restart local v91       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v93       #usb:Lcom/android/server/usb/UsbService;
    .restart local v98       #wifi:Lcom/android/server/WifiService;
    .restart local v100       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v102       #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_5bb
    :try_start_5bb
    const-string v3, "1"

    move-object/from16 v0, v52

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ea

    .line 168
    const-string v3, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/16 v75, 0x1

    goto/16 :goto_ea

    .line 172
    :cond_5d0
    const/4 v3, 0x0

    goto/16 :goto_ed

    .line 190
    .restart local v61       #firstBoot:Z
    :catch_5d3
    move-exception v57

    .line 191
    .local v57, e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v57

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5dd
    .catch Ljava/lang/RuntimeException; {:try_start_5bb .. :try_end_5dd} :catch_5df

    goto/16 :goto_115

    .line 259
    .end local v52           #cryptState:Ljava/lang/String;
    .end local v57           #e:Ljava/lang/Throwable;
    .end local v61           #firstBoot:Z
    .end local v75           #onlyCore:Z
    :catch_5df
    move-exception v57

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .line 260
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .local v57, e:Ljava/lang/RuntimeException;
    :goto_5e4
    const-string v3, "System"

    const-string v9, "******************************************"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const-string v3, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v57

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1c9

    .line 196
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v57           #e:Ljava/lang/RuntimeException;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v52       #cryptState:Ljava/lang/String;
    .restart local v61       #firstBoot:Z
    .restart local v75       #onlyCore:Z
    :cond_5f6
    const/4 v3, 0x0

    goto/16 :goto_122

    .line 226
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .end local v64           #lights:Lcom/android/server/LightsService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v65       #lights:Lcom/android/server/LightsService;
    :cond_5f9
    const/4 v3, 0x0

    move v9, v3

    goto/16 :goto_19b

    :cond_5fd
    const/4 v3, 0x0

    goto/16 :goto_19e

    .line 238
    :cond_600
    const/4 v3, 0x1

    move/from16 v0, v58

    if-ne v0, v3, :cond_612

    .line 239
    :try_start_605
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1c7

    .line 259
    :catch_60e
    move-exception v57

    move-object/from16 v64, v65

    .end local v65           #lights:Lcom/android/server/LightsService;
    .restart local v64       #lights:Lcom/android/server/LightsService;
    goto :goto_5e4

    .line 241
    .end local v64           #lights:Lcom/android/server/LightsService;
    .restart local v65       #lights:Lcom/android/server/LightsService;
    :cond_612
    const-string v3, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    new-instance v43, Landroid/server/BluetoothService;

    move-object/from16 v0, v43

    invoke-direct {v0, v4}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_620
    .catch Ljava/lang/RuntimeException; {:try_start_605 .. :try_end_620} :catch_60e

    .line 243
    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .local v43, bluetooth:Landroid/server/BluetoothService;
    :try_start_620
    const-string v3, "bluetooth"

    move-object/from16 v0, v43

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 244
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->initAfterRegistration()V

    .line 245
    new-instance v45, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v45

    move-object/from16 v1, v43

    invoke-direct {v0, v4, v1}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_633
    .catch Ljava/lang/RuntimeException; {:try_start_620 .. :try_end_633} :catch_8c4

    .line 246
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v45, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_633
    const-string v3, "bluetooth_a2dp"

    move-object/from16 v0, v45

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 248
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->initAfterA2dpRegistration()V

    .line 250
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "airplane_mode_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v37

    .line 252
    .local v37, airplaneModeOn:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "bluetooth_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v46

    .line 254
    .local v46, bluetoothOn:I
    if-nez v37, :cond_65a

    if-eqz v46, :cond_65a

    .line 255
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->enable()Z
    :try_end_65a
    .catch Ljava/lang/RuntimeException; {:try_start_633 .. :try_end_65a} :catch_8cb

    :cond_65a
    move-object/from16 v44, v45

    .end local v45           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_1c7

    .line 281
    .end local v37           #airplaneModeOn:I
    .end local v46           #bluetoothOn:I
    .end local v52           #cryptState:Ljava/lang/String;
    .end local v61           #firstBoot:Z
    .end local v65           #lights:Lcom/android/server/LightsService;
    .end local v75           #onlyCore:Z
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v53       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v62       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v64       #lights:Lcom/android/server/LightsService;
    .restart local v66       #location:Lcom/android/server/LocationManagerService;
    .restart local v73       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v78       #powerSaver:Landroid/server/PowerSaverService;
    .restart local v85       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v89       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v96       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_660
    move-exception v57

    .line 282
    .local v57, e:Ljava/lang/Throwable;
    :goto_661
    const-string v3, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1f9

    .line 289
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_66c
    move-exception v57

    .line 290
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_20a

    .line 296
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_678
    move-exception v57

    .line 297
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_20d

    .line 302
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_684
    move-exception v57

    .line 303
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_210

    .line 319
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_690
    move-exception v57

    .line 320
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_691
    const-string v3, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23f

    .line 327
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_69c
    move-exception v57

    .line 328
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_69d
    const-string v3, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_258

    .line 335
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6a8
    move-exception v57

    .line 336
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_269

    .line 343
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6b4
    move-exception v57

    .line 344
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_279

    .line 351
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6c0
    move-exception v57

    .line 352
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_6c1
    const-string v3, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_290

    .line 359
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6cc
    move-exception v57

    .line 360
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_6cd
    const-string v3, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a7

    .line 369
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6d8
    move-exception v57

    move-object/from16 v8, v69

    .line 370
    .end local v69           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_6db
    const-string v3, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2be

    .line 377
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6e6
    move-exception v57

    .line 378
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_6e7
    const-string v3, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d5

    .line 385
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6f2
    move-exception v57

    .line 386
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_6f3
    const-string v3, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2ec

    .line 398
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_6fe
    move-exception v57

    .line 399
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_6ff
    const-string v3, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_313

    .line 407
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_70a
    move-exception v57

    .line 408
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_70b
    const-string v3, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_32a

    .line 418
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_716
    move-exception v57

    .line 419
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33b

    .line 427
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_722
    move-exception v57

    .line 428
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_723
    const-string v3, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_35b

    .line 436
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_72e
    move-exception v57

    .line 437
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting HDMI Service "

    move-object/from16 v0, v57

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_370

    .line 445
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_73a
    move-exception v57

    .line 446
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_381

    .line 453
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_746
    move-exception v57

    .line 454
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_747
    const-string v3, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_398

    .line 461
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_752
    move-exception v57

    .line 462
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_753
    const-string v3, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3af

    .line 469
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_75e
    move-exception v57

    .line 470
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3c0

    .line 477
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_76a
    move-exception v57

    .line 478
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d8

    .line 485
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_776
    move-exception v57

    .line 486
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_777
    const-string v3, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3ef

    .line 492
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_782
    move-exception v57

    .line 493
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_400

    .line 500
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_78e
    move-exception v57

    .line 501
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_410

    .line 508
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_79a
    move-exception v57

    .line 509
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_41c

    .line 517
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7a6
    move-exception v57

    .line 518
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_7a7
    const-string v3, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_433

    .line 525
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7b2
    move-exception v57

    .line 526
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_443

    .line 533
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7be
    move-exception v57

    .line 534
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v57

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_454

    .line 541
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7ca
    move-exception v57

    .line 542
    .restart local v57       #e:Ljava/lang/Throwable;
    :goto_7cb
    const-string v3, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_46b

    .line 548
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7d6
    move-exception v57

    .line 549
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_47b

    .line 555
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7e2
    move-exception v57

    .line 556
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_48c

    .line 567
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7ee
    move-exception v57

    .line 568
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_49d

    .line 574
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_7fa
    move-exception v57

    .line 575
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4ad

    .line 581
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_806
    move-exception v57

    .line 582
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "starting PowerSaver service"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4bd

    .line 588
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_812
    move-exception v57

    .line 589
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v57

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4ce

    .line 604
    .end local v57           #e:Ljava/lang/Throwable;
    .restart local v27       #safeMode:Z
    :cond_81e
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_4e5

    .line 612
    :catch_827
    move-exception v57

    .line 613
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4ea

    .line 620
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_833
    move-exception v57

    .line 621
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4ef

    .line 627
    .end local v57           #e:Ljava/lang/Throwable;
    :catch_83f
    move-exception v57

    .line 628
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4f2

    .line 647
    .end local v57           #e:Ljava/lang/Throwable;
    .restart local v47       #config:Landroid/content/res/Configuration;
    .restart local v68       #metrics:Landroid/util/DisplayMetrics;
    .restart local v95       #w:Landroid/view/WindowManager;
    :catch_84b
    move-exception v57

    .line 648
    .restart local v57       #e:Ljava/lang/Throwable;
    const-string v3, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_526

    .line 178
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v27           #safeMode:Z
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v47           #config:Landroid/content/res/Configuration;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v53           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v57           #e:Ljava/lang/Throwable;
    .end local v62           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v66           #location:Lcom/android/server/LocationManagerService;
    .end local v68           #metrics:Landroid/util/DisplayMetrics;
    .end local v73           #notification:Lcom/android/server/NotificationManagerService;
    .end local v78           #powerSaver:Landroid/server/PowerSaverService;
    .end local v85           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v89           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v95           #w:Landroid/view/WindowManager;
    .end local v96           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v52       #cryptState:Ljava/lang/String;
    .restart local v61       #firstBoot:Z
    .restart local v69       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v75       #onlyCore:Z
    :catch_857
    move-exception v3

    goto/16 :goto_f9

    .line 541
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .end local v52           #cryptState:Ljava/lang/String;
    .end local v61           #firstBoot:Z
    .end local v69           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v75           #onlyCore:Z
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v40       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v53       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v62       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v66       #location:Lcom/android/server/LocationManagerService;
    .restart local v73       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v78       #powerSaver:Landroid/server/PowerSaverService;
    .restart local v85       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v89       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v96       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_85a
    move-exception v57

    move-object/from16 v39, v40

    .end local v40           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_7cb

    .line 517
    .end local v93           #usb:Lcom/android/server/usb/UsbService;
    .restart local v94       #usb:Lcom/android/server/usb/UsbService;
    :catch_85f
    move-exception v57

    move-object/from16 v93, v94

    .end local v94           #usb:Lcom/android/server/usb/UsbService;
    .restart local v93       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_7a7

    .line 485
    .end local v96           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v97       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_864
    move-exception v57

    move-object/from16 v96, v97

    .end local v97           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v96       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_777

    .line 461
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v51       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_869
    move-exception v57

    move-object/from16 v50, v51

    .end local v51           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_753

    .line 453
    .end local v66           #location:Lcom/android/server/LocationManagerService;
    .restart local v67       #location:Lcom/android/server/LocationManagerService;
    :catch_86e
    move-exception v57

    move-object/from16 v66, v67

    .end local v67           #location:Lcom/android/server/LocationManagerService;
    .restart local v66       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_747

    .line 427
    .end local v73           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v74       #notification:Lcom/android/server/NotificationManagerService;
    :catch_873
    move-exception v57

    move-object/from16 v73, v74

    .end local v74           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v73       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_723

    .line 407
    .end local v87           #throttle:Lcom/android/server/ThrottleService;
    .restart local v88       #throttle:Lcom/android/server/ThrottleService;
    :catch_878
    move-exception v57

    move-object/from16 v87, v88

    .end local v88           #throttle:Lcom/android/server/ThrottleService;
    .restart local v87       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_70b

    .line 398
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v49       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_87d
    move-exception v57

    move-object/from16 v48, v49

    .end local v49           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_6ff

    .line 385
    .end local v98           #wifi:Lcom/android/server/WifiService;
    .restart local v99       #wifi:Lcom/android/server/WifiService;
    :catch_882
    move-exception v57

    move-object/from16 v98, v99

    .end local v99           #wifi:Lcom/android/server/WifiService;
    .restart local v98       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_6f3

    .line 377
    .end local v100           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v101       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_887
    move-exception v57

    move-object/from16 v100, v101

    .end local v101           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v100       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_6e7

    .line 369
    :catch_88c
    move-exception v57

    goto/16 :goto_6db

    .line 359
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v69       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v70       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_88f
    move-exception v57

    move-object/from16 v12, v70

    .end local v70           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_6cd

    .line 351
    .end local v89           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v90       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_894
    move-exception v57

    move-object/from16 v89, v90

    .end local v90           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v89       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_6c1

    .line 327
    .end local v85           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v86       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_899
    move-exception v57

    move-object/from16 v85, v86

    .end local v86           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v85       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_69d

    .line 319
    .end local v53           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v54       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_89e
    move-exception v57

    move-object/from16 v53, v54

    .end local v54           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v53       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_691

    .line 311
    :catch_8a3
    move-exception v3

    goto/16 :goto_223

    .line 281
    .end local v62           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v63       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_8a6
    move-exception v57

    move-object/from16 v62, v63

    .end local v63           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v62       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_661

    .line 259
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v6           #power:Lcom/android/server/PowerManagerService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v53           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v62           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v66           #location:Lcom/android/server/LocationManagerService;
    .end local v73           #notification:Lcom/android/server/NotificationManagerService;
    .end local v78           #powerSaver:Landroid/server/PowerSaverService;
    .end local v85           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v89           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v96           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v77       #power:Lcom/android/server/PowerManagerService;
    :catch_8ab
    move-exception v57

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v77

    .end local v77           #power:Lcom/android/server/PowerManagerService;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    goto/16 :goto_5e4

    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v64           #lights:Lcom/android/server/LightsService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v52       #cryptState:Ljava/lang/String;
    .restart local v61       #firstBoot:Z
    .restart local v65       #lights:Lcom/android/server/LightsService;
    .restart local v75       #onlyCore:Z
    :catch_8b4
    move-exception v57

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v64, v65

    .end local v65           #lights:Lcom/android/server/LightsService;
    .restart local v64       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_5e4

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v64           #lights:Lcom/android/server/LightsService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v65       #lights:Lcom/android/server/LightsService;
    :catch_8bd
    move-exception v57

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v64, v65

    .end local v65           #lights:Lcom/android/server/LightsService;
    .restart local v64       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_5e4

    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v64           #lights:Lcom/android/server/LightsService;
    .restart local v43       #bluetooth:Landroid/server/BluetoothService;
    .restart local v65       #lights:Lcom/android/server/LightsService;
    :catch_8c4
    move-exception v57

    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v64, v65

    .end local v65           #lights:Lcom/android/server/LightsService;
    .restart local v64       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_5e4

    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v64           #lights:Lcom/android/server/LightsService;
    .restart local v43       #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v65       #lights:Lcom/android/server/LightsService;
    :catch_8cb
    move-exception v57

    move-object/from16 v44, v45

    .end local v45           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v64, v65

    .end local v65           #lights:Lcom/android/server/LightsService;
    .restart local v64       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_5e4

    .end local v52           #cryptState:Ljava/lang/String;
    .end local v61           #firstBoot:Z
    .end local v75           #onlyCore:Z
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v53       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v62       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v66       #location:Lcom/android/server/LocationManagerService;
    .restart local v73       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v78       #powerSaver:Landroid/server/PowerSaverService;
    .restart local v85       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v89       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v96       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_8d4
    move-object/from16 v8, v69

    .end local v69           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_4ce
.end method
