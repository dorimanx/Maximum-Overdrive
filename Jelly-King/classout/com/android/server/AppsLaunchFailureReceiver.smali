.class public Lcom/android/server/AppsLaunchFailureReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AppsLaunchFailureReceiver.java"


# static fields
.field private static final EXPIRATION_TIME_IN_MILLISECONDS:I = 0x7530

.field private static final FAILURES_THRESHOLD:I = 0x5


# instance fields
.field private mFailuresCount:I

.field private mStartTime:J


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mStartTime:J

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15

    const/4 v11, 0x5

    const/4 v10, 0x0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v6, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_51

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mStartTime:J

    sub-long v6, v3, v6

    const-wide/16 v8, 0x7530

    cmp-long v6, v6, v8

    if-lez v6, :cond_20

    iput-wide v3, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mStartTime:J

    iput v10, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    :cond_20
    iget v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    if-gt v6, v11, :cond_50

    iget v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    iget v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    if-ne v6, v11, :cond_50

    invoke-static {}, Landroid/content/res/CustomTheme;->getSystemTheme()Landroid/content/res/CustomTheme;

    move-result-object v5

    const-string v6, "activity"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {v1}, Landroid/app/ActivityManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    new-instance v6, Landroid/content/res/CustomTheme;

    invoke-virtual {v5}, Landroid/content/res/CustomTheme;->getThemeId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Landroid/content/res/CustomTheme;->getThemePackageName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Landroid/content/res/CustomTheme;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v6, v2, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->updateConfiguration(Landroid/content/res/Configuration;)V

    :cond_50
    :goto_50
    return-void

    :cond_51
    const-string v6, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_62

    iput v10, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mStartTime:J

    goto :goto_50

    :cond_62
    const-string v6, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_72

    const-string v6, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_50

    :cond_72
    iput v10, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mFailuresCount:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/server/AppsLaunchFailureReceiver;->mStartTime:J

    goto :goto_50
.end method
