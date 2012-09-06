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
    .line 73
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 85
    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 931
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 932
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 934
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

    .line 935
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 936
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 81
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
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

    .line 83
    return-void
.end method

.method public run()V
    .registers 121

    .prologue
    .line 100
    const/16 v3, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v3, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 103
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 105
    const/4 v3, -0x2

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 108
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 109
    const/4 v3, 0x0

    invoke-static {v3}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 113
    const-string v3, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v3, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v99

    .line 115
    .local v99, shutdownAction:Ljava/lang/String;
    if-eqz v99, :cond_4e

    invoke-virtual/range {v99 .. v99}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4e

    .line 116
    const/4 v3, 0x0

    move-object/from16 v0, v99

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v9, 0x31

    if-ne v3, v9, :cond_6e7

    const/16 v93, 0x1

    .line 119
    .local v93, reboot:Z
    :goto_35
    invoke-virtual/range {v99 .. v99}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v9, 0x1

    if-le v3, v9, :cond_6eb

    .line 120
    const/4 v3, 0x1

    invoke-virtual/range {v99 .. v99}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v99

    invoke-virtual {v0, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v92

    .line 125
    .local v92, reason:Ljava/lang/String;
    :goto_47
    move/from16 v0, v93

    move-object/from16 v1, v92

    invoke-static {v0, v1}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 129
    .end local v92           #reason:Ljava/lang/String;
    .end local v93           #reboot:Z
    :cond_4e
    const-string v3, "ro.factorytest"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    .line 130
    .local v66, factoryTestStr:Ljava/lang/String;
    const-string v3, ""

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6ef

    const/16 v65, 0x0

    .line 132
    .local v65, factoryTest:I
    :goto_60
    const-string v3, "1"

    const-string v9, "ro.config.headless"

    const-string v10, "0"

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    .line 134
    .local v16, headless:Z
    const/16 v72, 0x0

    .line 135
    .local v72, lights:Lcom/android/server/LightsService;
    const/16 v89, 0x0

    .line 136
    .local v89, power:Lcom/android/server/PowerManagerService;
    const/16 v44, 0x0

    .line 137
    .local v44, battery:Lcom/android/server/BatteryService;
    const/16 v110, 0x0

    .line 138
    .local v110, vibrator:Lcom/android/server/VibratorService;
    const/16 v41, 0x0

    .line 139
    .local v41, alarm:Lcom/android/server/AlarmManagerService;
    const/4 v13, 0x0

    .line 140
    .local v13, networkManagement:Lcom/android/server/NetworkManagementService;
    const/4 v12, 0x0

    .line 141
    .local v12, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v81, 0x0

    .line 142
    .local v81, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v53, 0x0

    .line 143
    .local v53, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v117, 0x0

    .line 144
    .local v117, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v115, 0x0

    .line 145
    .local v115, wifi:Lcom/android/server/WifiService;
    const/16 v98, 0x0

    .line 146
    .local v98, serviceDiscovery:Lcom/android/server/NsdService;
    const/16 v88, 0x0

    .line 147
    .local v88, pm:Landroid/content/pm/IPackageManager;
    const/4 v4, 0x0

    .line 148
    .local v4, context:Landroid/content/Context;
    const/16 v119, 0x0

    .line 149
    .local v119, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v45, 0x0

    .line 150
    .local v45, bluetooth:Landroid/server/BluetoothService;
    const/16 v47, 0x0

    .line 151
    .local v47, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v60, 0x0

    .line 152
    .local v60, dock:Lcom/android/server/DockObserver;
    const/16 v108, 0x0

    .line 153
    .local v108, usb:Lcom/android/server/usb/UsbService;
    const/16 v96, 0x0

    .line 154
    .local v96, serial:Lcom/android/server/SerialService;
    const/16 v106, 0x0

    .line 155
    .local v106, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v94, 0x0

    .line 156
    .local v94, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v102, 0x0

    .line 157
    .local v102, throttle:Lcom/android/server/ThrottleService;
    const/16 v83, 0x0

    .line 158
    .local v83, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v50, 0x0

    .line 159
    .local v50, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    const/16 v71, 0x0

    .line 163
    .local v71, inputManager:Lcom/android/server/input/InputManagerService;
    :try_start_9f
    const-string v3, "SystemServer"

    const-string v9, "Entropy Mixer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const-string v3, "entropy"

    new-instance v9, Lcom/android/server/EntropyMixer;

    invoke-direct {v9}, Lcom/android/server/EntropyMixer;-><init>()V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 166
    const-string v3, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v6, Lcom/android/server/PowerManagerService;

    invoke-direct {v6}, Lcom/android/server/PowerManagerService;-><init>()V
    :try_end_bc
    .catch Ljava/lang/RuntimeException; {:try_start_9f .. :try_end_bc} :catch_a65

    .line 168
    .end local v89           #power:Lcom/android/server/PowerManagerService;
    .local v6, power:Lcom/android/server/PowerManagerService;
    :try_start_bc
    const-string v3, "power"

    invoke-static {v3, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 170
    const-string v3, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-static/range {v65 .. v65}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v4

    .line 173
    const-string v3, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    const-string v3, "telephony.registry"

    new-instance v9, Lcom/android/server/TelephonyRegistry;

    invoke-direct {v9, v4}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 176
    const-string v3, "SystemServer"

    const-string v9, "Scheduling Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    const-string v3, "scheduling_policy"

    new-instance v9, Landroid/os/SchedulingPolicyService;

    invoke-direct {v9}, Landroid/os/SchedulingPolicyService;-><init>()V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 180
    invoke-static {v4}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 182
    const-string v3, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    const-string v3, "vold.decrypt"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    .line 185
    .local v57, cryptState:Ljava/lang/String;
    const/16 v87, 0x0

    .line 186
    .local v87, onlyCore:Z
    const-string v3, "trigger_restart_min_framework"

    move-object/from16 v0, v57

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6f5

    .line 187
    const-string v3, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const/16 v87, 0x1

    .line 194
    :cond_113
    :goto_113
    if-eqz v65, :cond_70a

    const/4 v3, 0x1

    :goto_116
    move/from16 v0, v87

    invoke-static {v4, v3, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_11b
    .catch Ljava/lang/RuntimeException; {:try_start_bc .. :try_end_11b} :catch_719

    move-result-object v88

    .line 197
    const/16 v68, 0x0

    .line 199
    .local v68, firstBoot:Z
    :try_start_11e
    invoke-interface/range {v88 .. v88}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_121
    .catch Landroid/os/RemoteException; {:try_start_11e .. :try_end_121} :catch_9f4
    .catch Ljava/lang/RuntimeException; {:try_start_11e .. :try_end_121} :catch_719

    move-result v68

    .line 203
    :goto_122
    :try_start_122
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 205
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_12d
    .catch Ljava/lang/RuntimeException; {:try_start_122 .. :try_end_12d} :catch_719

    .line 209
    :try_start_12d
    const-string v3, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    const-string v3, "account"

    new-instance v9, Landroid/accounts/AccountManagerService;

    invoke-direct {v9, v4}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_13e
    .catch Ljava/lang/Throwable; {:try_start_12d .. :try_end_13e} :catch_70d
    .catch Ljava/lang/RuntimeException; {:try_start_12d .. :try_end_13e} :catch_719

    .line 216
    :goto_13e
    :try_start_13e
    const-string v3, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    const/4 v3, 0x1

    move/from16 v0, v65

    if-ne v0, v3, :cond_730

    const/4 v3, 0x1

    :goto_14b
    invoke-static {v4, v3}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/IContentService;

    .line 220
    const-string v3, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 223
    const-string v3, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    new-instance v73, Lcom/android/server/LightsService;

    move-object/from16 v0, v73

    invoke-direct {v0, v4}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_166
    .catch Ljava/lang/RuntimeException; {:try_start_13e .. :try_end_166} :catch_719

    .line 226
    .end local v72           #lights:Lcom/android/server/LightsService;
    .local v73, lights:Lcom/android/server/LightsService;
    :try_start_166
    const-string v3, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    new-instance v5, Lcom/android/server/BatteryService;

    move-object/from16 v0, v73

    invoke-direct {v5, v4, v0}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_174
    .catch Ljava/lang/RuntimeException; {:try_start_166 .. :try_end_174} :catch_a6e

    .line 228
    .end local v44           #battery:Lcom/android/server/BatteryService;
    .local v5, battery:Lcom/android/server/BatteryService;
    :try_start_174
    const-string v3, "battery"

    invoke-static {v3, v5}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 230
    const-string v3, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    new-instance v111, Lcom/android/server/VibratorService;

    move-object/from16 v0, v111

    invoke-direct {v0, v4}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_187
    .catch Ljava/lang/RuntimeException; {:try_start_174 .. :try_end_187} :catch_a77

    .line 232
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .local v111, vibrator:Lcom/android/server/VibratorService;
    :try_start_187
    const-string v3, "vibrator"

    move-object/from16 v0, v111

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 236
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v73

    invoke-virtual {v6, v4, v0, v3, v5}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    .line 238
    const-string v3, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    new-instance v7, Lcom/android/server/AlarmManagerService;

    invoke-direct {v7, v4}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1a3
    .catch Ljava/lang/RuntimeException; {:try_start_187 .. :try_end_1a3} :catch_a7e

    .line 240
    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .local v7, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_1a3
    const-string v3, "alarm"

    invoke-static {v3, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 242
    const-string v3, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v3

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 246
    const-string v3, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const/4 v3, 0x1

    move/from16 v0, v65

    if-eq v0, v3, :cond_733

    const/4 v3, 0x1

    move v9, v3

    :goto_1c8
    if-nez v68, :cond_737

    const/4 v3, 0x1

    :goto_1cb
    move/from16 v0, v87

    invoke-static {v4, v6, v9, v3, v0}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v119

    .line 250
    const-string v3, "window"

    move-object/from16 v0, v119

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 251
    invoke-virtual/range {v119 .. v119}, Lcom/android/server/wm/WindowManagerService;->getInputManagerService()Lcom/android/server/input/InputManagerService;

    move-result-object v71

    .line 252
    const-string v3, "input"

    move-object/from16 v0, v71

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 254
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v119

    invoke-virtual {v3, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 259
    const-string v3, "ro.kernel.qemu"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "1"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_73a

    .line 260
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_201
    .catch Ljava/lang/RuntimeException; {:try_start_1a3 .. :try_end_201} :catch_748

    :goto_201
    move-object/from16 v110, v111

    .end local v111           #vibrator:Lcom/android/server/VibratorService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .line 288
    .end local v57           #cryptState:Ljava/lang/String;
    .end local v68           #firstBoot:Z
    .end local v73           #lights:Lcom/android/server/LightsService;
    .end local v87           #onlyCore:Z
    .restart local v72       #lights:Lcom/android/server/LightsService;
    :goto_205
    const/16 v58, 0x0

    .line 289
    .local v58, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v100, 0x0

    .line 290
    .local v100, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v69, 0x0

    .line 291
    .local v69, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v42, 0x0

    .line 292
    .local v42, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v90, 0x0

    .line 293
    .local v90, profile:Lcom/android/server/ProfileManagerService;
    const/16 v85, 0x0

    .line 294
    .local v85, notification:Lcom/android/server/NotificationManagerService;
    const/16 v113, 0x0

    .line 295
    .local v113, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v74, 0x0

    .line 296
    .local v74, location:Lcom/android/server/LocationManagerService;
    const/16 v55, 0x0

    .line 297
    .local v55, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v104, 0x0

    .line 298
    .local v104, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v76, 0x0

    .line 299
    .local v76, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    const/16 v62, 0x0

    .line 302
    .local v62, dreamy:Landroid/service/dreams/DreamManagerService;
    const/4 v3, 0x1

    move/from16 v0, v65

    if-eq v0, v3, :cond_24c

    .line 304
    :try_start_222
    const-string v3, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    new-instance v70, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v70

    move-object/from16 v1, v119

    invoke-direct {v0, v4, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_232
    .catch Ljava/lang/Throwable; {:try_start_222 .. :try_end_232} :catch_79d

    .line 306
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .local v70, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_232
    const-string v3, "input_method"

    move-object/from16 v0, v70

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_239
    .catch Ljava/lang/Throwable; {:try_start_232 .. :try_end_239} :catch_a60

    move-object/from16 v69, v70

    .line 312
    .end local v70           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_23b
    :try_start_23b
    const-string v3, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    const-string v3, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24c
    .catch Ljava/lang/Throwable; {:try_start_23b .. :try_end_24c} :catch_7a9

    .line 321
    :cond_24c
    :goto_24c
    :try_start_24c
    invoke-virtual/range {v119 .. v119}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_24f
    .catch Ljava/lang/Throwable; {:try_start_24c .. :try_end_24f} :catch_7b5

    .line 327
    :goto_24f
    :try_start_24f
    invoke-interface/range {v88 .. v88}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_252
    .catch Ljava/lang/Throwable; {:try_start_24f .. :try_end_252} :catch_7c1

    .line 333
    :goto_252
    :try_start_252
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x104040b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_265
    .catch Landroid/os/RemoteException; {:try_start_252 .. :try_end_265} :catch_a5d

    .line 340
    :goto_265
    const/4 v3, 0x1

    move/from16 v0, v65

    if-eq v0, v3, :cond_a9b

    .line 341
    const/16 v79, 0x0

    .line 342
    .local v79, mountService:Lcom/android/server/MountService;
    const-string v3, "0"

    const-string v9, "system_init.startmountservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_291

    .line 348
    :try_start_27a
    const-string v3, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    new-instance v80, Lcom/android/server/MountService;

    move-object/from16 v0, v80

    invoke-direct {v0, v4}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_288
    .catch Ljava/lang/Throwable; {:try_start_27a .. :try_end_288} :catch_7cd

    .line 350
    .end local v79           #mountService:Lcom/android/server/MountService;
    .local v80, mountService:Lcom/android/server/MountService;
    :try_start_288
    const-string v3, "mount"

    move-object/from16 v0, v80

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28f
    .catch Ljava/lang/Throwable; {:try_start_288 .. :try_end_28f} :catch_a58

    move-object/from16 v79, v80

    .line 357
    .end local v80           #mountService:Lcom/android/server/MountService;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    :cond_291
    :goto_291
    :try_start_291
    const-string v3, "SystemServer"

    const-string v9, "LockSettingsService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    new-instance v77, Lcom/android/internal/widget/LockSettingsService;

    move-object/from16 v0, v77

    invoke-direct {v0, v4}, Lcom/android/internal/widget/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_29f
    .catch Ljava/lang/Throwable; {:try_start_291 .. :try_end_29f} :catch_7d9

    .line 359
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .local v77, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :try_start_29f
    const-string v3, "lock_settings"

    move-object/from16 v0, v77

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a6
    .catch Ljava/lang/Throwable; {:try_start_29f .. :try_end_2a6} :catch_a53

    move-object/from16 v76, v77

    .line 365
    .end local v77           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :goto_2a8
    :try_start_2a8
    const-string v3, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    new-instance v59, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v59

    invoke-direct {v0, v4}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2b6
    .catch Ljava/lang/Throwable; {:try_start_2a8 .. :try_end_2b6} :catch_7e5

    .line 367
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v59, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_2b6
    const-string v3, "device_policy"

    move-object/from16 v0, v59

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2bd
    .catch Ljava/lang/Throwable; {:try_start_2b6 .. :try_end_2bd} :catch_a4e

    move-object/from16 v58, v59

    .line 373
    .end local v59           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_2bf
    :try_start_2bf
    const-string v3, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    new-instance v101, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v101

    move-object/from16 v1, v119

    invoke-direct {v0, v4, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_2cf
    .catch Ljava/lang/Throwable; {:try_start_2bf .. :try_end_2cf} :catch_7f1

    .line 375
    .end local v100           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v101, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_2cf
    const-string v3, "statusbar"

    move-object/from16 v0, v101

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d6
    .catch Ljava/lang/Throwable; {:try_start_2cf .. :try_end_2d6} :catch_a49

    move-object/from16 v100, v101

    .line 381
    .end local v101           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v100       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_2d8
    :try_start_2d8
    const-string v3, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    const-string v3, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v4}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2e9
    .catch Ljava/lang/Throwable; {:try_start_2d8 .. :try_end_2e9} :catch_7fd

    .line 389
    :goto_2e9
    :try_start_2e9
    const-string v3, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    invoke-static {v4}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v13

    .line 391
    const-string v3, "network_management"

    invoke-static {v3, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2f9
    .catch Ljava/lang/Throwable; {:try_start_2e9 .. :try_end_2f9} :catch_809

    .line 397
    :goto_2f9
    :try_start_2f9
    const-string v3, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    new-instance v105, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v105

    invoke-direct {v0, v4}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_307
    .catch Ljava/lang/Throwable; {:try_start_2f9 .. :try_end_307} :catch_815

    .line 399
    .end local v104           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v105, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_307
    const-string v3, "textservices"

    move-object/from16 v0, v105

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_30e
    .catch Ljava/lang/Throwable; {:try_start_307 .. :try_end_30e} :catch_a44

    move-object/from16 v104, v105

    .line 405
    .end local v105           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v104       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_310
    :try_start_310
    const-string v3, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    new-instance v82, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v82

    invoke-direct {v0, v4, v13, v7}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_31e
    .catch Ljava/lang/Throwable; {:try_start_310 .. :try_end_31e} :catch_821

    .line 407
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v82, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_31e
    const-string v3, "netstats"

    move-object/from16 v0, v82

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_325
    .catch Ljava/lang/Throwable; {:try_start_31e .. :try_end_325} :catch_a3f

    move-object/from16 v12, v82

    .line 413
    .end local v82           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_327
    :try_start_327
    const-string v3, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    new-instance v8, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    move-object v9, v4

    move-object v11, v6

    invoke-direct/range {v8 .. v13}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_339
    .catch Ljava/lang/Throwable; {:try_start_327 .. :try_end_339} :catch_82d

    .line 417
    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v8, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_339
    const-string v3, "netpolicy"

    invoke-static {v3, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33e
    .catch Ljava/lang/Throwable; {:try_start_339 .. :try_end_33e} :catch_a3c

    .line 423
    :goto_33e
    :try_start_33e
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    new-instance v118, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v118

    invoke-direct {v0, v4}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_34c
    .catch Ljava/lang/Throwable; {:try_start_33e .. :try_end_34c} :catch_83b

    .line 425
    .end local v117           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v118, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_34c
    const-string v3, "wifip2p"

    move-object/from16 v0, v118

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_353
    .catch Ljava/lang/Throwable; {:try_start_34c .. :try_end_353} :catch_a37

    move-object/from16 v117, v118

    .line 431
    .end local v118           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v117       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_355
    :try_start_355
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    new-instance v116, Lcom/android/server/WifiService;

    move-object/from16 v0, v116

    invoke-direct {v0, v4}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_363
    .catch Ljava/lang/Throwable; {:try_start_355 .. :try_end_363} :catch_847

    .line 433
    .end local v115           #wifi:Lcom/android/server/WifiService;
    .local v116, wifi:Lcom/android/server/WifiService;
    :try_start_363
    const-string v3, "wifi"

    move-object/from16 v0, v116

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_36a
    .catch Ljava/lang/Throwable; {:try_start_363 .. :try_end_36a} :catch_a32

    move-object/from16 v115, v116

    .line 439
    .end local v116           #wifi:Lcom/android/server/WifiService;
    .restart local v115       #wifi:Lcom/android/server/WifiService;
    :goto_36c
    :try_start_36c
    const-string v3, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    new-instance v54, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v54

    invoke-direct {v0, v4, v13, v12, v8}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_37a
    .catch Ljava/lang/Throwable; {:try_start_36c .. :try_end_37a} :catch_853

    .line 442
    .end local v53           #connectivity:Lcom/android/server/ConnectivityService;
    .local v54, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_37a
    const-string v3, "connectivity"

    move-object/from16 v0, v54

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 443
    move-object/from16 v0, v54

    invoke-virtual {v12, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 444
    move-object/from16 v0, v54

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 445
    invoke-virtual/range {v115 .. v115}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 446
    invoke-virtual/range {v117 .. v117}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_391
    .catch Ljava/lang/Throwable; {:try_start_37a .. :try_end_391} :catch_a2d

    move-object/from16 v53, v54

    .line 452
    .end local v54           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v53       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_393
    :try_start_393
    const-string v3, "SystemServer"

    const-string v9, "Network Service Discovery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    invoke-static {v4}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v98

    .line 454
    const-string v3, "servicediscovery"

    move-object/from16 v0, v98

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3a5
    .catch Ljava/lang/Throwable; {:try_start_393 .. :try_end_3a5} :catch_85f

    .line 461
    :goto_3a5
    :try_start_3a5
    const-string v3, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    new-instance v103, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v103

    invoke-direct {v0, v4}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_3b3
    .catch Ljava/lang/Throwable; {:try_start_3a5 .. :try_end_3b3} :catch_86b

    .line 463
    .end local v102           #throttle:Lcom/android/server/ThrottleService;
    .local v103, throttle:Lcom/android/server/ThrottleService;
    :try_start_3b3
    const-string v3, "throttle"

    move-object/from16 v0, v103

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3ba
    .catch Ljava/lang/Throwable; {:try_start_3b3 .. :try_end_3ba} :catch_a28

    move-object/from16 v102, v103

    .line 470
    .end local v103           #throttle:Lcom/android/server/ThrottleService;
    .restart local v102       #throttle:Lcom/android/server/ThrottleService;
    :goto_3bc
    :try_start_3bc
    const-string v3, "SystemServer"

    const-string v9, "UpdateLock Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    const-string v3, "updatelock"

    new-instance v9, Lcom/android/server/UpdateLockService;

    invoke-direct {v9, v4}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3cd
    .catch Ljava/lang/Throwable; {:try_start_3bc .. :try_end_3cd} :catch_877

    .line 482
    :goto_3cd
    if-eqz v79, :cond_3d2

    .line 483
    invoke-virtual/range {v79 .. v79}, Lcom/android/server/MountService;->waitForAsecScan()V

    .line 487
    :cond_3d2
    :try_start_3d2
    const-string v3, "SystemServer"

    const-string v9, "Profile Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    new-instance v91, Lcom/android/server/ProfileManagerService;

    move-object/from16 v0, v91

    invoke-direct {v0, v4}, Lcom/android/server/ProfileManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3e0
    .catch Ljava/lang/Throwable; {:try_start_3d2 .. :try_end_3e0} :catch_883

    .line 489
    .end local v90           #profile:Lcom/android/server/ProfileManagerService;
    .local v91, profile:Lcom/android/server/ProfileManagerService;
    :try_start_3e0
    const-string v3, "profile"

    move-object/from16 v0, v91

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3e7
    .catch Ljava/lang/Throwable; {:try_start_3e0 .. :try_end_3e7} :catch_a23

    move-object/from16 v90, v91

    .line 495
    .end local v91           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v90       #profile:Lcom/android/server/ProfileManagerService;
    :goto_3e9
    :try_start_3e9
    const-string v3, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    new-instance v86, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v86

    move-object/from16 v1, v100

    move-object/from16 v2, v72

    invoke-direct {v0, v4, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_3fb
    .catch Ljava/lang/Throwable; {:try_start_3e9 .. :try_end_3fb} :catch_88f

    .line 497
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .local v86, notification:Lcom/android/server/NotificationManagerService;
    :try_start_3fb
    const-string v3, "notification"

    move-object/from16 v0, v86

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 498
    move-object/from16 v0, v86

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_407
    .catch Ljava/lang/Throwable; {:try_start_3fb .. :try_end_407} :catch_a1e

    move-object/from16 v85, v86

    .line 504
    .end local v86           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    :goto_409
    :try_start_409
    const-string v3, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    const-string v3, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v4}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_41a
    .catch Ljava/lang/Throwable; {:try_start_409 .. :try_end_41a} :catch_89b

    .line 512
    :goto_41a
    :try_start_41a
    const-string v3, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    new-instance v75, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v75

    invoke-direct {v0, v4}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_428
    .catch Ljava/lang/Throwable; {:try_start_41a .. :try_end_428} :catch_8a7

    .line 514
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .local v75, location:Lcom/android/server/LocationManagerService;
    :try_start_428
    const-string v3, "location"

    move-object/from16 v0, v75

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42f
    .catch Ljava/lang/Throwable; {:try_start_428 .. :try_end_42f} :catch_a19

    move-object/from16 v74, v75

    .line 520
    .end local v75           #location:Lcom/android/server/LocationManagerService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    :goto_431
    :try_start_431
    const-string v3, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    new-instance v56, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v56

    invoke-direct {v0, v4}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_43f
    .catch Ljava/lang/Throwable; {:try_start_431 .. :try_end_43f} :catch_8b3

    .line 522
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v56, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_43f
    const-string v3, "country_detector"

    move-object/from16 v0, v56

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_446
    .catch Ljava/lang/Throwable; {:try_start_43f .. :try_end_446} :catch_a14

    move-object/from16 v55, v56

    .line 528
    .end local v56           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_448
    :try_start_448
    const-string v3, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    const-string v3, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v4}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_459
    .catch Ljava/lang/Throwable; {:try_start_448 .. :try_end_459} :catch_8bf

    .line 536
    :goto_459
    :try_start_459
    const-string v3, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    const-string v3, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v4, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_471
    .catch Ljava/lang/Throwable; {:try_start_459 .. :try_end_471} :catch_8cb

    .line 543
    :goto_471
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x1110027

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_497

    .line 546
    :try_start_47e
    const-string v3, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    if-nez v16, :cond_497

    .line 548
    new-instance v114, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v114

    invoke-direct {v0, v4}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_48e
    .catch Ljava/lang/Throwable; {:try_start_47e .. :try_end_48e} :catch_8d7

    .line 549
    .end local v113           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v114, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_48e
    const-string v3, "wallpaper"

    move-object/from16 v0, v114

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_495
    .catch Ljava/lang/Throwable; {:try_start_48e .. :try_end_495} :catch_a0f

    move-object/from16 v113, v114

    .line 556
    .end local v114           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v113       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_497
    :goto_497
    const-string v3, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4b6

    .line 558
    :try_start_4a5
    const-string v3, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 559
    const-string v3, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v4}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4b6
    .catch Ljava/lang/Throwable; {:try_start_4a5 .. :try_end_4b6} :catch_8e3

    .line 566
    :cond_4b6
    :goto_4b6
    :try_start_4b6
    const-string v3, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    new-instance v61, Lcom/android/server/DockObserver;

    move-object/from16 v0, v61

    invoke-direct {v0, v4, v6}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_4c4
    .catch Ljava/lang/Throwable; {:try_start_4b6 .. :try_end_4c4} :catch_8ef

    .end local v60           #dock:Lcom/android/server/DockObserver;
    .local v61, dock:Lcom/android/server/DockObserver;
    move-object/from16 v60, v61

    .line 574
    .end local v61           #dock:Lcom/android/server/DockObserver;
    .restart local v60       #dock:Lcom/android/server/DockObserver;
    :goto_4c6
    :try_start_4c6
    const-string v3, "SystemServer"

    const-string v9, "Wired Accessory Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    new-instance v3, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v3, v4}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_4d2
    .catch Ljava/lang/Throwable; {:try_start_4c6 .. :try_end_4d2} :catch_8fb

    .line 582
    :goto_4d2
    :try_start_4d2
    const-string v3, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    new-instance v109, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v109

    invoke-direct {v0, v4}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_4e0
    .catch Ljava/lang/Throwable; {:try_start_4d2 .. :try_end_4e0} :catch_907

    .line 585
    .end local v108           #usb:Lcom/android/server/usb/UsbService;
    .local v109, usb:Lcom/android/server/usb/UsbService;
    :try_start_4e0
    const-string v3, "usb"

    move-object/from16 v0, v109

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4e7
    .catch Ljava/lang/Throwable; {:try_start_4e0 .. :try_end_4e7} :catch_a0a

    move-object/from16 v108, v109

    .line 591
    .end local v109           #usb:Lcom/android/server/usb/UsbService;
    .restart local v108       #usb:Lcom/android/server/usb/UsbService;
    :goto_4e9
    :try_start_4e9
    const-string v3, "SystemServer"

    const-string v9, "Serial Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    new-instance v97, Lcom/android/server/SerialService;

    move-object/from16 v0, v97

    invoke-direct {v0, v4}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_4f7
    .catch Ljava/lang/Throwable; {:try_start_4e9 .. :try_end_4f7} :catch_913

    .line 594
    .end local v96           #serial:Lcom/android/server/SerialService;
    .local v97, serial:Lcom/android/server/SerialService;
    :try_start_4f7
    const-string v3, "serial"

    move-object/from16 v0, v97

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4fe
    .catch Ljava/lang/Throwable; {:try_start_4f7 .. :try_end_4fe} :catch_a05

    move-object/from16 v96, v97

    .line 600
    .end local v97           #serial:Lcom/android/server/SerialService;
    .restart local v96       #serial:Lcom/android/server/SerialService;
    :goto_500
    :try_start_500
    const-string v3, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    new-instance v107, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v107

    invoke-direct {v0, v4}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_50e
    .catch Ljava/lang/Throwable; {:try_start_500 .. :try_end_50e} :catch_91f

    .end local v106           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v107, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v106, v107

    .line 608
    .end local v107           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v106       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_510
    :try_start_510
    const-string v3, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    const-string v3, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_521
    .catch Ljava/lang/Throwable; {:try_start_510 .. :try_end_521} :catch_92b

    .line 616
    :goto_521
    :try_start_521
    const-string v3, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    new-instance v43, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v43

    invoke-direct {v0, v4}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_52f
    .catch Ljava/lang/Throwable; {:try_start_521 .. :try_end_52f} :catch_937

    .line 618
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .local v43, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_52f
    const-string v3, "appwidget"

    move-object/from16 v0, v43

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_536
    .catch Ljava/lang/Throwable; {:try_start_52f .. :try_end_536} :catch_a00

    move-object/from16 v42, v43

    .line 624
    .end local v43           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_538
    :try_start_538
    const-string v3, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    new-instance v95, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v95

    invoke-direct {v0, v4}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_546
    .catch Ljava/lang/Throwable; {:try_start_538 .. :try_end_546} :catch_943

    .end local v94           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v95, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v94, v95

    .line 631
    .end local v95           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v94       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_548
    :try_start_548
    const-string v3, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    const-string v3, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v4}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_559
    .catch Ljava/lang/Throwable; {:try_start_548 .. :try_end_559} :catch_94f

    .line 642
    :goto_559
    :try_start_559
    const-string v3, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    const-string v3, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v4}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_56a
    .catch Ljava/lang/Throwable; {:try_start_559 .. :try_end_56a} :catch_95b

    .line 650
    :goto_56a
    :try_start_56a
    const-string v3, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    new-instance v84, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v84

    invoke-direct {v0, v4}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_578
    .catch Ljava/lang/Throwable; {:try_start_56a .. :try_end_578} :catch_967

    .end local v83           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v84, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v83, v84

    .line 657
    .end local v84           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v83       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_57a
    :try_start_57a
    const-string v3, "SystemServer"

    const-string v9, "CommonTimeManagementService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    new-instance v51, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v51

    invoke-direct {v0, v4}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_588
    .catch Ljava/lang/Throwable; {:try_start_57a .. :try_end_588} :catch_973

    .line 659
    .end local v50           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .local v51, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :try_start_588
    const-string v3, "commontime_management"

    move-object/from16 v0, v51

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_58f
    .catch Ljava/lang/Throwable; {:try_start_588 .. :try_end_58f} :catch_9fb

    move-object/from16 v50, v51

    .line 665
    .end local v51           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v50       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :goto_591
    :try_start_591
    const-string v3, "SystemServer"

    const-string v9, "CertBlacklister"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    new-instance v3, Lcom/android/server/CertBlacklister;

    invoke-direct {v3, v4}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_59d
    .catch Ljava/lang/Throwable; {:try_start_591 .. :try_end_59d} :catch_97f

    .line 671
    :goto_59d
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x111003c

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_5c1

    .line 674
    :try_start_5aa
    const-string v3, "SystemServer"

    const-string v9, "Dreams Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    new-instance v63, Landroid/service/dreams/DreamManagerService;

    move-object/from16 v0, v63

    invoke-direct {v0, v4}, Landroid/service/dreams/DreamManagerService;-><init>(Landroid/content/Context;)V
    :try_end_5b8
    .catch Ljava/lang/Throwable; {:try_start_5aa .. :try_end_5b8} :catch_98b

    .line 677
    .end local v62           #dreamy:Landroid/service/dreams/DreamManagerService;
    .local v63, dreamy:Landroid/service/dreams/DreamManagerService;
    :try_start_5b8
    const-string v3, "dreams"

    move-object/from16 v0, v63

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5bf
    .catch Ljava/lang/Throwable; {:try_start_5b8 .. :try_end_5bf} :catch_9f7

    move-object/from16 v62, v63

    .line 684
    .end local v63           #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    :cond_5c1
    :goto_5c1
    :try_start_5c1
    const-string v3, "SystemServer"

    const-string v9, "AssetRedirectionManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    const-string v3, "assetredirection"

    new-instance v9, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5d2
    .catch Ljava/lang/Throwable; {:try_start_5c1 .. :try_end_5d2} :catch_997

    .line 692
    .end local v79           #mountService:Lcom/android/server/MountService;
    :goto_5d2
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

    .line 696
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

    .line 702
    invoke-virtual/range {v119 .. v119}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v28

    .line 703
    .local v28, safeMode:Z
    if-eqz v28, :cond_9a3

    .line 704
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 706
    const/4 v3, 0x1

    sput-boolean v3, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 708
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 717
    :goto_613
    :try_start_613
    invoke-virtual/range {v110 .. v110}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_616
    .catch Ljava/lang/Throwable; {:try_start_613 .. :try_end_616} :catch_9ac

    .line 722
    :goto_616
    if-eqz v58, :cond_61b

    .line 724
    :try_start_618
    invoke-virtual/range {v58 .. v58}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_61b
    .catch Ljava/lang/Throwable; {:try_start_618 .. :try_end_61b} :catch_9b8

    .line 730
    :cond_61b
    :goto_61b
    if-eqz v85, :cond_620

    .line 732
    :try_start_61d
    invoke-virtual/range {v85 .. v85}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_620
    .catch Ljava/lang/Throwable; {:try_start_61d .. :try_end_620} :catch_9c4

    .line 739
    :cond_620
    :goto_620
    :try_start_620
    invoke-virtual/range {v119 .. v119}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_623
    .catch Ljava/lang/Throwable; {:try_start_620 .. :try_end_623} :catch_9d0

    .line 744
    :goto_623
    if-eqz v28, :cond_62c

    .line 745
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 751
    :cond_62c
    invoke-virtual/range {v119 .. v119}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v52

    .line 752
    .local v52, config:Landroid/content/res/Configuration;
    new-instance v78, Landroid/util/DisplayMetrics;

    invoke-direct/range {v78 .. v78}, Landroid/util/DisplayMetrics;-><init>()V

    .line 753
    .local v78, metrics:Landroid/util/DisplayMetrics;
    const-string v3, "window"

    invoke-virtual {v4, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v112

    check-cast v112, Landroid/view/WindowManager;

    .line 754
    .local v112, w:Landroid/view/WindowManager;
    invoke-interface/range {v112 .. v112}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    move-object/from16 v0, v78

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 755
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v0, v52

    move-object/from16 v1, v78

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 757
    invoke-virtual {v6}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 759
    :try_start_654
    invoke-interface/range {v88 .. v88}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_657
    .catch Ljava/lang/Throwable; {:try_start_654 .. :try_end_657} :catch_9dc

    .line 764
    :goto_657
    :try_start_657
    invoke-virtual/range {v76 .. v76}, Lcom/android/internal/widget/LockSettingsService;->systemReady()V
    :try_end_65a
    .catch Ljava/lang/Throwable; {:try_start_657 .. :try_end_65a} :catch_9e8

    .line 769
    :goto_65a
    new-instance v67, Landroid/content/IntentFilter;

    invoke-direct/range {v67 .. v67}, Landroid/content/IntentFilter;-><init>()V

    .line 770
    .local v67, filter:Landroid/content/IntentFilter;
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 771
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 772
    const-string v3, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 773
    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 774
    const-string v3, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 775
    const-string v3, "package"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 776
    new-instance v3, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v3}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v67

    invoke-virtual {v4, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 779
    move-object/from16 v17, v4

    .line 780
    .local v17, contextF:Landroid/content/Context;
    move-object/from16 v18, v5

    .line 781
    .local v18, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v19, v13

    .line 782
    .local v19, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v20, v12

    .line 783
    .local v20, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v21, v8

    .line 784
    .local v21, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v22, v53

    .line 785
    .local v22, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v23, v60

    .line 786
    .local v23, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v24, v108

    .line 787
    .local v24, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v34, v102

    .line 788
    .local v34, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v25, v106

    .line 789
    .local v25, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v27, v42

    .line 790
    .local v27, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v29, v113

    .line 791
    .local v29, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v30, v69

    .line 792
    .local v30, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v26, v94

    .line 793
    .local v26, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v32, v74

    .line 794
    .local v32, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v33, v55

    .line 795
    .local v33, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v35, v83

    .line 796
    .local v35, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v36, v50

    .line 797
    .local v36, commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v37, v104

    .line 798
    .local v37, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v31, v100

    .line 799
    .local v31, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v38, v62

    .line 800
    .local v38, dreamyF:Landroid/service/dreams/DreamManagerService;
    move-object/from16 v39, v71

    .line 801
    .local v39, inputManagerF:Lcom/android/server/input/InputManagerService;
    move-object/from16 v40, v45

    .line 808
    .local v40, bluetoothF:Landroid/server/BluetoothService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    new-instance v14, Lcom/android/server/ServerThread$1;

    move-object/from16 v15, p0

    invoke-direct/range {v14 .. v40}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Landroid/service/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Landroid/server/BluetoothService;)V

    invoke-virtual {v3, v14}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 922
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v3

    if-eqz v3, :cond_6dc

    .line 923
    const-string v3, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    :cond_6dc
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 927
    const-string v3, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    return-void

    .line 116
    .end local v4           #context:Landroid/content/Context;
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v6           #power:Lcom/android/server/PowerManagerService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .end local v13           #networkManagement:Lcom/android/server/NetworkManagementService;
    .end local v16           #headless:Z
    .end local v17           #contextF:Landroid/content/Context;
    .end local v18           #batteryF:Lcom/android/server/BatteryService;
    .end local v19           #networkManagementF:Lcom/android/server/NetworkManagementService;
    .end local v20           #networkStatsF:Lcom/android/server/net/NetworkStatsService;
    .end local v21           #networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v22           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v23           #dockF:Lcom/android/server/DockObserver;
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
    .end local v36           #commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    .end local v37           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    .end local v38           #dreamyF:Landroid/service/dreams/DreamManagerService;
    .end local v39           #inputManagerF:Lcom/android/server/input/InputManagerService;
    .end local v40           #bluetoothF:Landroid/server/BluetoothService;
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .end local v47           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v50           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .end local v52           #config:Landroid/content/res/Configuration;
    .end local v53           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v60           #dock:Lcom/android/server/DockObserver;
    .end local v62           #dreamy:Landroid/service/dreams/DreamManagerService;
    .end local v65           #factoryTest:I
    .end local v66           #factoryTestStr:Ljava/lang/String;
    .end local v67           #filter:Landroid/content/IntentFilter;
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v71           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v78           #metrics:Landroid/util/DisplayMetrics;
    .end local v83           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .end local v88           #pm:Landroid/content/pm/IPackageManager;
    .end local v90           #profile:Lcom/android/server/ProfileManagerService;
    .end local v94           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v96           #serial:Lcom/android/server/SerialService;
    .end local v98           #serviceDiscovery:Lcom/android/server/NsdService;
    .end local v100           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v102           #throttle:Lcom/android/server/ThrottleService;
    .end local v104           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v106           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v108           #usb:Lcom/android/server/usb/UsbService;
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .end local v112           #w:Landroid/view/WindowManager;
    .end local v113           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v115           #wifi:Lcom/android/server/WifiService;
    .end local v117           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v119           #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_6e7
    const/16 v93, 0x0

    goto/16 :goto_35

    .line 122
    .restart local v93       #reboot:Z
    :cond_6eb
    const/16 v92, 0x0

    .restart local v92       #reason:Ljava/lang/String;
    goto/16 :goto_47

    .line 130
    .end local v92           #reason:Ljava/lang/String;
    .end local v93           #reboot:Z
    .restart local v66       #factoryTestStr:Ljava/lang/String;
    :cond_6ef
    invoke-static/range {v66 .. v66}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v65

    goto/16 :goto_60

    .line 189
    .restart local v4       #context:Landroid/content/Context;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v13       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v16       #headless:Z
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    .restart local v47       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v50       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v53       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v57       #cryptState:Ljava/lang/String;
    .restart local v60       #dock:Lcom/android/server/DockObserver;
    .restart local v65       #factoryTest:I
    .restart local v71       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    .restart local v81       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v83       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v87       #onlyCore:Z
    .restart local v88       #pm:Landroid/content/pm/IPackageManager;
    .restart local v94       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v96       #serial:Lcom/android/server/SerialService;
    .restart local v98       #serviceDiscovery:Lcom/android/server/NsdService;
    .restart local v102       #throttle:Lcom/android/server/ThrottleService;
    .restart local v106       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v108       #usb:Lcom/android/server/usb/UsbService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    .restart local v115       #wifi:Lcom/android/server/WifiService;
    .restart local v117       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v119       #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_6f5
    :try_start_6f5
    const-string v3, "1"

    move-object/from16 v0, v57

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_113

    .line 190
    const-string v3, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    const/16 v87, 0x1

    goto/16 :goto_113

    .line 194
    :cond_70a
    const/4 v3, 0x0

    goto/16 :goto_116

    .line 212
    .restart local v68       #firstBoot:Z
    :catch_70d
    move-exception v64

    .line 213
    .local v64, e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_717
    .catch Ljava/lang/RuntimeException; {:try_start_6f5 .. :try_end_717} :catch_719

    goto/16 :goto_13e

    .line 283
    .end local v57           #cryptState:Ljava/lang/String;
    .end local v64           #e:Ljava/lang/Throwable;
    .end local v68           #firstBoot:Z
    .end local v87           #onlyCore:Z
    :catch_719
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v44

    .line 284
    .end local v44           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .local v64, e:Ljava/lang/RuntimeException;
    :goto_71e
    const-string v3, "System"

    const-string v9, "******************************************"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    const-string v3, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_205

    .line 217
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v64           #e:Ljava/lang/RuntimeException;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v57       #cryptState:Ljava/lang/String;
    .restart local v68       #firstBoot:Z
    .restart local v87       #onlyCore:Z
    :cond_730
    const/4 v3, 0x0

    goto/16 :goto_14b

    .line 247
    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v44           #battery:Lcom/android/server/BatteryService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v111       #vibrator:Lcom/android/server/VibratorService;
    :cond_733
    const/4 v3, 0x0

    move v9, v3

    goto/16 :goto_1c8

    :cond_737
    const/4 v3, 0x0

    goto/16 :goto_1cb

    .line 261
    :cond_73a
    const/4 v3, 0x1

    move/from16 v0, v65

    if-ne v0, v3, :cond_74e

    .line 262
    :try_start_73f
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_201

    .line 283
    :catch_748
    move-exception v64

    move-object/from16 v110, v111

    .end local v111           #vibrator:Lcom/android/server/VibratorService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto :goto_71e

    .line 264
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v111       #vibrator:Lcom/android/server/VibratorService;
    :cond_74e
    const-string v3, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    new-instance v46, Landroid/server/BluetoothService;

    move-object/from16 v0, v46

    invoke-direct {v0, v4}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_75c
    .catch Ljava/lang/RuntimeException; {:try_start_73f .. :try_end_75c} :catch_748

    .line 266
    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .local v46, bluetooth:Landroid/server/BluetoothService;
    :try_start_75c
    const-string v3, "bluetooth"

    move-object/from16 v0, v46

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 267
    invoke-virtual/range {v46 .. v46}, Landroid/server/BluetoothService;->initAfterRegistration()V

    .line 269
    const-string v3, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_789

    .line 270
    new-instance v48, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v48

    move-object/from16 v1, v46

    invoke-direct {v0, v4, v1}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_77d
    .catch Ljava/lang/RuntimeException; {:try_start_75c .. :try_end_77d} :catch_a87

    .line 271
    .end local v47           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v48, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_77d
    const-string v3, "bluetooth_a2dp"

    move-object/from16 v0, v48

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 273
    invoke-virtual/range {v46 .. v46}, Landroid/server/BluetoothService;->initAfterA2dpRegistration()V
    :try_end_787
    .catch Ljava/lang/RuntimeException; {:try_start_77d .. :try_end_787} :catch_a90

    move-object/from16 v47, v48

    .line 276
    .end local v48           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v47       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :cond_789
    :try_start_789
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "bluetooth_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v49

    .line 278
    .local v49, bluetoothOn:I
    if-eqz v49, :cond_799

    .line 279
    invoke-virtual/range {v46 .. v46}, Landroid/server/BluetoothService;->enable()Z
    :try_end_799
    .catch Ljava/lang/RuntimeException; {:try_start_789 .. :try_end_799} :catch_a87

    :cond_799
    move-object/from16 v45, v46

    .end local v46           #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_201

    .line 307
    .end local v49           #bluetoothOn:I
    .end local v57           #cryptState:Ljava/lang/String;
    .end local v68           #firstBoot:Z
    .end local v73           #lights:Lcom/android/server/LightsService;
    .end local v87           #onlyCore:Z
    .end local v111           #vibrator:Lcom/android/server/VibratorService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v90       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v100       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v104       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    .restart local v113       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_79d
    move-exception v64

    .line 308
    .local v64, e:Ljava/lang/Throwable;
    :goto_79e
    const-string v3, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23b

    .line 315
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7a9
    move-exception v64

    .line 316
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24c

    .line 322
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7b5
    move-exception v64

    .line 323
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24f

    .line 328
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7c1
    move-exception v64

    .line 329
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_252

    .line 351
    .end local v64           #e:Ljava/lang/Throwable;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    :catch_7cd
    move-exception v64

    .line 352
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7ce
    const-string v3, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_291

    .line 360
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7d9
    move-exception v64

    .line 361
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7da
    const-string v3, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a8

    .line 368
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7e5
    move-exception v64

    .line 369
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7e6
    const-string v3, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2bf

    .line 376
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7f1
    move-exception v64

    .line 377
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7f2
    const-string v3, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d8

    .line 384
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7fd
    move-exception v64

    .line 385
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e9

    .line 392
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_809
    move-exception v64

    .line 393
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f9

    .line 400
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_815
    move-exception v64

    .line 401
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_816
    const-string v3, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_310

    .line 408
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_821
    move-exception v64

    .line 409
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_822
    const-string v3, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_327

    .line 418
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_82d
    move-exception v64

    move-object/from16 v8, v81

    .line 419
    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_830
    const-string v3, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33e

    .line 426
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_83b
    move-exception v64

    .line 427
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_83c
    const-string v3, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_355

    .line 434
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_847
    move-exception v64

    .line 435
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_848
    const-string v3, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36c

    .line 447
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_853
    move-exception v64

    .line 448
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_854
    const-string v3, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_393

    .line 456
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_85f
    move-exception v64

    .line 457
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a5

    .line 465
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_86b
    move-exception v64

    .line 466
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_86c
    const-string v3, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3bc

    .line 473
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_877
    move-exception v64

    .line 474
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3cd

    .line 490
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_883
    move-exception v64

    .line 491
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_884
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Profile Manager"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3e9

    .line 499
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_88f
    move-exception v64

    .line 500
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_890
    const-string v3, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_409

    .line 507
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_89b
    move-exception v64

    .line 508
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_41a

    .line 515
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8a7
    move-exception v64

    .line 516
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_8a8
    const-string v3, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_431

    .line 523
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8b3
    move-exception v64

    .line 524
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_8b4
    const-string v3, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_448

    .line 531
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8bf
    move-exception v64

    .line 532
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_459

    .line 539
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8cb
    move-exception v64

    .line 540
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_471

    .line 551
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8d7
    move-exception v64

    .line 552
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_8d8
    const-string v3, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_497

    .line 560
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8e3
    move-exception v64

    .line 561
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4b6

    .line 569
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8ef
    move-exception v64

    .line 570
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4c6

    .line 577
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8fb
    move-exception v64

    .line 578
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4d2

    .line 586
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_907
    move-exception v64

    .line 587
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_908
    const-string v3, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4e9

    .line 595
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_913
    move-exception v64

    .line 596
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_914
    const-string v3, "SystemServer"

    const-string v9, "Failure starting SerialService"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_500

    .line 603
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_91f
    move-exception v64

    .line 604
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_510

    .line 611
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_92b
    move-exception v64

    .line 612
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_521

    .line 619
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_937
    move-exception v64

    .line 620
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_938
    const-string v3, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_538

    .line 626
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_943
    move-exception v64

    .line 627
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_548

    .line 633
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_94f
    move-exception v64

    .line 634
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_559

    .line 645
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_95b
    move-exception v64

    .line 646
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_56a

    .line 652
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_967
    move-exception v64

    .line 653
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_57a

    .line 660
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_973
    move-exception v64

    .line 661
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_974
    const-string v3, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_591

    .line 667
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_97f
    move-exception v64

    .line 668
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_59d

    .line 678
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_98b
    move-exception v64

    .line 679
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_98c
    const-string v3, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5c1

    .line 686
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_997
    move-exception v64

    .line 687
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5d2

    .line 711
    .end local v64           #e:Ljava/lang/Throwable;
    .end local v79           #mountService:Lcom/android/server/MountService;
    .restart local v28       #safeMode:Z
    :cond_9a3
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_613

    .line 718
    :catch_9ac
    move-exception v64

    .line 719
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_616

    .line 725
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_9b8
    move-exception v64

    .line 726
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_61b

    .line 733
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_9c4
    move-exception v64

    .line 734
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_620

    .line 740
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_9d0
    move-exception v64

    .line 741
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_623

    .line 760
    .end local v64           #e:Ljava/lang/Throwable;
    .restart local v52       #config:Landroid/content/res/Configuration;
    .restart local v78       #metrics:Landroid/util/DisplayMetrics;
    .restart local v112       #w:Landroid/view/WindowManager;
    :catch_9dc
    move-exception v64

    .line 761
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_657

    .line 765
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_9e8
    move-exception v64

    .line 766
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_65a

    .line 200
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v28           #safeMode:Z
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v52           #config:Landroid/content/res/Configuration;
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v62           #dreamy:Landroid/service/dreams/DreamManagerService;
    .end local v64           #e:Ljava/lang/Throwable;
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v78           #metrics:Landroid/util/DisplayMetrics;
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .end local v90           #profile:Lcom/android/server/ProfileManagerService;
    .end local v100           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v104           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v112           #w:Landroid/view/WindowManager;
    .end local v113           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v57       #cryptState:Ljava/lang/String;
    .restart local v68       #firstBoot:Z
    .restart local v81       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v87       #onlyCore:Z
    :catch_9f4
    move-exception v3

    goto/16 :goto_122

    .line 678
    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v44           #battery:Lcom/android/server/BatteryService;
    .end local v57           #cryptState:Ljava/lang/String;
    .end local v68           #firstBoot:Z
    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v87           #onlyCore:Z
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v63       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v90       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v100       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v104       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v113       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_9f7
    move-exception v64

    move-object/from16 v62, v63

    .end local v63           #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    goto :goto_98c

    .line 660
    .end local v50           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v51       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :catch_9fb
    move-exception v64

    move-object/from16 v50, v51

    .end local v51           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v50       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_974

    .line 619
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v43       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_a00
    move-exception v64

    move-object/from16 v42, v43

    .end local v43           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_938

    .line 595
    .end local v96           #serial:Lcom/android/server/SerialService;
    .restart local v97       #serial:Lcom/android/server/SerialService;
    :catch_a05
    move-exception v64

    move-object/from16 v96, v97

    .end local v97           #serial:Lcom/android/server/SerialService;
    .restart local v96       #serial:Lcom/android/server/SerialService;
    goto/16 :goto_914

    .line 586
    .end local v108           #usb:Lcom/android/server/usb/UsbService;
    .restart local v109       #usb:Lcom/android/server/usb/UsbService;
    :catch_a0a
    move-exception v64

    move-object/from16 v108, v109

    .end local v109           #usb:Lcom/android/server/usb/UsbService;
    .restart local v108       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_908

    .line 551
    .end local v113           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v114       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_a0f
    move-exception v64

    move-object/from16 v113, v114

    .end local v114           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v113       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_8d8

    .line 523
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v56       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_a14
    move-exception v64

    move-object/from16 v55, v56

    .end local v56           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_8b4

    .line 515
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .restart local v75       #location:Lcom/android/server/LocationManagerService;
    :catch_a19
    move-exception v64

    move-object/from16 v74, v75

    .end local v75           #location:Lcom/android/server/LocationManagerService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_8a8

    .line 499
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v86       #notification:Lcom/android/server/NotificationManagerService;
    :catch_a1e
    move-exception v64

    move-object/from16 v85, v86

    .end local v86           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_890

    .line 490
    .end local v90           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v91       #profile:Lcom/android/server/ProfileManagerService;
    :catch_a23
    move-exception v64

    move-object/from16 v90, v91

    .end local v91           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v90       #profile:Lcom/android/server/ProfileManagerService;
    goto/16 :goto_884

    .line 465
    .end local v102           #throttle:Lcom/android/server/ThrottleService;
    .restart local v103       #throttle:Lcom/android/server/ThrottleService;
    :catch_a28
    move-exception v64

    move-object/from16 v102, v103

    .end local v103           #throttle:Lcom/android/server/ThrottleService;
    .restart local v102       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_86c

    .line 447
    .end local v53           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v54       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_a2d
    move-exception v64

    move-object/from16 v53, v54

    .end local v54           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v53       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_854

    .line 434
    .end local v115           #wifi:Lcom/android/server/WifiService;
    .restart local v116       #wifi:Lcom/android/server/WifiService;
    :catch_a32
    move-exception v64

    move-object/from16 v115, v116

    .end local v116           #wifi:Lcom/android/server/WifiService;
    .restart local v115       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_848

    .line 426
    .end local v117           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v118       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_a37
    move-exception v64

    move-object/from16 v117, v118

    .end local v118           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v117       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_83c

    .line 418
    :catch_a3c
    move-exception v64

    goto/16 :goto_830

    .line 408
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v81       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v82       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_a3f
    move-exception v64

    move-object/from16 v12, v82

    .end local v82           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_822

    .line 400
    .end local v104           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v105       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_a44
    move-exception v64

    move-object/from16 v104, v105

    .end local v105           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v104       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_816

    .line 376
    .end local v100           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v101       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_a49
    move-exception v64

    move-object/from16 v100, v101

    .end local v101           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v100       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_7f2

    .line 368
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v59       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_a4e
    move-exception v64

    move-object/from16 v58, v59

    .end local v59           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_7e6

    .line 360
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v77       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :catch_a53
    move-exception v64

    move-object/from16 v76, v77

    .end local v77           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    goto/16 :goto_7da

    .line 351
    .end local v79           #mountService:Lcom/android/server/MountService;
    .restart local v80       #mountService:Lcom/android/server/MountService;
    :catch_a58
    move-exception v64

    move-object/from16 v79, v80

    .end local v80           #mountService:Lcom/android/server/MountService;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    goto/16 :goto_7ce

    .line 337
    .end local v79           #mountService:Lcom/android/server/MountService;
    :catch_a5d
    move-exception v3

    goto/16 :goto_265

    .line 307
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v70       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_a60
    move-exception v64

    move-object/from16 v69, v70

    .end local v70           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_79e

    .line 283
    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v6           #power:Lcom/android/server/PowerManagerService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v62           #dreamy:Landroid/service/dreams/DreamManagerService;
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .end local v90           #profile:Lcom/android/server/ProfileManagerService;
    .end local v100           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v104           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v113           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v89       #power:Lcom/android/server/PowerManagerService;
    :catch_a65
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v44

    .end local v44           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v89

    .end local v89           #power:Lcom/android/server/PowerManagerService;
    .restart local v6       #power:Lcom/android/server/PowerManagerService;
    goto/16 :goto_71e

    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v57       #cryptState:Ljava/lang/String;
    .restart local v68       #firstBoot:Z
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v87       #onlyCore:Z
    :catch_a6e
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v44

    .end local v44           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_71e

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    :catch_a77
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_71e

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v111       #vibrator:Lcom/android/server/VibratorService;
    :catch_a7e
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v110, v111

    .end local v111           #vibrator:Lcom/android/server/VibratorService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_71e

    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .restart local v46       #bluetooth:Landroid/server/BluetoothService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v111       #vibrator:Lcom/android/server/VibratorService;
    :catch_a87
    move-exception v64

    move-object/from16 v45, v46

    .end local v46           #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v110, v111

    .end local v111           #vibrator:Lcom/android/server/VibratorService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_71e

    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .end local v47           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v110           #vibrator:Lcom/android/server/VibratorService;
    .restart local v46       #bluetooth:Landroid/server/BluetoothService;
    .restart local v48       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v111       #vibrator:Lcom/android/server/VibratorService;
    :catch_a90
    move-exception v64

    move-object/from16 v47, v48

    .end local v48           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v47       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v45, v46

    .end local v46           #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v110, v111

    .end local v111           #vibrator:Lcom/android/server/VibratorService;
    .restart local v110       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_71e

    .end local v57           #cryptState:Ljava/lang/String;
    .end local v68           #firstBoot:Z
    .end local v87           #onlyCore:Z
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v90       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v100       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v104       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v113       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_a9b
    move-object/from16 v8, v81

    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_5d2
.end method
