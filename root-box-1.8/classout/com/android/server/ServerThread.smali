.class Lcom/android/server/ServerThread;
.super Ljava/lang/Thread;
.source "SystemServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/ServerThread$AdbPortObserver;
    }
.end annotation


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
    .line 71
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 83
    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 831
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 832
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 834
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

    .line 835
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 836
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 79
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
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

    .line 81
    return-void
.end method

.method public run()V
    .registers 108

    .prologue
    .line 98
    const/16 v3, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v3, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 101
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 103
    const/4 v3, -0x2

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 106
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 107
    const/4 v3, 0x0

    invoke-static {v3}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 111
    const-string v3, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v3, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v88

    .line 113
    .local v88, shutdownAction:Ljava/lang/String;
    if-eqz v88, :cond_4e

    invoke-virtual/range {v88 .. v88}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4e

    .line 114
    const/4 v3, 0x0

    move-object/from16 v0, v88

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v9, 0x31

    if-ne v3, v9, :cond_601

    const/16 v85, 0x1

    .line 117
    .local v85, reboot:Z
    :goto_35
    invoke-virtual/range {v88 .. v88}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v9, 0x1

    if-le v3, v9, :cond_605

    .line 118
    const/4 v3, 0x1

    invoke-virtual/range {v88 .. v88}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v88

    invoke-virtual {v0, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v84

    .line 123
    .local v84, reason:Ljava/lang/String;
    :goto_47
    move/from16 v0, v85

    move-object/from16 v1, v84

    invoke-static {v0, v1}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 127
    .end local v84           #reason:Ljava/lang/String;
    .end local v85           #reboot:Z
    :cond_4e
    const-string v3, "ro.factorytest"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v63

    .line 128
    .local v63, factoryTestStr:Ljava/lang/String;
    const-string v3, ""

    move-object/from16 v0, v63

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_609

    const/16 v62, 0x0

    .line 131
    .local v62, factoryTest:I
    :goto_60
    const/16 v68, 0x0

    .line 132
    .local v68, lights:Lcom/android/server/LightsService;
    const/16 v81, 0x0

    .line 133
    .local v81, power:Lcom/android/server/PowerManagerService;
    const/16 v57, 0x0

    .line 134
    .local v57, dmm:Lcom/android/server/DynamicMemoryManagerService;
    const/16 v41, 0x0

    .line 135
    .local v41, battery:Lcom/android/server/BatteryService;
    const/16 v38, 0x0

    .line 136
    .local v38, alarm:Lcom/android/server/AlarmManagerService;
    const/4 v13, 0x0

    .line 137
    .local v13, networkManagement:Lcom/android/server/NetworkManagementService;
    const/4 v12, 0x0

    .line 138
    .local v12, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v73, 0x0

    .line 139
    .local v73, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v48, 0x0

    .line 140
    .local v48, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v104, 0x0

    .line 141
    .local v104, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v102, 0x0

    .line 142
    .local v102, wifi:Lcom/android/server/WifiService;
    const/16 v80, 0x0

    .line 143
    .local v80, pm:Landroid/content/pm/IPackageManager;
    const/4 v4, 0x0

    .line 144
    .local v4, context:Landroid/content/Context;
    const/16 v106, 0x0

    .line 145
    .local v106, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v42, 0x0

    .line 146
    .local v42, bluetooth:Landroid/server/BluetoothService;
    const/16 v44, 0x0

    .line 147
    .local v44, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v59, 0x0

    .line 148
    .local v59, dock:Lcom/android/server/DockObserver;
    const/16 v97, 0x0

    .line 149
    .local v97, usb:Lcom/android/server/usb/UsbService;
    const/16 v95, 0x0

    .line 150
    .local v95, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v86, 0x0

    .line 151
    .local v86, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v91, 0x0

    .line 152
    .local v91, throttle:Lcom/android/server/ThrottleService;
    const/16 v75, 0x0

    .line 153
    .local v75, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v52, 0x0

    .line 157
    .local v52, cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    :try_start_8b
    const-string v3, "SystemServer"

    const-string v9, "Entropy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    const-string v3, "entropy"

    new-instance v9, Lcom/android/server/EntropyService;

    invoke-direct {v9}, Lcom/android/server/EntropyService;-><init>()V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 160
    const-string v3, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    new-instance v6, Lcom/android/server/PowerManagerService;

    invoke-direct {v6}, Lcom/android/server/PowerManagerService;-><init>()V
    :try_end_a8
    .catch Ljava/lang/RuntimeException; {:try_start_8b .. :try_end_a8} :catch_8ff

    .line 162
    .end local v81           #power:Lcom/android/server/PowerManagerService;
    .local v6, power:Lcom/android/server/PowerManagerService;
    :try_start_a8
    const-string v3, "power"

    invoke-static {v3, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 164
    const-string v3, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-static/range {v62 .. v62}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v4

    .line 167
    const-string v3, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const-string v3, "telephony.registry"

    new-instance v9, Lcom/android/server/TelephonyRegistry;

    invoke-direct {v9, v4}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 170
    invoke-static {v4}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 172
    const-string v3, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    const-string v3, "vold.decrypt"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    .line 175
    .local v54, cryptState:Ljava/lang/String;
    const/16 v79, 0x0

    .line 176
    .local v79, onlyCore:Z
    const-string v3, "trigger_restart_min_framework"

    move-object/from16 v0, v54

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_60f

    .line 177
    const-string v3, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    const/16 v79, 0x1

    .line 184
    :cond_ee
    :goto_ee
    if-eqz v62, :cond_624

    const/4 v3, 0x1

    :goto_f1
    move/from16 v0, v79

    invoke-static {v4, v3, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_f6
    .catch Ljava/lang/RuntimeException; {:try_start_a8 .. :try_end_f6} :catch_633

    move-result-object v80

    .line 187
    const/16 v65, 0x0

    .line 189
    .local v65, firstBoot:Z
    :try_start_f9
    invoke-interface/range {v80 .. v80}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_fc
    .catch Landroid/os/RemoteException; {:try_start_f9 .. :try_end_fc} :catch_8ab
    .catch Ljava/lang/RuntimeException; {:try_start_f9 .. :try_end_fc} :catch_633

    move-result v65

    .line 193
    :goto_fd
    :try_start_fd
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 195
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_108
    .catch Ljava/lang/RuntimeException; {:try_start_fd .. :try_end_108} :catch_633

    .line 199
    :try_start_108
    const-string v3, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    const-string v3, "account"

    new-instance v9, Landroid/accounts/AccountManagerService;

    invoke-direct {v9, v4}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_119
    .catch Ljava/lang/Throwable; {:try_start_108 .. :try_end_119} :catch_627
    .catch Ljava/lang/RuntimeException; {:try_start_108 .. :try_end_119} :catch_633

    .line 207
    :goto_119
    :try_start_119
    const-string v3, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const/4 v3, 0x1

    move/from16 v0, v62

    if-ne v0, v3, :cond_64a

    const/4 v3, 0x1

    :goto_126
    invoke-static {v4, v3}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/IContentService;

    .line 212
    const-string v3, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 215
    const-string v3, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    new-instance v69, Lcom/android/server/LightsService;

    move-object/from16 v0, v69

    invoke-direct {v0, v4}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_141
    .catch Ljava/lang/RuntimeException; {:try_start_119 .. :try_end_141} :catch_633

    .line 218
    .end local v68           #lights:Lcom/android/server/LightsService;
    .local v69, lights:Lcom/android/server/LightsService;
    :try_start_141
    const-string v3, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    new-instance v5, Lcom/android/server/BatteryService;

    move-object/from16 v0, v69

    invoke-direct {v5, v4, v0}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_14f
    .catch Ljava/lang/RuntimeException; {:try_start_141 .. :try_end_14f} :catch_908

    .line 220
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .local v5, battery:Lcom/android/server/BatteryService;
    :try_start_14f
    const-string v3, "battery"

    invoke-static {v3, v5}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 222
    const-string v3, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    const-string v3, "vibrator"

    new-instance v9, Lcom/android/server/VibratorService;

    invoke-direct {v9, v4}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 227
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v69

    invoke-virtual {v6, v4, v0, v3, v5}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    .line 229
    const-string v3, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    new-instance v7, Lcom/android/server/AlarmManagerService;

    invoke-direct {v7, v4}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_17a
    .catch Ljava/lang/RuntimeException; {:try_start_14f .. :try_end_17a} :catch_911

    .line 231
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .local v7, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_17a
    const-string v3, "alarm"

    invoke-static {v3, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 233
    const-string v3, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v3

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 237
    const-string v3, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    const/4 v3, 0x1

    move/from16 v0, v62

    if-eq v0, v3, :cond_64d

    const/4 v3, 0x1

    move v9, v3

    :goto_19f
    if-nez v65, :cond_651

    const/4 v3, 0x1

    :goto_1a2
    invoke-static {v4, v6, v9, v3}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v106

    .line 241
    const-string v3, "window"

    move-object/from16 v0, v106

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 243
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v106

    invoke-virtual {v3, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 248
    const-string v3, "ro.kernel.qemu"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "1"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_654

    .line 249
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :goto_1cb
    sget-boolean v3, Landroid/os/SystemProperties;->QCOM_HARDWARE:Z

    if-eqz v3, :cond_1f1

    .line 272
    const-string v3, "SystemServer"

    const-string v9, "DynamicMemoryManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    new-instance v58, Lcom/android/server/DynamicMemoryManagerService;

    move-object/from16 v0, v58

    invoke-direct {v0, v4}, Lcom/android/server/DynamicMemoryManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1dd
    .catch Ljava/lang/RuntimeException; {:try_start_17a .. :try_end_1dd} :catch_662

    .line 275
    .end local v57           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .local v58, dmm:Lcom/android/server/DynamicMemoryManagerService;
    :try_start_1dd
    new-instance v53, Lcom/android/server/CpuGovernorService;

    move-object/from16 v0, v53

    invoke-direct {v0, v4}, Lcom/android/server/CpuGovernorService;-><init>(Landroid/content/Context;)V
    :try_end_1e4
    .catch Ljava/lang/RuntimeException; {:try_start_1dd .. :try_end_1e4} :catch_928

    .line 277
    .end local v52           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .local v53, cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    if-nez v53, :cond_1ed

    .line 278
    :try_start_1e6
    const-string v3, "SystemServer"

    const-string v9, "CpuGovernorService failed to start"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1ed
    .catch Ljava/lang/RuntimeException; {:try_start_1e6 .. :try_end_1ed} :catch_92f

    :cond_1ed
    move-object/from16 v52, v53

    .end local v53           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v52       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    move-object/from16 v57, v58

    .end local v58           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v57       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    :cond_1f1
    move-object/from16 v68, v69

    .line 286
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v69           #lights:Lcom/android/server/LightsService;
    .end local v79           #onlyCore:Z
    .restart local v68       #lights:Lcom/android/server/LightsService;
    :goto_1f3
    const/16 v55, 0x0

    .line 287
    .local v55, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v89, 0x0

    .line 288
    .local v89, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v66, 0x0

    .line 289
    .local v66, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v39, 0x0

    .line 290
    .local v39, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v77, 0x0

    .line 291
    .local v77, notification:Lcom/android/server/NotificationManagerService;
    const/16 v100, 0x0

    .line 292
    .local v100, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v70, 0x0

    .line 293
    .local v70, location:Lcom/android/server/LocationManagerService;
    const/16 v50, 0x0

    .line 294
    .local v50, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v93, 0x0

    .line 295
    .local v93, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v82, 0x0

    .line 298
    .local v82, powerSaver:Landroid/server/PowerSaverService;
    const/4 v3, 0x1

    move/from16 v0, v62

    if-eq v0, v3, :cond_234

    .line 300
    :try_start_20c
    const-string v3, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    new-instance v67, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v67

    invoke-direct {v0, v4}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;)V
    :try_end_21a
    .catch Ljava/lang/Throwable; {:try_start_20c .. :try_end_21a} :catch_6b4

    .line 302
    .end local v66           #imm:Lcom/android/server/InputMethodManagerService;
    .local v67, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_21a
    const-string v3, "input_method"

    move-object/from16 v0, v67

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_221
    .catch Ljava/lang/Throwable; {:try_start_21a .. :try_end_221} :catch_8fa

    move-object/from16 v66, v67

    .line 308
    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v66       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_223
    :try_start_223
    const-string v3, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    const-string v3, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_234
    .catch Ljava/lang/Throwable; {:try_start_223 .. :try_end_234} :catch_6c0

    .line 317
    :cond_234
    :goto_234
    :try_start_234
    invoke-virtual/range {v106 .. v106}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_237
    .catch Ljava/lang/Throwable; {:try_start_234 .. :try_end_237} :catch_6cc

    .line 323
    :goto_237
    :try_start_237
    invoke-interface/range {v80 .. v80}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_23a
    .catch Ljava/lang/Throwable; {:try_start_237 .. :try_end_23a} :catch_6d8

    .line 329
    :goto_23a
    :try_start_23a
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x10403d2

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_24d
    .catch Landroid/os/RemoteException; {:try_start_23a .. :try_end_24d} :catch_8f7

    .line 336
    :goto_24d
    const/4 v3, 0x1

    move/from16 v0, v62

    if-eq v0, v3, :cond_938

    .line 338
    :try_start_252
    const-string v3, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    new-instance v56, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v56

    invoke-direct {v0, v4}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_260
    .catch Ljava/lang/Throwable; {:try_start_252 .. :try_end_260} :catch_6e4

    .line 340
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v56, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_260
    const-string v3, "device_policy"

    move-object/from16 v0, v56

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_267
    .catch Ljava/lang/Throwable; {:try_start_260 .. :try_end_267} :catch_8f2

    move-object/from16 v55, v56

    .line 346
    .end local v56           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_269
    :try_start_269
    const-string v3, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    new-instance v90, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v90

    move-object/from16 v1, v106

    invoke-direct {v0, v4, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_279
    .catch Ljava/lang/Throwable; {:try_start_269 .. :try_end_279} :catch_6f0

    .line 348
    .end local v89           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v90, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_279
    const-string v3, "statusbar"

    move-object/from16 v0, v90

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_280
    .catch Ljava/lang/Throwable; {:try_start_279 .. :try_end_280} :catch_8ed

    move-object/from16 v89, v90

    .line 354
    .end local v90           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v89       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_282
    :try_start_282
    const-string v3, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    const-string v3, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v4}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_293
    .catch Ljava/lang/Throwable; {:try_start_282 .. :try_end_293} :catch_6fc

    .line 362
    :goto_293
    :try_start_293
    const-string v3, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    invoke-static {v4}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v13

    .line 364
    const-string v3, "network_management"

    invoke-static {v3, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a3
    .catch Ljava/lang/Throwable; {:try_start_293 .. :try_end_2a3} :catch_708

    .line 370
    :goto_2a3
    :try_start_2a3
    const-string v3, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    new-instance v94, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v94

    invoke-direct {v0, v4}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2b1
    .catch Ljava/lang/Throwable; {:try_start_2a3 .. :try_end_2b1} :catch_714

    .line 372
    .end local v93           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v94, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_2b1
    const-string v3, "textservices"

    move-object/from16 v0, v94

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b8
    .catch Ljava/lang/Throwable; {:try_start_2b1 .. :try_end_2b8} :catch_8e8

    move-object/from16 v93, v94

    .line 378
    .end local v94           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v93       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_2ba
    :try_start_2ba
    const-string v3, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    new-instance v74, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v74

    invoke-direct {v0, v4, v13, v7}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_2c8
    .catch Ljava/lang/Throwable; {:try_start_2ba .. :try_end_2c8} :catch_720

    .line 380
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v74, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_2c8
    const-string v3, "netstats"

    move-object/from16 v0, v74

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2cf
    .catch Ljava/lang/Throwable; {:try_start_2c8 .. :try_end_2cf} :catch_8e3

    move-object/from16 v12, v74

    .line 386
    .end local v74           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_2d1
    :try_start_2d1
    const-string v3, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    new-instance v8, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    move-object v9, v4

    move-object v11, v6

    invoke-direct/range {v8 .. v13}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_2e3
    .catch Ljava/lang/Throwable; {:try_start_2d1 .. :try_end_2e3} :catch_72c

    .line 390
    .end local v73           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v8, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_2e3
    const-string v3, "netpolicy"

    invoke-static {v3, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2e8
    .catch Ljava/lang/Throwable; {:try_start_2e3 .. :try_end_2e8} :catch_8e0

    .line 396
    :goto_2e8
    :try_start_2e8
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    new-instance v105, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v105

    invoke-direct {v0, v4}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_2f6
    .catch Ljava/lang/Throwable; {:try_start_2e8 .. :try_end_2f6} :catch_73a

    .line 398
    .end local v104           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v105, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_2f6
    const-string v3, "wifip2p"

    move-object/from16 v0, v105

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2fd
    .catch Ljava/lang/Throwable; {:try_start_2f6 .. :try_end_2fd} :catch_8db

    move-object/from16 v104, v105

    .line 404
    .end local v105           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v104       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_2ff
    :try_start_2ff
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    new-instance v103, Lcom/android/server/WifiService;

    move-object/from16 v0, v103

    invoke-direct {v0, v4}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_30d
    .catch Ljava/lang/Throwable; {:try_start_2ff .. :try_end_30d} :catch_746

    .line 406
    .end local v102           #wifi:Lcom/android/server/WifiService;
    .local v103, wifi:Lcom/android/server/WifiService;
    :try_start_30d
    const-string v3, "wifi"

    move-object/from16 v0, v103

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_314
    .catch Ljava/lang/Throwable; {:try_start_30d .. :try_end_314} :catch_8d6

    move-object/from16 v102, v103

    .line 412
    .end local v103           #wifi:Lcom/android/server/WifiService;
    .restart local v102       #wifi:Lcom/android/server/WifiService;
    :goto_316
    :try_start_316
    const-string v3, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    new-instance v49, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v49

    invoke-direct {v0, v4, v13, v12, v8}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_324
    .catch Ljava/lang/Throwable; {:try_start_316 .. :try_end_324} :catch_752

    .line 415
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .local v49, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_324
    const-string v3, "connectivity"

    move-object/from16 v0, v49

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 416
    move-object/from16 v0, v49

    invoke-virtual {v12, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 417
    move-object/from16 v0, v49

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 418
    invoke-virtual/range {v102 .. v102}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 419
    invoke-virtual/range {v104 .. v104}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_33b
    .catch Ljava/lang/Throwable; {:try_start_324 .. :try_end_33b} :catch_8d1

    move-object/from16 v48, v49

    .line 425
    .end local v49           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_33d
    :try_start_33d
    const-string v3, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    new-instance v92, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v92

    invoke-direct {v0, v4}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_34b
    .catch Ljava/lang/Throwable; {:try_start_33d .. :try_end_34b} :catch_75e

    .line 427
    .end local v91           #throttle:Lcom/android/server/ThrottleService;
    .local v92, throttle:Lcom/android/server/ThrottleService;
    :try_start_34b
    const-string v3, "throttle"

    move-object/from16 v0, v92

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_352
    .catch Ljava/lang/Throwable; {:try_start_34b .. :try_end_352} :catch_8cc

    move-object/from16 v91, v92

    .line 438
    .end local v92           #throttle:Lcom/android/server/ThrottleService;
    .restart local v91       #throttle:Lcom/android/server/ThrottleService;
    :goto_354
    :try_start_354
    const-string v3, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    const-string v3, "mount"

    new-instance v9, Lcom/android/server/MountService;

    invoke-direct {v9, v4}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_365
    .catch Ljava/lang/Throwable; {:try_start_354 .. :try_end_365} :catch_76a

    .line 445
    :goto_365
    :try_start_365
    const-string v3, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    new-instance v78, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v78

    move-object/from16 v1, v89

    move-object/from16 v2, v68

    invoke-direct {v0, v4, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_377
    .catch Ljava/lang/Throwable; {:try_start_365 .. :try_end_377} :catch_776

    .line 447
    .end local v77           #notification:Lcom/android/server/NotificationManagerService;
    .local v78, notification:Lcom/android/server/NotificationManagerService;
    :try_start_377
    const-string v3, "notification"

    move-object/from16 v0, v78

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 448
    move-object/from16 v0, v78

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_383
    .catch Ljava/lang/Throwable; {:try_start_377 .. :try_end_383} :catch_8c7

    move-object/from16 v77, v78

    .line 454
    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v77       #notification:Lcom/android/server/NotificationManagerService;
    :goto_385
    sget-boolean v3, Landroid/os/SystemProperties;->QCOM_HDMI_OUT:Z

    if-eqz v3, :cond_39a

    .line 456
    :try_start_389
    const-string v3, "SystemServer"

    const-string v9, "HDMI Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    const-string v3, "hdmi"

    new-instance v9, Lcom/android/server/HDMIService;

    invoke-direct {v9, v4}, Lcom/android/server/HDMIService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_39a
    .catch Ljava/lang/Throwable; {:try_start_389 .. :try_end_39a} :catch_782

    .line 464
    :cond_39a
    :goto_39a
    :try_start_39a
    const-string v3, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    const-string v3, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v4}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3ab
    .catch Ljava/lang/Throwable; {:try_start_39a .. :try_end_3ab} :catch_78e

    .line 472
    :goto_3ab
    :try_start_3ab
    const-string v3, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    new-instance v71, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v71

    invoke-direct {v0, v4}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3b9
    .catch Ljava/lang/Throwable; {:try_start_3ab .. :try_end_3b9} :catch_79a

    .line 474
    .end local v70           #location:Lcom/android/server/LocationManagerService;
    .local v71, location:Lcom/android/server/LocationManagerService;
    :try_start_3b9
    const-string v3, "location"

    move-object/from16 v0, v71

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3c0
    .catch Ljava/lang/Throwable; {:try_start_3b9 .. :try_end_3c0} :catch_8c2

    move-object/from16 v70, v71

    .line 480
    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .restart local v70       #location:Lcom/android/server/LocationManagerService;
    :goto_3c2
    :try_start_3c2
    const-string v3, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    new-instance v51, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v51

    invoke-direct {v0, v4}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_3d0
    .catch Ljava/lang/Throwable; {:try_start_3c2 .. :try_end_3d0} :catch_7a6

    .line 482
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v51, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_3d0
    const-string v3, "country_detector"

    move-object/from16 v0, v51

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3d7
    .catch Ljava/lang/Throwable; {:try_start_3d0 .. :try_end_3d7} :catch_8bd

    move-object/from16 v50, v51

    .line 488
    .end local v51           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_3d9
    :try_start_3d9
    const-string v3, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    const-string v3, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v4}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3ea
    .catch Ljava/lang/Throwable; {:try_start_3d9 .. :try_end_3ea} :catch_7b2

    .line 496
    :goto_3ea
    :try_start_3ea
    const-string v3, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    const-string v3, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v4, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_402
    .catch Ljava/lang/Throwable; {:try_start_3ea .. :try_end_402} :catch_7be

    .line 504
    :goto_402
    :try_start_402
    const-string v3, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    new-instance v101, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v101

    invoke-direct {v0, v4}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_410
    .catch Ljava/lang/Throwable; {:try_start_402 .. :try_end_410} :catch_7ca

    .line 506
    .end local v100           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v101, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_410
    const-string v3, "wallpaper"

    move-object/from16 v0, v101

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_417
    .catch Ljava/lang/Throwable; {:try_start_410 .. :try_end_417} :catch_8b8

    move-object/from16 v100, v101

    .line 512
    .end local v101           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v100       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :goto_419
    :try_start_419
    const-string v3, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    const-string v3, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v4}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42a
    .catch Ljava/lang/Throwable; {:try_start_419 .. :try_end_42a} :catch_7d6

    .line 519
    :goto_42a
    :try_start_42a
    const-string v3, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    new-instance v60, Lcom/android/server/DockObserver;

    move-object/from16 v0, v60

    invoke-direct {v0, v4, v6}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_438
    .catch Ljava/lang/Throwable; {:try_start_42a .. :try_end_438} :catch_7e2

    .end local v59           #dock:Lcom/android/server/DockObserver;
    .local v60, dock:Lcom/android/server/DockObserver;
    move-object/from16 v59, v60

    .line 527
    .end local v60           #dock:Lcom/android/server/DockObserver;
    .restart local v59       #dock:Lcom/android/server/DockObserver;
    :goto_43a
    :try_start_43a
    const-string v3, "SystemServer"

    const-string v9, "Wired Accessory Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    new-instance v3, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v3, v4}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_446
    .catch Ljava/lang/Throwable; {:try_start_43a .. :try_end_446} :catch_7ee

    .line 535
    :goto_446
    :try_start_446
    const-string v3, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    new-instance v98, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v98

    invoke-direct {v0, v4}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_454
    .catch Ljava/lang/Throwable; {:try_start_446 .. :try_end_454} :catch_7fa

    .line 538
    .end local v97           #usb:Lcom/android/server/usb/UsbService;
    .local v98, usb:Lcom/android/server/usb/UsbService;
    :try_start_454
    const-string v3, "usb"

    move-object/from16 v0, v98

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_45b
    .catch Ljava/lang/Throwable; {:try_start_454 .. :try_end_45b} :catch_8b3

    move-object/from16 v97, v98

    .line 544
    .end local v98           #usb:Lcom/android/server/usb/UsbService;
    .restart local v97       #usb:Lcom/android/server/usb/UsbService;
    :goto_45d
    :try_start_45d
    const-string v3, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 546
    new-instance v96, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v96

    invoke-direct {v0, v4}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_46b
    .catch Ljava/lang/Throwable; {:try_start_45d .. :try_end_46b} :catch_806

    .end local v95           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v96, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v95, v96

    .line 552
    .end local v96           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v95       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_46d
    :try_start_46d
    const-string v3, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 553
    const-string v3, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_47e
    .catch Ljava/lang/Throwable; {:try_start_46d .. :try_end_47e} :catch_812

    .line 560
    :goto_47e
    :try_start_47e
    const-string v3, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    new-instance v40, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v40

    invoke-direct {v0, v4}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_48c
    .catch Ljava/lang/Throwable; {:try_start_47e .. :try_end_48c} :catch_81e

    .line 562
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .local v40, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_48c
    const-string v3, "appwidget"

    move-object/from16 v0, v40

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_493
    .catch Ljava/lang/Throwable; {:try_start_48c .. :try_end_493} :catch_8ae

    move-object/from16 v39, v40

    .line 568
    .end local v40           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_495
    :try_start_495
    const-string v3, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    new-instance v87, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v87

    invoke-direct {v0, v4}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4a3
    .catch Ljava/lang/Throwable; {:try_start_495 .. :try_end_4a3} :catch_82a

    .end local v86           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v87, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v86, v87

    .line 575
    .end local v87           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v86       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_4a5
    :try_start_4a5
    const-string v3, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    const-string v3, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v4}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4b6
    .catch Ljava/lang/Throwable; {:try_start_4a5 .. :try_end_4b6} :catch_836

    .line 586
    :goto_4b6
    :try_start_4b6
    const-string v3, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 587
    const-string v3, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v4}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4c7
    .catch Ljava/lang/Throwable; {:try_start_4b6 .. :try_end_4c7} :catch_842

    .line 594
    :goto_4c7
    :try_start_4c7
    const-string v3, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 595
    new-instance v76, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v76

    invoke-direct {v0, v4}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_4d5
    .catch Ljava/lang/Throwable; {:try_start_4c7 .. :try_end_4d5} :catch_84e

    .end local v75           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v76, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v75, v76

    .line 601
    .end local v76           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v75       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_4d7
    :try_start_4d7
    const-string v3, "SystemServer"

    const-string v9, "PowerSaverService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    new-instance v83, Landroid/server/PowerSaverService;

    move-object/from16 v0, v83

    invoke-direct {v0, v4}, Landroid/server/PowerSaverService;-><init>(Landroid/content/Context;)V
    :try_end_4e5
    .catch Ljava/lang/Throwable; {:try_start_4d7 .. :try_end_4e5} :catch_85a

    .end local v82           #powerSaver:Landroid/server/PowerSaverService;
    .local v83, powerSaver:Landroid/server/PowerSaverService;
    move-object/from16 v82, v83

    .line 608
    .end local v83           #powerSaver:Landroid/server/PowerSaverService;
    .restart local v82       #powerSaver:Landroid/server/PowerSaverService;
    :goto_4e7
    :try_start_4e7
    const-string v3, "SystemServer"

    const-string v9, "AssetRedirectionManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    const-string v3, "assetredirection"

    new-instance v9, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4f8
    .catch Ljava/lang/Throwable; {:try_start_4e7 .. :try_end_4f8} :catch_866

    .line 616
    :goto_4f8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "adb_port"

    const-string v10, "service.adb.tcp.port"

    const-string v11, "-1"

    invoke-static {v10, v11}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 620
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "adb_port"

    invoke-static {v9}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    const/4 v10, 0x0

    new-instance v11, Lcom/android/server/ServerThread$AdbPortObserver;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lcom/android/server/ServerThread$AdbPortObserver;-><init>(Lcom/android/server/ServerThread;)V

    invoke-virtual {v3, v9, v10, v11}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 626
    invoke-virtual/range {v106 .. v106}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v27

    .line 627
    .local v27, safeMode:Z
    if-eqz v27, :cond_872

    .line 628
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 630
    const/4 v3, 0x1

    sput-boolean v3, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 632
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 640
    :goto_539
    if-eqz v55, :cond_53e

    .line 642
    :try_start_53b
    invoke-virtual/range {v55 .. v55}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_53e
    .catch Ljava/lang/Throwable; {:try_start_53b .. :try_end_53e} :catch_87b

    .line 648
    :cond_53e
    :goto_53e
    if-eqz v77, :cond_543

    .line 650
    :try_start_540
    invoke-virtual/range {v77 .. v77}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_543
    .catch Ljava/lang/Throwable; {:try_start_540 .. :try_end_543} :catch_887

    .line 657
    :cond_543
    :goto_543
    :try_start_543
    invoke-virtual/range {v106 .. v106}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_546
    .catch Ljava/lang/Throwable; {:try_start_543 .. :try_end_546} :catch_893

    .line 662
    :goto_546
    if-eqz v27, :cond_54f

    .line 663
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 669
    :cond_54f
    invoke-virtual/range {v106 .. v106}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v47

    .line 670
    .local v47, config:Landroid/content/res/Configuration;
    new-instance v72, Landroid/util/DisplayMetrics;

    invoke-direct/range {v72 .. v72}, Landroid/util/DisplayMetrics;-><init>()V

    .line 671
    .local v72, metrics:Landroid/util/DisplayMetrics;
    const-string v3, "window"

    invoke-virtual {v4, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v99

    check-cast v99, Landroid/view/WindowManager;

    .line 672
    .local v99, w:Landroid/view/WindowManager;
    invoke-interface/range {v99 .. v99}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    move-object/from16 v0, v72

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 673
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v0, v47

    move-object/from16 v1, v72

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 675
    invoke-virtual {v6}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 677
    :try_start_577
    invoke-interface/range {v80 .. v80}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_57a
    .catch Ljava/lang/Throwable; {:try_start_577 .. :try_end_57a} :catch_89f

    .line 682
    :goto_57a
    new-instance v64, Landroid/content/IntentFilter;

    invoke-direct/range {v64 .. v64}, Landroid/content/IntentFilter;-><init>()V

    .line 683
    .local v64, filter:Landroid/content/IntentFilter;
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 684
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 685
    const-string v3, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 686
    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 687
    const-string v3, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 688
    const-string v3, "package"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 689
    new-instance v3, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v3}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v64

    invoke-virtual {v4, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 692
    move-object/from16 v16, v4

    .line 693
    .local v16, contextF:Landroid/content/Context;
    move-object/from16 v17, v5

    .line 694
    .local v17, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v18, v13

    .line 695
    .local v18, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v19, v12

    .line 696
    .local v19, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v20, v8

    .line 697
    .local v20, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v21, v48

    .line 698
    .local v21, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v22, v59

    .line 699
    .local v22, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v23, v97

    .line 700
    .local v23, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v33, v91

    .line 701
    .local v33, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v24, v95

    .line 702
    .local v24, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v26, v39

    .line 703
    .local v26, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v28, v100

    .line 704
    .local v28, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v29, v66

    .line 705
    .local v29, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v25, v86

    .line 706
    .local v25, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v31, v70

    .line 707
    .local v31, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v32, v50

    .line 708
    .local v32, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v34, v75

    .line 709
    .local v34, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v35, v93

    .line 710
    .local v35, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v30, v89

    .line 711
    .local v30, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v36, v82

    .line 718
    .local v36, powerSaverF:Landroid/server/PowerSaverService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    new-instance v14, Lcom/android/server/ServerThread$1;

    move-object/from16 v15, p0

    invoke-direct/range {v14 .. v36}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/TextServicesManagerService;Landroid/server/PowerSaverService;)V

    invoke-virtual {v3, v14}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 822
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v3

    if-eqz v3, :cond_5f6

    .line 823
    const-string v3, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    :cond_5f6
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 827
    const-string v3, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 828
    return-void

    .line 114
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
    .end local v52           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v57           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .end local v59           #dock:Lcom/android/server/DockObserver;
    .end local v62           #factoryTest:I
    .end local v63           #factoryTestStr:Ljava/lang/String;
    .end local v64           #filter:Landroid/content/IntentFilter;
    .end local v66           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .end local v70           #location:Lcom/android/server/LocationManagerService;
    .end local v72           #metrics:Landroid/util/DisplayMetrics;
    .end local v75           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v77           #notification:Lcom/android/server/NotificationManagerService;
    .end local v80           #pm:Landroid/content/pm/IPackageManager;
    .end local v82           #powerSaver:Landroid/server/PowerSaverService;
    .end local v86           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v89           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v91           #throttle:Lcom/android/server/ThrottleService;
    .end local v93           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v95           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v97           #usb:Lcom/android/server/usb/UsbService;
    .end local v99           #w:Landroid/view/WindowManager;
    .end local v100           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v102           #wifi:Lcom/android/server/WifiService;
    .end local v104           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v106           #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_601
    const/16 v85, 0x0

    goto/16 :goto_35

    .line 120
    .restart local v85       #reboot:Z
    :cond_605
    const/16 v84, 0x0

    .restart local v84       #reason:Ljava/lang/String;
    goto/16 :goto_47

    .line 128
    .end local v84           #reason:Ljava/lang/String;
    .end local v85           #reboot:Z
    .restart local v63       #factoryTestStr:Ljava/lang/String;
    :cond_609
    invoke-static/range {v63 .. v63}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v62

    goto/16 :goto_60

    .line 179
    .restart local v4       #context:Landroid/content/Context;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v13       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v52       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v57       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v59       #dock:Lcom/android/server/DockObserver;
    .restart local v62       #factoryTest:I
    .restart local v68       #lights:Lcom/android/server/LightsService;
    .restart local v73       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v75       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v79       #onlyCore:Z
    .restart local v80       #pm:Landroid/content/pm/IPackageManager;
    .restart local v86       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v91       #throttle:Lcom/android/server/ThrottleService;
    .restart local v95       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v97       #usb:Lcom/android/server/usb/UsbService;
    .restart local v102       #wifi:Lcom/android/server/WifiService;
    .restart local v104       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v106       #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_60f
    :try_start_60f
    const-string v3, "1"

    move-object/from16 v0, v54

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ee

    .line 180
    const-string v3, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    const/16 v79, 0x1

    goto/16 :goto_ee

    .line 184
    :cond_624
    const/4 v3, 0x0

    goto/16 :goto_f1

    .line 202
    .restart local v65       #firstBoot:Z
    :catch_627
    move-exception v61

    .line 203
    .local v61, e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_631
    .catch Ljava/lang/RuntimeException; {:try_start_60f .. :try_end_631} :catch_633

    goto/16 :goto_119

    .line 281
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v61           #e:Ljava/lang/Throwable;
    .end local v65           #firstBoot:Z
    .end local v79           #onlyCore:Z
    :catch_633
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .line 282
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .local v61, e:Ljava/lang/RuntimeException;
    :goto_638
    const-string v3, "System"

    const-string v9, "******************************************"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    const-string v3, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1f3

    .line 208
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v61           #e:Ljava/lang/RuntimeException;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v65       #firstBoot:Z
    .restart local v79       #onlyCore:Z
    :cond_64a
    const/4 v3, 0x0

    goto/16 :goto_126

    .line 238
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :cond_64d
    const/4 v3, 0x0

    move v9, v3

    goto/16 :goto_19f

    :cond_651
    const/4 v3, 0x0

    goto/16 :goto_1a2

    .line 250
    :cond_654
    const/4 v3, 0x1

    move/from16 v0, v62

    if-ne v0, v3, :cond_666

    .line 251
    :try_start_659
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1cb

    .line 281
    :catch_662
    move-exception v61

    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto :goto_638

    .line 253
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :cond_666
    const-string v3, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    new-instance v43, Landroid/server/BluetoothService;

    move-object/from16 v0, v43

    invoke-direct {v0, v4}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_674
    .catch Ljava/lang/RuntimeException; {:try_start_659 .. :try_end_674} :catch_662

    .line 255
    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .local v43, bluetooth:Landroid/server/BluetoothService;
    :try_start_674
    const-string v3, "bluetooth"

    move-object/from16 v0, v43

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 256
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->initAfterRegistration()V

    .line 257
    new-instance v45, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v45

    move-object/from16 v1, v43

    invoke-direct {v0, v4, v1}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_687
    .catch Ljava/lang/RuntimeException; {:try_start_674 .. :try_end_687} :catch_918

    .line 258
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v45, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_687
    const-string v3, "bluetooth_a2dp"

    move-object/from16 v0, v45

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 260
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->initAfterA2dpRegistration()V

    .line 262
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "airplane_mode_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v37

    .line 264
    .local v37, airplaneModeOn:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "bluetooth_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v46

    .line 266
    .local v46, bluetoothOn:I
    if-nez v37, :cond_6ae

    if-eqz v46, :cond_6ae

    .line 267
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->enable()Z
    :try_end_6ae
    .catch Ljava/lang/RuntimeException; {:try_start_687 .. :try_end_6ae} :catch_91f

    :cond_6ae
    move-object/from16 v44, v45

    .end local v45           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_1cb

    .line 303
    .end local v37           #airplaneModeOn:I
    .end local v46           #bluetoothOn:I
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v69           #lights:Lcom/android/server/LightsService;
    .end local v79           #onlyCore:Z
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v66       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    .restart local v70       #location:Lcom/android/server/LocationManagerService;
    .restart local v77       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v82       #powerSaver:Landroid/server/PowerSaverService;
    .restart local v89       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v93       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v100       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_6b4
    move-exception v61

    .line 304
    .local v61, e:Ljava/lang/Throwable;
    :goto_6b5
    const-string v3, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_223

    .line 311
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6c0
    move-exception v61

    .line 312
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_234

    .line 318
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6cc
    move-exception v61

    .line 319
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_237

    .line 324
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6d8
    move-exception v61

    .line 325
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23a

    .line 341
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6e4
    move-exception v61

    .line 342
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_6e5
    const-string v3, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_269

    .line 349
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6f0
    move-exception v61

    .line 350
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_6f1
    const-string v3, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_282

    .line 357
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6fc
    move-exception v61

    .line 358
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_293

    .line 365
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_708
    move-exception v61

    .line 366
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a3

    .line 373
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_714
    move-exception v61

    .line 374
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_715
    const-string v3, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2ba

    .line 381
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_720
    move-exception v61

    .line 382
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_721
    const-string v3, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d1

    .line 391
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_72c
    move-exception v61

    move-object/from16 v8, v73

    .line 392
    .end local v73           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_72f
    const-string v3, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e8

    .line 399
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_73a
    move-exception v61

    .line 400
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_73b
    const-string v3, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2ff

    .line 407
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_746
    move-exception v61

    .line 408
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_747
    const-string v3, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_316

    .line 420
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_752
    move-exception v61

    .line 421
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_753
    const-string v3, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33d

    .line 429
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_75e
    move-exception v61

    .line 430
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_75f
    const-string v3, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_354

    .line 440
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_76a
    move-exception v61

    .line 441
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_365

    .line 449
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_776
    move-exception v61

    .line 450
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_777
    const-string v3, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_385

    .line 458
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_782
    move-exception v61

    .line 459
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting HDMI Service "

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_39a

    .line 467
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_78e
    move-exception v61

    .line 468
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3ab

    .line 475
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_79a
    move-exception v61

    .line 476
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_79b
    const-string v3, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3c2

    .line 483
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7a6
    move-exception v61

    .line 484
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7a7
    const-string v3, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d9

    .line 491
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7b2
    move-exception v61

    .line 492
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3ea

    .line 499
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7be
    move-exception v61

    .line 500
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_402

    .line 507
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7ca
    move-exception v61

    .line 508
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7cb
    const-string v3, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_419

    .line 514
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7d6
    move-exception v61

    .line 515
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42a

    .line 522
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7e2
    move-exception v61

    .line 523
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_43a

    .line 530
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7ee
    move-exception v61

    .line 531
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_446

    .line 539
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7fa
    move-exception v61

    .line 540
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7fb
    const-string v3, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_45d

    .line 547
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_806
    move-exception v61

    .line 548
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_46d

    .line 555
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_812
    move-exception v61

    .line 556
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_47e

    .line 563
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_81e
    move-exception v61

    .line 564
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_81f
    const-string v3, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_495

    .line 570
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_82a
    move-exception v61

    .line 571
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4a5

    .line 577
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_836
    move-exception v61

    .line 578
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4b6

    .line 589
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_842
    move-exception v61

    .line 590
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4c7

    .line 596
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_84e
    move-exception v61

    .line 597
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4d7

    .line 603
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_85a
    move-exception v61

    .line 604
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting PowerSaver service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4e7

    .line 610
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_866
    move-exception v61

    .line 611
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4f8

    .line 635
    .end local v61           #e:Ljava/lang/Throwable;
    .restart local v27       #safeMode:Z
    :cond_872
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_539

    .line 643
    :catch_87b
    move-exception v61

    .line 644
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_53e

    .line 651
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_887
    move-exception v61

    .line 652
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_543

    .line 658
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_893
    move-exception v61

    .line 659
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_546

    .line 678
    .end local v61           #e:Ljava/lang/Throwable;
    .restart local v47       #config:Landroid/content/res/Configuration;
    .restart local v72       #metrics:Landroid/util/DisplayMetrics;
    .restart local v99       #w:Landroid/view/WindowManager;
    :catch_89f
    move-exception v61

    .line 679
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_57a

    .line 190
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v27           #safeMode:Z
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v47           #config:Landroid/content/res/Configuration;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v61           #e:Ljava/lang/Throwable;
    .end local v66           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v70           #location:Lcom/android/server/LocationManagerService;
    .end local v72           #metrics:Landroid/util/DisplayMetrics;
    .end local v77           #notification:Lcom/android/server/NotificationManagerService;
    .end local v82           #powerSaver:Landroid/server/PowerSaverService;
    .end local v89           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v93           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v99           #w:Landroid/view/WindowManager;
    .end local v100           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v65       #firstBoot:Z
    .restart local v73       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v79       #onlyCore:Z
    :catch_8ab
    move-exception v3

    goto/16 :goto_fd

    .line 563
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v73           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v79           #onlyCore:Z
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v40       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v66       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v70       #location:Lcom/android/server/LocationManagerService;
    .restart local v77       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v82       #powerSaver:Landroid/server/PowerSaverService;
    .restart local v89       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v93       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v100       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_8ae
    move-exception v61

    move-object/from16 v39, v40

    .end local v40           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_81f

    .line 539
    .end local v97           #usb:Lcom/android/server/usb/UsbService;
    .restart local v98       #usb:Lcom/android/server/usb/UsbService;
    :catch_8b3
    move-exception v61

    move-object/from16 v97, v98

    .end local v98           #usb:Lcom/android/server/usb/UsbService;
    .restart local v97       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_7fb

    .line 507
    .end local v100           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v101       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_8b8
    move-exception v61

    move-object/from16 v100, v101

    .end local v101           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v100       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_7cb

    .line 483
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v51       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_8bd
    move-exception v61

    move-object/from16 v50, v51

    .end local v51           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_7a7

    .line 475
    .end local v70           #location:Lcom/android/server/LocationManagerService;
    .restart local v71       #location:Lcom/android/server/LocationManagerService;
    :catch_8c2
    move-exception v61

    move-object/from16 v70, v71

    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .restart local v70       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_79b

    .line 449
    .end local v77           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v78       #notification:Lcom/android/server/NotificationManagerService;
    :catch_8c7
    move-exception v61

    move-object/from16 v77, v78

    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v77       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_777

    .line 429
    .end local v91           #throttle:Lcom/android/server/ThrottleService;
    .restart local v92       #throttle:Lcom/android/server/ThrottleService;
    :catch_8cc
    move-exception v61

    move-object/from16 v91, v92

    .end local v92           #throttle:Lcom/android/server/ThrottleService;
    .restart local v91       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_75f

    .line 420
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v49       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_8d1
    move-exception v61

    move-object/from16 v48, v49

    .end local v49           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_753

    .line 407
    .end local v102           #wifi:Lcom/android/server/WifiService;
    .restart local v103       #wifi:Lcom/android/server/WifiService;
    :catch_8d6
    move-exception v61

    move-object/from16 v102, v103

    .end local v103           #wifi:Lcom/android/server/WifiService;
    .restart local v102       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_747

    .line 399
    .end local v104           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v105       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_8db
    move-exception v61

    move-object/from16 v104, v105

    .end local v105           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v104       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_73b

    .line 391
    :catch_8e0
    move-exception v61

    goto/16 :goto_72f

    .line 381
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v73       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v74       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_8e3
    move-exception v61

    move-object/from16 v12, v74

    .end local v74           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_721

    .line 373
    .end local v93           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v94       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_8e8
    move-exception v61

    move-object/from16 v93, v94

    .end local v94           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v93       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_715

    .line 349
    .end local v89           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v90       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_8ed
    move-exception v61

    move-object/from16 v89, v90

    .end local v90           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v89       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_6f1

    .line 341
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v56       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_8f2
    move-exception v61

    move-object/from16 v55, v56

    .end local v56           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_6e5

    .line 333
    :catch_8f7
    move-exception v3

    goto/16 :goto_24d

    .line 303
    .end local v66           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v67       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_8fa
    move-exception v61

    move-object/from16 v66, v67

    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v66       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_6b5

    .line 281
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v6           #power:Lcom/android/server/PowerManagerService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v66           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v70           #location:Lcom/android/server/LocationManagerService;
    .end local v77           #notification:Lcom/android/server/NotificationManagerService;
    .end local v82           #powerSaver:Landroid/server/PowerSaverService;
    .end local v89           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v93           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v100           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v81       #power:Lcom/android/server/PowerManagerService;
    :catch_8ff
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v81

    .end local v81           #power:Lcom/android/server/PowerManagerService;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    goto/16 :goto_638

    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v65       #firstBoot:Z
    .restart local v69       #lights:Lcom/android/server/LightsService;
    .restart local v79       #onlyCore:Z
    :catch_908
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_638

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :catch_911
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_638

    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v43       #bluetooth:Landroid/server/BluetoothService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :catch_918
    move-exception v61

    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_638

    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v43       #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :catch_91f
    move-exception v61

    move-object/from16 v44, v45

    .end local v45           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_638

    .end local v57           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v58       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :catch_928
    move-exception v61

    move-object/from16 v57, v58

    .end local v58           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v57       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_638

    .end local v52           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .end local v57           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .end local v68           #lights:Lcom/android/server/LightsService;
    .restart local v53       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v58       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :catch_92f
    move-exception v61

    move-object/from16 v52, v53

    .end local v53           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v52       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    move-object/from16 v57, v58

    .end local v58           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v57       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    move-object/from16 v68, v69

    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v68       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_638

    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v79           #onlyCore:Z
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v66       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v70       #location:Lcom/android/server/LocationManagerService;
    .restart local v77       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v82       #powerSaver:Landroid/server/PowerSaverService;
    .restart local v89       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v93       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v100       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_938
    move-object/from16 v8, v73

    .end local v73           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_4f8
.end method
