.class Lcom/android/server/PowerManagerService$SettingsObserver;
.super Ljava/lang/Object;
.source "PowerManagerService.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PowerManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/PowerManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 482
    iput-object p1, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/PowerManagerService;Lcom/android/server/PowerManagerService$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 482
    invoke-direct {p0, p1}, Lcom/android/server/PowerManagerService$SettingsObserver;-><init>(Lcom/android/server/PowerManagerService;)V

    return-void
.end method

.method private getFloat(Ljava/lang/String;F)F
    .registers 6
    .parameter "name"
    .parameter "defValue"

    .prologue
    .line 490
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mSettings:Landroid/content/ContentQueryMap;
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$1200(Lcom/android/server/PowerManagerService;)Landroid/content/ContentQueryMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentQueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v1

    .line 491
    .local v1, values:Landroid/content/ContentValues;
    if-eqz v1, :cond_19

    const-string v2, "value"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->getAsFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .line 492
    .local v0, fVal:Ljava/lang/Float;
    :goto_12
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p2

    .end local p2
    :cond_18
    return p2

    .line 491
    .end local v0           #fVal:Ljava/lang/Float;
    .restart local p2
    :cond_19
    const/4 v0, 0x0

    goto :goto_12
.end method

.method private getInt(Ljava/lang/String;I)I
    .registers 6
    .parameter "name"
    .parameter "defValue"

    .prologue
    .line 484
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mSettings:Landroid/content/ContentQueryMap;
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$1200(Lcom/android/server/PowerManagerService;)Landroid/content/ContentQueryMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentQueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v1

    .line 485
    .local v1, values:Landroid/content/ContentValues;
    if-eqz v1, :cond_19

    const-string v2, "value"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 486
    .local v0, iVal:Ljava/lang/Integer;
    :goto_12
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .end local p2
    :cond_18
    return p2

    .line 485
    .end local v0           #iVal:Ljava/lang/Integer;
    .restart local p2
    :cond_19
    const/4 v0, 0x0

    goto :goto_12
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 9
    .parameter "o"
    .parameter "arg"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 497
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLocks:Lcom/android/server/PowerManagerService$LockList;
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$500(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$LockList;

    move-result-object v3

    monitor-enter v3

    .line 499
    :try_start_9
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const-string v4, "stay_on_while_plugged_in"

    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Lcom/android/server/PowerManagerService$SettingsObserver;->getInt(Ljava/lang/String;I)I

    move-result v4

    #setter for: Lcom/android/server/PowerManagerService;->mStayOnConditions:I
    invoke-static {v2, v4}, Lcom/android/server/PowerManagerService;->access$1302(Lcom/android/server/PowerManagerService;I)I

    .line 501
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->updateWakeLockLocked()V
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$800(Lcom/android/server/PowerManagerService;)V

    .line 504
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const-string v4, "screen_off_timeout"

    const/16 v5, 0x3a98

    invoke-direct {p0, v4, v5}, Lcom/android/server/PowerManagerService$SettingsObserver;->getInt(Ljava/lang/String;I)I

    move-result v4

    #setter for: Lcom/android/server/PowerManagerService;->mScreenOffTimeoutSetting:I
    invoke-static {v2, v4}, Lcom/android/server/PowerManagerService;->access$1402(Lcom/android/server/PowerManagerService;I)I

    .line 509
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->updateLightSettings()V
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$1500(Lcom/android/server/PowerManagerService;)V

    .line 512
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const-string v4, "screen_brightness_mode"

    const/4 v5, 0x0

    invoke-direct {p0, v4, v5}, Lcom/android/server/PowerManagerService$SettingsObserver;->getInt(Ljava/lang/String;I)I

    move-result v4

    #calls: Lcom/android/server/PowerManagerService;->setScreenBrightnessMode(I)V
    invoke-static {v2, v4}, Lcom/android/server/PowerManagerService;->access$1600(Lcom/android/server/PowerManagerService;I)V

    .line 516
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->setScreenOffTimeoutsLocked()V
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$1700(Lcom/android/server/PowerManagerService;)V

    .line 520
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v4, 0x0

    #setter for: Lcom/android/server/PowerManagerService;->mAnimationSetting:I
    invoke-static {v2, v4}, Lcom/android/server/PowerManagerService;->access$1802(Lcom/android/server/PowerManagerService;I)I

    .line 521
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/PowerManagerService;->access$1900(Lcom/android/server/PowerManagerService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x1110035

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-eqz v2, :cond_90

    .line 522
    iget-object v4, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const-string v2, "crt_on_animation"

    const/4 v5, 0x0

    invoke-direct {p0, v2, v5}, Lcom/android/server/PowerManagerService$SettingsObserver;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_92

    move v2, v0

    :goto_62
    #setter for: Lcom/android/server/PowerManagerService;->mAnimateCrtOn:Z
    invoke-static {v4, v2}, Lcom/android/server/PowerManagerService;->access$2002(Lcom/android/server/PowerManagerService;Z)Z

    .line 523
    iget-object v2, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const-string v4, "crt_off_animation"

    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Lcom/android/server/PowerManagerService$SettingsObserver;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v0, :cond_94

    :goto_70
    #setter for: Lcom/android/server/PowerManagerService;->mAnimateCrtOff:Z
    invoke-static {v2, v0}, Lcom/android/server/PowerManagerService;->access$2102(Lcom/android/server/PowerManagerService;Z)Z

    .line 524
    iget-object v0, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAnimateCrtOff:Z
    invoke-static {v0}, Lcom/android/server/PowerManagerService;->access$2100(Lcom/android/server/PowerManagerService;)Z

    move-result v0

    if-eqz v0, :cond_82

    .line 525
    iget-object v0, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const/16 v1, 0x10

    invoke-static {v0, v1}, Lcom/android/server/PowerManagerService;->access$1876(Lcom/android/server/PowerManagerService;I)I

    .line 526
    :cond_82
    iget-object v0, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mAnimateCrtOn:Z
    invoke-static {v0}, Lcom/android/server/PowerManagerService;->access$2000(Lcom/android/server/PowerManagerService;)Z

    move-result v0

    if-eqz v0, :cond_90

    .line 527
    iget-object v0, p0, Lcom/android/server/PowerManagerService$SettingsObserver;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/PowerManagerService;->access$1876(Lcom/android/server/PowerManagerService;I)I

    .line 537
    :cond_90
    monitor-exit v3

    .line 538
    return-void

    :cond_92
    move v2, v1

    .line 522
    goto :goto_62

    :cond_94
    move v0, v1

    .line 523
    goto :goto_70

    .line 537
    :catchall_96
    move-exception v0

    monitor-exit v3
    :try_end_98
    .catchall {:try_start_9 .. :try_end_98} :catchall_96

    throw v0
.end method
