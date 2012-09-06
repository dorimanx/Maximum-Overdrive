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

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method private addPrivacyService(Landroid/content/Context;)V
    .registers 5

    :try_start_0
    const-string v1, "SystemServer"

    const-string v2, "Privacy Service"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "privacy"

    new-instance v2, Landroid/privacy/PrivacySettingsManagerService;

    invoke-direct {v2, p1}, Landroid/privacy/PrivacySettingsManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_11} :catch_12

    :goto_11
    return-void

    :catch_12
    move-exception v0

    const-string v1, "SystemServer"

    const-string v2, "Failure starting Privacy Service"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_11
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .registers 5

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

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

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6

    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

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

    return-void
.end method

.method public run()V
    .registers 125

    const/16 v3, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v3, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    invoke-static {}, Landroid/os/Looper;->prepare()V

    const/4 v3, -0x2

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    const/4 v3, 0x1

    invoke-static {v3}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    const/4 v3, 0x0

    invoke-static {v3}, Landroid/os/Process;->setCanSelfBackground(Z)V

    const-string v3, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v3, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v103

    if-eqz v103, :cond_4e

    invoke-virtual/range {v103 .. v103}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4e

    const/4 v3, 0x0

    move-object/from16 v0, v103

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v9, 0x31

    if-ne v3, v9, :cond_70d

    const/16 v95, 0x1

    :goto_35
    invoke-virtual/range {v103 .. v103}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v9, 0x1

    if-le v3, v9, :cond_711

    const/4 v3, 0x1

    invoke-virtual/range {v103 .. v103}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v103

    invoke-virtual {v0, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v94

    :goto_47
    move/from16 v0, v95

    move-object/from16 v1, v94

    invoke-static {v0, v1}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    :cond_4e
    const-string v3, "ro.factorytest"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v67

    const-string v3, ""

    move-object/from16 v0, v67

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_715

    const/16 v66, 0x0

    :goto_60
    const-string v3, "1"

    const-string v9, "ro.config.headless"

    const-string v10, "0"

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    const/16 v74, 0x0

    const/16 v91, 0x0

    const/16 v45, 0x0

    const/16 v114, 0x0

    const/16 v42, 0x0

    const/4 v13, 0x0

    const/4 v12, 0x0

    const/16 v83, 0x0

    const/16 v54, 0x0

    const/16 v121, 0x0

    const/16 v119, 0x0

    const/16 v102, 0x0

    const/16 v90, 0x0

    const/4 v4, 0x0

    const/16 v123, 0x0

    const/16 v46, 0x0

    const/16 v48, 0x0

    const/16 v61, 0x0

    const/16 v98, 0x0

    const/16 v112, 0x0

    const/16 v100, 0x0

    const/16 v110, 0x0

    const/16 v96, 0x0

    const/16 v106, 0x0

    const/16 v85, 0x0

    const/16 v51, 0x0

    const/16 v73, 0x0

    :try_start_a1
    const-string v3, "SystemServer"

    const-string v9, "Entropy Mixer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "entropy"

    new-instance v9, Lcom/android/server/EntropyMixer;

    invoke-direct {v9}, Lcom/android/server/EntropyMixer;-><init>()V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v3, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v6, Lcom/android/server/PowerManagerService;

    invoke-direct {v6}, Lcom/android/server/PowerManagerService;-><init>()V
    :try_end_be
    .catch Ljava/lang/RuntimeException; {:try_start_a1 .. :try_end_be} :catch_a97

    :try_start_be
    const-string v3, "power"

    invoke-static {v3, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v3, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static/range {v66 .. v66}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v4

    const-string v3, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "telephony.registry"

    new-instance v9, Lcom/android/server/TelephonyRegistry;

    invoke-direct {v9, v4}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v3, "SystemServer"

    const-string v9, "Scheduling Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "scheduling_policy"

    new-instance v9, Landroid/os/SchedulingPolicyService;

    invoke-direct {v9}, Landroid/os/SchedulingPolicyService;-><init>()V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {v4}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    const-string v3, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "vold.decrypt"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v58

    const/16 v89, 0x0

    const-string v3, "trigger_restart_min_framework"

    move-object/from16 v0, v58

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_71b

    const-string v3, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v89, 0x1

    :cond_115
    :goto_115
    if-eqz v66, :cond_730

    const/4 v3, 0x1

    :goto_118
    move/from16 v0, v89

    invoke-static {v4, v3, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_11d
    .catch Ljava/lang/RuntimeException; {:try_start_be .. :try_end_11d} :catch_73f

    move-result-object v90

    const/16 v69, 0x0

    :try_start_120
    invoke-interface/range {v90 .. v90}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_123
    .catch Landroid/os/RemoteException; {:try_start_120 .. :try_end_123} :catch_a26
    .catch Ljava/lang/RuntimeException; {:try_start_120 .. :try_end_123} :catch_73f

    move-result v69

    :goto_124
    :try_start_124
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_12f
    .catch Ljava/lang/RuntimeException; {:try_start_124 .. :try_end_12f} :catch_73f

    :try_start_12f
    const-string v3, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "account"

    new-instance v9, Landroid/accounts/AccountManagerService;

    invoke-direct {v9, v4}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_140
    .catch Ljava/lang/Throwable; {:try_start_12f .. :try_end_140} :catch_733
    .catch Ljava/lang/RuntimeException; {:try_start_12f .. :try_end_140} :catch_73f

    :goto_140
    :try_start_140
    const-string v3, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x1

    move/from16 v0, v66

    if-ne v0, v3, :cond_756

    const/4 v3, 0x1

    :goto_14d
    invoke-static {v4, v3}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/IContentService;

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/server/ServerThread;->addPrivacyService(Landroid/content/Context;)V

    const-string v3, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    const-string v3, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v75, Lcom/android/server/LightsService;

    move-object/from16 v0, v75

    invoke-direct {v0, v4}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_16d
    .catch Ljava/lang/RuntimeException; {:try_start_140 .. :try_end_16d} :catch_73f

    :try_start_16d
    const-string v3, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Lcom/android/server/BatteryService;

    move-object/from16 v0, v75

    invoke-direct {v5, v4, v0}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_17b
    .catch Ljava/lang/RuntimeException; {:try_start_16d .. :try_end_17b} :catch_aa0

    :try_start_17b
    const-string v3, "battery"

    invoke-static {v3, v5}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v3, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v115, Lcom/android/server/VibratorService;

    move-object/from16 v0, v115

    invoke-direct {v0, v4}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_18e
    .catch Ljava/lang/RuntimeException; {:try_start_17b .. :try_end_18e} :catch_aa9

    :try_start_18e
    const-string v3, "vibrator"

    move-object/from16 v0, v115

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v75

    invoke-virtual {v6, v4, v0, v3, v5}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    const-string v3, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v7, Lcom/android/server/AlarmManagerService;

    invoke-direct {v7, v4}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1aa
    .catch Ljava/lang/RuntimeException; {:try_start_18e .. :try_end_1aa} :catch_ab0

    :try_start_1aa
    const-string v3, "alarm"

    invoke-static {v3, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v3, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v3

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    const-string v3, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x1

    move/from16 v0, v66

    if-eq v0, v3, :cond_759

    const/4 v3, 0x1

    move v9, v3

    :goto_1cf
    if-nez v69, :cond_75d

    const/4 v3, 0x1

    :goto_1d2
    move/from16 v0, v89

    invoke-static {v4, v6, v9, v3, v0}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v123

    const-string v3, "window"

    move-object/from16 v0, v123

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-virtual/range {v123 .. v123}, Lcom/android/server/wm/WindowManagerService;->getInputManagerService()Lcom/android/server/input/InputManagerService;

    move-result-object v73

    const-string v3, "input"

    move-object/from16 v0, v73

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    move-object/from16 v0, v123

    invoke-virtual {v3, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    const-string v3, "ro.kernel.qemu"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "1"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_760

    const-string v3, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_208
    .catch Ljava/lang/RuntimeException; {:try_start_1aa .. :try_end_208} :catch_76e

    :goto_208
    move-object/from16 v114, v115

    move-object/from16 v74, v75

    :goto_20c
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x1110042

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v70

    const/16 v59, 0x0

    const/16 v104, 0x0

    const/16 v71, 0x0

    const/16 v43, 0x0

    const/16 v92, 0x0

    const/16 v87, 0x0

    const/16 v117, 0x0

    const/16 v76, 0x0

    const/16 v56, 0x0

    const/16 v108, 0x0

    const/16 v78, 0x0

    const/16 v63, 0x0

    const/4 v3, 0x1

    move/from16 v0, v66

    if-eq v0, v3, :cond_25e

    :try_start_234
    const-string v3, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v72, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v72

    move-object/from16 v1, v123

    invoke-direct {v0, v4, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_244
    .catch Ljava/lang/Throwable; {:try_start_234 .. :try_end_244} :catch_7c3

    :try_start_244
    const-string v3, "input_method"

    move-object/from16 v0, v72

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24b
    .catch Ljava/lang/Throwable; {:try_start_244 .. :try_end_24b} :catch_a92

    move-object/from16 v71, v72

    :goto_24d
    :try_start_24d
    const-string v3, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_25e
    .catch Ljava/lang/Throwable; {:try_start_24d .. :try_end_25e} :catch_7cf

    :cond_25e
    :goto_25e
    :try_start_25e
    invoke-virtual/range {v123 .. v123}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_261
    .catch Ljava/lang/Throwable; {:try_start_25e .. :try_end_261} :catch_7db

    :goto_261
    :try_start_261
    invoke-interface/range {v90 .. v90}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_264
    .catch Ljava/lang/Throwable; {:try_start_261 .. :try_end_264} :catch_7e7

    :goto_264
    :try_start_264
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x104040a

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v3, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_277
    .catch Landroid/os/RemoteException; {:try_start_264 .. :try_end_277} :catch_a8f

    :goto_277
    const/4 v3, 0x1

    move/from16 v0, v66

    if-eq v0, v3, :cond_acd

    const/16 v81, 0x0

    const-string v3, "0"

    const-string v9, "system_init.startmountservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a3

    :try_start_28c
    const-string v3, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v82, Lcom/android/server/MountService;

    move-object/from16 v0, v82

    invoke-direct {v0, v4}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_29a
    .catch Ljava/lang/Throwable; {:try_start_28c .. :try_end_29a} :catch_7f3

    :try_start_29a
    const-string v3, "mount"

    move-object/from16 v0, v82

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a1
    .catch Ljava/lang/Throwable; {:try_start_29a .. :try_end_2a1} :catch_a8a

    move-object/from16 v81, v82

    :cond_2a3
    :goto_2a3
    :try_start_2a3
    const-string v3, "SystemServer"

    const-string v9, "LockSettingsService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v79, Lcom/android/internal/widget/LockSettingsService;

    move-object/from16 v0, v79

    invoke-direct {v0, v4}, Lcom/android/internal/widget/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_2b1
    .catch Ljava/lang/Throwable; {:try_start_2a3 .. :try_end_2b1} :catch_7ff

    :try_start_2b1
    const-string v3, "lock_settings"

    move-object/from16 v0, v79

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b8
    .catch Ljava/lang/Throwable; {:try_start_2b1 .. :try_end_2b8} :catch_a85

    move-object/from16 v78, v79

    :goto_2ba
    :try_start_2ba
    const-string v3, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v60, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v60

    invoke-direct {v0, v4}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2c8
    .catch Ljava/lang/Throwable; {:try_start_2ba .. :try_end_2c8} :catch_80b

    :try_start_2c8
    const-string v3, "device_policy"

    move-object/from16 v0, v60

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2cf
    .catch Ljava/lang/Throwable; {:try_start_2c8 .. :try_end_2cf} :catch_a80

    move-object/from16 v59, v60

    :goto_2d1
    :try_start_2d1
    const-string v3, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v105, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v105

    move-object/from16 v1, v123

    invoke-direct {v0, v4, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_2e1
    .catch Ljava/lang/Throwable; {:try_start_2d1 .. :try_end_2e1} :catch_817

    :try_start_2e1
    const-string v3, "statusbar"

    move-object/from16 v0, v105

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2e8
    .catch Ljava/lang/Throwable; {:try_start_2e1 .. :try_end_2e8} :catch_a7b

    move-object/from16 v104, v105

    :goto_2ea
    :try_start_2ea
    const-string v3, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v4}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2fb
    .catch Ljava/lang/Throwable; {:try_start_2ea .. :try_end_2fb} :catch_823

    :goto_2fb
    :try_start_2fb
    const-string v3, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v13

    const-string v3, "network_management"

    invoke-static {v3, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_30b
    .catch Ljava/lang/Throwable; {:try_start_2fb .. :try_end_30b} :catch_82f

    :goto_30b
    :try_start_30b
    const-string v3, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v109, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v109

    invoke-direct {v0, v4}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_319
    .catch Ljava/lang/Throwable; {:try_start_30b .. :try_end_319} :catch_83b

    :try_start_319
    const-string v3, "textservices"

    move-object/from16 v0, v109

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_320
    .catch Ljava/lang/Throwable; {:try_start_319 .. :try_end_320} :catch_a76

    move-object/from16 v108, v109

    :goto_322
    :try_start_322
    const-string v3, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v84, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v84

    invoke-direct {v0, v4, v13, v7}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_330
    .catch Ljava/lang/Throwable; {:try_start_322 .. :try_end_330} :catch_847

    :try_start_330
    const-string v3, "netstats"

    move-object/from16 v0, v84

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_337
    .catch Ljava/lang/Throwable; {:try_start_330 .. :try_end_337} :catch_a71

    move-object/from16 v12, v84

    :goto_339
    :try_start_339
    const-string v3, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v8, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    move-object v9, v4

    move-object v11, v6

    invoke-direct/range {v8 .. v13}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_34b
    .catch Ljava/lang/Throwable; {:try_start_339 .. :try_end_34b} :catch_853

    :try_start_34b
    const-string v3, "netpolicy"

    invoke-static {v3, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_350
    .catch Ljava/lang/Throwable; {:try_start_34b .. :try_end_350} :catch_a6e

    :goto_350
    :try_start_350
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v122, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v122

    invoke-direct {v0, v4}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_35e
    .catch Ljava/lang/Throwable; {:try_start_350 .. :try_end_35e} :catch_861

    :try_start_35e
    const-string v3, "wifip2p"

    move-object/from16 v0, v122

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_365
    .catch Ljava/lang/Throwable; {:try_start_35e .. :try_end_365} :catch_a69

    move-object/from16 v121, v122

    :goto_367
    :try_start_367
    const-string v3, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v120, Lcom/android/server/WifiService;

    move-object/from16 v0, v120

    invoke-direct {v0, v4}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_375
    .catch Ljava/lang/Throwable; {:try_start_367 .. :try_end_375} :catch_86d

    :try_start_375
    const-string v3, "wifi"

    move-object/from16 v0, v120

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_37c
    .catch Ljava/lang/Throwable; {:try_start_375 .. :try_end_37c} :catch_a64

    move-object/from16 v119, v120

    :goto_37e
    :try_start_37e
    const-string v3, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v55, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v55

    invoke-direct {v0, v4, v13, v12, v8}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_38c
    .catch Ljava/lang/Throwable; {:try_start_37e .. :try_end_38c} :catch_879

    :try_start_38c
    const-string v3, "connectivity"

    move-object/from16 v0, v55

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    move-object/from16 v0, v55

    invoke-virtual {v12, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    move-object/from16 v0, v55

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    invoke-virtual/range {v119 .. v119}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    invoke-virtual/range {v121 .. v121}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_3a3
    .catch Ljava/lang/Throwable; {:try_start_38c .. :try_end_3a3} :catch_a5f

    move-object/from16 v54, v55

    :goto_3a5
    :try_start_3a5
    const-string v3, "SystemServer"

    const-string v9, "Network Service Discovery Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v102

    const-string v3, "servicediscovery"

    move-object/from16 v0, v102

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3b7
    .catch Ljava/lang/Throwable; {:try_start_3a5 .. :try_end_3b7} :catch_885

    :goto_3b7
    :try_start_3b7
    const-string v3, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v107, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v107

    invoke-direct {v0, v4}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_3c5
    .catch Ljava/lang/Throwable; {:try_start_3b7 .. :try_end_3c5} :catch_891

    :try_start_3c5
    const-string v3, "throttle"

    move-object/from16 v0, v107

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3cc
    .catch Ljava/lang/Throwable; {:try_start_3c5 .. :try_end_3cc} :catch_a5a

    move-object/from16 v106, v107

    :goto_3ce
    :try_start_3ce
    const-string v3, "SystemServer"

    const-string v9, "UpdateLock Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "updatelock"

    new-instance v9, Lcom/android/server/UpdateLockService;

    invoke-direct {v9, v4}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3df
    .catch Ljava/lang/Throwable; {:try_start_3ce .. :try_end_3df} :catch_89d

    :goto_3df
    if-eqz v81, :cond_3e4

    invoke-virtual/range {v81 .. v81}, Lcom/android/server/MountService;->waitForAsecScan()V

    :cond_3e4
    :try_start_3e4
    const-string v3, "SystemServer"

    const-string v9, "Profile Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v93, Lcom/android/server/ProfileManagerService;

    move-object/from16 v0, v93

    invoke-direct {v0, v4}, Lcom/android/server/ProfileManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3f2
    .catch Ljava/lang/Throwable; {:try_start_3e4 .. :try_end_3f2} :catch_8a9

    :try_start_3f2
    const-string v3, "profile"

    move-object/from16 v0, v93

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3f9
    .catch Ljava/lang/Throwable; {:try_start_3f2 .. :try_end_3f9} :catch_a55

    move-object/from16 v92, v93

    :goto_3fb
    :try_start_3fb
    const-string v3, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v88, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v88

    move-object/from16 v1, v104

    move-object/from16 v2, v74

    invoke-direct {v0, v4, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_40d
    .catch Ljava/lang/Throwable; {:try_start_3fb .. :try_end_40d} :catch_8b5

    :try_start_40d
    const-string v3, "notification"

    move-object/from16 v0, v88

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    move-object/from16 v0, v88

    invoke-virtual {v8, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_419
    .catch Ljava/lang/Throwable; {:try_start_40d .. :try_end_419} :catch_a50

    move-object/from16 v87, v88

    :goto_41b
    :try_start_41b
    const-string v3, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v4}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42c
    .catch Ljava/lang/Throwable; {:try_start_41b .. :try_end_42c} :catch_8c1

    :goto_42c
    :try_start_42c
    const-string v3, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v77, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v77

    invoke-direct {v0, v4}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_43a
    .catch Ljava/lang/Throwable; {:try_start_42c .. :try_end_43a} :catch_8cd

    :try_start_43a
    const-string v3, "location"

    move-object/from16 v0, v77

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_441
    .catch Ljava/lang/Throwable; {:try_start_43a .. :try_end_441} :catch_a4b

    move-object/from16 v76, v77

    :goto_443
    :try_start_443
    const-string v3, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v57, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v57

    invoke-direct {v0, v4}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_451
    .catch Ljava/lang/Throwable; {:try_start_443 .. :try_end_451} :catch_8d9

    :try_start_451
    const-string v3, "country_detector"

    move-object/from16 v0, v57

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_458
    .catch Ljava/lang/Throwable; {:try_start_451 .. :try_end_458} :catch_a46

    move-object/from16 v56, v57

    :goto_45a
    :try_start_45a
    const-string v3, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v4}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_46b
    .catch Ljava/lang/Throwable; {:try_start_45a .. :try_end_46b} :catch_8e5

    :goto_46b
    :try_start_46b
    const-string v3, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v4, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_483
    .catch Ljava/lang/Throwable; {:try_start_46b .. :try_end_483} :catch_8f1

    :goto_483
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x1110027

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_4a9

    :try_start_490
    const-string v3, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v16, :cond_4a9

    new-instance v118, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v118

    invoke-direct {v0, v4}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4a0
    .catch Ljava/lang/Throwable; {:try_start_490 .. :try_end_4a0} :catch_8fd

    :try_start_4a0
    const-string v3, "wallpaper"

    move-object/from16 v0, v118

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4a7
    .catch Ljava/lang/Throwable; {:try_start_4a0 .. :try_end_4a7} :catch_a41

    move-object/from16 v117, v118

    :cond_4a9
    :goto_4a9
    const-string v3, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4c8

    :try_start_4b7
    const-string v3, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v4}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4c8
    .catch Ljava/lang/Throwable; {:try_start_4b7 .. :try_end_4c8} :catch_909

    :cond_4c8
    :goto_4c8
    :try_start_4c8
    const-string v3, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v62, Lcom/android/server/DockObserver;

    move-object/from16 v0, v62

    invoke-direct {v0, v4, v6}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_4d6
    .catch Ljava/lang/Throwable; {:try_start_4c8 .. :try_end_4d6} :catch_915

    move-object/from16 v61, v62

    :goto_4d8
    if-eqz v70, :cond_4ea

    :try_start_4da
    const-string v3, "SystemServer"

    const-string v9, "Rotation Switch Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v99, Lcom/android/server/RotationSwitchObserver;

    move-object/from16 v0, v99

    invoke-direct {v0, v4}, Lcom/android/server/RotationSwitchObserver;-><init>(Landroid/content/Context;)V
    :try_end_4e8
    .catch Ljava/lang/Throwable; {:try_start_4da .. :try_end_4e8} :catch_921

    move-object/from16 v98, v99

    :cond_4ea
    :goto_4ea
    :try_start_4ea
    const-string v3, "SystemServer"

    const-string v9, "Wired Accessory Observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v3, v4}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_4f6
    .catch Ljava/lang/Throwable; {:try_start_4ea .. :try_end_4f6} :catch_92d

    :goto_4f6
    :try_start_4f6
    const-string v3, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v113, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v113

    invoke-direct {v0, v4}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_504
    .catch Ljava/lang/Throwable; {:try_start_4f6 .. :try_end_504} :catch_939

    :try_start_504
    const-string v3, "usb"

    move-object/from16 v0, v113

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_50b
    .catch Ljava/lang/Throwable; {:try_start_504 .. :try_end_50b} :catch_a3c

    move-object/from16 v112, v113

    :goto_50d
    :try_start_50d
    const-string v3, "SystemServer"

    const-string v9, "Serial Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v101, Lcom/android/server/SerialService;

    move-object/from16 v0, v101

    invoke-direct {v0, v4}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_51b
    .catch Ljava/lang/Throwable; {:try_start_50d .. :try_end_51b} :catch_945

    :try_start_51b
    const-string v3, "serial"

    move-object/from16 v0, v101

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_522
    .catch Ljava/lang/Throwable; {:try_start_51b .. :try_end_522} :catch_a37

    move-object/from16 v100, v101

    :goto_524
    :try_start_524
    const-string v3, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v111, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v111

    invoke-direct {v0, v4}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_532
    .catch Ljava/lang/Throwable; {:try_start_524 .. :try_end_532} :catch_951

    move-object/from16 v110, v111

    :goto_534
    :try_start_534
    const-string v3, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_545
    .catch Ljava/lang/Throwable; {:try_start_534 .. :try_end_545} :catch_95d

    :goto_545
    :try_start_545
    const-string v3, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v44, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v44

    invoke-direct {v0, v4}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_553
    .catch Ljava/lang/Throwable; {:try_start_545 .. :try_end_553} :catch_969

    :try_start_553
    const-string v3, "appwidget"

    move-object/from16 v0, v44

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_55a
    .catch Ljava/lang/Throwable; {:try_start_553 .. :try_end_55a} :catch_a32

    move-object/from16 v43, v44

    :goto_55c
    :try_start_55c
    const-string v3, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v97, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v97

    invoke-direct {v0, v4}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_56a
    .catch Ljava/lang/Throwable; {:try_start_55c .. :try_end_56a} :catch_975

    move-object/from16 v96, v97

    :goto_56c
    :try_start_56c
    const-string v3, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v4}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_57d
    .catch Ljava/lang/Throwable; {:try_start_56c .. :try_end_57d} :catch_981

    :goto_57d
    :try_start_57d
    const-string v3, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v4}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_58e
    .catch Ljava/lang/Throwable; {:try_start_57d .. :try_end_58e} :catch_98d

    :goto_58e
    :try_start_58e
    const-string v3, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v86, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v86

    invoke-direct {v0, v4}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_59c
    .catch Ljava/lang/Throwable; {:try_start_58e .. :try_end_59c} :catch_999

    move-object/from16 v85, v86

    :goto_59e
    :try_start_59e
    const-string v3, "SystemServer"

    const-string v9, "CommonTimeManagementService"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v52, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v52

    invoke-direct {v0, v4}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_5ac
    .catch Ljava/lang/Throwable; {:try_start_59e .. :try_end_5ac} :catch_9a5

    :try_start_5ac
    const-string v3, "commontime_management"

    move-object/from16 v0, v52

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5b3
    .catch Ljava/lang/Throwable; {:try_start_5ac .. :try_end_5b3} :catch_a2d

    move-object/from16 v51, v52

    :goto_5b5
    :try_start_5b5
    const-string v3, "SystemServer"

    const-string v9, "CertBlacklister"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Lcom/android/server/CertBlacklister;

    invoke-direct {v3, v4}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_5c1
    .catch Ljava/lang/Throwable; {:try_start_5b5 .. :try_end_5c1} :catch_9b1

    :goto_5c1
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x111003c

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_5e5

    :try_start_5ce
    const-string v3, "SystemServer"

    const-string v9, "Dreams Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v64, Landroid/service/dreams/DreamManagerService;

    move-object/from16 v0, v64

    invoke-direct {v0, v4}, Landroid/service/dreams/DreamManagerService;-><init>(Landroid/content/Context;)V
    :try_end_5dc
    .catch Ljava/lang/Throwable; {:try_start_5ce .. :try_end_5dc} :catch_9bd

    :try_start_5dc
    const-string v3, "dreams"

    move-object/from16 v0, v64

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5e3
    .catch Ljava/lang/Throwable; {:try_start_5dc .. :try_end_5e3} :catch_a29

    move-object/from16 v63, v64

    :cond_5e5
    :goto_5e5
    :try_start_5e5
    const-string v3, "SystemServer"

    const-string v9, "AssetRedirectionManager Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "assetredirection"

    new-instance v9, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v9, v4}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5f6
    .catch Ljava/lang/Throwable; {:try_start_5e5 .. :try_end_5f6} :catch_9c9

    :goto_5f6
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

    invoke-virtual/range {v123 .. v123}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v29

    if-eqz v29, :cond_9d5

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    const/4 v3, 0x1

    sput-boolean v3, Ldalvik/system/Zygote;->systemInSafeMode:Z

    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    :goto_637
    :try_start_637
    invoke-virtual/range {v114 .. v114}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_63a
    .catch Ljava/lang/Throwable; {:try_start_637 .. :try_end_63a} :catch_9de

    :goto_63a
    if-eqz v59, :cond_63f

    :try_start_63c
    invoke-virtual/range {v59 .. v59}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_63f
    .catch Ljava/lang/Throwable; {:try_start_63c .. :try_end_63f} :catch_9ea

    :cond_63f
    :goto_63f
    if-eqz v87, :cond_644

    :try_start_641
    invoke-virtual/range {v87 .. v87}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_644
    .catch Ljava/lang/Throwable; {:try_start_641 .. :try_end_644} :catch_9f6

    :cond_644
    :goto_644
    :try_start_644
    invoke-virtual/range {v123 .. v123}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_647
    .catch Ljava/lang/Throwable; {:try_start_644 .. :try_end_647} :catch_a02

    :goto_647
    if-eqz v29, :cond_650

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    :cond_650
    invoke-virtual/range {v123 .. v123}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v53

    new-instance v80, Landroid/util/DisplayMetrics;

    invoke-direct/range {v80 .. v80}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v3, "window"

    invoke-virtual {v4, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v116

    check-cast v116, Landroid/view/WindowManager;

    invoke-interface/range {v116 .. v116}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    move-object/from16 v0, v80

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v0, v53

    move-object/from16 v1, v80

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    invoke-virtual {v6}, Lcom/android/server/PowerManagerService;->systemReady()V

    :try_start_678
    invoke-interface/range {v90 .. v90}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_67b
    .catch Ljava/lang/Throwable; {:try_start_678 .. :try_end_67b} :catch_a0e

    :goto_67b
    :try_start_67b
    invoke-virtual/range {v78 .. v78}, Lcom/android/internal/widget/LockSettingsService;->systemReady()V
    :try_end_67e
    .catch Ljava/lang/Throwable; {:try_start_67b .. :try_end_67e} :catch_a1a

    :goto_67e
    new-instance v68, Landroid/content/IntentFilter;

    invoke-direct/range {v68 .. v68}, Landroid/content/IntentFilter;-><init>()V

    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v3, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v3, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v3, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v3, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    const-string v3, "package"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    new-instance v3, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v3}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v68

    invoke-virtual {v4, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-object/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v13

    move-object/from16 v20, v12

    move-object/from16 v21, v8

    move-object/from16 v22, v54

    move-object/from16 v23, v61

    move-object/from16 v24, v98

    move-object/from16 v25, v112

    move-object/from16 v35, v106

    move-object/from16 v26, v110

    move-object/from16 v28, v43

    move-object/from16 v30, v117

    move-object/from16 v31, v71

    move-object/from16 v27, v96

    move-object/from16 v33, v76

    move-object/from16 v34, v56

    move-object/from16 v36, v85

    move-object/from16 v37, v51

    move-object/from16 v38, v108

    move-object/from16 v32, v104

    move-object/from16 v39, v63

    move-object/from16 v40, v73

    move-object/from16 v41, v46

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v3

    new-instance v14, Lcom/android/server/ServerThread$1;

    move-object/from16 v15, p0

    invoke-direct/range {v14 .. v41}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/RotationSwitchObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Landroid/service/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Landroid/server/BluetoothService;)V

    invoke-virtual {v3, v14}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v3

    if-eqz v3, :cond_702

    const-string v3, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_702
    invoke-static {}, Landroid/os/Looper;->loop()V

    const-string v3, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_70d
    const/16 v95, 0x0

    goto/16 :goto_35

    :cond_711
    const/16 v94, 0x0

    goto/16 :goto_47

    :cond_715
    invoke-static/range {v67 .. v67}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v66

    goto/16 :goto_60

    :cond_71b
    :try_start_71b
    const-string v3, "1"

    move-object/from16 v0, v58

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_115

    const-string v3, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v3, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v89, 0x1

    goto/16 :goto_115

    :cond_730
    const/4 v3, 0x0

    goto/16 :goto_118

    :catch_733
    move-exception v65

    const-string v3, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v65

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_73d
    .catch Ljava/lang/RuntimeException; {:try_start_71b .. :try_end_73d} :catch_73f

    goto/16 :goto_140

    :catch_73f
    move-exception v65

    move-object/from16 v7, v42

    move-object/from16 v5, v45

    :goto_744
    const-string v3, "System"

    const-string v9, "******************************************"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v65

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_20c

    :cond_756
    const/4 v3, 0x0

    goto/16 :goto_14d

    :cond_759
    const/4 v3, 0x0

    move v9, v3

    goto/16 :goto_1cf

    :cond_75d
    const/4 v3, 0x0

    goto/16 :goto_1d2

    :cond_760
    const/4 v3, 0x1

    move/from16 v0, v66

    if-ne v0, v3, :cond_774

    :try_start_765
    const-string v3, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_208

    :catch_76e
    move-exception v65

    move-object/from16 v114, v115

    move-object/from16 v74, v75

    goto :goto_744

    :cond_774
    const-string v3, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v3, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v47, Landroid/server/BluetoothService;

    move-object/from16 v0, v47

    invoke-direct {v0, v4}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_782
    .catch Ljava/lang/RuntimeException; {:try_start_765 .. :try_end_782} :catch_76e

    :try_start_782
    const-string v3, "bluetooth"

    move-object/from16 v0, v47

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-virtual/range {v47 .. v47}, Landroid/server/BluetoothService;->initAfterRegistration()V

    const-string v3, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7af

    new-instance v49, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v49

    move-object/from16 v1, v47

    invoke-direct {v0, v4, v1}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_7a3
    .catch Ljava/lang/RuntimeException; {:try_start_782 .. :try_end_7a3} :catch_ab9

    :try_start_7a3
    const-string v3, "bluetooth_a2dp"

    move-object/from16 v0, v49

    invoke-static {v3, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-virtual/range {v47 .. v47}, Landroid/server/BluetoothService;->initAfterA2dpRegistration()V
    :try_end_7ad
    .catch Ljava/lang/RuntimeException; {:try_start_7a3 .. :try_end_7ad} :catch_ac2

    move-object/from16 v48, v49

    :cond_7af
    :try_start_7af
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v9, "bluetooth_on"

    const/4 v10, 0x0

    invoke-static {v3, v9, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v50

    if-eqz v50, :cond_7bf

    invoke-virtual/range {v47 .. v47}, Landroid/server/BluetoothService;->enable()Z
    :try_end_7bf
    .catch Ljava/lang/RuntimeException; {:try_start_7af .. :try_end_7bf} :catch_ab9

    :cond_7bf
    move-object/from16 v46, v47

    goto/16 :goto_208

    :catch_7c3
    move-exception v65

    :goto_7c4
    const-string v3, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24d

    :catch_7cf
    move-exception v65

    const-string v3, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_25e

    :catch_7db
    move-exception v65

    const-string v3, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_261

    :catch_7e7
    move-exception v65

    const-string v3, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_264

    :catch_7f3
    move-exception v65

    :goto_7f4
    const-string v3, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a3

    :catch_7ff
    move-exception v65

    :goto_800
    const-string v3, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2ba

    :catch_80b
    move-exception v65

    :goto_80c
    const-string v3, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d1

    :catch_817
    move-exception v65

    :goto_818
    const-string v3, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2ea

    :catch_823
    move-exception v65

    const-string v3, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2fb

    :catch_82f
    move-exception v65

    const-string v3, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30b

    :catch_83b
    move-exception v65

    :goto_83c
    const-string v3, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_322

    :catch_847
    move-exception v65

    :goto_848
    const-string v3, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_339

    :catch_853
    move-exception v65

    move-object/from16 v8, v83

    :goto_856
    const-string v3, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_350

    :catch_861
    move-exception v65

    :goto_862
    const-string v3, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_367

    :catch_86d
    move-exception v65

    :goto_86e
    const-string v3, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_37e

    :catch_879
    move-exception v65

    :goto_87a
    const-string v3, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a5

    :catch_885
    move-exception v65

    const-string v3, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3b7

    :catch_891
    move-exception v65

    :goto_892
    const-string v3, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3ce

    :catch_89d
    move-exception v65

    const-string v3, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3df

    :catch_8a9
    move-exception v65

    :goto_8aa
    const-string v3, "SystemServer"

    const-string v9, "Failure starting Profile Manager"

    move-object/from16 v0, v65

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3fb

    :catch_8b5
    move-exception v65

    :goto_8b6
    const-string v3, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_41b

    :catch_8c1
    move-exception v65

    const-string v3, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42c

    :catch_8cd
    move-exception v65

    :goto_8ce
    const-string v3, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_443

    :catch_8d9
    move-exception v65

    :goto_8da
    const-string v3, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_45a

    :catch_8e5
    move-exception v65

    const-string v3, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_46b

    :catch_8f1
    move-exception v65

    const-string v3, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_483

    :catch_8fd
    move-exception v65

    :goto_8fe
    const-string v3, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4a9

    :catch_909
    move-exception v65

    const-string v3, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4c8

    :catch_915
    move-exception v65

    const-string v3, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4d8

    :catch_921
    move-exception v65

    const-string v3, "starting RotationSwitchObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4ea

    :catch_92d
    move-exception v65

    const-string v3, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4f6

    :catch_939
    move-exception v65

    :goto_93a
    const-string v3, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_50d

    :catch_945
    move-exception v65

    :goto_946
    const-string v3, "SystemServer"

    const-string v9, "Failure starting SerialService"

    move-object/from16 v0, v65

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_524

    :catch_951
    move-exception v65

    const-string v3, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_534

    :catch_95d
    move-exception v65

    const-string v3, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v65

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_545

    :catch_969
    move-exception v65

    :goto_96a
    const-string v3, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_55c

    :catch_975
    move-exception v65

    const-string v3, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_56c

    :catch_981
    move-exception v65

    const-string v3, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_57d

    :catch_98d
    move-exception v65

    const-string v3, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_58e

    :catch_999
    move-exception v65

    const-string v3, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_59e

    :catch_9a5
    move-exception v65

    :goto_9a6
    const-string v3, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5b5

    :catch_9b1
    move-exception v65

    const-string v3, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5c1

    :catch_9bd
    move-exception v65

    :goto_9be
    const-string v3, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5e5

    :catch_9c9
    move-exception v65

    const-string v3, "SystemServer"

    const-string v9, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v65

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5f6

    :cond_9d5
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v3

    invoke-virtual {v3}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_637

    :catch_9de
    move-exception v65

    const-string v3, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_63a

    :catch_9ea
    move-exception v65

    const-string v3, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_63f

    :catch_9f6
    move-exception v65

    const-string v3, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_644

    :catch_a02
    move-exception v65

    const-string v3, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_647

    :catch_a0e
    move-exception v65

    const-string v3, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_67b

    :catch_a1a
    move-exception v65

    const-string v3, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_67e

    :catch_a26
    move-exception v3

    goto/16 :goto_124

    :catch_a29
    move-exception v65

    move-object/from16 v63, v64

    goto :goto_9be

    :catch_a2d
    move-exception v65

    move-object/from16 v51, v52

    goto/16 :goto_9a6

    :catch_a32
    move-exception v65

    move-object/from16 v43, v44

    goto/16 :goto_96a

    :catch_a37
    move-exception v65

    move-object/from16 v100, v101

    goto/16 :goto_946

    :catch_a3c
    move-exception v65

    move-object/from16 v112, v113

    goto/16 :goto_93a

    :catch_a41
    move-exception v65

    move-object/from16 v117, v118

    goto/16 :goto_8fe

    :catch_a46
    move-exception v65

    move-object/from16 v56, v57

    goto/16 :goto_8da

    :catch_a4b
    move-exception v65

    move-object/from16 v76, v77

    goto/16 :goto_8ce

    :catch_a50
    move-exception v65

    move-object/from16 v87, v88

    goto/16 :goto_8b6

    :catch_a55
    move-exception v65

    move-object/from16 v92, v93

    goto/16 :goto_8aa

    :catch_a5a
    move-exception v65

    move-object/from16 v106, v107

    goto/16 :goto_892

    :catch_a5f
    move-exception v65

    move-object/from16 v54, v55

    goto/16 :goto_87a

    :catch_a64
    move-exception v65

    move-object/from16 v119, v120

    goto/16 :goto_86e

    :catch_a69
    move-exception v65

    move-object/from16 v121, v122

    goto/16 :goto_862

    :catch_a6e
    move-exception v65

    goto/16 :goto_856

    :catch_a71
    move-exception v65

    move-object/from16 v12, v84

    goto/16 :goto_848

    :catch_a76
    move-exception v65

    move-object/from16 v108, v109

    goto/16 :goto_83c

    :catch_a7b
    move-exception v65

    move-object/from16 v104, v105

    goto/16 :goto_818

    :catch_a80
    move-exception v65

    move-object/from16 v59, v60

    goto/16 :goto_80c

    :catch_a85
    move-exception v65

    move-object/from16 v78, v79

    goto/16 :goto_800

    :catch_a8a
    move-exception v65

    move-object/from16 v81, v82

    goto/16 :goto_7f4

    :catch_a8f
    move-exception v3

    goto/16 :goto_277

    :catch_a92
    move-exception v65

    move-object/from16 v71, v72

    goto/16 :goto_7c4

    :catch_a97
    move-exception v65

    move-object/from16 v7, v42

    move-object/from16 v5, v45

    move-object/from16 v6, v91

    goto/16 :goto_744

    :catch_aa0
    move-exception v65

    move-object/from16 v7, v42

    move-object/from16 v5, v45

    move-object/from16 v74, v75

    goto/16 :goto_744

    :catch_aa9
    move-exception v65

    move-object/from16 v7, v42

    move-object/from16 v74, v75

    goto/16 :goto_744

    :catch_ab0
    move-exception v65

    move-object/from16 v7, v42

    move-object/from16 v114, v115

    move-object/from16 v74, v75

    goto/16 :goto_744

    :catch_ab9
    move-exception v65

    move-object/from16 v46, v47

    move-object/from16 v114, v115

    move-object/from16 v74, v75

    goto/16 :goto_744

    :catch_ac2
    move-exception v65

    move-object/from16 v48, v49

    move-object/from16 v46, v47

    move-object/from16 v114, v115

    move-object/from16 v74, v75

    goto/16 :goto_744

    :cond_acd
    move-object/from16 v8, v83

    goto/16 :goto_5f6
.end method
