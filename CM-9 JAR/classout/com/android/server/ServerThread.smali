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
    .line 70
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 82
    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 845
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 846
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 848
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

    .line 849
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 850
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 78
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
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

    .line 80
    return-void
.end method

.method public run()V
    .registers 111

    .prologue
    .line 97
    const/16 v3, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v3, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 100
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 102
    const/4 v3, -0x2

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 105
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 106
    const/4 v3, 0x0

    invoke-static {v3}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 110
    const-string v3, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v3, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v91

    .line 112
    .local v91, shutdownAction:Ljava/lang/String;
    if-eqz v91, :cond_4e

    invoke-virtual/range {v91 .. v91}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4e

    .line 113
    const/4 v3, 0x0

    move-object/from16 v0, v91

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v9, 0x31

    if-ne v3, v9, :cond_627

    const/16 v86, 0x1

    .line 116
    .local v86, reboot:Z
    :goto_35
    invoke-virtual/range {v91 .. v91}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v9, 0x1

    if-le v3, v9, :cond_62b

    .line 117
    const/4 v3, 0x1

    invoke-virtual/range {v91 .. v91}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v91

    invoke-virtual {v0, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v85

    .line 122
    .local v85, reason:Ljava/lang/String;
    :goto_47
    move/from16 v0, v86

    move-object/from16 v1, v85

    invoke-static {v0, v1}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 126
    .end local v85           #reason:Ljava/lang/String;
    .end local v86           #reboot:Z
    :cond_4e
    const-string v3, "ro.factorytest"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v63

    .line 127
    .local v63, factoryTestStr:Ljava/lang/String;
    const-string v3, ""

    move-object/from16 v0, v63

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62f

    const/16 v62, 0x0

    .line 130
    .local v62, factoryTest:I
    :goto_60
    const/16 v69, 0x0

    .line 131
    .local v69, lights:Lcom/android/server/LightsService;
    const/16 v82, 0x0

    .line 132
    .local v82, power:Lcom/android/server/PowerManagerService;
    const/16 v57, 0x0

    .line 133
    .local v57, dmm:Lcom/android/server/DynamicMemoryManagerService;
    const/16 v41, 0x0

    .line 134
    .local v41, battery:Lcom/android/server/BatteryService;
    const/16 v38, 0x0

    .line 135
    .local v38, alarm:Lcom/android/server/AlarmManagerService;
    const/4 v13, 0x0

    .line 136
    .local v13, networkManagement:Lcom/android/server/NetworkManagementService;
    const/4 v12, 0x0

    .line 137
    .local v12, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v74, 0x0

    .line 138
    .local v74, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v48, 0x0

    .line 139
    .local v48, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v107, 0x0

    .line 140
    .local v107, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v105, 0x0

    .line 141
    .local v105, wifi:Lcom/android/server/WifiService;
    const/16 v81, 0x0

    .line 142
    .local v81, pm:Landroid/content/pm/IPackageManager;
    const/4 v4, 0x0

    .line 143
    .local v4, context:Landroid/content/Context;
    const/16 v109, 0x0

    .line 144
    .local v109, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v42, 0x0

    .line 145
    .local v42, bluetooth:Landroid/server/BluetoothService;
    const/16 v44, 0x0

    .line 146
    .local v44, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v59, 0x0

    .line 147
    .local v59, dock:Lcom/android/server/DockObserver;
    const/16 v89, 0x0

    .line 148
    .local v89, rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    const/16 v100, 0x0

    .line 149
    .local v100, usb:Lcom/android/server/usb/UsbService;
    const/16 v98, 0x0

    .line 150
    .local v98, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v87, 0x0

    .line 151
    .local v87, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v94, 0x0

    .line 152
    .local v94, throttle:Lcom/android/server/ThrottleService;
    const/16 v76, 0x0

    .line 153
    .local v76, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v52, 0x0

    .line 157
    .local v52, cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    :try_start_8d
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
    :try_end_aa
    .catch Ljava/lang/RuntimeException; {:try_start_8d .. :try_end_aa} :catch_936

    .line 162
    .end local v82           #power:Lcom/android/server/PowerManagerService;
    .local v6, power:Lcom/android/server/PowerManagerService;
    :try_start_aa
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
    const/16 v80, 0x0

    .line 176
    .local v80, onlyCore:Z
    const-string v3, "trigger_restart_min_framework"

    move-object/from16 v0, v54

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_635

    .line 177
    const-string v3, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    const/16 v80, 0x1

    .line 184
    :cond_f0
    :goto_f0
    if-eqz v62, :cond_64a

    const/4 v3, 0x1

    :goto_f3
    move/from16 v0, v80

    invoke-static {v4, v3, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_f8
    .catch Ljava/lang/RuntimeException; {:try_start_aa .. :try_end_f8} :catch_659

    move-result-object v81

    .line 187
    const/16 v65, 0x0

    .line 189
    .local v65, firstBoot:Z
    :try_start_fb
    invoke-interface/range {v81 .. v81}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_fe
    .catch Landroid/os/RemoteException; {:try_start_fb .. :try_end_fe} :catch_8dd
    .catch Ljava/lang/RuntimeException; {:try_start_fb .. :try_end_fe} :catch_659

    move-result v65

    .line 193
    :goto_ff
    :try_start_ff
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 195
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_10a
    .catch Ljava/lang/RuntimeException; {:try_start_ff .. :try_end_10a} :catch_659

    .line 199
    :try_start_10a
    const-string v3, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    const-string v3, "account"

    new-instance v9, Landroid/accounts/AccountManagerService;

    invoke-direct {v9, v4}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_11b
    .catch Ljava/lang/Throwable; {:try_start_10a .. :try_end_11b} :catch_64d
    .catch Ljava/lang/RuntimeException; {:try_start_10a .. :try_end_11b} :catch_659

    .line 207
    :goto_11b
    :try_start_11b
    const-string v3, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const/4 v3, 0x1

    move/from16 v0, v62

    if-ne v0, v3, :cond_670

    const/4 v3, 0x1

    :goto_128
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
    new-instance v70, Lcom/android/server/LightsService;

    move-object/from16 v0, v70

    invoke-direct {v0, v4}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_143
    .catch Ljava/lang/RuntimeException; {:try_start_11b .. :try_end_143} :catch_659

    .line 218
    .end local v69           #lights:Lcom/android/server/LightsService;
    .local v70, lights:Lcom/android/server/LightsService;
    :try_start_143
    const-string v3, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    new-instance v5, Lcom/android/server/BatteryService;

    move-object/from16 v0, v70

    invoke-direct {v5, v4, v0}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_151
    .catch Ljava/lang/RuntimeException; {:try_start_143 .. :try_end_151} :catch_93f

    .line 220
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .local v5, battery:Lcom/android/server/BatteryService;
    :try_start_151
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

    move-object/from16 v0, v70

    invoke-virtual {v6, v4, v0, v3, v5}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    .line 229
    const-string v3, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    new-instance v7, Lcom/android/server/AlarmManagerService;

    invoke-direct {v7, v4}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_17c
    .catch Ljava/lang/RuntimeException; {:try_start_151 .. :try_end_17c} :catch_948

    .line 231
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .local v7, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_17c
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

    if-eq v0, v3, :cond_673

    const/4 v3, 0x1

    move v9, v3

    :goto_1a1
    if-nez v65, :cond_677

    const/4 v3, 0x1

    :goto_1a4
    invoke-static {v4, v6, v9, v3}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v109

    .line 241
    const-string v3, "window"

    move-object/from16 v0, v109

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 243
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v109

    invoke-virtual {v3, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 248
    const-string v3, "ro.kernel.qemu"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "1"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_67a

    .line 249
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :goto_1cd
    sget-boolean v3, Landroid/os/SystemProperties;->QCOM_HARDWARE:Z

    if-eqz v3, :cond_1e1

    .line 272
    const-string v3, "SystemServer"

    const-string v9, "DynamicMemoryManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    new-instance v58, Lcom/android/server/DynamicMemoryManagerService;

    move-object/from16 v0, v58

    invoke-direct {v0, v4}, Lcom/android/server/DynamicMemoryManagerService;-><init>(Landroid/content/Context;)V

    .end local v57           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .local v58, dmm:Lcom/android/server/DynamicMemoryManagerService;
    move-object/from16 v57, v58

    .line 276
    .end local v58           #dmm:Lcom/android/server/DynamicMemoryManagerService;
    .restart local v57       #dmm:Lcom/android/server/DynamicMemoryManagerService;
    :cond_1e1
    new-instance v53, Lcom/android/server/CpuGovernorService;

    move-object/from16 v0, v53

    invoke-direct {v0, v4}, Lcom/android/server/CpuGovernorService;-><init>(Landroid/content/Context;)V
    :try_end_1e8
    .catch Ljava/lang/RuntimeException; {:try_start_17c .. :try_end_1e8} :catch_688

    .line 277
    .end local v52           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .local v53, cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    if-nez v53, :cond_1f1

    .line 278
    :try_start_1ea
    const-string v3, "SystemServer"

    const-string v9, "CpuGovernorService failed to start"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f1
    .catch Ljava/lang/RuntimeException; {:try_start_1ea .. :try_end_1f1} :catch_95f

    :cond_1f1
    move-object/from16 v52, v53

    .end local v53           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v52       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    move-object/from16 v69, v70

    .line 286
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v70           #lights:Lcom/android/server/LightsService;
    .end local v80           #onlyCore:Z
    .restart local v69       #lights:Lcom/android/server/LightsService;
    :goto_1f5
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x111003d

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v66

    .line 289
    .local v66, hasRotationLock:Z
    const/16 v55, 0x0

    .line 290
    .local v55, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v92, 0x0

    .line 291
    .local v92, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v67, 0x0

    .line 292
    .local v67, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v39, 0x0

    .line 293
    .local v39, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v83, 0x0

    .line 294
    .local v83, profile:Lcom/android/server/ProfileManagerService;
    const/16 v78, 0x0

    .line 295
    .local v78, notification:Lcom/android/server/NotificationManagerService;
    const/16 v103, 0x0

    .line 296
    .local v103, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v71, 0x0

    .line 297
    .local v71, location:Lcom/android/server/LocationManagerService;
    const/16 v50, 0x0

    .line 298
    .local v50, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v96, 0x0

    .line 301
    .local v96, tsms:Lcom/android/server/TextServicesManagerService;
    const/4 v3, 0x1

    move/from16 v0, v62

    if-eq v0, v3, :cond_241

    .line 303
    :try_start_219
    const-string v3, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    new-instance v68, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v68

    invoke-direct {v0, v4}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;)V
    :try_end_227
    .catch Ljava/lang/Throwable; {:try_start_219 .. :try_end_227} :catch_6da

    .line 305
    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .local v68, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_227
    const-string v3, "input_method"

    move-object/from16 v0, v68

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_22e
    .catch Ljava/lang/Throwable; {:try_start_227 .. :try_end_22e} :catch_931

    move-object/from16 v67, v68

    .line 311
    .end local v68           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v67       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_230
    :try_start_230
    const-string v3, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    const-string v3, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_241
    .catch Ljava/lang/Throwable; {:try_start_230 .. :try_end_241} :catch_6e6

    .line 320
    :cond_241
    :goto_241
    :try_start_241
    invoke-virtual/range {v109 .. v109}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_244
    .catch Ljava/lang/Throwable; {:try_start_241 .. :try_end_244} :catch_6f2

    .line 326
    :goto_244
    :try_start_244
    invoke-interface/range {v81 .. v81}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_247
    .catch Ljava/lang/Throwable; {:try_start_244 .. :try_end_247} :catch_6fe

    .line 332
    :goto_247
    :try_start_247
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x10403d9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_25a
    .catch Landroid/os/RemoteException; {:try_start_247 .. :try_end_25a} :catch_92e

    .line 339
    :goto_25a
    const/4 v3, 0x1

    move/from16 v0, v62

    if-eq v0, v3, :cond_966

    .line 341
    :try_start_25f
    const-string v3, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    new-instance v56, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v56

    invoke-direct {v0, v4}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_26d
    .catch Ljava/lang/Throwable; {:try_start_25f .. :try_end_26d} :catch_70a

    .line 343
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v56, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_26d
    const-string v3, "device_policy"

    move-object/from16 v0, v56

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_274
    .catch Ljava/lang/Throwable; {:try_start_26d .. :try_end_274} :catch_929

    move-object/from16 v55, v56

    .line 349
    .end local v56           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_276
    :try_start_276
    const-string v3, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    new-instance v93, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v93

    move-object/from16 v1, v109

    invoke-direct {v0, v4, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_286
    .catch Ljava/lang/Throwable; {:try_start_276 .. :try_end_286} :catch_716

    .line 351
    .end local v92           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v93, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_286
    const-string v3, "statusbar"

    move-object/from16 v0, v93

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28d
    .catch Ljava/lang/Throwable; {:try_start_286 .. :try_end_28d} :catch_924

    move-object/from16 v92, v93

    .line 357
    .end local v93           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v92       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_28f
    :try_start_28f
    const-string v3, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    const-string v3, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v4}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a0
    .catch Ljava/lang/Throwable; {:try_start_28f .. :try_end_2a0} :catch_722

    .line 365
    :goto_2a0
    :try_start_2a0
    const-string v3, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    invoke-static {v4}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v13

    .line 367
    const-string v3, "network_management"

    invoke-static {v3, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b0
    .catch Ljava/lang/Throwable; {:try_start_2a0 .. :try_end_2b0} :catch_72e

    .line 373
    :goto_2b0
    :try_start_2b0
    const-string v3, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    new-instance v97, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v97

    invoke-direct {v0, v4}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2be
    .catch Ljava/lang/Throwable; {:try_start_2b0 .. :try_end_2be} :catch_73a

    .line 375
    .end local v96           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v97, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_2be
    const-string v3, "textservices"

    move-object/from16 v0, v97

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2c5
    .catch Ljava/lang/Throwable; {:try_start_2be .. :try_end_2c5} :catch_91f

    move-object/from16 v96, v97

    .line 381
    .end local v97           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v96       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_2c7
    :try_start_2c7
    const-string v3, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    new-instance v75, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v75

    invoke-direct {v0, v4, v13, v7}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_2d5
    .catch Ljava/lang/Throwable; {:try_start_2c7 .. :try_end_2d5} :catch_746

    .line 383
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v75, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_2d5
    const-string v3, "netstats"

    move-object/from16 v0, v75

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2dc
    .catch Ljava/lang/Throwable; {:try_start_2d5 .. :try_end_2dc} :catch_91a

    move-object/from16 v12, v75

    .line 389
    .end local v75           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_2de
    :try_start_2de
    const-string v3, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    new-instance v8, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    move-object v9, v4

    move-object v11, v6

    invoke-direct/range {v8 .. v13}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_2f0
    .catch Ljava/lang/Throwable; {:try_start_2de .. :try_end_2f0} :catch_752

    .line 393
    .end local v74           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v8, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_2f0
    const-string v3, "netpolicy"

    invoke-static {v3, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2f5
    .catch Ljava/lang/Throwable; {:try_start_2f0 .. :try_end_2f5} :catch_917

    .line 399
    :goto_2f5
    :try_start_2f5
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    new-instance v108, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v108

    invoke-direct {v0, v4}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_303
    .catch Ljava/lang/Throwable; {:try_start_2f5 .. :try_end_303} :catch_760

    .line 401
    .end local v107           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v108, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_303
    const-string v3, "wifip2p"

    move-object/from16 v0, v108

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_30a
    .catch Ljava/lang/Throwable; {:try_start_303 .. :try_end_30a} :catch_912

    move-object/from16 v107, v108

    .line 407
    .end local v108           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v107       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_30c
    :try_start_30c
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    new-instance v106, Lcom/android/server/WifiService;

    move-object/from16 v0, v106

    invoke-direct {v0, v4}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_31a
    .catch Ljava/lang/Throwable; {:try_start_30c .. :try_end_31a} :catch_76c

    .line 409
    .end local v105           #wifi:Lcom/android/server/WifiService;
    .local v106, wifi:Lcom/android/server/WifiService;
    :try_start_31a
    const-string v3, "wifi"

    move-object/from16 v0, v106

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_321
    .catch Ljava/lang/Throwable; {:try_start_31a .. :try_end_321} :catch_90d

    move-object/from16 v105, v106

    .line 415
    .end local v106           #wifi:Lcom/android/server/WifiService;
    .restart local v105       #wifi:Lcom/android/server/WifiService;
    :goto_323
    :try_start_323
    const-string v3, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    new-instance v49, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v49

    invoke-direct {v0, v4, v13, v12, v8}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_331
    .catch Ljava/lang/Throwable; {:try_start_323 .. :try_end_331} :catch_778

    .line 418
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .local v49, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_331
    const-string v3, "connectivity"

    move-object/from16 v0, v49

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 419
    move-object/from16 v0, v49

    invoke-virtual {v12, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 420
    move-object/from16 v0, v49

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 421
    invoke-virtual/range {v105 .. v105}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 422
    invoke-virtual/range {v107 .. v107}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_348
    .catch Ljava/lang/Throwable; {:try_start_331 .. :try_end_348} :catch_908

    move-object/from16 v48, v49

    .line 428
    .end local v49           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_34a
    :try_start_34a
    const-string v3, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    new-instance v95, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v95

    invoke-direct {v0, v4}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_358
    .catch Ljava/lang/Throwable; {:try_start_34a .. :try_end_358} :catch_784

    .line 430
    .end local v94           #throttle:Lcom/android/server/ThrottleService;
    .local v95, throttle:Lcom/android/server/ThrottleService;
    :try_start_358
    const-string v3, "throttle"

    move-object/from16 v0, v95

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_35f
    .catch Ljava/lang/Throwable; {:try_start_358 .. :try_end_35f} :catch_903

    move-object/from16 v94, v95

    .line 441
    .end local v95           #throttle:Lcom/android/server/ThrottleService;
    .restart local v94       #throttle:Lcom/android/server/ThrottleService;
    :goto_361
    :try_start_361
    const-string v3, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    const-string v3, "mount"

    new-instance v9, Lcom/android/server/MountService;

    invoke-direct {v9, v4}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_372
    .catch Ljava/lang/Throwable; {:try_start_361 .. :try_end_372} :catch_790

    .line 448
    :goto_372
    :try_start_372
    const-string v3, "SystemServer"

    const-string v9, "Profile Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    new-instance v84, Lcom/android/server/ProfileManagerService;

    move-object/from16 v0, v84

    invoke-direct {v0, v4}, Lcom/android/server/ProfileManagerService;-><init>(Landroid/content/Context;)V
    :try_end_380
    .catch Ljava/lang/Throwable; {:try_start_372 .. :try_end_380} :catch_79c

    .line 450
    .end local v83           #profile:Lcom/android/server/ProfileManagerService;
    .local v84, profile:Lcom/android/server/ProfileManagerService;
    :try_start_380
    const-string v3, "profile"

    move-object/from16 v0, v84

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_387
    .catch Ljava/lang/Throwable; {:try_start_380 .. :try_end_387} :catch_8fe

    move-object/from16 v83, v84

    .line 456
    .end local v84           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v83       #profile:Lcom/android/server/ProfileManagerService;
    :goto_389
    :try_start_389
    const-string v3, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    new-instance v79, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v79

    move-object/from16 v1, v92

    move-object/from16 v2, v69

    invoke-direct {v0, v4, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_39b
    .catch Ljava/lang/Throwable; {:try_start_389 .. :try_end_39b} :catch_7a8

    .line 458
    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .local v79, notification:Lcom/android/server/NotificationManagerService;
    :try_start_39b
    const-string v3, "notification"

    move-object/from16 v0, v79

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 459
    move-object/from16 v0, v79

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_3a7
    .catch Ljava/lang/Throwable; {:try_start_39b .. :try_end_3a7} :catch_8f9

    move-object/from16 v78, v79

    .line 465
    .end local v79           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v78       #notification:Lcom/android/server/NotificationManagerService;
    :goto_3a9
    sget-boolean v3, Landroid/os/SystemProperties;->QCOM_HDMI_OUT:Z

    if-eqz v3, :cond_3be

    .line 467
    :try_start_3ad
    const-string v3, "SystemServer"

    const-string v9, "HDMI Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    const-string v3, "hdmi"

    new-instance v9, Lcom/android/server/HDMIService;

    invoke-direct {v9, v4}, Lcom/android/server/HDMIService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3be
    .catch Ljava/lang/Throwable; {:try_start_3ad .. :try_end_3be} :catch_7b4

    .line 475
    :cond_3be
    :goto_3be
    :try_start_3be
    const-string v3, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 476
    const-string v3, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v4}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3cf
    .catch Ljava/lang/Throwable; {:try_start_3be .. :try_end_3cf} :catch_7c0

    .line 483
    :goto_3cf
    :try_start_3cf
    const-string v3, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    new-instance v72, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v72

    invoke-direct {v0, v4}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3dd
    .catch Ljava/lang/Throwable; {:try_start_3cf .. :try_end_3dd} :catch_7cc

    .line 485
    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .local v72, location:Lcom/android/server/LocationManagerService;
    :try_start_3dd
    const-string v3, "location"

    move-object/from16 v0, v72

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3e4
    .catch Ljava/lang/Throwable; {:try_start_3dd .. :try_end_3e4} :catch_8f4

    move-object/from16 v71, v72

    .line 491
    .end local v72           #location:Lcom/android/server/LocationManagerService;
    .restart local v71       #location:Lcom/android/server/LocationManagerService;
    :goto_3e6
    :try_start_3e6
    const-string v3, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    new-instance v51, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v51

    invoke-direct {v0, v4}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_3f4
    .catch Ljava/lang/Throwable; {:try_start_3e6 .. :try_end_3f4} :catch_7d8

    .line 493
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v51, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_3f4
    const-string v3, "country_detector"

    move-object/from16 v0, v51

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3fb
    .catch Ljava/lang/Throwable; {:try_start_3f4 .. :try_end_3fb} :catch_8ef

    move-object/from16 v50, v51

    .line 499
    .end local v51           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_3fd
    :try_start_3fd
    const-string v3, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 500
    const-string v3, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v4}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_40e
    .catch Ljava/lang/Throwable; {:try_start_3fd .. :try_end_40e} :catch_7e4

    .line 507
    :goto_40e
    :try_start_40e
    const-string v3, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    const-string v3, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v4, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_426
    .catch Ljava/lang/Throwable; {:try_start_40e .. :try_end_426} :catch_7f0

    .line 515
    :goto_426
    :try_start_426
    const-string v3, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    new-instance v104, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v104

    invoke-direct {v0, v4}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_434
    .catch Ljava/lang/Throwable; {:try_start_426 .. :try_end_434} :catch_7fc

    .line 517
    .end local v103           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v104, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_434
    const-string v3, "wallpaper"

    move-object/from16 v0, v104

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_43b
    .catch Ljava/lang/Throwable; {:try_start_434 .. :try_end_43b} :catch_8ea

    move-object/from16 v103, v104

    .line 523
    .end local v104           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v103       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :goto_43d
    :try_start_43d
    const-string v3, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    const-string v3, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v4}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_44e
    .catch Ljava/lang/Throwable; {:try_start_43d .. :try_end_44e} :catch_808

    .line 530
    :goto_44e
    :try_start_44e
    const-string v3, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    new-instance v60, Lcom/android/server/DockObserver;

    move-object/from16 v0, v60

    invoke-direct {v0, v4, v6}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_45c
    .catch Ljava/lang/Throwable; {:try_start_44e .. :try_end_45c} :catch_814

    .end local v59           #dock:Lcom/android/server/DockObserver;
    .local v60, dock:Lcom/android/server/DockObserver;
    move-object/from16 v59, v60

    .line 538
    .end local v60           #dock:Lcom/android/server/DockObserver;
    .restart local v59       #dock:Lcom/android/server/DockObserver;
    :goto_45e
    if-eqz v66, :cond_470

    .line 539
    :try_start_460
    const-string v3, "SystemServer"

    const-string v9, "Rotation Switch Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    new-instance v90, Lcom/android/server/RotationSwitchObserver;

    move-object/from16 v0, v90

    invoke-direct {v0, v4}, Lcom/android/server/RotationSwitchObserver;-><init>(Landroid/content/Context;)V
    :try_end_46e
    .catch Ljava/lang/Throwable; {:try_start_460 .. :try_end_46e} :catch_820

    .end local v89           #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .local v90, rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    move-object/from16 v89, v90

    .line 548
    .end local v90           #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .restart local v89       #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    :cond_470
    :goto_470
    :try_start_470
    const-string v3, "SystemServer"

    const-string v9, "Wired Accessory Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    new-instance v3, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v3, v4}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_47c
    .catch Ljava/lang/Throwable; {:try_start_470 .. :try_end_47c} :catch_82c

    .line 556
    :goto_47c
    :try_start_47c
    const-string v3, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    new-instance v101, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v101

    invoke-direct {v0, v4}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_48a
    .catch Ljava/lang/Throwable; {:try_start_47c .. :try_end_48a} :catch_838

    .line 559
    .end local v100           #usb:Lcom/android/server/usb/UsbService;
    .local v101, usb:Lcom/android/server/usb/UsbService;
    :try_start_48a
    const-string v3, "usb"

    move-object/from16 v0, v101

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_491
    .catch Ljava/lang/Throwable; {:try_start_48a .. :try_end_491} :catch_8e5

    move-object/from16 v100, v101

    .line 565
    .end local v101           #usb:Lcom/android/server/usb/UsbService;
    .restart local v100       #usb:Lcom/android/server/usb/UsbService;
    :goto_493
    :try_start_493
    const-string v3, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    new-instance v99, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v99

    invoke-direct {v0, v4}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4a1
    .catch Ljava/lang/Throwable; {:try_start_493 .. :try_end_4a1} :catch_844

    .end local v98           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v99, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v98, v99

    .line 573
    .end local v99           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v98       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_4a3
    :try_start_4a3
    const-string v3, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    const-string v3, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4b4
    .catch Ljava/lang/Throwable; {:try_start_4a3 .. :try_end_4b4} :catch_850

    .line 581
    :goto_4b4
    :try_start_4b4
    const-string v3, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    new-instance v40, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v40

    invoke-direct {v0, v4}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_4c2
    .catch Ljava/lang/Throwable; {:try_start_4b4 .. :try_end_4c2} :catch_85c

    .line 583
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .local v40, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_4c2
    const-string v3, "appwidget"

    move-object/from16 v0, v40

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4c9
    .catch Ljava/lang/Throwable; {:try_start_4c2 .. :try_end_4c9} :catch_8e0

    move-object/from16 v39, v40

    .line 589
    .end local v40           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_4cb
    :try_start_4cb
    const-string v3, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    new-instance v88, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v88

    invoke-direct {v0, v4}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4d9
    .catch Ljava/lang/Throwable; {:try_start_4cb .. :try_end_4d9} :catch_868

    .end local v87           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v88, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v87, v88

    .line 596
    .end local v88           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v87       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_4db
    :try_start_4db
    const-string v3, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    const-string v3, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v4}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4ec
    .catch Ljava/lang/Throwable; {:try_start_4db .. :try_end_4ec} :catch_874

    .line 607
    :goto_4ec
    :try_start_4ec
    const-string v3, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    const-string v3, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v4}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4fd
    .catch Ljava/lang/Throwable; {:try_start_4ec .. :try_end_4fd} :catch_880

    .line 615
    :goto_4fd
    :try_start_4fd
    const-string v3, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 616
    new-instance v77, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v77

    invoke-direct {v0, v4}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_50b
    .catch Ljava/lang/Throwable; {:try_start_4fd .. :try_end_50b} :catch_88c

    .end local v76           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v77, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v76, v77

    .line 622
    .end local v77           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v76       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_50d
    :try_start_50d
    const-string v3, "SystemServer"

    const-string v9, "AssetRedirectionManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    const-string v3, "assetredirection"

    new-instance v9, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_51e
    .catch Ljava/lang/Throwable; {:try_start_50d .. :try_end_51e} :catch_898

    .line 630
    :goto_51e
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

    .line 634
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

    .line 640
    invoke-virtual/range {v109 .. v109}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v28

    .line 641
    .local v28, safeMode:Z
    if-eqz v28, :cond_8a4

    .line 642
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 644
    const/4 v3, 0x1

    sput-boolean v3, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 646
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 654
    :goto_55f
    if-eqz v55, :cond_564

    .line 656
    :try_start_561
    invoke-virtual/range {v55 .. v55}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_564
    .catch Ljava/lang/Throwable; {:try_start_561 .. :try_end_564} :catch_8ad

    .line 662
    :cond_564
    :goto_564
    if-eqz v78, :cond_569

    .line 664
    :try_start_566
    invoke-virtual/range {v78 .. v78}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_569
    .catch Ljava/lang/Throwable; {:try_start_566 .. :try_end_569} :catch_8b9

    .line 671
    :cond_569
    :goto_569
    :try_start_569
    invoke-virtual/range {v109 .. v109}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_56c
    .catch Ljava/lang/Throwable; {:try_start_569 .. :try_end_56c} :catch_8c5

    .line 676
    :goto_56c
    if-eqz v28, :cond_575

    .line 677
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 683
    :cond_575
    invoke-virtual/range {v109 .. v109}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v47

    .line 684
    .local v47, config:Landroid/content/res/Configuration;
    new-instance v73, Landroid/util/DisplayMetrics;

    invoke-direct/range {v73 .. v73}, Landroid/util/DisplayMetrics;-><init>()V

    .line 685
    .local v73, metrics:Landroid/util/DisplayMetrics;
    const-string v3, "window"

    invoke-virtual {v4, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v102

    check-cast v102, Landroid/view/WindowManager;

    .line 686
    .local v102, w:Landroid/view/WindowManager;
    invoke-interface/range {v102 .. v102}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    move-object/from16 v0, v73

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 687
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v0, v47

    move-object/from16 v1, v73

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 689
    invoke-virtual {v6}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 691
    :try_start_59d
    invoke-interface/range {v81 .. v81}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_5a0
    .catch Ljava/lang/Throwable; {:try_start_59d .. :try_end_5a0} :catch_8d1

    .line 696
    :goto_5a0
    new-instance v64, Landroid/content/IntentFilter;

    invoke-direct/range {v64 .. v64}, Landroid/content/IntentFilter;-><init>()V

    .line 697
    .local v64, filter:Landroid/content/IntentFilter;
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 698
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 699
    const-string v3, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 700
    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 701
    const-string v3, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 702
    const-string v3, "package"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 703
    new-instance v3, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v3}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v64

    invoke-virtual {v4, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 706
    move-object/from16 v16, v4

    .line 707
    .local v16, contextF:Landroid/content/Context;
    move-object/from16 v17, v5

    .line 708
    .local v17, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v18, v13

    .line 709
    .local v18, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v19, v12

    .line 710
    .local v19, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v20, v8

    .line 711
    .local v20, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v21, v48

    .line 712
    .local v21, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v22, v59

    .line 713
    .local v22, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v23, v89

    .line 714
    .local v23, rotateSwitchF:Lcom/android/server/RotationSwitchObserver;
    move-object/from16 v24, v100

    .line 715
    .local v24, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v34, v94

    .line 716
    .local v34, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v25, v98

    .line 717
    .local v25, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v27, v39

    .line 718
    .local v27, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v29, v103

    .line 719
    .local v29, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v30, v67

    .line 720
    .local v30, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v26, v87

    .line 721
    .local v26, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v32, v71

    .line 722
    .local v32, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v33, v50

    .line 723
    .local v33, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v35, v76

    .line 724
    .local v35, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v36, v96

    .line 725
    .local v36, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v31, v92

    .line 732
    .local v31, statusBarF:Lcom/android/server/StatusBarManagerService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    new-instance v14, Lcom/android/server/ServerThread$1;

    move-object/from16 v15, p0

    invoke-direct/range {v14 .. v36}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/RotationSwitchObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/TextServicesManagerService;)V

    invoke-virtual {v3, v14}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 836
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v3

    if-eqz v3, :cond_61c

    .line 837
    const-string v3, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    :cond_61c
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 841
    const-string v3, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 842
    return-void

    .line 113
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
    .end local v23           #rotateSwitchF:Lcom/android/server/RotationSwitchObserver;
    .end local v24           #usbF:Lcom/android/server/usb/UsbService;
    .end local v25           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v26           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v27           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v28           #safeMode:Z
    .end local v29           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v30           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v31           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v32           #locationF:Lcom/android/server/LocationManagerService;
    .end local v33           #countryDetectorF:Lcom/android/server/CountryDetectorService;
    .end local v34           #throttleF:Lcom/android/server/ThrottleService;
    .end local v35           #networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    .end local v36           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
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
    .end local v66           #hasRotationLock:Z
    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .end local v73           #metrics:Landroid/util/DisplayMetrics;
    .end local v76           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .end local v81           #pm:Landroid/content/pm/IPackageManager;
    .end local v83           #profile:Lcom/android/server/ProfileManagerService;
    .end local v87           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v89           #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .end local v92           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v94           #throttle:Lcom/android/server/ThrottleService;
    .end local v96           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v98           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v100           #usb:Lcom/android/server/usb/UsbService;
    .end local v102           #w:Landroid/view/WindowManager;
    .end local v103           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v105           #wifi:Lcom/android/server/WifiService;
    .end local v107           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v109           #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_627
    const/16 v86, 0x0

    goto/16 :goto_35

    .line 119
    .restart local v86       #reboot:Z
    :cond_62b
    const/16 v85, 0x0

    .restart local v85       #reason:Ljava/lang/String;
    goto/16 :goto_47

    .line 127
    .end local v85           #reason:Ljava/lang/String;
    .end local v86           #reboot:Z
    .restart local v63       #factoryTestStr:Ljava/lang/String;
    :cond_62f
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
    .restart local v69       #lights:Lcom/android/server/LightsService;
    .restart local v74       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v76       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v80       #onlyCore:Z
    .restart local v81       #pm:Landroid/content/pm/IPackageManager;
    .restart local v87       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v89       #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .restart local v94       #throttle:Lcom/android/server/ThrottleService;
    .restart local v98       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v100       #usb:Lcom/android/server/usb/UsbService;
    .restart local v105       #wifi:Lcom/android/server/WifiService;
    .restart local v107       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v109       #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_635
    :try_start_635
    const-string v3, "1"

    move-object/from16 v0, v54

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f0

    .line 180
    const-string v3, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    const/16 v80, 0x1

    goto/16 :goto_f0

    .line 184
    :cond_64a
    const/4 v3, 0x0

    goto/16 :goto_f3

    .line 202
    .restart local v65       #firstBoot:Z
    :catch_64d
    move-exception v61

    .line 203
    .local v61, e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_657
    .catch Ljava/lang/RuntimeException; {:try_start_635 .. :try_end_657} :catch_659

    goto/16 :goto_11b

    .line 281
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v61           #e:Ljava/lang/Throwable;
    .end local v65           #firstBoot:Z
    .end local v80           #onlyCore:Z
    :catch_659
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .line 282
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .local v61, e:Ljava/lang/RuntimeException;
    :goto_65e
    const-string v3, "System"

    const-string v9, "******************************************"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    const-string v3, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1f5

    .line 208
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v61           #e:Ljava/lang/RuntimeException;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v65       #firstBoot:Z
    .restart local v80       #onlyCore:Z
    :cond_670
    const/4 v3, 0x0

    goto/16 :goto_128

    .line 238
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #lights:Lcom/android/server/LightsService;
    :cond_673
    const/4 v3, 0x0

    move v9, v3

    goto/16 :goto_1a1

    :cond_677
    const/4 v3, 0x0

    goto/16 :goto_1a4

    .line 250
    :cond_67a
    const/4 v3, 0x1

    move/from16 v0, v62

    if-ne v0, v3, :cond_68c

    .line 251
    :try_start_67f
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1cd

    .line 281
    :catch_688
    move-exception v61

    move-object/from16 v69, v70

    .end local v70           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    goto :goto_65e

    .line 253
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v70       #lights:Lcom/android/server/LightsService;
    :cond_68c
    const-string v3, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    new-instance v43, Landroid/server/BluetoothService;

    move-object/from16 v0, v43

    invoke-direct {v0, v4}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_69a
    .catch Ljava/lang/RuntimeException; {:try_start_67f .. :try_end_69a} :catch_688

    .line 255
    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .local v43, bluetooth:Landroid/server/BluetoothService;
    :try_start_69a
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
    :try_end_6ad
    .catch Ljava/lang/RuntimeException; {:try_start_69a .. :try_end_6ad} :catch_94f

    .line 258
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v45, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_6ad
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
    if-nez v37, :cond_6d4

    if-eqz v46, :cond_6d4

    .line 267
    invoke-virtual/range {v43 .. v43}, Landroid/server/BluetoothService;->enable()Z
    :try_end_6d4
    .catch Ljava/lang/RuntimeException; {:try_start_6ad .. :try_end_6d4} :catch_956

    :cond_6d4
    move-object/from16 v44, v45

    .end local v45           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_1cd

    .line 306
    .end local v37           #airplaneModeOn:I
    .end local v46           #bluetoothOn:I
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v70           #lights:Lcom/android/server/LightsService;
    .end local v80           #onlyCore:Z
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v66       #hasRotationLock:Z
    .restart local v67       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    .restart local v71       #location:Lcom/android/server/LocationManagerService;
    .restart local v78       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v83       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v92       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v96       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v103       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_6da
    move-exception v61

    .line 307
    .local v61, e:Ljava/lang/Throwable;
    :goto_6db
    const-string v3, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_230

    .line 314
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6e6
    move-exception v61

    .line 315
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_241

    .line 321
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6f2
    move-exception v61

    .line 322
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_244

    .line 327
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_6fe
    move-exception v61

    .line 328
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_247

    .line 344
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_70a
    move-exception v61

    .line 345
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_70b
    const-string v3, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_276

    .line 352
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_716
    move-exception v61

    .line 353
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_717
    const-string v3, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28f

    .line 360
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_722
    move-exception v61

    .line 361
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a0

    .line 368
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_72e
    move-exception v61

    .line 369
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b0

    .line 376
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_73a
    move-exception v61

    .line 377
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_73b
    const-string v3, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2c7

    .line 384
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_746
    move-exception v61

    .line 385
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_747
    const-string v3, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2de

    .line 394
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_752
    move-exception v61

    move-object/from16 v8, v74

    .line 395
    .end local v74           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_755
    const-string v3, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f5

    .line 402
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_760
    move-exception v61

    .line 403
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_761
    const-string v3, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30c

    .line 410
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_76c
    move-exception v61

    .line 411
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_76d
    const-string v3, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_323

    .line 423
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_778
    move-exception v61

    .line 424
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_779
    const-string v3, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34a

    .line 432
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_784
    move-exception v61

    .line 433
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_785
    const-string v3, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_361

    .line 443
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_790
    move-exception v61

    .line 444
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_372

    .line 451
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_79c
    move-exception v61

    .line 452
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_79d
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Profile Manager"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_389

    .line 460
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7a8
    move-exception v61

    .line 461
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7a9
    const-string v3, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a9

    .line 469
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7b4
    move-exception v61

    .line 470
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting HDMI Service "

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3be

    .line 478
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7c0
    move-exception v61

    .line 479
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3cf

    .line 486
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7cc
    move-exception v61

    .line 487
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7cd
    const-string v3, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3e6

    .line 494
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7d8
    move-exception v61

    .line 495
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7d9
    const-string v3, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3fd

    .line 502
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7e4
    move-exception v61

    .line 503
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_40e

    .line 510
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7f0
    move-exception v61

    .line 511
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_426

    .line 518
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_7fc
    move-exception v61

    .line 519
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_7fd
    const-string v3, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_43d

    .line 525
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_808
    move-exception v61

    .line 526
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_44e

    .line 533
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_814
    move-exception v61

    .line 534
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_45e

    .line 543
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_820
    move-exception v61

    .line 544
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting RotationSwitchObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_470

    .line 551
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_82c
    move-exception v61

    .line 552
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_47c

    .line 560
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_838
    move-exception v61

    .line 561
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_839
    const-string v3, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_493

    .line 568
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_844
    move-exception v61

    .line 569
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4a3

    .line 576
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_850
    move-exception v61

    .line 577
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4b4

    .line 584
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_85c
    move-exception v61

    .line 585
    .restart local v61       #e:Ljava/lang/Throwable;
    :goto_85d
    const-string v3, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4cb

    .line 591
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_868
    move-exception v61

    .line 592
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4db

    .line 598
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_874
    move-exception v61

    .line 599
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4ec

    .line 610
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_880
    move-exception v61

    .line 611
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4fd

    .line 617
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_88c
    move-exception v61

    .line 618
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_50d

    .line 624
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_898
    move-exception v61

    .line 625
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v61

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_51e

    .line 649
    .end local v61           #e:Ljava/lang/Throwable;
    .restart local v28       #safeMode:Z
    :cond_8a4
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_55f

    .line 657
    :catch_8ad
    move-exception v61

    .line 658
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_564

    .line 665
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_8b9
    move-exception v61

    .line 666
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_569

    .line 672
    .end local v61           #e:Ljava/lang/Throwable;
    :catch_8c5
    move-exception v61

    .line 673
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_56c

    .line 692
    .end local v61           #e:Ljava/lang/Throwable;
    .restart local v47       #config:Landroid/content/res/Configuration;
    .restart local v73       #metrics:Landroid/util/DisplayMetrics;
    .restart local v102       #w:Landroid/view/WindowManager;
    :catch_8d1
    move-exception v61

    .line 693
    .restart local v61       #e:Ljava/lang/Throwable;
    const-string v3, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5a0

    .line 190
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v28           #safeMode:Z
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v47           #config:Landroid/content/res/Configuration;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v61           #e:Ljava/lang/Throwable;
    .end local v66           #hasRotationLock:Z
    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .end local v73           #metrics:Landroid/util/DisplayMetrics;
    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .end local v83           #profile:Lcom/android/server/ProfileManagerService;
    .end local v92           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v96           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v102           #w:Landroid/view/WindowManager;
    .end local v103           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v65       #firstBoot:Z
    .restart local v74       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v80       #onlyCore:Z
    :catch_8dd
    move-exception v3

    goto/16 :goto_ff

    .line 584
    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v41           #battery:Lcom/android/server/BatteryService;
    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v74           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v80           #onlyCore:Z
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v40       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v66       #hasRotationLock:Z
    .restart local v67       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v71       #location:Lcom/android/server/LocationManagerService;
    .restart local v78       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v83       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v92       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v96       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v103       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_8e0
    move-exception v61

    move-object/from16 v39, v40

    .end local v40           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_85d

    .line 560
    .end local v100           #usb:Lcom/android/server/usb/UsbService;
    .restart local v101       #usb:Lcom/android/server/usb/UsbService;
    :catch_8e5
    move-exception v61

    move-object/from16 v100, v101

    .end local v101           #usb:Lcom/android/server/usb/UsbService;
    .restart local v100       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_839

    .line 518
    .end local v103           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v104       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_8ea
    move-exception v61

    move-object/from16 v103, v104

    .end local v104           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v103       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_7fd

    .line 494
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v51       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_8ef
    move-exception v61

    move-object/from16 v50, v51

    .end local v51           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_7d9

    .line 486
    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .restart local v72       #location:Lcom/android/server/LocationManagerService;
    :catch_8f4
    move-exception v61

    move-object/from16 v71, v72

    .end local v72           #location:Lcom/android/server/LocationManagerService;
    .restart local v71       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_7cd

    .line 460
    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v79       #notification:Lcom/android/server/NotificationManagerService;
    :catch_8f9
    move-exception v61

    move-object/from16 v78, v79

    .end local v79           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v78       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_7a9

    .line 451
    .end local v83           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v84       #profile:Lcom/android/server/ProfileManagerService;
    :catch_8fe
    move-exception v61

    move-object/from16 v83, v84

    .end local v84           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v83       #profile:Lcom/android/server/ProfileManagerService;
    goto/16 :goto_79d

    .line 432
    .end local v94           #throttle:Lcom/android/server/ThrottleService;
    .restart local v95       #throttle:Lcom/android/server/ThrottleService;
    :catch_903
    move-exception v61

    move-object/from16 v94, v95

    .end local v95           #throttle:Lcom/android/server/ThrottleService;
    .restart local v94       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_785

    .line 423
    .end local v48           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v49       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_908
    move-exception v61

    move-object/from16 v48, v49

    .end local v49           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v48       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_779

    .line 410
    .end local v105           #wifi:Lcom/android/server/WifiService;
    .restart local v106       #wifi:Lcom/android/server/WifiService;
    :catch_90d
    move-exception v61

    move-object/from16 v105, v106

    .end local v106           #wifi:Lcom/android/server/WifiService;
    .restart local v105       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_76d

    .line 402
    .end local v107           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v108       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_912
    move-exception v61

    move-object/from16 v107, v108

    .end local v108           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v107       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_761

    .line 394
    :catch_917
    move-exception v61

    goto/16 :goto_755

    .line 384
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v74       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v75       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_91a
    move-exception v61

    move-object/from16 v12, v75

    .end local v75           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_747

    .line 376
    .end local v96           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v97       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_91f
    move-exception v61

    move-object/from16 v96, v97

    .end local v97           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v96       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_73b

    .line 352
    .end local v92           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v93       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_924
    move-exception v61

    move-object/from16 v92, v93

    .end local v93           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v92       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_717

    .line 344
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v56       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_929
    move-exception v61

    move-object/from16 v55, v56

    .end local v56           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_70b

    .line 336
    :catch_92e
    move-exception v3

    goto/16 :goto_25a

    .line 306
    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v68       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_931
    move-exception v61

    move-object/from16 v67, v68

    .end local v68           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v67       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_6db

    .line 281
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v6           #power:Lcom/android/server/PowerManagerService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v39           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v50           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v55           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v66           #hasRotationLock:Z
    .end local v67           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v71           #location:Lcom/android/server/LocationManagerService;
    .end local v78           #notification:Lcom/android/server/NotificationManagerService;
    .end local v83           #profile:Lcom/android/server/ProfileManagerService;
    .end local v92           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v96           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v103           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v82       #power:Lcom/android/server/PowerManagerService;
    :catch_936
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v82

    .end local v82           #power:Lcom/android/server/PowerManagerService;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    goto/16 :goto_65e

    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v41       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #cryptState:Ljava/lang/String;
    .restart local v65       #firstBoot:Z
    .restart local v70       #lights:Lcom/android/server/LightsService;
    .restart local v80       #onlyCore:Z
    :catch_93f
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v41

    .end local v41           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v69, v70

    .end local v70           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_65e

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v38       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #lights:Lcom/android/server/LightsService;
    :catch_948
    move-exception v61

    move-object/from16 v7, v38

    .end local v38           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v69, v70

    .end local v70           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_65e

    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v43       #bluetooth:Landroid/server/BluetoothService;
    .restart local v70       #lights:Lcom/android/server/LightsService;
    :catch_94f
    move-exception v61

    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v69, v70

    .end local v70           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_65e

    .end local v42           #bluetooth:Landroid/server/BluetoothService;
    .end local v44           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v43       #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v70       #lights:Lcom/android/server/LightsService;
    :catch_956
    move-exception v61

    move-object/from16 v44, v45

    .end local v45           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v44       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v42, v43

    .end local v43           #bluetooth:Landroid/server/BluetoothService;
    .restart local v42       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v69, v70

    .end local v70           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_65e

    .end local v52           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .end local v69           #lights:Lcom/android/server/LightsService;
    .restart local v53       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v70       #lights:Lcom/android/server/LightsService;
    :catch_95f
    move-exception v61

    move-object/from16 v52, v53

    .end local v53           #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    .restart local v52       #cpuGovernorManager:Lcom/android/server/CpuGovernorService;
    move-object/from16 v69, v70

    .end local v70           #lights:Lcom/android/server/LightsService;
    .restart local v69       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_65e

    .end local v54           #cryptState:Ljava/lang/String;
    .end local v65           #firstBoot:Z
    .end local v80           #onlyCore:Z
    .restart local v39       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v50       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v66       #hasRotationLock:Z
    .restart local v67       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v71       #location:Lcom/android/server/LocationManagerService;
    .restart local v78       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v83       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v92       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v96       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v103       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_966
    move-object/from16 v8, v74

    .end local v74           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_51e
.end method
