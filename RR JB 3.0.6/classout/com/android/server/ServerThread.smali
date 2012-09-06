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
    .line 922
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 923
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 925
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

    .line 926
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 927
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
    .registers 119

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

    move-result-object v97

    .line 115
    .local v97, shutdownAction:Ljava/lang/String;
    if-eqz v97, :cond_4e

    invoke-virtual/range {v97 .. v97}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4e

    .line 116
    const/4 v3, 0x0

    move-object/from16 v0, v97

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v9, 0x31

    if-ne v3, v9, :cond_6ce

    const/16 v91, 0x1

    .line 119
    .local v91, reboot:Z
    :goto_35
    invoke-virtual/range {v97 .. v97}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v9, 0x1

    if-le v3, v9, :cond_6d2

    .line 120
    const/4 v3, 0x1

    invoke-virtual/range {v97 .. v97}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v97

    invoke-virtual {v0, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v90

    .line 125
    .local v90, reason:Ljava/lang/String;
    :goto_47
    move/from16 v0, v91

    move-object/from16 v1, v90

    invoke-static {v0, v1}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 129
    .end local v90           #reason:Ljava/lang/String;
    .end local v91           #reboot:Z
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

    if-eqz v3, :cond_6d6

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
    const/16 v108, 0x0

    .line 138
    .local v108, vibrator:Lcom/android/server/VibratorService;
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
    const/16 v115, 0x0

    .line 144
    .local v115, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v113, 0x0

    .line 145
    .local v113, wifi:Lcom/android/server/WifiService;
    const/16 v96, 0x0

    .line 146
    .local v96, serviceDiscovery:Lcom/android/server/NsdService;
    const/16 v88, 0x0

    .line 147
    .local v88, pm:Landroid/content/pm/IPackageManager;
    const/4 v4, 0x0

    .line 148
    .local v4, context:Landroid/content/Context;
    const/16 v117, 0x0

    .line 149
    .local v117, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v45, 0x0

    .line 150
    .local v45, bluetooth:Landroid/server/BluetoothService;
    const/16 v47, 0x0

    .line 151
    .local v47, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v60, 0x0

    .line 152
    .local v60, dock:Lcom/android/server/DockObserver;
    const/16 v106, 0x0

    .line 153
    .local v106, usb:Lcom/android/server/usb/UsbService;
    const/16 v94, 0x0

    .line 154
    .local v94, serial:Lcom/android/server/SerialService;
    const/16 v104, 0x0

    .line 155
    .local v104, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v92, 0x0

    .line 156
    .local v92, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v100, 0x0

    .line 157
    .local v100, throttle:Lcom/android/server/ThrottleService;
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
    .catch Ljava/lang/RuntimeException; {:try_start_9f .. :try_end_bc} :catch_a3b

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

    if-eqz v3, :cond_6dc

    .line 187
    const-string v3, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const/16 v87, 0x1

    .line 194
    :cond_113
    :goto_113
    if-eqz v65, :cond_6f1

    const/4 v3, 0x1

    :goto_116
    move/from16 v0, v87

    invoke-static {v4, v3, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_11b
    .catch Ljava/lang/RuntimeException; {:try_start_bc .. :try_end_11b} :catch_700

    move-result-object v88

    .line 197
    const/16 v68, 0x0

    .line 199
    .local v68, firstBoot:Z
    :try_start_11e
    invoke-interface/range {v88 .. v88}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_121
    .catch Landroid/os/RemoteException; {:try_start_11e .. :try_end_121} :catch_9cf
    .catch Ljava/lang/RuntimeException; {:try_start_11e .. :try_end_121} :catch_700

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
    .catch Ljava/lang/RuntimeException; {:try_start_122 .. :try_end_12d} :catch_700

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
    .catch Ljava/lang/Throwable; {:try_start_12d .. :try_end_13e} :catch_6f4
    .catch Ljava/lang/RuntimeException; {:try_start_12d .. :try_end_13e} :catch_700

    .line 216
    :goto_13e
    :try_start_13e
    const-string v3, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    const/4 v3, 0x1

    move/from16 v0, v65

    if-ne v0, v3, :cond_717

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
    .catch Ljava/lang/RuntimeException; {:try_start_13e .. :try_end_166} :catch_700

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
    .catch Ljava/lang/RuntimeException; {:try_start_166 .. :try_end_174} :catch_a44

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
    new-instance v109, Lcom/android/server/VibratorService;

    move-object/from16 v0, v109

    invoke-direct {v0, v4}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_187
    .catch Ljava/lang/RuntimeException; {:try_start_174 .. :try_end_187} :catch_a4d

    .line 232
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .local v109, vibrator:Lcom/android/server/VibratorService;
    :try_start_187
    const-string v3, "vibrator"

    move-object/from16 v0, v109

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
    .catch Ljava/lang/RuntimeException; {:try_start_187 .. :try_end_1a3} :catch_a54

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

    if-eq v0, v3, :cond_71a

    const/4 v3, 0x1

    move v9, v3

    :goto_1c8
    if-nez v68, :cond_71e

    const/4 v3, 0x1

    :goto_1cb
    move/from16 v0, v87

    invoke-static {v4, v6, v9, v3, v0}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v117

    .line 250
    const-string v3, "window"

    move-object/from16 v0, v117

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 251
    invoke-virtual/range {v117 .. v117}, Lcom/android/server/wm/WindowManagerService;->getInputManagerService()Lcom/android/server/input/InputManagerService;

    move-result-object v71

    .line 252
    const-string v3, "input"

    move-object/from16 v0, v71

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 254
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v117

    invoke-virtual {v3, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 259
    const-string v3, "ro.kernel.qemu"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "1"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_721

    .line 260
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_201
    .catch Ljava/lang/RuntimeException; {:try_start_1a3 .. :try_end_201} :catch_72f

    :goto_201
    move-object/from16 v108, v109

    .end local v109           #vibrator:Lcom/android/server/VibratorService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
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
    const/16 v98, 0x0

    .line 290
    .local v98, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v69, 0x0

    .line 291
    .local v69, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v42, 0x0

    .line 292
    .local v42, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v85, 0x0

    .line 293
    .local v85, notification:Lcom/android/server/NotificationManagerService;
    const/16 v111, 0x0

    .line 294
    .local v111, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v74, 0x0

    .line 295
    .local v74, location:Lcom/android/server/LocationManagerService;
    const/16 v55, 0x0

    .line 296
    .local v55, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v102, 0x0

    .line 297
    .local v102, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v76, 0x0

    .line 298
    .local v76, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    const/16 v62, 0x0

    .line 301
    .local v62, dreamy:Landroid/service/dreams/DreamManagerService;
    const/4 v3, 0x1

    move/from16 v0, v65

    if-eq v0, v3, :cond_24a

    .line 303
    :try_start_220
    const-string v3, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    new-instance v70, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v70

    move-object/from16 v1, v117

    invoke-direct {v0, v4, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_230
    .catch Ljava/lang/Throwable; {:try_start_220 .. :try_end_230} :catch_784

    .line 305
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .local v70, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_230
    const-string v3, "input_method"

    move-object/from16 v0, v70

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_237
    .catch Ljava/lang/Throwable; {:try_start_230 .. :try_end_237} :catch_a36

    move-object/from16 v69, v70

    .line 311
    .end local v70           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_239
    :try_start_239
    const-string v3, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    const-string v3, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24a
    .catch Ljava/lang/Throwable; {:try_start_239 .. :try_end_24a} :catch_790

    .line 320
    :cond_24a
    :goto_24a
    :try_start_24a
    invoke-virtual/range {v117 .. v117}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_24d
    .catch Ljava/lang/Throwable; {:try_start_24a .. :try_end_24d} :catch_79c

    .line 326
    :goto_24d
    :try_start_24d
    invoke-interface/range {v88 .. v88}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_250
    .catch Ljava/lang/Throwable; {:try_start_24d .. :try_end_250} :catch_7a8

    .line 332
    :goto_250
    :try_start_250
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x10403f5

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_263
    .catch Landroid/os/RemoteException; {:try_start_250 .. :try_end_263} :catch_a33

    .line 339
    :goto_263
    const/4 v3, 0x1

    move/from16 v0, v65

    if-eq v0, v3, :cond_a71

    .line 340
    const/16 v79, 0x0

    .line 341
    .local v79, mountService:Lcom/android/server/MountService;
    const-string v3, "0"

    const-string v9, "system_init.startmountservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28f

    .line 347
    :try_start_278
    const-string v3, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    new-instance v80, Lcom/android/server/MountService;

    move-object/from16 v0, v80

    invoke-direct {v0, v4}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_286
    .catch Ljava/lang/Throwable; {:try_start_278 .. :try_end_286} :catch_7b4

    .line 349
    .end local v79           #mountService:Lcom/android/server/MountService;
    .local v80, mountService:Lcom/android/server/MountService;
    :try_start_286
    const-string v3, "mount"

    move-object/from16 v0, v80

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28d
    .catch Ljava/lang/Throwable; {:try_start_286 .. :try_end_28d} :catch_a2e

    move-object/from16 v79, v80

    .line 356
    .end local v80           #mountService:Lcom/android/server/MountService;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    :cond_28f
    :goto_28f
    :try_start_28f
    const-string v3, "SystemServer"

    const-string v9, "LockSettingsService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    new-instance v77, Lcom/android/internal/widget/LockSettingsService;

    move-object/from16 v0, v77

    invoke-direct {v0, v4}, Lcom/android/internal/widget/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_29d
    .catch Ljava/lang/Throwable; {:try_start_28f .. :try_end_29d} :catch_7c0

    .line 358
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .local v77, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :try_start_29d
    const-string v3, "lock_settings"

    move-object/from16 v0, v77

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a4
    .catch Ljava/lang/Throwable; {:try_start_29d .. :try_end_2a4} :catch_a29

    move-object/from16 v76, v77

    .line 364
    .end local v77           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :goto_2a6
    :try_start_2a6
    const-string v3, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    new-instance v59, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v59

    invoke-direct {v0, v4}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2b4
    .catch Ljava/lang/Throwable; {:try_start_2a6 .. :try_end_2b4} :catch_7cc

    .line 366
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v59, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_2b4
    const-string v3, "device_policy"

    move-object/from16 v0, v59

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2bb
    .catch Ljava/lang/Throwable; {:try_start_2b4 .. :try_end_2bb} :catch_a24

    move-object/from16 v58, v59

    .line 372
    .end local v59           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_2bd
    :try_start_2bd
    const-string v3, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    new-instance v99, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v99

    move-object/from16 v1, v117

    invoke-direct {v0, v4, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_2cd
    .catch Ljava/lang/Throwable; {:try_start_2bd .. :try_end_2cd} :catch_7d8

    .line 374
    .end local v98           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v99, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_2cd
    const-string v3, "statusbar"

    move-object/from16 v0, v99

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d4
    .catch Ljava/lang/Throwable; {:try_start_2cd .. :try_end_2d4} :catch_a1f

    move-object/from16 v98, v99

    .line 380
    .end local v99           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v98       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_2d6
    :try_start_2d6
    const-string v3, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    const-string v3, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v4}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2e7
    .catch Ljava/lang/Throwable; {:try_start_2d6 .. :try_end_2e7} :catch_7e4

    .line 388
    :goto_2e7
    :try_start_2e7
    const-string v3, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    invoke-static {v4}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v13

    .line 390
    const-string v3, "network_management"

    invoke-static {v3, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2f7
    .catch Ljava/lang/Throwable; {:try_start_2e7 .. :try_end_2f7} :catch_7f0

    .line 396
    :goto_2f7
    :try_start_2f7
    const-string v3, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    new-instance v103, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v103

    invoke-direct {v0, v4}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_305
    .catch Ljava/lang/Throwable; {:try_start_2f7 .. :try_end_305} :catch_7fc

    .line 398
    .end local v102           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v103, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_305
    const-string v3, "textservices"

    move-object/from16 v0, v103

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_30c
    .catch Ljava/lang/Throwable; {:try_start_305 .. :try_end_30c} :catch_a1a

    move-object/from16 v102, v103

    .line 404
    .end local v103           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v102       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_30e
    :try_start_30e
    const-string v3, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    new-instance v82, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v82

    invoke-direct {v0, v4, v13, v7}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_31c
    .catch Ljava/lang/Throwable; {:try_start_30e .. :try_end_31c} :catch_808

    .line 406
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v82, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_31c
    const-string v3, "netstats"

    move-object/from16 v0, v82

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_323
    .catch Ljava/lang/Throwable; {:try_start_31c .. :try_end_323} :catch_a15

    move-object/from16 v12, v82

    .line 412
    .end local v82           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_325
    :try_start_325
    const-string v3, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    new-instance v8, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    move-object v9, v4

    move-object v11, v6

    invoke-direct/range {v8 .. v13}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_337
    .catch Ljava/lang/Throwable; {:try_start_325 .. :try_end_337} :catch_814

    .line 416
    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v8, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_337
    const-string v3, "netpolicy"

    invoke-static {v3, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33c
    .catch Ljava/lang/Throwable; {:try_start_337 .. :try_end_33c} :catch_a12

    .line 422
    :goto_33c
    :try_start_33c
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    new-instance v116, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v116

    invoke-direct {v0, v4}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_34a
    .catch Ljava/lang/Throwable; {:try_start_33c .. :try_end_34a} :catch_822

    .line 424
    .end local v115           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v116, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_34a
    const-string v3, "wifip2p"

    move-object/from16 v0, v116

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_351
    .catch Ljava/lang/Throwable; {:try_start_34a .. :try_end_351} :catch_a0d

    move-object/from16 v115, v116

    .line 430
    .end local v116           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v115       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_353
    :try_start_353
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    new-instance v114, Lcom/android/server/WifiService;

    move-object/from16 v0, v114

    invoke-direct {v0, v4}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_361
    .catch Ljava/lang/Throwable; {:try_start_353 .. :try_end_361} :catch_82e

    .line 432
    .end local v113           #wifi:Lcom/android/server/WifiService;
    .local v114, wifi:Lcom/android/server/WifiService;
    :try_start_361
    const-string v3, "wifi"

    move-object/from16 v0, v114

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_368
    .catch Ljava/lang/Throwable; {:try_start_361 .. :try_end_368} :catch_a08

    move-object/from16 v113, v114

    .line 438
    .end local v114           #wifi:Lcom/android/server/WifiService;
    .restart local v113       #wifi:Lcom/android/server/WifiService;
    :goto_36a
    :try_start_36a
    const-string v3, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    new-instance v54, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v54

    invoke-direct {v0, v4, v13, v12, v8}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_378
    .catch Ljava/lang/Throwable; {:try_start_36a .. :try_end_378} :catch_83a

    .line 441
    .end local v53           #connectivity:Lcom/android/server/ConnectivityService;
    .local v54, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_378
    const-string v3, "connectivity"

    move-object/from16 v0, v54

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 442
    move-object/from16 v0, v54

    invoke-virtual {v12, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 443
    move-object/from16 v0, v54

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 444
    invoke-virtual/range {v113 .. v113}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 445
    invoke-virtual/range {v115 .. v115}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_38f
    .catch Ljava/lang/Throwable; {:try_start_378 .. :try_end_38f} :catch_a03

    move-object/from16 v53, v54

    .line 451
    .end local v54           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v53       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_391
    :try_start_391
    const-string v3, "SystemServer"

    const-string v9, "Network Service Discovery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    invoke-static {v4}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v96

    .line 453
    const-string v3, "servicediscovery"

    move-object/from16 v0, v96

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3a3
    .catch Ljava/lang/Throwable; {:try_start_391 .. :try_end_3a3} :catch_846

    .line 460
    :goto_3a3
    :try_start_3a3
    const-string v3, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    new-instance v101, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v101

    invoke-direct {v0, v4}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_3b1
    .catch Ljava/lang/Throwable; {:try_start_3a3 .. :try_end_3b1} :catch_852

    .line 462
    .end local v100           #throttle:Lcom/android/server/ThrottleService;
    .local v101, throttle:Lcom/android/server/ThrottleService;
    :try_start_3b1
    const-string v3, "throttle"

    move-object/from16 v0, v101

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3b8
    .catch Ljava/lang/Throwable; {:try_start_3b1 .. :try_end_3b8} :catch_9fe

    move-object/from16 v100, v101

    .line 469
    .end local v101           #throttle:Lcom/android/server/ThrottleService;
    .restart local v100       #throttle:Lcom/android/server/ThrottleService;
    :goto_3ba
    :try_start_3ba
    const-string v3, "SystemServer"

    const-string v9, "UpdateLock Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    const-string v3, "updatelock"

    new-instance v9, Lcom/android/server/UpdateLockService;

    invoke-direct {v9, v4}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3cb
    .catch Ljava/lang/Throwable; {:try_start_3ba .. :try_end_3cb} :catch_85e

    .line 481
    :goto_3cb
    if-eqz v79, :cond_3d0

    .line 482
    invoke-virtual/range {v79 .. v79}, Lcom/android/server/MountService;->waitForAsecScan()V

    .line 486
    :cond_3d0
    :try_start_3d0
    const-string v3, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    new-instance v86, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v86

    move-object/from16 v1, v98

    move-object/from16 v2, v72

    invoke-direct {v0, v4, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_3e2
    .catch Ljava/lang/Throwable; {:try_start_3d0 .. :try_end_3e2} :catch_86a

    .line 488
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .local v86, notification:Lcom/android/server/NotificationManagerService;
    :try_start_3e2
    const-string v3, "notification"

    move-object/from16 v0, v86

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 489
    move-object/from16 v0, v86

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_3ee
    .catch Ljava/lang/Throwable; {:try_start_3e2 .. :try_end_3ee} :catch_9f9

    move-object/from16 v85, v86

    .line 495
    .end local v86           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    :goto_3f0
    :try_start_3f0
    const-string v3, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    const-string v3, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v4}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_401
    .catch Ljava/lang/Throwable; {:try_start_3f0 .. :try_end_401} :catch_876

    .line 503
    :goto_401
    :try_start_401
    const-string v3, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    new-instance v75, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v75

    invoke-direct {v0, v4}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_40f
    .catch Ljava/lang/Throwable; {:try_start_401 .. :try_end_40f} :catch_882

    .line 505
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .local v75, location:Lcom/android/server/LocationManagerService;
    :try_start_40f
    const-string v3, "location"

    move-object/from16 v0, v75

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_416
    .catch Ljava/lang/Throwable; {:try_start_40f .. :try_end_416} :catch_9f4

    move-object/from16 v74, v75

    .line 511
    .end local v75           #location:Lcom/android/server/LocationManagerService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    :goto_418
    :try_start_418
    const-string v3, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    new-instance v56, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v56

    invoke-direct {v0, v4}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_426
    .catch Ljava/lang/Throwable; {:try_start_418 .. :try_end_426} :catch_88e

    .line 513
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v56, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_426
    const-string v3, "country_detector"

    move-object/from16 v0, v56

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42d
    .catch Ljava/lang/Throwable; {:try_start_426 .. :try_end_42d} :catch_9ef

    move-object/from16 v55, v56

    .line 519
    .end local v56           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_42f
    :try_start_42f
    const-string v3, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    const-string v3, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v4}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_440
    .catch Ljava/lang/Throwable; {:try_start_42f .. :try_end_440} :catch_89a

    .line 527
    :goto_440
    :try_start_440
    const-string v3, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    const-string v3, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v4, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_458
    .catch Ljava/lang/Throwable; {:try_start_440 .. :try_end_458} :catch_8a6

    .line 534
    :goto_458
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x1110025

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_47e

    .line 537
    :try_start_465
    const-string v3, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    if-nez v16, :cond_47e

    .line 539
    new-instance v112, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v112

    invoke-direct {v0, v4}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_475
    .catch Ljava/lang/Throwable; {:try_start_465 .. :try_end_475} :catch_8b2

    .line 540
    .end local v111           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v112, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_475
    const-string v3, "wallpaper"

    move-object/from16 v0, v112

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_47c
    .catch Ljava/lang/Throwable; {:try_start_475 .. :try_end_47c} :catch_9ea

    move-object/from16 v111, v112

    .line 547
    .end local v112           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v111       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_47e
    :goto_47e
    const-string v3, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_49d

    .line 549
    :try_start_48c
    const-string v3, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    const-string v3, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v4}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_49d
    .catch Ljava/lang/Throwable; {:try_start_48c .. :try_end_49d} :catch_8be

    .line 557
    :cond_49d
    :goto_49d
    :try_start_49d
    const-string v3, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 559
    new-instance v61, Lcom/android/server/DockObserver;

    move-object/from16 v0, v61

    invoke-direct {v0, v4, v6}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_4ab
    .catch Ljava/lang/Throwable; {:try_start_49d .. :try_end_4ab} :catch_8ca

    .end local v60           #dock:Lcom/android/server/DockObserver;
    .local v61, dock:Lcom/android/server/DockObserver;
    move-object/from16 v60, v61

    .line 565
    .end local v61           #dock:Lcom/android/server/DockObserver;
    .restart local v60       #dock:Lcom/android/server/DockObserver;
    :goto_4ad
    :try_start_4ad
    const-string v3, "SystemServer"

    const-string v9, "Wired Accessory Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    new-instance v3, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v3, v4}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_4b9
    .catch Ljava/lang/Throwable; {:try_start_4ad .. :try_end_4b9} :catch_8d6

    .line 573
    :goto_4b9
    :try_start_4b9
    const-string v3, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 575
    new-instance v107, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v107

    invoke-direct {v0, v4}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_4c7
    .catch Ljava/lang/Throwable; {:try_start_4b9 .. :try_end_4c7} :catch_8e2

    .line 576
    .end local v106           #usb:Lcom/android/server/usb/UsbService;
    .local v107, usb:Lcom/android/server/usb/UsbService;
    :try_start_4c7
    const-string v3, "usb"

    move-object/from16 v0, v107

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4ce
    .catch Ljava/lang/Throwable; {:try_start_4c7 .. :try_end_4ce} :catch_9e5

    move-object/from16 v106, v107

    .line 582
    .end local v107           #usb:Lcom/android/server/usb/UsbService;
    .restart local v106       #usb:Lcom/android/server/usb/UsbService;
    :goto_4d0
    :try_start_4d0
    const-string v3, "SystemServer"

    const-string v9, "Serial Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    new-instance v95, Lcom/android/server/SerialService;

    move-object/from16 v0, v95

    invoke-direct {v0, v4}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_4de
    .catch Ljava/lang/Throwable; {:try_start_4d0 .. :try_end_4de} :catch_8ee

    .line 585
    .end local v94           #serial:Lcom/android/server/SerialService;
    .local v95, serial:Lcom/android/server/SerialService;
    :try_start_4de
    const-string v3, "serial"

    move-object/from16 v0, v95

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4e5
    .catch Ljava/lang/Throwable; {:try_start_4de .. :try_end_4e5} :catch_9e0

    move-object/from16 v94, v95

    .line 591
    .end local v95           #serial:Lcom/android/server/SerialService;
    .restart local v94       #serial:Lcom/android/server/SerialService;
    :goto_4e7
    :try_start_4e7
    const-string v3, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    new-instance v105, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v105

    invoke-direct {v0, v4}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4f5
    .catch Ljava/lang/Throwable; {:try_start_4e7 .. :try_end_4f5} :catch_8fa

    .end local v104           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v105, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v104, v105

    .line 599
    .end local v105           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v104       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_4f7
    :try_start_4f7
    const-string v3, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    const-string v3, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_508
    .catch Ljava/lang/Throwable; {:try_start_4f7 .. :try_end_508} :catch_906

    .line 607
    :goto_508
    :try_start_508
    const-string v3, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    new-instance v43, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v43

    invoke-direct {v0, v4}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_516
    .catch Ljava/lang/Throwable; {:try_start_508 .. :try_end_516} :catch_912

    .line 609
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .local v43, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_516
    const-string v3, "appwidget"

    move-object/from16 v0, v43

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_51d
    .catch Ljava/lang/Throwable; {:try_start_516 .. :try_end_51d} :catch_9db

    move-object/from16 v42, v43

    .line 615
    .end local v43           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_51f
    :try_start_51f
    const-string v3, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 616
    new-instance v93, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v93

    invoke-direct {v0, v4}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_52d
    .catch Ljava/lang/Throwable; {:try_start_51f .. :try_end_52d} :catch_91e

    .end local v92           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v93, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v92, v93

    .line 622
    .end local v93           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v92       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_52f
    :try_start_52f
    const-string v3, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    const-string v3, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v4}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_540
    .catch Ljava/lang/Throwable; {:try_start_52f .. :try_end_540} :catch_92a

    .line 633
    :goto_540
    :try_start_540
    const-string v3, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 634
    const-string v3, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v4}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_551
    .catch Ljava/lang/Throwable; {:try_start_540 .. :try_end_551} :catch_936

    .line 641
    :goto_551
    :try_start_551
    const-string v3, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    new-instance v84, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v84

    invoke-direct {v0, v4}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_55f
    .catch Ljava/lang/Throwable; {:try_start_551 .. :try_end_55f} :catch_942

    .end local v83           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v84, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v83, v84

    .line 648
    .end local v84           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v83       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_561
    :try_start_561
    const-string v3, "SystemServer"

    const-string v9, "CommonTimeManagementService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    new-instance v51, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v51

    invoke-direct {v0, v4}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_56f
    .catch Ljava/lang/Throwable; {:try_start_561 .. :try_end_56f} :catch_94e

    .line 650
    .end local v50           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .local v51, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :try_start_56f
    const-string v3, "commontime_management"

    move-object/from16 v0, v51

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_576
    .catch Ljava/lang/Throwable; {:try_start_56f .. :try_end_576} :catch_9d6

    move-object/from16 v50, v51

    .line 656
    .end local v51           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v50       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :goto_578
    :try_start_578
    const-string v3, "SystemServer"

    const-string v9, "CertBlacklister"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    new-instance v3, Lcom/android/server/CertBlacklister;

    invoke-direct {v3, v4}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_584
    .catch Ljava/lang/Throwable; {:try_start_578 .. :try_end_584} :catch_95a

    .line 662
    :goto_584
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x1110039

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_5a8

    .line 665
    :try_start_591
    const-string v3, "SystemServer"

    const-string v9, "Dreams Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    new-instance v63, Landroid/service/dreams/DreamManagerService;

    move-object/from16 v0, v63

    invoke-direct {v0, v4}, Landroid/service/dreams/DreamManagerService;-><init>(Landroid/content/Context;)V
    :try_end_59f
    .catch Ljava/lang/Throwable; {:try_start_591 .. :try_end_59f} :catch_966

    .line 668
    .end local v62           #dreamy:Landroid/service/dreams/DreamManagerService;
    .local v63, dreamy:Landroid/service/dreams/DreamManagerService;
    :try_start_59f
    const-string v3, "dreams"

    move-object/from16 v0, v63

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5a6
    .catch Ljava/lang/Throwable; {:try_start_59f .. :try_end_5a6} :catch_9d2

    move-object/from16 v62, v63

    .line 675
    .end local v63           #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    :cond_5a8
    :goto_5a8
    :try_start_5a8
    const-string v3, "SystemServer"

    const-string v9, "AssetRedirectionManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    const-string v3, "assetredirection"

    new-instance v9, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5b9
    .catch Ljava/lang/Throwable; {:try_start_5a8 .. :try_end_5b9} :catch_972

    .line 683
    .end local v79           #mountService:Lcom/android/server/MountService;
    :goto_5b9
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

    .line 687
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

    .line 693
    invoke-virtual/range {v117 .. v117}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v28

    .line 694
    .local v28, safeMode:Z
    if-eqz v28, :cond_97e

    .line 695
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 697
    const/4 v3, 0x1

    sput-boolean v3, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 699
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 708
    :goto_5fa
    :try_start_5fa
    invoke-virtual/range {v108 .. v108}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_5fd
    .catch Ljava/lang/Throwable; {:try_start_5fa .. :try_end_5fd} :catch_987

    .line 713
    :goto_5fd
    if-eqz v58, :cond_602

    .line 715
    :try_start_5ff
    invoke-virtual/range {v58 .. v58}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_602
    .catch Ljava/lang/Throwable; {:try_start_5ff .. :try_end_602} :catch_993

    .line 721
    :cond_602
    :goto_602
    if-eqz v85, :cond_607

    .line 723
    :try_start_604
    invoke-virtual/range {v85 .. v85}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_607
    .catch Ljava/lang/Throwable; {:try_start_604 .. :try_end_607} :catch_99f

    .line 730
    :cond_607
    :goto_607
    :try_start_607
    invoke-virtual/range {v117 .. v117}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_60a
    .catch Ljava/lang/Throwable; {:try_start_607 .. :try_end_60a} :catch_9ab

    .line 735
    :goto_60a
    if-eqz v28, :cond_613

    .line 736
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 742
    :cond_613
    invoke-virtual/range {v117 .. v117}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v52

    .line 743
    .local v52, config:Landroid/content/res/Configuration;
    new-instance v78, Landroid/util/DisplayMetrics;

    invoke-direct/range {v78 .. v78}, Landroid/util/DisplayMetrics;-><init>()V

    .line 744
    .local v78, metrics:Landroid/util/DisplayMetrics;
    const-string v3, "window"

    invoke-virtual {v4, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v110

    check-cast v110, Landroid/view/WindowManager;

    .line 745
    .local v110, w:Landroid/view/WindowManager;
    invoke-interface/range {v110 .. v110}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    move-object/from16 v0, v78

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 746
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v0, v52

    move-object/from16 v1, v78

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 748
    invoke-virtual {v6}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 750
    :try_start_63b
    invoke-interface/range {v88 .. v88}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_63e
    .catch Ljava/lang/Throwable; {:try_start_63b .. :try_end_63e} :catch_9b7

    .line 755
    :goto_63e
    :try_start_63e
    invoke-virtual/range {v76 .. v76}, Lcom/android/internal/widget/LockSettingsService;->systemReady()V
    :try_end_641
    .catch Ljava/lang/Throwable; {:try_start_63e .. :try_end_641} :catch_9c3

    .line 760
    :goto_641
    new-instance v67, Landroid/content/IntentFilter;

    invoke-direct/range {v67 .. v67}, Landroid/content/IntentFilter;-><init>()V

    .line 761
    .local v67, filter:Landroid/content/IntentFilter;
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 762
    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 763
    const-string v3, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 764
    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 765
    const-string v3, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 766
    const-string v3, "package"

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 767
    new-instance v3, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v3}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v67

    invoke-virtual {v4, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 770
    move-object/from16 v17, v4

    .line 771
    .local v17, contextF:Landroid/content/Context;
    move-object/from16 v18, v5

    .line 772
    .local v18, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v19, v13

    .line 773
    .local v19, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v20, v12

    .line 774
    .local v20, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v21, v8

    .line 775
    .local v21, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v22, v53

    .line 776
    .local v22, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v23, v60

    .line 777
    .local v23, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v24, v106

    .line 778
    .local v24, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v34, v100

    .line 779
    .local v34, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v25, v104

    .line 780
    .local v25, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v27, v42

    .line 781
    .local v27, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v29, v111

    .line 782
    .local v29, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v30, v69

    .line 783
    .local v30, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v26, v92

    .line 784
    .local v26, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v32, v74

    .line 785
    .local v32, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v33, v55

    .line 786
    .local v33, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v35, v83

    .line 787
    .local v35, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v36, v50

    .line 788
    .local v36, commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v37, v102

    .line 789
    .local v37, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v31, v98

    .line 790
    .local v31, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v38, v62

    .line 791
    .local v38, dreamyF:Landroid/service/dreams/DreamManagerService;
    move-object/from16 v39, v71

    .line 792
    .local v39, inputManagerF:Lcom/android/server/input/InputManagerService;
    move-object/from16 v40, v45

    .line 799
    .local v40, bluetoothF:Landroid/server/BluetoothService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    new-instance v14, Lcom/android/server/ServerThread$1;

    move-object/from16 v15, p0

    invoke-direct/range {v14 .. v40}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Landroid/service/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Landroid/server/BluetoothService;)V

    invoke-virtual {v3, v14}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 913
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v3

    if-eqz v3, :cond_6c3

    .line 914
    const-string v3, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 917
    :cond_6c3
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 918
    const-string v3, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 919
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
    .end local v92           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v94           #serial:Lcom/android/server/SerialService;
    .end local v96           #serviceDiscovery:Lcom/android/server/NsdService;
    .end local v98           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v100           #throttle:Lcom/android/server/ThrottleService;
    .end local v102           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v104           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v106           #usb:Lcom/android/server/usb/UsbService;
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .end local v110           #w:Landroid/view/WindowManager;
    .end local v111           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v113           #wifi:Lcom/android/server/WifiService;
    .end local v115           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v117           #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_6ce
    const/16 v91, 0x0

    goto/16 :goto_35

    .line 122
    .restart local v91       #reboot:Z
    :cond_6d2
    const/16 v90, 0x0

    .restart local v90       #reason:Ljava/lang/String;
    goto/16 :goto_47

    .line 130
    .end local v90           #reason:Ljava/lang/String;
    .end local v91           #reboot:Z
    .restart local v66       #factoryTestStr:Ljava/lang/String;
    :cond_6d6
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
    .restart local v92       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v94       #serial:Lcom/android/server/SerialService;
    .restart local v96       #serviceDiscovery:Lcom/android/server/NsdService;
    .restart local v100       #throttle:Lcom/android/server/ThrottleService;
    .restart local v104       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v106       #usb:Lcom/android/server/usb/UsbService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
    .restart local v113       #wifi:Lcom/android/server/WifiService;
    .restart local v115       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v117       #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_6dc
    :try_start_6dc
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
    :cond_6f1
    const/4 v3, 0x0

    goto/16 :goto_116

    .line 212
    .restart local v68       #firstBoot:Z
    :catch_6f4
    move-exception v64

    .line 213
    .local v64, e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6fe
    .catch Ljava/lang/RuntimeException; {:try_start_6dc .. :try_end_6fe} :catch_700

    goto/16 :goto_13e

    .line 283
    .end local v57           #cryptState:Ljava/lang/String;
    .end local v64           #e:Ljava/lang/Throwable;
    .end local v68           #firstBoot:Z
    .end local v87           #onlyCore:Z
    :catch_700
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v5, v44

    .line 284
    .end local v44           #battery:Lcom/android/server/BatteryService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .local v64, e:Ljava/lang/RuntimeException;
    :goto_705
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
    :cond_717
    const/4 v3, 0x0

    goto/16 :goto_14b

    .line 247
    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v44           #battery:Lcom/android/server/BatteryService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .restart local v5       #battery:Lcom/android/server/BatteryService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v109       #vibrator:Lcom/android/server/VibratorService;
    :cond_71a
    const/4 v3, 0x0

    move v9, v3

    goto/16 :goto_1c8

    :cond_71e
    const/4 v3, 0x0

    goto/16 :goto_1cb

    .line 261
    :cond_721
    const/4 v3, 0x1

    move/from16 v0, v65

    if-ne v0, v3, :cond_735

    .line 262
    :try_start_726
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_201

    .line 283
    :catch_72f
    move-exception v64

    move-object/from16 v108, v109

    .end local v109           #vibrator:Lcom/android/server/VibratorService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto :goto_705

    .line 264
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v109       #vibrator:Lcom/android/server/VibratorService;
    :cond_735
    const-string v3, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    new-instance v46, Landroid/server/BluetoothService;

    move-object/from16 v0, v46

    invoke-direct {v0, v4}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_743
    .catch Ljava/lang/RuntimeException; {:try_start_726 .. :try_end_743} :catch_72f

    .line 266
    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .local v46, bluetooth:Landroid/server/BluetoothService;
    :try_start_743
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

    if-nez v3, :cond_770

    .line 270
    new-instance v48, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v48

    move-object/from16 v1, v46

    invoke-direct {v0, v4, v1}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_764
    .catch Ljava/lang/RuntimeException; {:try_start_743 .. :try_end_764} :catch_a5d

    .line 271
    .end local v47           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v48, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_764
    const-string v3, "bluetooth_a2dp"

    move-object/from16 v0, v48

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 273
    invoke-virtual/range {v46 .. v46}, Landroid/server/BluetoothService;->initAfterA2dpRegistration()V
    :try_end_76e
    .catch Ljava/lang/RuntimeException; {:try_start_764 .. :try_end_76e} :catch_a66

    move-object/from16 v47, v48

    .line 276
    .end local v48           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v47       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :cond_770
    :try_start_770
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "bluetooth_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v49

    .line 278
    .local v49, bluetoothOn:I
    if-eqz v49, :cond_780

    .line 279
    invoke-virtual/range {v46 .. v46}, Landroid/server/BluetoothService;->enable()Z
    :try_end_780
    .catch Ljava/lang/RuntimeException; {:try_start_770 .. :try_end_780} :catch_a5d

    :cond_780
    move-object/from16 v45, v46

    .end local v46           #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_201

    .line 306
    .end local v49           #bluetoothOn:I
    .end local v57           #cryptState:Ljava/lang/String;
    .end local v68           #firstBoot:Z
    .end local v73           #lights:Lcom/android/server/LightsService;
    .end local v87           #onlyCore:Z
    .end local v109           #vibrator:Lcom/android/server/VibratorService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v98       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v102       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
    .restart local v111       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_784
    move-exception v64

    .line 307
    .local v64, e:Ljava/lang/Throwable;
    :goto_785
    const-string v3, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_239

    .line 314
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_790
    move-exception v64

    .line 315
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24a

    .line 321
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_79c
    move-exception v64

    .line 322
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24d

    .line 327
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7a8
    move-exception v64

    .line 328
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_250

    .line 350
    .end local v64           #e:Ljava/lang/Throwable;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    :catch_7b4
    move-exception v64

    .line 351
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7b5
    const-string v3, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28f

    .line 359
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7c0
    move-exception v64

    .line 360
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7c1
    const-string v3, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a6

    .line 367
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7cc
    move-exception v64

    .line 368
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7cd
    const-string v3, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2bd

    .line 375
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7d8
    move-exception v64

    .line 376
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7d9
    const-string v3, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d6

    .line 383
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7e4
    move-exception v64

    .line 384
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e7

    .line 391
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7f0
    move-exception v64

    .line 392
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f7

    .line 399
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_7fc
    move-exception v64

    .line 400
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_7fd
    const-string v3, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30e

    .line 407
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_808
    move-exception v64

    .line 408
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_809
    const-string v3, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_325

    .line 417
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_814
    move-exception v64

    move-object/from16 v8, v81

    .line 418
    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_817
    const-string v3, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33c

    .line 425
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_822
    move-exception v64

    .line 426
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_823
    const-string v3, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_353

    .line 433
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_82e
    move-exception v64

    .line 434
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_82f
    const-string v3, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36a

    .line 446
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_83a
    move-exception v64

    .line 447
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_83b
    const-string v3, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_391

    .line 455
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_846
    move-exception v64

    .line 456
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a3

    .line 464
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_852
    move-exception v64

    .line 465
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_853
    const-string v3, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3ba

    .line 472
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_85e
    move-exception v64

    .line 473
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3cb

    .line 490
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_86a
    move-exception v64

    .line 491
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_86b
    const-string v3, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3f0

    .line 498
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_876
    move-exception v64

    .line 499
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_401

    .line 506
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_882
    move-exception v64

    .line 507
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_883
    const-string v3, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_418

    .line 514
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_88e
    move-exception v64

    .line 515
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_88f
    const-string v3, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42f

    .line 522
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_89a
    move-exception v64

    .line 523
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_440

    .line 530
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8a6
    move-exception v64

    .line 531
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_458

    .line 542
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8b2
    move-exception v64

    .line 543
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_8b3
    const-string v3, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_47e

    .line 551
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8be
    move-exception v64

    .line 552
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_49d

    .line 560
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8ca
    move-exception v64

    .line 561
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4ad

    .line 568
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8d6
    move-exception v64

    .line 569
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4b9

    .line 577
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8e2
    move-exception v64

    .line 578
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_8e3
    const-string v3, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4d0

    .line 586
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8ee
    move-exception v64

    .line 587
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_8ef
    const-string v3, "SystemServer"

    const-string v9, "Failure starting SerialService"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4e7

    .line 594
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_8fa
    move-exception v64

    .line 595
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4f7

    .line 602
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_906
    move-exception v64

    .line 603
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_508

    .line 610
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_912
    move-exception v64

    .line 611
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_913
    const-string v3, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_51f

    .line 617
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_91e
    move-exception v64

    .line 618
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_52f

    .line 624
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_92a
    move-exception v64

    .line 625
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_540

    .line 636
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_936
    move-exception v64

    .line 637
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_551

    .line 643
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_942
    move-exception v64

    .line 644
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_561

    .line 651
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_94e
    move-exception v64

    .line 652
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_94f
    const-string v3, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_578

    .line 658
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_95a
    move-exception v64

    .line 659
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_584

    .line 669
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_966
    move-exception v64

    .line 670
    .restart local v64       #e:Ljava/lang/Throwable;
    :goto_967
    const-string v3, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5a8

    .line 677
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_972
    move-exception v64

    .line 678
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "SystemServer"

    const-string v9, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v64

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5b9

    .line 702
    .end local v64           #e:Ljava/lang/Throwable;
    .end local v79           #mountService:Lcom/android/server/MountService;
    .restart local v28       #safeMode:Z
    :cond_97e
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_5fa

    .line 709
    :catch_987
    move-exception v64

    .line 710
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5fd

    .line 716
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_993
    move-exception v64

    .line 717
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_602

    .line 724
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_99f
    move-exception v64

    .line 725
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_607

    .line 731
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_9ab
    move-exception v64

    .line 732
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_60a

    .line 751
    .end local v64           #e:Ljava/lang/Throwable;
    .restart local v52       #config:Landroid/content/res/Configuration;
    .restart local v78       #metrics:Landroid/util/DisplayMetrics;
    .restart local v110       #w:Landroid/view/WindowManager;
    :catch_9b7
    move-exception v64

    .line 752
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_63e

    .line 756
    .end local v64           #e:Ljava/lang/Throwable;
    :catch_9c3
    move-exception v64

    .line 757
    .restart local v64       #e:Ljava/lang/Throwable;
    const-string v3, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_641

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
    .end local v98           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v102           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v110           #w:Landroid/view/WindowManager;
    .end local v111           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v57       #cryptState:Ljava/lang/String;
    .restart local v68       #firstBoot:Z
    .restart local v81       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v87       #onlyCore:Z
    :catch_9cf
    move-exception v3

    goto/16 :goto_122

    .line 669
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
    .restart local v98       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v102       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v111       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_9d2
    move-exception v64

    move-object/from16 v62, v63

    .end local v63           #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v62       #dreamy:Landroid/service/dreams/DreamManagerService;
    goto :goto_967

    .line 651
    .end local v50           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v51       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :catch_9d6
    move-exception v64

    move-object/from16 v50, v51

    .end local v51           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v50       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_94f

    .line 610
    .end local v42           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v43       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_9db
    move-exception v64

    move-object/from16 v42, v43

    .end local v43           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v42       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_913

    .line 586
    .end local v94           #serial:Lcom/android/server/SerialService;
    .restart local v95       #serial:Lcom/android/server/SerialService;
    :catch_9e0
    move-exception v64

    move-object/from16 v94, v95

    .end local v95           #serial:Lcom/android/server/SerialService;
    .restart local v94       #serial:Lcom/android/server/SerialService;
    goto/16 :goto_8ef

    .line 577
    .end local v106           #usb:Lcom/android/server/usb/UsbService;
    .restart local v107       #usb:Lcom/android/server/usb/UsbService;
    :catch_9e5
    move-exception v64

    move-object/from16 v106, v107

    .end local v107           #usb:Lcom/android/server/usb/UsbService;
    .restart local v106       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_8e3

    .line 542
    .end local v111           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v112       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_9ea
    move-exception v64

    move-object/from16 v111, v112

    .end local v112           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v111       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_8b3

    .line 514
    .end local v55           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v56       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_9ef
    move-exception v64

    move-object/from16 v55, v56

    .end local v56           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v55       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_88f

    .line 506
    .end local v74           #location:Lcom/android/server/LocationManagerService;
    .restart local v75       #location:Lcom/android/server/LocationManagerService;
    :catch_9f4
    move-exception v64

    move-object/from16 v74, v75

    .end local v75           #location:Lcom/android/server/LocationManagerService;
    .restart local v74       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_883

    .line 490
    .end local v85           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v86       #notification:Lcom/android/server/NotificationManagerService;
    :catch_9f9
    move-exception v64

    move-object/from16 v85, v86

    .end local v86           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v85       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_86b

    .line 464
    .end local v100           #throttle:Lcom/android/server/ThrottleService;
    .restart local v101       #throttle:Lcom/android/server/ThrottleService;
    :catch_9fe
    move-exception v64

    move-object/from16 v100, v101

    .end local v101           #throttle:Lcom/android/server/ThrottleService;
    .restart local v100       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_853

    .line 446
    .end local v53           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v54       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_a03
    move-exception v64

    move-object/from16 v53, v54

    .end local v54           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v53       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_83b

    .line 433
    .end local v113           #wifi:Lcom/android/server/WifiService;
    .restart local v114       #wifi:Lcom/android/server/WifiService;
    :catch_a08
    move-exception v64

    move-object/from16 v113, v114

    .end local v114           #wifi:Lcom/android/server/WifiService;
    .restart local v113       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_82f

    .line 425
    .end local v115           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v116       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_a0d
    move-exception v64

    move-object/from16 v115, v116

    .end local v116           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v115       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_823

    .line 417
    :catch_a12
    move-exception v64

    goto/16 :goto_817

    .line 407
    .end local v8           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v12           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v81       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v82       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_a15
    move-exception v64

    move-object/from16 v12, v82

    .end local v82           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v12       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_809

    .line 399
    .end local v102           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v103       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_a1a
    move-exception v64

    move-object/from16 v102, v103

    .end local v103           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v102       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_7fd

    .line 375
    .end local v98           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v99       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_a1f
    move-exception v64

    move-object/from16 v98, v99

    .end local v99           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v98       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_7d9

    .line 367
    .end local v58           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v59       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_a24
    move-exception v64

    move-object/from16 v58, v59

    .end local v59           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v58       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_7cd

    .line 359
    .end local v76           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v77       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :catch_a29
    move-exception v64

    move-object/from16 v76, v77

    .end local v77           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v76       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    goto/16 :goto_7c1

    .line 350
    .end local v79           #mountService:Lcom/android/server/MountService;
    .restart local v80       #mountService:Lcom/android/server/MountService;
    :catch_a2e
    move-exception v64

    move-object/from16 v79, v80

    .end local v80           #mountService:Lcom/android/server/MountService;
    .restart local v79       #mountService:Lcom/android/server/MountService;
    goto/16 :goto_7b5

    .line 336
    .end local v79           #mountService:Lcom/android/server/MountService;
    :catch_a33
    move-exception v3

    goto/16 :goto_263

    .line 306
    .end local v69           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v70       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_a36
    move-exception v64

    move-object/from16 v69, v70

    .end local v70           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v69       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_785

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
    .end local v98           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v102           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v111           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v89       #power:Lcom/android/server/PowerManagerService;
    :catch_a3b
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
    goto/16 :goto_705

    .end local v5           #battery:Lcom/android/server/BatteryService;
    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v44       #battery:Lcom/android/server/BatteryService;
    .restart local v57       #cryptState:Ljava/lang/String;
    .restart local v68       #firstBoot:Z
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v87       #onlyCore:Z
    :catch_a44
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
    goto/16 :goto_705

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    :catch_a4d
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_705

    .end local v7           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .restart local v41       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v109       #vibrator:Lcom/android/server/VibratorService;
    :catch_a54
    move-exception v64

    move-object/from16 v7, v41

    .end local v41           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v7       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v108, v109

    .end local v109           #vibrator:Lcom/android/server/VibratorService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_705

    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .restart local v46       #bluetooth:Landroid/server/BluetoothService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v109       #vibrator:Lcom/android/server/VibratorService;
    :catch_a5d
    move-exception v64

    move-object/from16 v45, v46

    .end local v46           #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v108, v109

    .end local v109           #vibrator:Lcom/android/server/VibratorService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_705

    .end local v45           #bluetooth:Landroid/server/BluetoothService;
    .end local v47           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v72           #lights:Lcom/android/server/LightsService;
    .end local v108           #vibrator:Lcom/android/server/VibratorService;
    .restart local v46       #bluetooth:Landroid/server/BluetoothService;
    .restart local v48       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v73       #lights:Lcom/android/server/LightsService;
    .restart local v109       #vibrator:Lcom/android/server/VibratorService;
    :catch_a66
    move-exception v64

    move-object/from16 v47, v48

    .end local v48           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v47       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v45, v46

    .end local v46           #bluetooth:Landroid/server/BluetoothService;
    .restart local v45       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v108, v109

    .end local v109           #vibrator:Lcom/android/server/VibratorService;
    .restart local v108       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v72, v73

    .end local v73           #lights:Lcom/android/server/LightsService;
    .restart local v72       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_705

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
    .restart local v98       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v102       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v111       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_a71
    move-object/from16 v8, v81

    .end local v81           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v8       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_5b9
.end method
