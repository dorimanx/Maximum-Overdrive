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
    .line 341
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 16
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 344
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 346
    .local v0, action:Ljava/lang/String;
    const/4 v7, 0x0

    .line 348
    .local v7, queryRestart:Z
    iget-object v11, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v11, v11, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "led_screen_on"

    invoke-static {v11, v12, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    if-ne v11, v9, :cond_66

    move v3, v9

    .line 351
    .local v3, ledScreenOn:Z
    :goto_18
    const-string v11, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_40

    const-string v11, "android.intent.action.PACKAGE_RESTARTED"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_40

    const-string v11, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_40

    const-string v11, "android.intent.action.QUERY_PACKAGE_RESTART"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_40

    const-string v11, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_85

    .line 356
    :cond_40
    const/4 v5, 0x0

    .line 357
    .local v5, pkgList:[Ljava/lang/String;
    const-string v11, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_68

    .line 358
    const-string v11, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v11}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 374
    :goto_4f
    if-eqz v5, :cond_77

    array-length v11, v5

    if-lez v11, :cond_77

    .line 375
    move-object v1, v5

    .local v1, arr$:[Ljava/lang/String;
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_57
    if-ge v2, v4, :cond_77

    aget-object v6, v1, v2

    .line 376
    .local v6, pkgName:Ljava/lang/String;
    iget-object v12, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    if-nez v7, :cond_83

    move v11, v9

    :goto_60
    invoke-virtual {v12, v6, v10, v10, v11}, Lcom/android/server/NotificationManagerService;->cancelAllNotificationsInt(Ljava/lang/String;IIZ)Z

    .line 375
    add-int/lit8 v2, v2, 0x1

    goto :goto_57

    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #ledScreenOn:Z
    .end local v4           #len$:I
    .end local v5           #pkgList:[Ljava/lang/String;
    .end local v6           #pkgName:Ljava/lang/String;
    :cond_66
    move v3, v10

    .line 348
    goto :goto_18

    .line 359
    .restart local v3       #ledScreenOn:Z
    .restart local v5       #pkgList:[Ljava/lang/String;
    :cond_68
    if-eqz v7, :cond_71

    .line 360
    const-string v11, "android.intent.extra.PACKAGES"

    invoke-virtual {p2, v11}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    goto :goto_4f

    .line 362
    :cond_71
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v8

    .line 363
    .local v8, uri:Landroid/net/Uri;
    if-nez v8, :cond_78

    .line 393
    .end local v5           #pkgList:[Ljava/lang/String;
    .end local v8           #uri:Landroid/net/Uri;
    :cond_77
    :goto_77
    return-void

    .line 366
    .restart local v5       #pkgList:[Ljava/lang/String;
    .restart local v8       #uri:Landroid/net/Uri;
    :cond_78
    invoke-virtual {v8}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v6

    .line 367
    .restart local v6       #pkgName:Ljava/lang/String;
    if-eqz v6, :cond_77

    .line 370
    new-array v5, v9, [Ljava/lang/String;

    .end local v5           #pkgList:[Ljava/lang/String;
    aput-object v6, v5, v10

    .restart local v5       #pkgList:[Ljava/lang/String;
    goto :goto_4f

    .end local v8           #uri:Landroid/net/Uri;
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v4       #len$:I
    :cond_83
    move v11, v10

    .line 376
    goto :goto_60

    .line 379
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v4           #len$:I
    .end local v5           #pkgList:[Ljava/lang/String;
    .end local v6           #pkgName:Ljava/lang/String;
    :cond_85
    const-string v11, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_93

    .line 382
    iget-object v10, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static {v10, v9}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_77

    .line 383
    :cond_93
    const-string v9, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a1

    .line 384
    iget-object v9, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static {v9, v10}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_77

    .line 385
    :cond_a1
    const-string v9, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c0

    .line 386
    iget-object v9, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v10, "state"

    invoke-virtual {p2, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    sget-object v11, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    #setter for: Lcom/android/server/NotificationManagerService;->mInCall:Z
    invoke-static {v9, v10}, Lcom/android/server/NotificationManagerService;->access$1202(Lcom/android/server/NotificationManagerService;Z)Z

    .line 388
    iget-object v9, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static {v9}, Lcom/android/server/NotificationManagerService;->access$1300(Lcom/android/server/NotificationManagerService;)V

    goto :goto_77

    .line 389
    :cond_c0
    const-string v9, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_77

    if-nez v3, :cond_77

    .line 391
    iget-object v9, p0, Lcom/android/server/NotificationManagerService$3;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationLight:Lcom/android/server/LightsService$Light;
    invoke-static {v9}, Lcom/android/server/NotificationManagerService;->access$1400(Lcom/android/server/NotificationManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto :goto_77
.end method
