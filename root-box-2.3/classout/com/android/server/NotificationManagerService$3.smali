.class Lcom/android/server/NotificationManagerService$3;
.super Landroid/content/BroadcastReceiver;
.source "NotificationManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 529
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 19
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 532
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 534
    .local v1, action:Ljava/lang/String;
    const/4 v10, 0x0

    .line 535
    .local v10, queryRestart:Z
    const/4 v7, 0x0

    .line 537
    .local v7, packageChanged:Z
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v12, v12, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    const-string v13, "led_screen_on"

    const/4 v14, 0x0

    invoke-static {v12, v13, v14}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_6f

    const/4 v5, 0x1

    .line 540
    .local v5, ledScreenOn:Z
    :goto_1b
    const-string v12, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_43

    const-string v12, "android.intent.action.PACKAGE_RESTARTED"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_43

    const-string v12, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_43

    const-string v12, "android.intent.action.QUERY_PACKAGE_RESTART"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_43

    const-string v12, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a7

    .line 545
    :cond_43
    const/4 v8, 0x0

    .line 546
    .local v8, pkgList:[Ljava/lang/String;
    const-string v12, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_71

    .line 547
    const-string v12, "android.intent.extra.changed_package_list"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 573
    :goto_54
    if-eqz v8, :cond_82

    array-length v12, v8

    if-lez v12, :cond_82

    .line 574
    move-object v2, v8

    .local v2, arr$:[Ljava/lang/String;
    array-length v6, v2

    .local v6, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_5c
    if-ge v4, v6, :cond_82

    aget-object v9, v2, v4

    .line 575
    .local v9, pkgName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v14, 0x0

    const/4 v15, 0x0

    if-nez v10, :cond_a5

    const/4 v12, 0x1

    :goto_69
    invoke-virtual {v13, v9, v14, v15, v12}, Lcom/android/server/NotificationManagerService;->cancelAllNotificationsInt(Ljava/lang/String;IIZ)Z

    .line 574
    add-int/lit8 v4, v4, 0x1

    goto :goto_5c

    .line 537
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #ledScreenOn:Z
    .end local v6           #len$:I
    .end local v8           #pkgList:[Ljava/lang/String;
    .end local v9           #pkgName:Ljava/lang/String;
    :cond_6f
    const/4 v5, 0x0

    goto :goto_1b

    .line 548
    .restart local v5       #ledScreenOn:Z
    .restart local v8       #pkgList:[Ljava/lang/String;
    :cond_71
    if-eqz v10, :cond_7c

    .line 549
    const-string v12, "android.intent.extra.PACKAGES"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    goto :goto_54

    .line 551
    :cond_7c
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v11

    .line 552
    .local v11, uri:Landroid/net/Uri;
    if-nez v11, :cond_83

    .line 594
    .end local v8           #pkgList:[Ljava/lang/String;
    .end local v11           #uri:Landroid/net/Uri;
    :cond_82
    :goto_82
    return-void

    .line 555
    .restart local v8       #pkgList:[Ljava/lang/String;
    .restart local v11       #uri:Landroid/net/Uri;
    :cond_83
    invoke-virtual {v11}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v9

    .line 556
    .restart local v9       #pkgName:Ljava/lang/String;
    if-eqz v9, :cond_82

    .line 559
    if-eqz v7, :cond_9e

    .line 562
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v12, v12, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    invoke-virtual {v12, v9}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I

    move-result v3

    .line 564
    .local v3, enabled:I
    const/4 v12, 0x1

    if-eq v3, v12, :cond_82

    if-eqz v3, :cond_82

    .line 569
    .end local v3           #enabled:I
    :cond_9e
    const/4 v12, 0x1

    new-array v8, v12, [Ljava/lang/String;

    .end local v8           #pkgList:[Ljava/lang/String;
    const/4 v12, 0x0

    aput-object v9, v8, v12

    .restart local v8       #pkgList:[Ljava/lang/String;
    goto :goto_54

    .line 575
    .end local v11           #uri:Landroid/net/Uri;
    .restart local v2       #arr$:[Ljava/lang/String;
    .restart local v4       #i$:I
    .restart local v6       #len$:I
    :cond_a5
    const/4 v12, 0x0

    goto :goto_69

    .line 578
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v6           #len$:I
    .end local v8           #pkgList:[Ljava/lang/String;
    .end local v9           #pkgName:Ljava/lang/String;
    :cond_a7
    const-string v12, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b8

    .line 583
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v13, 0x1

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static {v12, v13}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_82

    .line 584
    :cond_b8
    const-string v12, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c9

    .line 585
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    const/4 v13, 0x0

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static {v12, v13}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_82

    .line 586
    :cond_c9
    const-string v12, "android.intent.action.PHONE_STATE"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_ee

    .line 587
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v13, "state"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    #setter for: Lcom/android/server/NotificationManagerService;->mInCall:Z
    invoke-static {v12, v13}, Lcom/android/server/NotificationManagerService;->access$1202(Lcom/android/server/NotificationManagerService;Z)Z

    .line 589
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static {v12}, Lcom/android/server/NotificationManagerService;->access$1300(Lcom/android/server/NotificationManagerService;)V

    goto :goto_82

    .line 590
    :cond_ee
    const-string v12, "android.intent.action.USER_PRESENT"

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_82

    if-nez v5, :cond_82

    .line 592
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationLight:Lcom/android/server/LightsService$Light;
    invoke-static {v12}, Lcom/android/server/NotificationManagerService;->access$1400(Lcom/android/server/NotificationManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto/16 :goto_82
.end method
