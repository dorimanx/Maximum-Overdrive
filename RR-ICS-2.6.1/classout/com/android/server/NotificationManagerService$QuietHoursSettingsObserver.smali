.class Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;
.super Landroid/database/ContentObserver;
.source "NotificationManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "QuietHoursSettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "handler"

    .prologue
    .line 1282
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    .line 1283
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 1284
    return-void
.end method


# virtual methods
.method observe()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1287
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v1, v1, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1288
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "quiet_hours_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1290
    const-string v1, "quiet_hours_start"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1292
    const-string v1, "quiet_hours_end"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1294
    const-string v1, "quiet_hours_notifications"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1296
    const-string v1, "quiet_hours_dim"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1298
    const-string v1, "mute_annoying_notifications_threshold"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1300
    invoke-virtual {p0}, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->update()V

    .line 1301
    return-void
.end method

.method public onChange(Z)V
    .registers 3
    .parameter "selfChange"

    .prologue
    .line 1304
    invoke-virtual {p0}, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->update()V

    .line 1305
    iget-object v0, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static {v0}, Lcom/android/server/NotificationManagerService;->access$1300(Lcom/android/server/NotificationManagerService;)V

    .line 1306
    return-void
.end method

.method public update()V
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1309
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    iget-object v1, v1, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1310
    .local v0, resolver:Landroid/content/ContentResolver;
    iget-object v4, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v1, "quiet_hours_enabled"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_57

    move v1, v2

    :goto_15
    #setter for: Lcom/android/server/NotificationManagerService;->mQuietHoursEnabled:Z
    invoke-static {v4, v1}, Lcom/android/server/NotificationManagerService;->access$2102(Lcom/android/server/NotificationManagerService;Z)Z

    .line 1312
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v4, "quiet_hours_start"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    #setter for: Lcom/android/server/NotificationManagerService;->mQuietHoursStart:I
    invoke-static {v1, v4}, Lcom/android/server/NotificationManagerService;->access$2202(Lcom/android/server/NotificationManagerService;I)I

    .line 1314
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v4, "quiet_hours_end"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    #setter for: Lcom/android/server/NotificationManagerService;->mQuietHoursEnd:I
    invoke-static {v1, v4}, Lcom/android/server/NotificationManagerService;->access$2302(Lcom/android/server/NotificationManagerService;I)I

    .line 1316
    iget-object v4, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v1, "quiet_hours_notifications"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_59

    move v1, v2

    :goto_39
    #setter for: Lcom/android/server/NotificationManagerService;->mQuietHoursMute:Z
    invoke-static {v4, v1}, Lcom/android/server/NotificationManagerService;->access$2402(Lcom/android/server/NotificationManagerService;Z)Z

    .line 1318
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v4, "quiet_hours_dim"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_5b

    :goto_46
    #setter for: Lcom/android/server/NotificationManagerService;->mQuietHoursDim:Z
    invoke-static {v1, v2}, Lcom/android/server/NotificationManagerService;->access$2502(Lcom/android/server/NotificationManagerService;Z)Z

    .line 1320
    iget-object v1, p0, Lcom/android/server/NotificationManagerService$QuietHoursSettingsObserver;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v2, "mute_annoying_notifications_threshold"

    const-wide/16 v3, 0x0

    invoke-static {v0, v2, v3, v4}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v2

    #setter for: Lcom/android/server/NotificationManagerService;->mAnnoyingNotificationThreshold:J
    invoke-static {v1, v2, v3}, Lcom/android/server/NotificationManagerService;->access$2602(Lcom/android/server/NotificationManagerService;J)J

    .line 1322
    return-void

    :cond_57
    move v1, v3

    .line 1310
    goto :goto_15

    :cond_59
    move v1, v3

    .line 1316
    goto :goto_39

    :cond_5b
    move v2, v3

    .line 1318
    goto :goto_46
.end method
