.class public Lcom/android/server/wm/InputManager;
.super Ljava/lang/Object;
.source "InputManager.java"

# interfaces
.implements Lcom/android/server/Watchdog$Monitor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/wm/InputManager$Callbacks;,
        Lcom/android/server/wm/InputManager$InputFilterHost;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final INPUT_EVENT_INJECTION_FAILED:I = 0x2

.field static final INPUT_EVENT_INJECTION_PERMISSION_DENIED:I = 0x1

.field static final INPUT_EVENT_INJECTION_SUCCEEDED:I = 0x0

.field static final INPUT_EVENT_INJECTION_SYNC_NONE:I = 0x0

.field static final INPUT_EVENT_INJECTION_SYNC_WAIT_FOR_FINISH:I = 0x2

.field static final INPUT_EVENT_INJECTION_SYNC_WAIT_FOR_RESULT:I = 0x1

.field static final INPUT_EVENT_INJECTION_TIMED_OUT:I = 0x3

.field public static final KEY_STATE_DOWN:I = 0x1

.field public static final KEY_STATE_UNKNOWN:I = -0x1

.field public static final KEY_STATE_UP:I = 0x0

.field public static final KEY_STATE_VIRTUAL:I = 0x2

.field static final TAG:Ljava/lang/String; = "InputManager"


# instance fields
.field private final mCallbacks:Lcom/android/server/wm/InputManager$Callbacks;

.field private final mContext:Landroid/content/Context;

.field mInputFilter:Lcom/android/server/wm/InputFilter;

.field mInputFilterHost:Lcom/android/server/wm/InputManager$InputFilterHost;

.field final mInputFilterLock:Ljava/lang/Object;

.field private final mWindowManagerService:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    .registers 7
    .parameter "context"
    .parameter "windowManagerService"

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilterLock:Ljava/lang/Object;

    .line 135
    iput-object p1, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    .line 136
    iput-object p2, p0, Lcom/android/server/wm/InputManager;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;

    .line 137
    new-instance v1, Lcom/android/server/wm/InputManager$Callbacks;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/server/wm/InputManager$Callbacks;-><init>(Lcom/android/server/wm/InputManager;Lcom/android/server/wm/InputManager$1;)V

    iput-object v1, p0, Lcom/android/server/wm/InputManager;->mCallbacks:Lcom/android/server/wm/InputManager$Callbacks;

    .line 139
    iget-object v1, p2, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-virtual {v1}, Lcom/android/server/wm/WindowManagerService$H;->getLooper()Landroid/os/Looper;

    move-result-object v0

    .line 141
    .local v0, looper:Landroid/os/Looper;
    const-string v1, "InputManager"

    const-string v2, "Initializing input manager"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/wm/InputManager;->mCallbacks:Lcom/android/server/wm/InputManager$Callbacks;

    invoke-virtual {v0}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/android/server/wm/InputManager;->nativeInit(Landroid/content/Context;Lcom/android/server/wm/InputManager$Callbacks;Landroid/os/MessageQueue;)V

    .line 145
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/server/Watchdog;->addMonitor(Lcom/android/server/Watchdog$Monitor;)V

    .line 146
    return-void
.end method

.method static synthetic access$200(Lcom/android/server/wm/InputManager;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->updateKeyLayoutFromSettings()V

    return-void
.end method

.method static synthetic access$300(Landroid/view/InputEvent;IIIII)I
    .registers 7
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 56
    invoke-static/range {p0 .. p5}, Lcom/android/server/wm/InputManager;->nativeInjectInputEvent(Landroid/view/InputEvent;IIIII)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/android/server/wm/InputManager;)Lcom/android/server/wm/WindowManagerService;
    .registers 2
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/server/wm/InputManager;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private getKeyLayoutSetting()Ljava/lang/String;
    .registers 4

    .prologue
    .line 566
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "keylayout"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 568
    .local v0, setting:Ljava/lang/String;
    return-object v0
.end method

.method private getPointerSpeedSetting(I)I
    .registers 5
    .parameter "defaultValue"

    .prologue
    .line 458
    move v0, p1

    .line 460
    .local v0, speed:I
    :try_start_1
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "pointer_speed"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_c
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_1 .. :try_end_c} :catch_e

    move-result v0

    .line 464
    :goto_d
    return v0

    .line 462
    :catch_e
    move-exception v1

    goto :goto_d
.end method

.method private getShowTouchesSetting(I)I
    .registers 5
    .parameter "defaultValue"

    .prologue
    .line 513
    move v0, p1

    .line 515
    .local v0, result:I
    :try_start_1
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "show_touches"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_c
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_1 .. :try_end_c} :catch_e

    move-result v0

    .line 519
    :goto_d
    return v0

    .line 517
    :catch_e
    move-exception v1

    goto :goto_d
.end method

.method private getStylusIconEnabled()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 492
    iget-object v2, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "stylus_icon_enabled"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_11

    :goto_10
    return v0

    :cond_11
    move v0, v1

    goto :goto_10
.end method

.method private static native nativeDump()Ljava/lang/String;
.end method

.method private static native nativeGetInputConfiguration(Landroid/content/res/Configuration;)V
.end method

.method private static native nativeGetInputDevice(I)Landroid/view/InputDevice;
.end method

.method private static native nativeGetInputDeviceIds()[I
.end method

.method private static native nativeGetKeyCodeState(III)I
.end method

.method private static native nativeGetScanCodeState(III)I
.end method

.method private static native nativeGetSwitchState(III)I
.end method

.method private static native nativeHasKeys(II[I[Z)Z
.end method

.method private static native nativeInit(Landroid/content/Context;Lcom/android/server/wm/InputManager$Callbacks;Landroid/os/MessageQueue;)V
.end method

.method private static native nativeInjectInputEvent(Landroid/view/InputEvent;IIIII)I
.end method

.method private static native nativeMonitor()V
.end method

.method private static native nativeRegisterInputChannel(Landroid/view/InputChannel;Lcom/android/server/wm/InputWindowHandle;Z)V
.end method

.method private static native nativeSetDisplayOrientation(II)V
.end method

.method private static native nativeSetDisplaySize(IIIII)V
.end method

.method private static native nativeSetFocusedApplication(Lcom/android/server/wm/InputApplicationHandle;)V
.end method

.method private static native nativeSetInputDispatchMode(ZZ)V
.end method

.method private static native nativeSetInputFilterEnabled(Z)V
.end method

.method private static native nativeSetInputWindows([Lcom/android/server/wm/InputWindowHandle;)V
.end method

.method private static native nativeSetKeyLayout(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static native nativeSetPointerSpeed(I)V
.end method

.method private static native nativeSetShowTouches(Z)V
.end method

.method private static native nativeSetStylusIconEnabled(Z)V
.end method

.method private static native nativeSetSystemUiVisibility(I)V
.end method

.method private static native nativeStart()V
.end method

.method private static native nativeTransferTouchFocus(Landroid/view/InputChannel;Landroid/view/InputChannel;)Z
.end method

.method private static native nativeUnregisterInputChannel(Landroid/view/InputChannel;)V
.end method

.method private registerKeyLayoutSettingObserver()V
    .registers 6

    .prologue
    .line 555
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "keylayout"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-instance v3, Lcom/android/server/wm/InputManager$4;

    iget-object v4, p0, Lcom/android/server/wm/InputManager;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-direct {v3, p0, v4}, Lcom/android/server/wm/InputManager$4;-><init>(Lcom/android/server/wm/InputManager;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 563
    return-void
.end method

.method private registerPointerSpeedSettingObserver()V
    .registers 6

    .prologue
    .line 447
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pointer_speed"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-instance v3, Lcom/android/server/wm/InputManager$1;

    iget-object v4, p0, Lcom/android/server/wm/InputManager;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-direct {v3, p0, v4}, Lcom/android/server/wm/InputManager$1;-><init>(Lcom/android/server/wm/InputManager;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 455
    return-void
.end method

.method private registerShowTouchesSettingObserver()V
    .registers 6

    .prologue
    .line 502
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "show_touches"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-instance v3, Lcom/android/server/wm/InputManager$3;

    iget-object v4, p0, Lcom/android/server/wm/InputManager;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-direct {v3, p0, v4}, Lcom/android/server/wm/InputManager$3;-><init>(Lcom/android/server/wm/InputManager;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 510
    return-void
.end method

.method private registerStylusIconEnabledSettingObserver()V
    .registers 6

    .prologue
    .line 481
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "stylus_icon_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    new-instance v3, Lcom/android/server/wm/InputManager$2;

    iget-object v4, p0, Lcom/android/server/wm/InputManager;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-direct {v3, p0, v4}, Lcom/android/server/wm/InputManager$2;-><init>(Lcom/android/server/wm/InputManager;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 489
    return-void
.end method

.method private setKeyLayout(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .parameter "deviceName"
    .parameter "keyLayout"

    .prologue
    .line 536
    invoke-static {p1, p2}, Lcom/android/server/wm/InputManager;->nativeSetKeyLayout(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    return-void
.end method

.method private updateKeyLayoutFromSettings()V
    .registers 8

    .prologue
    const/4 v3, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 540
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->getKeyLayoutSetting()Ljava/lang/String;

    move-result-object v1

    .line 541
    .local v1, setting:Ljava/lang/String;
    if-eqz v1, :cond_f

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_10

    .line 552
    :cond_f
    :goto_f
    return-void

    .line 544
    :cond_10
    const-string v2, ","

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 545
    .local v0, opts:[Ljava/lang/String;
    array-length v2, v0

    if-eq v2, v3, :cond_32

    .line 546
    const-string v2, "InputManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid layout setting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f

    .line 549
    :cond_32
    const-string v2, "InputManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "changing layout "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v0, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to keymap "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v0, v6

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", setting: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    aget-object v2, v0, v5

    aget-object v3, v0, v6

    invoke-direct {p0, v2, v3}, Lcom/android/server/wm/InputManager;->setKeyLayout(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;)V
    .registers 3
    .parameter "pw"

    .prologue
    .line 523
    invoke-static {}, Lcom/android/server/wm/InputManager;->nativeDump()Ljava/lang/String;

    move-result-object v0

    .line 524
    .local v0, dumpStr:Ljava/lang/String;
    if-eqz v0, :cond_9

    .line 525
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 527
    :cond_9
    return-void
.end method

.method public getInputConfiguration(Landroid/content/res/Configuration;)V
    .registers 4
    .parameter "config"

    .prologue
    .line 188
    if-nez p1, :cond_a

    .line 189
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "config must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_a
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeGetInputConfiguration(Landroid/content/res/Configuration;)V

    .line 193
    return-void
.end method

.method public getInputDevice(I)Landroid/view/InputDevice;
    .registers 3
    .parameter "deviceId"

    .prologue
    .line 381
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeGetInputDevice(I)Landroid/view/InputDevice;

    move-result-object v0

    return-object v0
.end method

.method public getInputDeviceIds()[I
    .registers 2

    .prologue
    .line 389
    invoke-static {}, Lcom/android/server/wm/InputManager;->nativeGetInputDeviceIds()[I

    move-result-object v0

    return-object v0
.end method

.method public getKeyCodeState(III)I
    .registers 5
    .parameter "deviceId"
    .parameter "sourceMask"
    .parameter "keyCode"

    .prologue
    .line 205
    invoke-static {p1, p2, p3}, Lcom/android/server/wm/InputManager;->nativeGetKeyCodeState(III)I

    move-result v0

    return v0
.end method

.method public getScanCodeState(III)I
    .registers 5
    .parameter "deviceId"
    .parameter "sourceMask"
    .parameter "scanCode"

    .prologue
    .line 218
    invoke-static {p1, p2, p3}, Lcom/android/server/wm/InputManager;->nativeGetScanCodeState(III)I

    move-result v0

    return v0
.end method

.method public getSwitchState(III)I
    .registers 5
    .parameter "deviceId"
    .parameter "sourceMask"
    .parameter "switchCode"

    .prologue
    .line 231
    invoke-static {p1, p2, p3}, Lcom/android/server/wm/InputManager;->nativeGetSwitchState(III)I

    move-result v0

    return v0
.end method

.method public hasKeys(II[I[Z)Z
    .registers 7
    .parameter "deviceId"
    .parameter "sourceMask"
    .parameter "keyCodes"
    .parameter "keyExists"

    .prologue
    .line 247
    if-nez p3, :cond_a

    .line 248
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "keyCodes must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 250
    :cond_a
    if-eqz p4, :cond_10

    array-length v0, p4

    array-length v1, p3

    if-ge v0, v1, :cond_18

    .line 251
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "keyExists must not be null and must be at least as large as keyCodes."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_18
    invoke-static {p1, p2, p3, p4}, Lcom/android/server/wm/InputManager;->nativeHasKeys(II[I[Z)Z

    move-result v0

    return v0
.end method

.method public injectInputEvent(Landroid/view/InputEvent;IIII)I
    .registers 12
    .parameter "event"
    .parameter "injectorPid"
    .parameter "injectorUid"
    .parameter "syncMode"
    .parameter "timeoutMillis"

    .prologue
    .line 361
    if-nez p1, :cond_a

    .line 362
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "event must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 364
    :cond_a
    if-ltz p2, :cond_e

    if-gez p3, :cond_16

    .line 365
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "injectorPid and injectorUid must not be negative."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 367
    :cond_16
    if-gtz p5, :cond_20

    .line 368
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "timeoutMillis must be positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 371
    :cond_20
    const/high16 v5, 0x800

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-static/range {v0 .. v5}, Lcom/android/server/wm/InputManager;->nativeInjectInputEvent(Landroid/view/InputEvent;IIIII)I

    move-result v0

    return v0
.end method

.method public monitor()V
    .registers 3

    .prologue
    .line 531
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilterLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_3 .. :try_end_4} :catchall_8

    .line 532
    invoke-static {}, Lcom/android/server/wm/InputManager;->nativeMonitor()V

    .line 533
    return-void

    .line 531
    :catchall_8
    move-exception v0

    :try_start_9
    monitor-exit v1
    :try_end_a
    .catchall {:try_start_9 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public monitorInput(Ljava/lang/String;)Landroid/view/InputChannel;
    .registers 7
    .parameter "inputChannelName"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 264
    if-nez p1, :cond_c

    .line 265
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "inputChannelName must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 268
    :cond_c
    invoke-static {p1}, Landroid/view/InputChannel;->openInputChannelPair(Ljava/lang/String;)[Landroid/view/InputChannel;

    move-result-object v0

    .line 269
    .local v0, inputChannels:[Landroid/view/InputChannel;
    aget-object v1, v0, v3

    const/4 v2, 0x0

    invoke-static {v1, v2, v4}, Lcom/android/server/wm/InputManager;->nativeRegisterInputChannel(Landroid/view/InputChannel;Lcom/android/server/wm/InputWindowHandle;Z)V

    .line 270
    aget-object v1, v0, v3

    invoke-virtual {v1}, Landroid/view/InputChannel;->dispose()V

    .line 271
    aget-object v1, v0, v4

    return-object v1
.end method

.method public registerInputChannel(Landroid/view/InputChannel;Lcom/android/server/wm/InputWindowHandle;)V
    .registers 5
    .parameter "inputChannel"
    .parameter "inputWindowHandle"

    .prologue
    .line 282
    if-nez p1, :cond_a

    .line 283
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "inputChannel must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 286
    :cond_a
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/android/server/wm/InputManager;->nativeRegisterInputChannel(Landroid/view/InputChannel;Lcom/android/server/wm/InputWindowHandle;Z)V

    .line 287
    return-void
.end method

.method public setDisplayOrientation(II)V
    .registers 5
    .parameter "displayId"
    .parameter "rotation"

    .prologue
    .line 177
    if-ltz p2, :cond_5

    const/4 v0, 0x3

    if-le p2, v0, :cond_d

    .line 178
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid rotation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_d
    invoke-static {p1, p2}, Lcom/android/server/wm/InputManager;->nativeSetDisplayOrientation(II)V

    .line 185
    return-void
.end method

.method public setDisplaySize(IIIII)V
    .registers 8
    .parameter "displayId"
    .parameter "width"
    .parameter "height"
    .parameter "externalWidth"
    .parameter "externalHeight"

    .prologue
    .line 165
    if-lez p2, :cond_8

    if-lez p3, :cond_8

    if-lez p4, :cond_8

    if-gtz p5, :cond_10

    .line 166
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid display id or dimensions."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_10
    invoke-static {p1, p2, p3, p4, p5}, Lcom/android/server/wm/InputManager;->nativeSetDisplaySize(IIIII)V

    .line 174
    return-void
.end method

.method public setFocusedApplication(Lcom/android/server/wm/InputApplicationHandle;)V
    .registers 2
    .parameter "application"

    .prologue
    .line 397
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeSetFocusedApplication(Lcom/android/server/wm/InputApplicationHandle;)V

    .line 398
    return-void
.end method

.method public setInputDispatchMode(ZZ)V
    .registers 3
    .parameter "enabled"
    .parameter "frozen"

    .prologue
    .line 401
    invoke-static {p1, p2}, Lcom/android/server/wm/InputManager;->nativeSetInputDispatchMode(ZZ)V

    .line 402
    return-void
.end method

.method public setInputFilter(Lcom/android/server/wm/InputFilter;)V
    .registers 6
    .parameter "filter"

    .prologue
    .line 313
    iget-object v2, p0, Lcom/android/server/wm/InputManager;->mInputFilterLock:Ljava/lang/Object;

    monitor-enter v2

    .line 314
    :try_start_3
    iget-object v0, p0, Lcom/android/server/wm/InputManager;->mInputFilter:Lcom/android/server/wm/InputFilter;

    .line 315
    .local v0, oldFilter:Lcom/android/server/wm/InputFilter;
    if-ne v0, p1, :cond_9

    .line 316
    monitor-exit v2

    .line 334
    :goto_8
    return-void

    .line 319
    :cond_9
    if-eqz v0, :cond_19

    .line 320
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilter:Lcom/android/server/wm/InputFilter;

    .line 321
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilterHost:Lcom/android/server/wm/InputManager$InputFilterHost;

    invoke-virtual {v1}, Lcom/android/server/wm/InputManager$InputFilterHost;->disconnectLocked()V

    .line 322
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilterHost:Lcom/android/server/wm/InputManager$InputFilterHost;

    .line 323
    invoke-virtual {v0}, Lcom/android/server/wm/InputFilter;->uninstall()V

    .line 326
    :cond_19
    if-eqz p1, :cond_2a

    .line 327
    iput-object p1, p0, Lcom/android/server/wm/InputManager;->mInputFilter:Lcom/android/server/wm/InputFilter;

    .line 328
    new-instance v1, Lcom/android/server/wm/InputManager$InputFilterHost;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/android/server/wm/InputManager$InputFilterHost;-><init>(Lcom/android/server/wm/InputManager;Lcom/android/server/wm/InputManager$1;)V

    iput-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilterHost:Lcom/android/server/wm/InputManager$InputFilterHost;

    .line 329
    iget-object v1, p0, Lcom/android/server/wm/InputManager;->mInputFilterHost:Lcom/android/server/wm/InputManager$InputFilterHost;

    invoke-virtual {p1, v1}, Lcom/android/server/wm/InputFilter;->install(Lcom/android/server/wm/InputFilter$Host;)V

    .line 332
    :cond_2a
    if-eqz p1, :cond_35

    const/4 v1, 0x1

    :goto_2d
    invoke-static {v1}, Lcom/android/server/wm/InputManager;->nativeSetInputFilterEnabled(Z)V

    .line 333
    monitor-exit v2

    goto :goto_8

    .end local v0           #oldFilter:Lcom/android/server/wm/InputFilter;
    :catchall_32
    move-exception v1

    monitor-exit v2
    :try_end_34
    .catchall {:try_start_3 .. :try_end_34} :catchall_32

    throw v1

    .line 332
    .restart local v0       #oldFilter:Lcom/android/server/wm/InputFilter;
    :cond_35
    const/4 v1, 0x0

    goto :goto_2d
.end method

.method public setInputWindows([Lcom/android/server/wm/InputWindowHandle;)V
    .registers 2
    .parameter "windowHandles"

    .prologue
    .line 393
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeSetInputWindows([Lcom/android/server/wm/InputWindowHandle;)V

    .line 394
    return-void
.end method

.method public setPointerSpeed(I)V
    .registers 4
    .parameter "speed"

    .prologue
    .line 437
    const/4 v0, -0x7

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v1, 0x7

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 438
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeSetPointerSpeed(I)V

    .line 439
    return-void
.end method

.method public setStylusIconEnabled(Z)V
    .registers 2
    .parameter "enabled"

    .prologue
    .line 472
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeSetStylusIconEnabled(Z)V

    .line 473
    return-void
.end method

.method public setSystemUiVisibility(I)V
    .registers 2
    .parameter "visibility"

    .prologue
    .line 405
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeSetSystemUiVisibility(I)V

    .line 406
    return-void
.end method

.method public start()V
    .registers 3

    .prologue
    .line 149
    const-string v0, "InputManager"

    const-string v1, "Starting input manager"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    invoke-static {}, Lcom/android/server/wm/InputManager;->nativeStart()V

    .line 152
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->registerPointerSpeedSettingObserver()V

    .line 153
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->registerShowTouchesSettingObserver()V

    .line 154
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->registerKeyLayoutSettingObserver()V

    .line 155
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->registerStylusIconEnabledSettingObserver()V

    .line 157
    invoke-virtual {p0}, Lcom/android/server/wm/InputManager;->updatePointerSpeedFromSettings()V

    .line 158
    invoke-virtual {p0}, Lcom/android/server/wm/InputManager;->updateShowTouchesFromSettings()V

    .line 159
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->updateKeyLayoutFromSettings()V

    .line 160
    invoke-virtual {p0}, Lcom/android/server/wm/InputManager;->updateStylusIconEnabledFromSettings()V

    .line 161
    return-void
.end method

.method public transferTouchFocus(Landroid/view/InputChannel;Landroid/view/InputChannel;)Z
    .registers 5
    .parameter "fromChannel"
    .parameter "toChannel"

    .prologue
    .line 422
    if-nez p1, :cond_a

    .line 423
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fromChannel must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 425
    :cond_a
    if-nez p2, :cond_14

    .line 426
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "toChannel must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 428
    :cond_14
    invoke-static {p1, p2}, Lcom/android/server/wm/InputManager;->nativeTransferTouchFocus(Landroid/view/InputChannel;Landroid/view/InputChannel;)Z

    move-result v0

    return v0
.end method

.method public unregisterInputChannel(Landroid/view/InputChannel;)V
    .registers 4
    .parameter "inputChannel"

    .prologue
    .line 294
    if-nez p1, :cond_a

    .line 295
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "inputChannel must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 298
    :cond_a
    invoke-static {p1}, Lcom/android/server/wm/InputManager;->nativeUnregisterInputChannel(Landroid/view/InputChannel;)V

    .line 299
    return-void
.end method

.method public updatePointerSpeedFromSettings()V
    .registers 3

    .prologue
    .line 442
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/server/wm/InputManager;->getPointerSpeedSetting(I)I

    move-result v0

    .line 443
    .local v0, speed:I
    invoke-virtual {p0, v0}, Lcom/android/server/wm/InputManager;->setPointerSpeed(I)V

    .line 444
    return-void
.end method

.method public updateShowTouchesFromSettings()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 497
    invoke-direct {p0, v1}, Lcom/android/server/wm/InputManager;->getShowTouchesSetting(I)I

    move-result v0

    .line 498
    .local v0, setting:I
    if-eqz v0, :cond_8

    const/4 v1, 0x1

    :cond_8
    invoke-static {v1}, Lcom/android/server/wm/InputManager;->nativeSetShowTouches(Z)V

    .line 499
    return-void
.end method

.method public updateStylusIconEnabledFromSettings()V
    .registers 2

    .prologue
    .line 476
    invoke-direct {p0}, Lcom/android/server/wm/InputManager;->getStylusIconEnabled()Z

    move-result v0

    .line 477
    .local v0, enabled:Z
    invoke-virtual {p0, v0}, Lcom/android/server/wm/InputManager;->setStylusIconEnabled(Z)V

    .line 478
    return-void
.end method
