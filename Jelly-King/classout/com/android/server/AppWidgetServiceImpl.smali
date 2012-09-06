.class Lcom/android/server/AppWidgetServiceImpl;
.super Ljava/lang/Object;
.source "AppWidgetServiceImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;,
        Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;,
        Lcom/android/server/AppWidgetServiceImpl$Host;,
        Lcom/android/server/AppWidgetServiceImpl$Provider;
    }
.end annotation


# static fields
.field private static final MIN_UPDATE_PERIOD:I = 0x1b7740

.field private static final SETTINGS_FILENAME:Ljava/lang/String; = "appwidgets.xml"

.field private static final TAG:Ljava/lang/String; = "AppWidgetServiceImpl"


# instance fields
.field mAlarmManager:Landroid/app/AlarmManager;

.field final mAppWidgetIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;",
            ">;"
        }
    .end annotation
.end field

.field private final mBoundRemoteViewsServices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/content/Intent$FilterComparison;",
            ">;",
            "Landroid/content/ServiceConnection;",
            ">;"
        }
    .end annotation
.end field

.field mContext:Landroid/content/Context;

.field mDeletedHosts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppWidgetServiceImpl$Host;",
            ">;"
        }
    .end annotation
.end field

.field mDeletedProviders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppWidgetServiceImpl$Provider;",
            ">;"
        }
    .end annotation
.end field

.field mHosts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppWidgetServiceImpl$Host;",
            ">;"
        }
    .end annotation
.end field

.field mInstalledProviders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppWidgetServiceImpl$Provider;",
            ">;"
        }
    .end annotation
.end field

.field mLocale:Ljava/util/Locale;

.field mMaxWidgetBitmapMemory:I

.field mNextAppWidgetId:I

.field mPackagesWithBindWidgetPermission:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mPm:Landroid/content/pm/IPackageManager;

.field private final mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/Intent$FilterComparison;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field mSafeMode:Z

.field mStateLoaded:Z

.field mUserId:I


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mNextAppWidgetId:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedProviders:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedHosts:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mPm:Landroid/content/pm/IPackageManager;

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    iput-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mAlarmManager:Landroid/app/AlarmManager;

    iput p2, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->computeMaximumWidgetBitmapMemory()V

    return-void
.end method

.method private bindAppWidgetIdImpl(ILandroid/content/ComponentName;)V
    .registers 12

    const/4 v7, 0x1

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    :try_start_5
    iget-object v6, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v6
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_1c

    :try_start_8
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v0

    if-nez v0, :cond_21

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v7, "bad appWidgetId"

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :catchall_19
    move-exception v5

    monitor-exit v6
    :try_end_1b
    .catchall {:try_start_8 .. :try_end_1b} :catchall_19

    :try_start_1b
    throw v5
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1c

    :catchall_1c
    move-exception v5

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5

    :cond_21
    :try_start_21
    iget-object v5, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v5, :cond_4e

    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "appWidgetId "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " already bound to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v8, v8, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v8, v8, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_4e
    invoke-virtual {p0, p2}, Lcom/android/server/AppWidgetServiceImpl;->lookupProviderLocked(Landroid/content/ComponentName;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v4

    if-nez v4, :cond_6d

    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "not a appwidget provider: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_6d
    iget-boolean v5, v4, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    if-eqz v5, :cond_8a

    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "can\'t bind to a 3rd party provider in safe mode: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_8a
    iput-object v4, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v5, v4, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, v4, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v7, :cond_9c

    invoke-virtual {p0, v4}, Lcom/android/server/AppWidgetServiceImpl;->sendEnableIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    :cond_9c
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v7, 0x0

    aput p1, v5, v7

    invoke-virtual {p0, v4, v5}, Lcom/android/server/AppWidgetServiceImpl;->sendUpdateIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V

    invoke-static {v4}, Lcom/android/server/AppWidgetServiceImpl;->getAppWidgetIds(Lcom/android/server/AppWidgetServiceImpl$Provider;)[I

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/android/server/AppWidgetServiceImpl;->registerForBroadcastsLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    monitor-exit v6
    :try_end_b0
    .catchall {:try_start_21 .. :try_end_b0} :catchall_19

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void
.end method

.method private callerHasBindAppWidgetPermission(Ljava/lang/String;)Z
    .registers 6

    const/4 v2, 0x0

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    :try_start_5
    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->getUidForPackage(Ljava/lang/String;)I

    move-result v3

    invoke-static {v0, v3}, Landroid/os/UserId;->isSameApp(II)Z
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_c} :catch_10

    move-result v3

    if-nez v3, :cond_12

    :goto_f
    return v2

    :catch_10
    move-exception v1

    goto :goto_f

    :cond_12
    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_15
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    monitor-exit v3

    goto :goto_f

    :catchall_20
    move-exception v2

    monitor-exit v3
    :try_end_22
    .catchall {:try_start_15 .. :try_end_22} :catchall_20

    throw v2
.end method

.method private decrementAppWidgetServiceRefCount(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V
    .registers 6

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent$FilterComparison;

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    iget v3, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-virtual {v2}, Landroid/content/Intent$FilterComparison;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/android/server/AppWidgetServiceImpl;->destroyRemoteViewsService(Landroid/content/Intent;Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_a

    :cond_3b
    return-void
.end method

.method private destroyRemoteViewsService(Landroid/content/Intent;Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V
    .registers 9

    new-instance v0, Lcom/android/server/AppWidgetServiceImpl$1;

    invoke-direct {v0, p0, p1}, Lcom/android/server/AppWidgetServiceImpl$1;-><init>(Lcom/android/server/AppWidgetServiceImpl;Landroid/content/Intent;)V

    iget-object v4, p2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget v4, v4, Lcom/android/server/AppWidgetServiceImpl$Provider;->uid:I

    invoke-static {v4}, Landroid/os/UserId;->getUserId(I)I

    move-result v3

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    :try_start_11
    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const/4 v5, 0x1

    invoke-virtual {v4, p1, v0, v5, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z
    :try_end_17
    .catchall {:try_start_11 .. :try_end_17} :catchall_1b

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_1b
    move-exception v4

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4
.end method

.method private dumpAppWidgetId(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;ILjava/io/PrintWriter;)V
    .registers 5

    const-string v0, "  ["

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, "] id="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    const-string v0, "    hostId="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const/16 v0, 0x20

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(C)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/16 v0, 0x2f

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(C)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v0, :cond_4c

    const-string v0, "    provider="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_4c
    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    if-eqz v0, :cond_5c

    const-string v0, "    host.callbacks="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_5c
    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->views:Landroid/widget/RemoteViews;

    if-eqz v0, :cond_6a

    const-string v0, "    views="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->views:Landroid/widget/RemoteViews;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_6a
    return-void
.end method

.method private dumpHost(Lcom/android/server/AppWidgetServiceImpl$Host;ILjava/io/PrintWriter;)V
    .registers 5

    const-string v0, "  ["

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, "] hostId="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const/16 v0, 0x20

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(C)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/16 v0, 0x2f

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(C)V

    iget v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const/16 v0, 0x3a

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(C)V

    const-string v0, "    callbacks="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    const-string v0, "    instances.size="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " zombie="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->zombie:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    return-void
.end method

.method private dumpProvider(Lcom/android/server/AppWidgetServiceImpl$Provider;ILjava/io/PrintWriter;)V
    .registers 6

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    const-string v1, "  ["

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, "] provider "

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/16 v1, 0x3a

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(C)V

    const-string v1, "    min=("

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, "x"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, ")   minResize=("

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, "x"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, ") updatePeriodMillis="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->updatePeriodMillis:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, " resizeMode="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, " autoAdvanceViewId="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, " initialLayout=#"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->initialLayout:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, " zombie="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Z)V

    return-void
.end method

.method private ensureStateLoadedLocked()V
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mStateLoaded:Z

    if-nez v0, :cond_d

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->loadAppWidgetList()V

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->loadStateLocked()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mStateLoaded:Z

    :cond_d
    return-void
.end method

.method static getAppWidgetIds(Lcom/android/server/AppWidgetServiceImpl$Provider;)[I
    .registers 5

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v0, v2, [I

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v2, :cond_1a

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    iget v3, v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    aput v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_1a
    return-object v0
.end method

.method static getSettingsFile(I)Ljava/io/File;
    .registers 4

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/data/system/users/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "appwidgets.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private incrementAppWidgetServiceRefCount(ILandroid/content/Intent$FilterComparison;)V
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    :goto_11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_19
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11
.end method

.method private parseProviderInfoXml(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;)Lcom/android/server/AppWidgetServiceImpl$Provider;
    .registers 20

    const/4 v7, 0x0

    move-object/from16 v0, p2

    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    const/4 v9, 0x0

    :try_start_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    const-string v15, "android.appwidget.provider"

    invoke-virtual {v1, v14, v15}, Landroid/content/pm/ActivityInfo;->loadXmlMetaData(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/res/XmlResourceParser;

    move-result-object v9

    if-nez v9, :cond_3d

    const-string v14, "AppWidgetServiceImpl"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "No android.appwidget.provider meta-data for AppWidget provider \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x27

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_36
    .catchall {:try_start_6 .. :try_end_36} :catchall_167
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_36} :catch_13e

    const/4 v8, 0x0

    if-eqz v9, :cond_3c

    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_3c
    :goto_3c
    return-object v8

    :cond_3d
    :try_start_3d
    invoke-static {v9}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    :cond_41
    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v12

    const/4 v14, 0x1

    if-eq v12, v14, :cond_4b

    const/4 v14, 0x2

    if-ne v12, v14, :cond_41

    :cond_4b
    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v14, "appwidget-provider"

    invoke-virtual {v14, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_7e

    const-string v14, "AppWidgetServiceImpl"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Meta-data does not start with appwidget-provider tag for AppWidget provider \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x27

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_77
    .catchall {:try_start_3d .. :try_end_77} :catchall_167
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_77} :catch_13e

    const/4 v8, 0x0

    if-eqz v9, :cond_3c

    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->close()V

    goto :goto_3c

    :cond_7e
    :try_start_7e
    new-instance v8, Lcom/android/server/AppWidgetServiceImpl$Provider;

    invoke-direct {v8}, Lcom/android/server/AppWidgetServiceImpl$Provider;-><init>()V
    :try_end_83
    .catchall {:try_start_7e .. :try_end_83} :catchall_167
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_83} :catch_13e

    :try_start_83
    new-instance v5, Landroid/appwidget/AppWidgetProviderInfo;

    invoke-direct {v5}, Landroid/appwidget/AppWidgetProviderInfo;-><init>()V

    iput-object v5, v8, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v0, p1

    iput-object v0, v5, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget-object v14, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v14, v14, Landroid/content/pm/ApplicationInfo;->uid:I

    iput v14, v8, Lcom/android/server/AppWidgetServiceImpl$Provider;->uid:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    iget-object v15, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v14, v15}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object v10

    sget-object v14, Lcom/android/internal/R$styleable;->AppWidgetProviderInfo:[I

    invoke-virtual {v10, v2, v14}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v11

    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v13

    if-eqz v13, :cond_133

    iget v14, v13, Landroid/util/TypedValue;->data:I

    :goto_b1
    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v13

    if-eqz v13, :cond_136

    iget v14, v13, Landroid/util/TypedValue;->data:I

    :goto_bc
    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    const/16 v14, 0x8

    invoke-virtual {v11, v14}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v13

    if-eqz v13, :cond_138

    iget v14, v13, Landroid/util/TypedValue;->data:I

    :goto_c8
    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    const/16 v14, 0x9

    invoke-virtual {v11, v14}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v13

    if-eqz v13, :cond_13b

    iget v14, v13, Landroid/util/TypedValue;->data:I

    :goto_d4
    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    const/4 v14, 0x2

    const/4 v15, 0x0

    invoke-virtual {v11, v14, v15}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v14

    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->updatePeriodMillis:I

    const/4 v14, 0x3

    const/4 v15, 0x0

    invoke-virtual {v11, v14, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->initialLayout:I

    const/4 v14, 0x4

    invoke-virtual {v11, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_f8

    new-instance v14, Landroid/content/ComponentName;

    invoke-virtual/range {p1 .. p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    :cond_f8
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    invoke-virtual {v1, v14}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    invoke-virtual/range {p2 .. p2}, Landroid/content/pm/ResolveInfo;->getIconResource()I

    move-result v14

    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    const/4 v14, 0x5

    const/4 v15, 0x0

    invoke-virtual {v11, v14, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    const/4 v14, 0x6

    const/4 v15, -0x1

    invoke-virtual {v11, v14, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    const/4 v14, 0x7

    const/4 v15, 0x0

    invoke-virtual {v11, v14, v15}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v14

    iput v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_12b
    .catchall {:try_start_83 .. :try_end_12b} :catchall_16e
    .catch Ljava/lang/Exception; {:try_start_83 .. :try_end_12b} :catch_171

    if-eqz v9, :cond_130

    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_130
    move-object v7, v8

    goto/16 :goto_3c

    :cond_133
    const/4 v14, 0x0

    goto/16 :goto_b1

    :cond_136
    const/4 v14, 0x0

    goto :goto_bc

    :cond_138
    :try_start_138
    iget v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    goto :goto_c8

    :cond_13b
    iget v14, v5, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I
    :try_end_13d
    .catchall {:try_start_138 .. :try_end_13d} :catchall_16e
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_13d} :catch_171

    goto :goto_d4

    :catch_13e
    move-exception v4

    :goto_13f
    :try_start_13f
    const-string v14, "AppWidgetServiceImpl"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "XML parsing failed for AppWidget provider \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x27

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_15f
    .catchall {:try_start_13f .. :try_end_15f} :catchall_167

    const/4 v8, 0x0

    if-eqz v9, :cond_3c

    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->close()V

    goto/16 :goto_3c

    :catchall_167
    move-exception v14

    :goto_168
    if-eqz v9, :cond_16d

    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_16d
    throw v14

    :catchall_16e
    move-exception v14

    move-object v7, v8

    goto :goto_168

    :catch_171
    move-exception v4

    move-object v7, v8

    goto :goto_13f
.end method

.method private unbindAppWidgetRemoteViewsServicesLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V
    .registers 7

    iget v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v0, :cond_c

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;

    invoke-virtual {v1}, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;->disconnect()V

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_c

    :cond_36
    invoke-direct {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->decrementAppWidgetServiceRefCount(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V

    return-void
.end method


# virtual methods
.method addProviderLocked(Landroid/content/pm/ResolveInfo;)Z
    .registers 7

    const/4 v1, 0x0

    iget-object v2, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x4

    and-int/2addr v2, v3

    if-eqz v2, :cond_d

    :cond_c
    :goto_c
    return v1

    :cond_d
    iget-object v2, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v2}, Landroid/content/pm/ActivityInfo;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_c

    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v4, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v2, p1}, Lcom/android/server/AppWidgetServiceImpl;->parseProviderInfoXml(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v0

    if-eqz v0, :cond_c

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    goto :goto_c
.end method

.method addProvidersForPackageLocked(Ljava/lang/String;)V
    .registers 13

    new-instance v4, Landroid/content/Intent;

    const-string v7, "android.appwidget.action.APPWIDGET_UPDATE"

    invoke-direct {v4, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :try_start_a
    iget-object v7, p0, Lcom/android/server/AppWidgetServiceImpl;->mPm:Landroid/content/pm/IPackageManager;

    iget-object v8, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x80

    iget v10, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-interface {v7, v4, v8, v9, v10}, Landroid/content/pm/IPackageManager;->queryIntentReceivers(Landroid/content/Intent;Ljava/lang/String;II)Ljava/util/List;
    :try_end_1d
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_1d} :catch_38

    move-result-object v2

    if-nez v2, :cond_3a

    const/4 v0, 0x0

    :goto_21
    const/4 v3, 0x0

    :goto_22
    if-ge v3, v0, :cond_39

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/ResolveInfo;

    iget-object v1, v6, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v8, 0x4

    and-int/2addr v7, v8

    if-eqz v7, :cond_3f

    :cond_35
    :goto_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    :catch_38
    move-exception v5

    :cond_39
    return-void

    :cond_3a
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_21

    :cond_3f
    iget-object v7, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_35

    invoke-virtual {p0, v6}, Lcom/android/server/AppWidgetServiceImpl;->addProviderLocked(Landroid/content/pm/ResolveInfo;)Z

    goto :goto_35
.end method

.method public allocateAppWidgetId(Ljava/lang/String;I)I
    .registers 9

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->enforceCallingUid(Ljava/lang/String;)I

    move-result v1

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v5

    :try_start_7
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    iget v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mNextAppWidgetId:I

    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mNextAppWidgetId:I

    invoke-virtual {p0, v1, p1, p2}, Lcom/android/server/AppWidgetServiceImpl;->lookupOrAddHostLocked(ILjava/lang/String;I)Lcom/android/server/AppWidgetServiceImpl$Host;

    move-result-object v2

    new-instance v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    invoke-direct {v3}, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;-><init>()V

    iput v0, v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    iput-object v2, v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v4, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    monitor-exit v5

    return v0

    :catchall_2c
    move-exception v4

    monitor-exit v5
    :try_end_2e
    .catchall {:try_start_7 .. :try_end_2e} :catchall_2c

    throw v4
.end method

.method public bindAppWidgetId(ILandroid/content/ComponentName;)V
    .registers 7

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.BIND_APPWIDGET"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bindAppWidgetId appWidgetId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " provider="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lcom/android/server/AppWidgetServiceImpl;->bindAppWidgetIdImpl(ILandroid/content/ComponentName;)V

    return-void
.end method

.method public bindAppWidgetIdIfAllowed(Ljava/lang/String;ILandroid/content/ComponentName;)Z
    .registers 8

    :try_start_0
    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.BIND_APPWIDGET"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingPermission(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_8} :catch_d

    :cond_8
    invoke-direct {p0, p2, p3}, Lcom/android/server/AppWidgetServiceImpl;->bindAppWidgetIdImpl(ILandroid/content/ComponentName;)V

    const/4 v1, 0x1

    :goto_c
    return v1

    :catch_d
    move-exception v0

    invoke-direct {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->callerHasBindAppWidgetPermission(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    const/4 v1, 0x0

    goto :goto_c
.end method

.method public bindRemoteViewsService(ILandroid/content/Intent;Landroid/os/IBinder;)V
    .registers 21

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v14

    :try_start_5
    invoke-direct/range {p0 .. p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual/range {p0 .. p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v7

    if-nez v7, :cond_19

    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v15, "bad appWidgetId"

    invoke-direct {v13, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    :catchall_16
    move-exception v13

    monitor-exit v14
    :try_end_18
    .catchall {:try_start_5 .. :try_end_18} :catchall_16

    throw v13

    :cond_19
    :try_start_19
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_16

    move-result-object v2

    :try_start_1d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    const/16 v15, 0x1000

    invoke-virtual {v13, v2, v15}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v9

    const-string v13, "android.permission.BIND_REMOTEVIEWS"

    iget-object v15, v9, Landroid/content/pm/ServiceInfo;->permission:Ljava/lang/String;

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_68

    new-instance v13, Ljava/lang/SecurityException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Selected service does not require android.permission.BIND_REMOTEVIEWS: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v15}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_4e
    .catchall {:try_start_1d .. :try_end_4e} :catchall_16
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1d .. :try_end_4e} :catch_4e

    :catch_4e
    move-exception v5

    :try_start_4f
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unknown component "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    :cond_68
    const/4 v3, 0x0

    new-instance v6, Landroid/content/Intent$FilterComparison;

    move-object/from16 v0, p2

    invoke-direct {v6, v0}, Landroid/content/Intent$FilterComparison;-><init>(Landroid/content/Intent;)V

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v13, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v13, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9d

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v13, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;

    invoke-virtual {v3}, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;->disconnect()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v13, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v13, v8}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9d
    move-object v4, v3

    iget-object v13, v7, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget v13, v13, Lcom/android/server/AppWidgetServiceImpl$Provider;->uid:I

    invoke-static {v13}, Landroid/os/UserId;->getUserId(I)I

    move-result v12

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_a9
    .catchall {:try_start_4f .. :try_end_a9} :catchall_16

    move-result-wide v10

    :try_start_aa
    new-instance v3, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;

    move-object/from16 v0, p3

    invoke-direct {v3, v8, v0}, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;-><init>(Landroid/util/Pair;Landroid/os/IBinder;)V
    :try_end_b1
    .catchall {:try_start_aa .. :try_end_b1} :catchall_ce

    :try_start_b1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const/4 v15, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v13, v0, v3, v15, v12}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v13, v8, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c2
    .catchall {:try_start_b1 .. :try_end_c2} :catchall_d4

    :try_start_c2
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lcom/android/server/AppWidgetServiceImpl;->incrementAppWidgetServiceRefCount(ILandroid/content/Intent$FilterComparison;)V

    monitor-exit v14

    return-void

    :catchall_ce
    move-exception v13

    move-object v3, v4

    :goto_d0
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v13
    :try_end_d4
    .catchall {:try_start_c2 .. :try_end_d4} :catchall_16

    :catchall_d4
    move-exception v13

    goto :goto_d0
.end method

.method canAccessAppWidgetId(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;I)Z
    .registers 6

    const/4 v0, 0x1

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v1, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I

    if-ne v1, p2, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v1, :cond_12

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget v1, v1, Lcom/android/server/AppWidgetServiceImpl$Provider;->uid:I

    if-eq v1, p2, :cond_7

    :cond_12
    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.BIND_APPWIDGET"

    invoke-virtual {v1, v2}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_7

    const/4 v0, 0x0

    goto :goto_7
.end method

.method cancelBroadcasts(Lcom/android/server/AppWidgetServiceImpl$Provider;)V
    .registers 6

    iget-object v2, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;

    if-eqz v2, :cond_1a

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v3, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_f
    iget-object v2, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;

    invoke-virtual {v2}, Landroid/app/PendingIntent;->cancel()V
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_1b

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    const/4 v2, 0x0

    iput-object v2, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;

    :cond_1a
    return-void

    :catchall_1b
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
.end method

.method computeMaximumWidgetBitmapMemory()V
    .registers 6

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v4, "window"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getRawHeight()I

    move-result v0

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getRawWidth()I

    move-result v1

    mul-int/lit8 v3, v1, 0x6

    mul-int/2addr v3, v0

    iput v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mMaxWidgetBitmapMemory:I

    return-void
.end method

.method public deleteAllHosts()V
    .registers 8

    iget-object v6, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v6

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    add-int/lit8 v4, v0, -0x1

    :goto_13
    if-ltz v4, :cond_28

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v5, v3, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I

    if-ne v5, v1, :cond_25

    invoke-virtual {p0, v3}, Lcom/android/server/AppWidgetServiceImpl;->deleteHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    const/4 v2, 0x1

    :cond_25
    add-int/lit8 v4, v4, -0x1

    goto :goto_13

    :cond_28
    if-eqz v2, :cond_2d

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    :cond_2d
    monitor-exit v6

    return-void

    :catchall_2f
    move-exception v5

    monitor-exit v6
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_2f

    throw v5
.end method

.method public deleteAppWidgetId(I)V
    .registers 5

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p0, v0}, Lcom/android/server/AppWidgetServiceImpl;->deleteAppWidgetLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    :cond_12
    monitor-exit v2

    return-void

    :catchall_14
    move-exception v1

    monitor-exit v2
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v1
.end method

.method deleteAppWidgetLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V
    .registers 7

    invoke-direct {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->unbindAppWidgetRemoteViewsServicesLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v3, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lcom/android/server/AppWidgetServiceImpl;->pruneHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v2, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v2, :cond_5b

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-boolean v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    if-nez v3, :cond_5b

    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.appwidget.action.APPWIDGET_DELETED"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v3, v3, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v3, "appWidgetId"

    iget v4, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    iget v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {v3, v1, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;I)V

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_5b

    invoke-virtual {p0, v2}, Lcom/android/server/AppWidgetServiceImpl;->cancelBroadcasts(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.appwidget.action.APPWIDGET_DISABLED"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v3, v3, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    iget v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {v3, v1, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;I)V

    :cond_5b
    return-void
.end method

.method public deleteHost(I)V
    .registers 6

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupHostLocked(II)Lcom/android/server/AppWidgetServiceImpl$Host;

    move-result-object v1

    if-eqz v1, :cond_16

    invoke-virtual {p0, v1}, Lcom/android/server/AppWidgetServiceImpl;->deleteHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    :cond_16
    monitor-exit v3

    return-void

    :catchall_18
    move-exception v2

    monitor-exit v3
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v2
.end method

.method deleteHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V
    .registers 6

    iget-object v3, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_8
    if-ltz v1, :cond_18

    iget-object v3, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    invoke-virtual {p0, v2}, Lcom/android/server/AppWidgetServiceImpl;->deleteAppWidgetLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_18
    iget-object v3, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedHosts:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v3, 0x0

    iput-object v3, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    return-void
.end method

.method dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 8

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v3, "android.permission.DUMP"

    invoke-virtual {v2, v3}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_33

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Permission Denial: can\'t dump from from pid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", uid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_32
    return-void

    :cond_33
    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_36
    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, "Providers:"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_42
    if-ge v1, v0, :cond_52

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Provider;

    invoke-direct {p0, v2, v1, p2}, Lcom/android/server/AppWidgetServiceImpl;->dumpProvider(Lcom/android/server/AppWidgetServiceImpl$Provider;ILjava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_42

    :cond_52
    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, " "

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string v2, "AppWidgetIds:"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_63
    if-ge v1, v0, :cond_73

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    invoke-direct {p0, v2, v1, p2}, Lcom/android/server/AppWidgetServiceImpl;->dumpAppWidgetId(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;ILjava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_63

    :cond_73
    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, " "

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string v2, "Hosts:"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_84
    if-ge v1, v0, :cond_94

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Host;

    invoke-direct {p0, v2, v1, p2}, Lcom/android/server/AppWidgetServiceImpl;->dumpHost(Lcom/android/server/AppWidgetServiceImpl$Host;ILjava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_84

    :cond_94
    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedProviders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, " "

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string v2, "Deleted Providers:"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_a5
    if-ge v1, v0, :cond_b5

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedProviders:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Provider;

    invoke-direct {p0, v2, v1, p2}, Lcom/android/server/AppWidgetServiceImpl;->dumpProvider(Lcom/android/server/AppWidgetServiceImpl$Provider;ILjava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a5

    :cond_b5
    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedHosts:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, " "

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string v2, "Deleted Hosts:"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_c6
    if-ge v1, v0, :cond_d6

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedHosts:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Host;

    invoke-direct {p0, v2, v1, p2}, Lcom/android/server/AppWidgetServiceImpl;->dumpHost(Lcom/android/server/AppWidgetServiceImpl$Host;ILjava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_c6

    :cond_d6
    monitor-exit v3

    goto/16 :goto_32

    :catchall_d9
    move-exception v2

    monitor-exit v3
    :try_end_db
    .catchall {:try_start_36 .. :try_end_db} :catchall_d9

    throw v2
.end method

.method enforceCallingUid(Ljava/lang/String;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->getUidForPackage(Ljava/lang/String;)I
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_7} :catch_27

    move-result v2

    invoke-static {v0, v2}, Landroid/os/UserId;->isSameApp(II)Z

    move-result v3

    if-nez v3, :cond_41

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "packageName and uid don\'t match packageName="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :catch_27
    move-exception v1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "packageName and uid don\'t match packageName="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_41
    return v0
.end method

.method public getAppWidgetIds(Landroid/content/ComponentName;)[I
    .registers 6

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupProviderLocked(Landroid/content/ComponentName;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    iget v3, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->uid:I

    if-ne v1, v3, :cond_1a

    invoke-static {v0}, Lcom/android/server/AppWidgetServiceImpl;->getAppWidgetIds(Lcom/android/server/AppWidgetServiceImpl$Provider;)[I

    move-result-object v1

    monitor-exit v2

    :goto_19
    return-object v1

    :cond_1a
    const/4 v1, 0x0

    new-array v1, v1, [I

    monitor-exit v2

    goto :goto_19

    :catchall_1f
    move-exception v1

    monitor-exit v2
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;
    .registers 5

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v0

    if-eqz v0, :cond_1c

    iget-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v1, :cond_1c

    iget-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-boolean v1, v1, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    if-nez v1, :cond_1c

    iget-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v1, v1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    monitor-exit v2

    :goto_1b
    return-object v1

    :cond_1c
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_1b

    :catchall_1f
    move-exception v1

    monitor-exit v2
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public getAppWidgetOptions(I)Landroid/os/Bundle;
    .registers 5

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v0

    if-eqz v0, :cond_14

    iget-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->options:Landroid/os/Bundle;

    if-eqz v1, :cond_14

    iget-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->options:Landroid/os/Bundle;

    monitor-exit v2

    :goto_13
    return-object v1

    :cond_14
    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    monitor-exit v2

    goto :goto_13

    :catchall_18
    move-exception v1

    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v1
.end method

.method public getAppWidgetViews(I)Landroid/widget/RemoteViews;
    .registers 5

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v0

    if-eqz v0, :cond_10

    iget-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->views:Landroid/widget/RemoteViews;

    monitor-exit v2

    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_f

    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v1
.end method

.method public getInstalledProviders()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v5

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_12
    if-ge v1, v0, :cond_28

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-boolean v4, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    if-nez v4, :cond_25

    iget-object v4, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_28
    monitor-exit v5

    return-object v3

    :catchall_2a
    move-exception v4

    monitor-exit v5
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_2a

    throw v4
.end method

.method getUidForPackage(Ljava/lang/String;)I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mPm:Landroid/content/pm/IPackageManager;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-interface {v1, p1, v2, v3}, Landroid/content/pm/IPackageManager;->getPackageInfo(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_9} :catch_1b

    move-result-object v0

    :goto_a
    if-eqz v0, :cond_10

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v1, :cond_16

    :cond_10
    new-instance v1, Landroid/content/pm/PackageManager$NameNotFoundException;

    invoke-direct {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>()V

    throw v1

    :cond_16
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    return v1

    :catch_1b
    move-exception v1

    goto :goto_a
.end method

.method public hasBindAppWidgetPermission(Ljava/lang/String;)Z
    .registers 6

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MODIFY_APPWIDGET_BIND_PERMISSIONS"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hasBindAppWidgetPermission packageName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingPermission(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_1d
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_1d .. :try_end_2a} :catchall_28

    throw v0
.end method

.method loadAppWidgetList()V
    .registers 10

    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.appwidget.action.APPWIDGET_UPDATE"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :try_start_7
    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mPm:Landroid/content/pm/IPackageManager;

    iget-object v6, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x80

    iget v8, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-interface {v5, v3, v6, v7, v8}, Landroid/content/pm/IPackageManager;->queryIntentReceivers(Landroid/content/Intent;Ljava/lang/String;II)Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_2d

    const/4 v0, 0x0

    :goto_1e
    const/4 v2, 0x0

    :goto_1f
    if-ge v2, v0, :cond_33

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    invoke-virtual {p0, v4}, Lcom/android/server/AppWidgetServiceImpl;->addProviderLocked(Landroid/content/pm/ResolveInfo;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    :cond_2d
    invoke-interface {v1}, Ljava/util/List;->size()I
    :try_end_30
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_30} :catch_32

    move-result v0

    goto :goto_1e

    :catch_32
    move-exception v5

    :cond_33
    return-void
.end method

.method loadStateLocked()V
    .registers 7

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->savedStateFile()Lcom/android/internal/os/AtomicFile;

    move-result-object v1

    :try_start_4
    invoke-virtual {v1}, Lcom/android/internal/os/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/server/AppWidgetServiceImpl;->readStateFromFileLocked(Ljava/io/FileInputStream;)V
    :try_end_b
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_b} :catch_2b

    if-eqz v2, :cond_10

    :try_start_d
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_11
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_10} :catch_2b

    :cond_10
    :goto_10
    return-void

    :catch_11
    move-exception v0

    :try_start_12
    const-string v3, "AppWidgetServiceImpl"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to close state FileInputStream "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2a
    .catch Ljava/io/FileNotFoundException; {:try_start_12 .. :try_end_2a} :catch_2b

    goto :goto_10

    :catch_2b
    move-exception v0

    const-string v3, "AppWidgetServiceImpl"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to read state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10
.end method

.method lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;
    .registers 7

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v0, :cond_23

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    iget v4, v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    if-ne v4, p1, :cond_20

    invoke-virtual {p0, v3, v1}, Lcom/android/server/AppWidgetServiceImpl;->canAccessAppWidgetId(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;I)Z

    move-result v4

    if-eqz v4, :cond_20

    :goto_1f
    return-object v3

    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_23
    const/4 v3, 0x0

    goto :goto_1f
.end method

.method lookupHostLocked(II)Lcom/android/server/AppWidgetServiceImpl$Host;
    .registers 7

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_1d

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v3, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I

    if-ne v3, p1, :cond_1a

    iget v3, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    if-ne v3, p2, :cond_1a

    :goto_19
    return-object v1

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_1d
    const/4 v1, 0x0

    goto :goto_19
.end method

.method lookupOrAddHostLocked(ILjava/lang/String;I)Lcom/android/server/AppWidgetServiceImpl$Host;
    .registers 9

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v0, :cond_21

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v4, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    if-ne v4, p3, :cond_1e

    iget-object v4, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1e

    :goto_1d
    return-object v1

    :cond_1e
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_21
    new-instance v2, Lcom/android/server/AppWidgetServiceImpl$Host;

    invoke-direct {v2}, Lcom/android/server/AppWidgetServiceImpl$Host;-><init>()V

    iput-object p2, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    iput p1, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I

    iput p3, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v1, v2

    goto :goto_1d
.end method

.method lookupProviderLocked(Landroid/content/ComponentName;)Lcom/android/server/AppWidgetServiceImpl$Provider;
    .registers 6

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1f

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v3, v3, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v3, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    :goto_1b
    return-object v2

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1f
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public notifyAppWidgetViewDataChanged([II)V
    .registers 8

    if-nez p1, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    array-length v3, p1

    if-eqz v3, :cond_2

    array-length v0, p1

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v4

    :try_start_a
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    const/4 v1, 0x0

    :goto_e
    if-ge v1, v0, :cond_1c

    aget v3, p1, v1

    invoke-virtual {p0, v3}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lcom/android/server/AppWidgetServiceImpl;->notifyAppWidgetViewDataChangedInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_1c
    monitor-exit v4

    goto :goto_2

    :catchall_1e
    move-exception v3

    monitor-exit v4
    :try_end_20
    .catchall {:try_start_a .. :try_end_20} :catchall_1e

    throw v3
.end method

.method notifyAppWidgetViewDataChangedInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;I)V
    .registers 14

    if-eqz p1, :cond_7c

    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v9, :cond_7c

    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-boolean v9, v9, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    if-nez v9, :cond_7c

    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-boolean v9, v9, Lcom/android/server/AppWidgetServiceImpl$Host;->zombie:Z

    if-nez v9, :cond_7c

    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v9, v9, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    if-eqz v9, :cond_21

    :try_start_18
    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v9, v9, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    iget v10, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-interface {v9, v10, p2}, Lcom/android/internal/appwidget/IAppWidgetHost;->viewDataChanged(II)V
    :try_end_21
    .catch Landroid/os/RemoteException; {:try_start_18 .. :try_end_21} :catch_70

    :cond_21
    :goto_21
    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v9, v9, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    if-nez v9, :cond_7c

    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_31
    :goto_31
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Intent$FilterComparison;

    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mRemoteViewsServicesAppWidgets:Ljava/util/HashMap;

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashSet;

    iget v10, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_31

    invoke-virtual {v4}, Landroid/content/Intent$FilterComparison;->getIntent()Landroid/content/Intent;

    move-result-object v3

    new-instance v0, Lcom/android/server/AppWidgetServiceImpl$2;

    invoke-direct {v0, p0}, Lcom/android/server/AppWidgetServiceImpl$2;-><init>(Lcom/android/server/AppWidgetServiceImpl;)V

    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget v9, v9, Lcom/android/server/AppWidgetServiceImpl$Provider;->uid:I

    invoke-static {v9}, Landroid/os/UserId;->getUserId(I)I

    move-result v8

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v6

    :try_start_66
    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const/4 v10, 0x1

    invoke-virtual {v9, v3, v0, v10, v8}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z
    :try_end_6c
    .catchall {:try_start_66 .. :try_end_6c} :catchall_77

    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_31

    :catch_70
    move-exception v1

    iget-object v9, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    const/4 v10, 0x0

    iput-object v10, v9, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    goto :goto_21

    :catchall_77
    move-exception v9

    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v9

    :cond_7c
    return-void
.end method

.method onBroadcastReceived(Landroid/content/Intent;)V
    .registers 15

    const/4 v11, 0x0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v7, 0x0

    const-string v10, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1d

    const-string v10, "android.intent.extra.changed_package_list"

    invoke-virtual {p1, v10}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v1, 0x1

    :goto_17
    if-eqz v7, :cond_1c

    array-length v10, v7

    if-nez v10, :cond_4b

    :cond_1c
    :goto_1c
    return-void

    :cond_1d
    const-string v10, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2d

    const-string v10, "android.intent.extra.changed_package_list"

    invoke-virtual {p1, v10}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v1, 0x0

    goto :goto_17

    :cond_2d
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    if-eqz v9, :cond_1c

    invoke-virtual {v9}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_1c

    const/4 v10, 0x1

    new-array v7, v10, [Ljava/lang/String;

    aput-object v8, v7, v11

    const-string v10, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v10, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_17

    :cond_4b
    if-nez v1, :cond_4f

    if-eqz v3, :cond_88

    :cond_4f
    iget-object v11, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v11

    :try_start_52
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    if-nez v3, :cond_66

    if-eqz v4, :cond_73

    const-string v10, "android.intent.extra.REPLACING"

    const/4 v12, 0x0

    invoke-virtual {v4, v10, v12}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_73

    :cond_66
    move-object v2, v7

    array-length v6, v2

    const/4 v5, 0x0

    :goto_69
    if-ge v5, v6, :cond_80

    aget-object v8, v2, v5

    invoke-virtual {p0, v8}, Lcom/android/server/AppWidgetServiceImpl;->updateProvidersForPackageLocked(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_69

    :cond_73
    move-object v2, v7

    array-length v6, v2

    const/4 v5, 0x0

    :goto_76
    if-ge v5, v6, :cond_80

    aget-object v8, v2, v5

    invoke-virtual {p0, v8}, Lcom/android/server/AppWidgetServiceImpl;->addProvidersForPackageLocked(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_76

    :cond_80
    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    monitor-exit v11

    goto :goto_1c

    :catchall_85
    move-exception v10

    monitor-exit v11
    :try_end_87
    .catchall {:try_start_52 .. :try_end_87} :catchall_85

    throw v10

    :cond_88
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_96

    const-string v10, "android.intent.extra.REPLACING"

    invoke-virtual {v4, v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-nez v10, :cond_1c

    :cond_96
    iget-object v11, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v11

    :try_start_99
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    move-object v2, v7

    array-length v6, v2

    const/4 v5, 0x0

    :goto_9f
    if-ge v5, v6, :cond_ac

    aget-object v8, v2, v5

    invoke-virtual {p0, v8}, Lcom/android/server/AppWidgetServiceImpl;->removeProvidersForPackageLocked(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    add-int/lit8 v5, v5, 0x1

    goto :goto_9f

    :cond_ac
    monitor-exit v11

    goto/16 :goto_1c

    :catchall_af
    move-exception v10

    monitor-exit v11
    :try_end_b1
    .catchall {:try_start_99 .. :try_end_b1} :catchall_af

    throw v10
.end method

.method onConfigurationChanged()V
    .registers 8

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    if-eqz v4, :cond_12

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mLocale:Ljava/util/Locale;

    if-eqz v5, :cond_12

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mLocale:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3e

    :cond_12
    iput-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mLocale:Ljava/util/Locale;

    iget-object v6, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v6

    :try_start_17
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_22
    if-ltz v1, :cond_3a

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v5, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v5, v5, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/server/AppWidgetServiceImpl;->updateProvidersForPackageLocked(Ljava/lang/String;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_22

    :cond_3a
    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    monitor-exit v6

    :cond_3e
    return-void

    :catchall_3f
    move-exception v5

    monitor-exit v6
    :try_end_41
    .catchall {:try_start_17 .. :try_end_41} :catchall_3f

    throw v5
.end method

.method onUserRemoved()V
    .registers 5

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_8
    if-ltz v1, :cond_18

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Provider;

    invoke-virtual {p0, v2}, Lcom/android/server/AppWidgetServiceImpl;->cancelBroadcasts(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_18
    iget v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-static {v3}, Lcom/android/server/AppWidgetServiceImpl;->getSettingsFile(I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    return-void
.end method

.method public partiallyUpdateAppWidgetIds([ILandroid/widget/RemoteViews;)V
    .registers 8

    if-nez p1, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    array-length v3, p1

    if-eqz v3, :cond_2

    array-length v0, p1

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v4

    :try_start_a
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    const/4 v1, 0x0

    :goto_e
    if-ge v1, v0, :cond_1d

    aget v3, p1, v1

    invoke-virtual {p0, v3}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, p2, v3}, Lcom/android/server/AppWidgetServiceImpl;->updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_1d
    monitor-exit v4

    goto :goto_2

    :catchall_1f
    move-exception v3

    monitor-exit v4
    :try_end_21
    .catchall {:try_start_a .. :try_end_21} :catchall_1f

    throw v3
.end method

.method pruneHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V
    .registers 3

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_11
    return-void
.end method

.method readStateFromFileLocked(Ljava/io/FileInputStream;)V
    .registers 28

    const/16 v20, 0x0

    :try_start_2
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v15

    const/16 v23, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v18, 0x0

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    :cond_16
    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v22

    const/16 v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_c0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v21

    const-string v23, "p"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_10b

    const/16 v23, 0x0

    const-string v24, "pkg"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const/16 v23, 0x0

    const-string v24, "cl"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    :try_end_53
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_53} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_53} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_53} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_53} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_53} :catch_2dc

    move-result-object v13

    :try_start_54
    new-instance v23, Landroid/content/ComponentName;

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v24, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_66
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_54 .. :try_end_66} :catch_f2
    .catch Ljava/lang/NullPointerException; {:try_start_54 .. :try_end_66} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_54 .. :try_end_66} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_54 .. :try_end_66} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_66} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_54 .. :try_end_66} :catch_2dc

    :goto_66
    :try_start_66
    new-instance v23, Landroid/content/ComponentName;

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/android/server/AppWidgetServiceImpl;->lookupProviderLocked(Landroid/content/ComponentName;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v11

    if-nez v11, :cond_b3

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mSafeMode:Z

    move/from16 v23, v0

    if-eqz v23, :cond_b3

    new-instance v11, Lcom/android/server/AppWidgetServiceImpl$Provider;

    invoke-direct {v11}, Lcom/android/server/AppWidgetServiceImpl$Provider;-><init>()V

    new-instance v23, Landroid/appwidget/AppWidgetProviderInfo;

    invoke-direct/range {v23 .. v23}, Landroid/appwidget/AppWidgetProviderInfo;-><init>()V

    move-object/from16 v0, v23

    iput-object v0, v11, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v0, v11, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v23, v0

    new-instance v24, Landroid/content/ComponentName;

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    iput-object v0, v1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    const/16 v23, 0x1

    move/from16 v0, v23

    iput-boolean v0, v11, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b3
    if-eqz v11, :cond_be

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v10, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_be
    .catch Ljava/lang/NullPointerException; {:try_start_66 .. :try_end_be} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_66 .. :try_end_be} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_66 .. :try_end_be} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_66 .. :try_end_be} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_66 .. :try_end_be} :catch_2dc

    :cond_be
    add-int/lit8 v18, v18, 0x1

    :cond_c0
    :goto_c0
    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_16

    const/16 v20, 0x1

    :goto_ca
    if-eqz v20, :cond_2f9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v23

    add-int/lit8 v8, v23, -0x1

    :goto_d8
    if-ltz v8, :cond_339

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/android/server/AppWidgetServiceImpl;->pruneHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    add-int/lit8 v8, v8, -0x1

    goto :goto_d8

    :catch_f2
    move-exception v4

    const/16 v23, 0x1

    :try_start_f5
    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v16, v23, v24

    move-object/from16 v0, v23

    invoke-virtual {v13, v0}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    const/16 v23, 0x0

    aget-object v16, v17, v23

    goto/16 :goto_66

    :cond_10b
    const-string v23, "h"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1af

    new-instance v7, Lcom/android/server/AppWidgetServiceImpl$Host;

    invoke-direct {v7}, Lcom/android/server/AppWidgetServiceImpl$Host;-><init>()V

    const/16 v23, 0x0

    const-string v24, "pkg"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    iput-object v0, v7, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;
    :try_end_12c
    .catch Ljava/lang/NullPointerException; {:try_start_f5 .. :try_end_12c} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_f5 .. :try_end_12c} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f5 .. :try_end_12c} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_f5 .. :try_end_12c} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_f5 .. :try_end_12c} :catch_2dc

    :try_start_12c
    iget-object v0, v7, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/android/server/AppWidgetServiceImpl;->getUidForPackage(Ljava/lang/String;)I

    move-result v23

    move/from16 v0, v23

    iput v0, v7, Lcom/android/server/AppWidgetServiceImpl$Host;->uid:I
    :try_end_13c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_12c .. :try_end_13c} :catch_18a
    .catch Ljava/lang/NullPointerException; {:try_start_12c .. :try_end_13c} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_12c .. :try_end_13c} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_12c .. :try_end_13c} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_12c .. :try_end_13c} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_12c .. :try_end_13c} :catch_2dc

    :goto_13c
    :try_start_13c
    iget-boolean v0, v7, Lcom/android/server/AppWidgetServiceImpl$Host;->zombie:Z

    move/from16 v23, v0

    if-eqz v23, :cond_14a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mSafeMode:Z

    move/from16 v23, v0

    if-eqz v23, :cond_c0

    :cond_14a
    const/16 v23, 0x0

    const-string v24, "id"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x10

    invoke-static/range {v23 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v23

    move/from16 v0, v23

    iput v0, v7, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_16b
    .catch Ljava/lang/NullPointerException; {:try_start_13c .. :try_end_16b} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_13c .. :try_end_16b} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_13c .. :try_end_16b} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_13c .. :try_end_16b} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_13c .. :try_end_16b} :catch_2dc

    goto/16 :goto_c0

    :catch_16d
    move-exception v4

    const-string v23, "AppWidgetServiceImpl"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "failed parsing "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_ca

    :catch_18a
    move-exception v5

    const/16 v23, 0x1

    :try_start_18d
    move/from16 v0, v23

    iput-boolean v0, v7, Lcom/android/server/AppWidgetServiceImpl$Host;->zombie:Z
    :try_end_191
    .catch Ljava/lang/NullPointerException; {:try_start_18d .. :try_end_191} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_18d .. :try_end_191} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_18d .. :try_end_191} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_18d .. :try_end_191} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_18d .. :try_end_191} :catch_2dc

    goto :goto_13c

    :catch_192
    move-exception v4

    const-string v23, "AppWidgetServiceImpl"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "failed parsing "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_ca

    :cond_1af
    :try_start_1af
    const-string v23, "b"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1f3

    const/16 v23, 0x0

    const-string v24, "packageName"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_c0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_1d4
    .catch Ljava/lang/NullPointerException; {:try_start_1af .. :try_end_1d4} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_1af .. :try_end_1d4} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1af .. :try_end_1d4} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_1af .. :try_end_1d4} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1af .. :try_end_1d4} :catch_2dc

    goto/16 :goto_c0

    :catch_1d6
    move-exception v4

    const-string v23, "AppWidgetServiceImpl"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "failed parsing "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_ca

    :cond_1f3
    :try_start_1f3
    const-string v23, "g"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_c0

    new-instance v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    invoke-direct {v9}, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;-><init>()V

    const/16 v23, 0x0

    const-string v24, "id"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x10

    invoke-static/range {v23 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v23

    move/from16 v0, v23

    iput v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    iget v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mNextAppWidgetId:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_236

    iget v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/AppWidgetServiceImpl;->mNextAppWidgetId:I

    :cond_236
    const/16 v23, 0x0

    const-string v24, "p"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_264

    const/16 v23, 0x10

    move-object/from16 v0, v19

    move/from16 v1, v23

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v10, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-object/from16 v0, v23

    iput-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-object/from16 v23, v0

    if-eqz v23, :cond_c0

    :cond_264
    const/16 v23, 0x0

    const-string v24, "h"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x10

    invoke-static/range {v23 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v0, v23

    iput-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v23, v0

    if-eqz v23, :cond_c0

    iget-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-object/from16 v23, v0

    if-eqz v23, :cond_2a3

    iget-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2a3
    iget-object v0, v9, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2bd
    .catch Ljava/lang/NullPointerException; {:try_start_1f3 .. :try_end_2bd} :catch_16d
    .catch Ljava/lang/NumberFormatException; {:try_start_1f3 .. :try_end_2bd} :catch_192
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1f3 .. :try_end_2bd} :catch_1d6
    .catch Ljava/io/IOException; {:try_start_1f3 .. :try_end_2bd} :catch_2bf
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1f3 .. :try_end_2bd} :catch_2dc

    goto/16 :goto_c0

    :catch_2bf
    move-exception v4

    const-string v23, "AppWidgetServiceImpl"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "failed parsing "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_ca

    :catch_2dc
    move-exception v4

    const-string v23, "AppWidgetServiceImpl"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "failed parsing "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_ca

    :cond_2f9
    const-string v23, "AppWidgetServiceImpl"

    const-string v24, "Failed to read state, clearing widgets and hosts."

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->clear()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->clear()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v8, 0x0

    :goto_31d
    if-ge v8, v2, :cond_339

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->clear()V

    add-int/lit8 v8, v8, 0x1

    goto :goto_31d

    :cond_339
    return-void
.end method

.method registerForBroadcastsLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V
    .registers 14

    const/4 v7, 0x1

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->updatePeriodMillis:I

    if-lez v0, :cond_4e

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;

    if-eqz v0, :cond_4f

    :goto_b
    new-instance v8, Landroid/content/Intent;

    const-string v0, "android.appwidget.action.APPWIDGET_UPDATE"

    invoke-direct {v8, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "appWidgetIds"

    invoke-virtual {v8, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v8, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v9

    :try_start_22
    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    const/high16 v2, 0x800

    invoke-static {v0, v1, v8, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;
    :try_end_2d
    .catchall {:try_start_22 .. :try_end_2d} :catchall_51

    invoke-static {v9, v10}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    if-nez v7, :cond_4e

    iget-object v0, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->updatePeriodMillis:I

    int-to-long v4, v0

    const-wide/32 v0, 0x1b7740

    cmp-long v0, v4, v0

    if-gez v0, :cond_41

    const-wide/32 v4, 0x1b7740

    :cond_41
    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v1, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    add-long/2addr v2, v4

    iget-object v6, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->broadcast:Landroid/app/PendingIntent;

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    :cond_4e
    return-void

    :cond_4f
    const/4 v7, 0x0

    goto :goto_b

    :catchall_51
    move-exception v0

    invoke-static {v9, v10}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v0
.end method

.method removeProviderLocked(ILcom/android/server/AppWidgetServiceImpl$Provider;)V
    .registers 8

    const/4 v4, 0x0

    iget-object v3, p2, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_8
    if-ge v1, v0, :cond_30

    iget-object v3, p2, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    invoke-virtual {p0, v2, v4}, Lcom/android/server/AppWidgetServiceImpl;->updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;)V

    invoke-virtual {p0, p2}, Lcom/android/server/AppWidgetServiceImpl;->cancelBroadcasts(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v3, v3, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iput-object v4, v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    invoke-virtual {p0, v3}, Lcom/android/server/AppWidgetServiceImpl;->pruneHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    iput-object v4, v2, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_30
    iget-object v3, p2, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mDeletedProviders:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p2}, Lcom/android/server/AppWidgetServiceImpl;->cancelBroadcasts(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    return-void
.end method

.method removeProvidersForPackageLocked(Ljava/lang/String;)V
    .registers 7

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v2, v0, -0x1

    :goto_8
    if-ltz v2, :cond_26

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v4, v3, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v4, v4, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-virtual {p0, v2, v3}, Lcom/android/server/AppWidgetServiceImpl;->removeProviderLocked(ILcom/android/server/AppWidgetServiceImpl$Provider;)V

    :cond_23
    add-int/lit8 v2, v2, -0x1

    goto :goto_8

    :cond_26
    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v2, v0, -0x1

    :goto_2e
    if-ltz v2, :cond_46

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v4, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43

    invoke-virtual {p0, v1}, Lcom/android/server/AppWidgetServiceImpl;->deleteHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    :cond_43
    add-int/lit8 v2, v2, -0x1

    goto :goto_2e

    :cond_46
    return-void
.end method

.method saveStateLocked()V
    .registers 7

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->savedStateFile()Lcom/android/internal/os/AtomicFile;

    move-result-object v1

    :try_start_4
    invoke-virtual {v1}, Lcom/android/internal/os/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/server/AppWidgetServiceImpl;->writeStateToFileLocked(Ljava/io/FileOutputStream;)Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-virtual {v1, v2}, Lcom/android/internal/os/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V

    :goto_11
    return-void

    :cond_12
    invoke-virtual {v1, v2}, Lcom/android/internal/os/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    const-string v3, "AppWidgetServiceImpl"

    const-string v4, "Failed to save state, restoring backup."

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_1c} :catch_1d

    goto :goto_11

    :catch_1d
    move-exception v0

    const-string v3, "AppWidgetServiceImpl"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed open state file for write: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11
.end method

.method savedStateFile()Lcom/android/internal/os/AtomicFile;
    .registers 6

    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/system/users/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-static {v3}, Lcom/android/server/AppWidgetServiceImpl;->getSettingsFile(I)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_3d

    iget v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    if-nez v3, :cond_3d

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_33

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_33
    new-instance v1, Ljava/io/File;

    const-string v3, "/data/system/appwidgets.xml"

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_3d
    new-instance v3, Lcom/android/internal/os/AtomicFile;

    invoke-direct {v3, v2}, Lcom/android/internal/os/AtomicFile;-><init>(Ljava/io/File;)V

    return-object v3
.end method

.method sendEnableIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;)V
    .registers 5

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.appwidget.action.APPWIDGET_ENABLED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v1, v1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;I)V

    return-void
.end method

.method sendInitialBroadcasts()V
    .registers 7

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v5

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_d
    if-ge v2, v0, :cond_2f

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v4, v3, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2c

    invoke-virtual {p0, v3}, Lcom/android/server/AppWidgetServiceImpl;->sendEnableIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    invoke-static {v3}, Lcom/android/server/AppWidgetServiceImpl;->getAppWidgetIds(Lcom/android/server/AppWidgetServiceImpl$Provider;)[I

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/android/server/AppWidgetServiceImpl;->sendUpdateIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V

    invoke-virtual {p0, v3, v1}, Lcom/android/server/AppWidgetServiceImpl;->registerForBroadcastsLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V

    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_2f
    monitor-exit v5

    return-void

    :catchall_31
    move-exception v4

    monitor-exit v5
    :try_end_33
    .catchall {:try_start_3 .. :try_end_33} :catchall_31

    throw v4
.end method

.method sendUpdateIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V
    .registers 6

    if-eqz p2, :cond_1f

    array-length v1, p2

    if-lez v1, :cond_1f

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.appwidget.action.APPWIDGET_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "appWidgetIds"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v1, v1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;I)V

    :cond_1f
    return-void
.end method

.method public setBindAppWidgetPermission(Ljava/lang/String;Z)V
    .registers 7

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MODIFY_APPWIDGET_BIND_PERMISSIONS"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setBindAppWidgetPermission packageName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingPermission(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_1d
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    if-eqz p2, :cond_2c

    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :goto_27
    monitor-exit v1
    :try_end_28
    .catchall {:try_start_1d .. :try_end_28} :catchall_32

    invoke-virtual {p0}, Lcom/android/server/AppWidgetServiceImpl;->saveStateLocked()V

    return-void

    :cond_2c
    :try_start_2c
    iget-object v0, p0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_27

    :catchall_32
    move-exception v0

    monitor-exit v1
    :try_end_34
    .catchall {:try_start_2c .. :try_end_34} :catchall_32

    throw v0
.end method

.method public startListening(Lcom/android/internal/appwidget/IAppWidgetHost;Ljava/lang/String;ILjava/util/List;)[I
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/appwidget/IAppWidgetHost;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Landroid/widget/RemoteViews;",
            ">;)[I"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/android/server/AppWidgetServiceImpl;->enforceCallingUid(Ljava/lang/String;)I

    move-result v1

    iget-object v8, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v8

    :try_start_7
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, v1, p2, p3}, Lcom/android/server/AppWidgetServiceImpl;->lookupOrAddHostLocked(ILjava/lang/String;I)Lcom/android/server/AppWidgetServiceImpl$Host;

    move-result-object v2

    iput-object p1, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    invoke-interface {p4}, Ljava/util/List;->clear()V

    iget-object v5, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->instances:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v6, v0, [I

    const/4 v3, 0x0

    :goto_1c
    if-ge v3, v0, :cond_30

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    iget v7, v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    aput v7, v6, v3

    iget-object v7, v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->views:Landroid/widget/RemoteViews;

    invoke-interface {p4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    :cond_30
    monitor-exit v8

    return-object v6

    :catchall_32
    move-exception v7

    monitor-exit v8
    :try_end_34
    .catchall {:try_start_7 .. :try_end_34} :catchall_32

    throw v7
.end method

.method public stopListening(I)V
    .registers 5

    iget-object v2, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {p0, v1, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupHostLocked(II)Lcom/android/server/AppWidgetServiceImpl$Host;

    move-result-object v0

    if-eqz v0, :cond_16

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    invoke-virtual {p0, v0}, Lcom/android/server/AppWidgetServiceImpl;->pruneHostLocked(Lcom/android/server/AppWidgetServiceImpl$Host;)V

    :cond_16
    monitor-exit v2

    return-void

    :catchall_18
    move-exception v1

    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v1
.end method

.method public systemReady(Z)V
    .registers 4

    iput-boolean p1, p0, Lcom/android/server/AppWidgetServiceImpl;->mSafeMode:Z

    iget-object v1, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_5
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public unbindRemoteViewsService(ILandroid/content/Intent;)V
    .registers 9

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v4

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v5, Landroid/content/Intent$FilterComparison;

    invoke-direct {v5, p2}, Landroid/content/Intent$FilterComparison;-><init>(Landroid/content/Intent;)V

    invoke-static {v3, v5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v1

    if-nez v1, :cond_2c

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v5, "bad appWidgetId"

    invoke-direct {v3, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :catchall_29
    move-exception v3

    monitor-exit v4
    :try_end_2b
    .catchall {:try_start_3 .. :try_end_2b} :catchall_29

    throw v3

    :cond_2c
    :try_start_2c
    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;

    invoke-virtual {v0}, Lcom/android/server/AppWidgetServiceImpl$ServiceConnectionProxy;->disconnect()V

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mBoundRemoteViewsServices:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_41
    monitor-exit v4

    return-void

    :cond_43
    const-string v3, "AppWidgetService"

    const-string v5, "Error (unbindRemoteViewsService): Connection not bound"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4a
    .catchall {:try_start_2c .. :try_end_4a} :catchall_29

    goto :goto_41
.end method

.method public updateAppWidgetIds([ILandroid/widget/RemoteViews;)V
    .registers 10

    if-nez p1, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    invoke-virtual {p2}, Landroid/widget/RemoteViews;->estimateMemoryUsage()I

    move-result v1

    iget v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mMaxWidgetBitmapMemory:I

    if-le v1, v4, :cond_3c

    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "RemoteViews for widget update exceeds maximum bitmap memory usage (used: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", max: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/server/AppWidgetServiceImpl;->mMaxWidgetBitmapMemory:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") The total memory cannot exceed that required to"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " fill the device\'s screen once."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_3c
    array-length v4, p1

    if-eqz v4, :cond_2

    array-length v0, p1

    iget-object v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v5

    :try_start_43
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    const/4 v2, 0x0

    :goto_47
    if-ge v2, v0, :cond_55

    aget v4, p1, v2

    invoke-virtual {p0, v4}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v3

    invoke-virtual {p0, v3, p2}, Lcom/android/server/AppWidgetServiceImpl;->updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_47

    :cond_55
    monitor-exit v5

    goto :goto_2

    :catchall_57
    move-exception v4

    monitor-exit v5
    :try_end_59
    .catchall {:try_start_43 .. :try_end_59} :catchall_57

    throw v4
.end method

.method updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/AppWidgetServiceImpl;->updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;Z)V

    return-void
.end method

.method updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;Z)V
    .registers 7

    if-eqz p1, :cond_25

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v1, :cond_25

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-boolean v1, v1, Lcom/android/server/AppWidgetServiceImpl$Provider;->zombie:Z

    if-nez v1, :cond_25

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-boolean v1, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->zombie:Z

    if-nez v1, :cond_25

    if-nez p3, :cond_16

    iput-object p2, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->views:Landroid/widget/RemoteViews;

    :cond_16
    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v1, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    if-eqz v1, :cond_25

    :try_start_1c
    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget-object v1, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    iget v2, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-interface {v1, v2, p2}, Lcom/android/internal/appwidget/IAppWidgetHost;->updateAppWidget(ILandroid/widget/RemoteViews;)V
    :try_end_25
    .catch Landroid/os/RemoteException; {:try_start_1c .. :try_end_25} :catch_26

    :cond_25
    :goto_25
    return-void

    :catch_26
    move-exception v0

    iget-object v1, p1, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    goto :goto_25
.end method

.method public updateAppWidgetOptions(ILandroid/os/Bundle;)V
    .registers 9

    iget-object v4, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v4

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupAppWidgetIdLocked(I)Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    move-result-object v0

    if-nez v0, :cond_e

    monitor-exit v4

    :goto_d
    return-void

    :cond_e
    iget-object v2, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iput-object p2, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->options:Landroid/os/Bundle;

    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.appwidget.action.APPWIDGET_UPDATE_OPTIONS"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v3, v3, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v3, "appWidgetId"

    iget v5, v0, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v3, "appWidgetOptions"

    invoke-virtual {v1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    iget v5, p0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    invoke-virtual {v3, v1, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;I)V

    monitor-exit v4

    goto :goto_d

    :catchall_35
    move-exception v3

    monitor-exit v4
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_35

    throw v3
.end method

.method public updateAppWidgetProvider(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V
    .registers 13

    iget-object v7, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    monitor-enter v7

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/AppWidgetServiceImpl;->ensureStateLoadedLocked()V

    invoke-virtual {p0, p1}, Lcom/android/server/AppWidgetServiceImpl;->lookupProviderLocked(Landroid/content/ComponentName;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v5

    if-nez v5, :cond_26

    const-string v6, "AppWidgetServiceImpl"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateAppWidgetProvider: provider doesn\'t exist: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v7

    :goto_25
    return-void

    :cond_26
    iget-object v4, v5, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_31
    if-ge v2, v0, :cond_45

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    invoke-virtual {p0, v3, v1}, Lcom/android/server/AppWidgetServiceImpl;->canAccessAppWidgetId(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;I)Z

    move-result v6

    if-eqz v6, :cond_42

    invoke-virtual {p0, v3, p2}, Lcom/android/server/AppWidgetServiceImpl;->updateAppWidgetInstanceLocked(Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;Landroid/widget/RemoteViews;)V

    :cond_42
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    :cond_45
    monitor-exit v7

    goto :goto_25

    :catchall_47
    move-exception v6

    monitor-exit v7
    :try_end_49
    .catchall {:try_start_3 .. :try_end_49} :catchall_47

    throw v6
.end method

.method updateProvidersForPackageLocked(Ljava/lang/String;)V
    .registers 26

    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15}, Ljava/util/HashSet;-><init>()V

    new-instance v13, Landroid/content/Intent;

    const-string v20, "android.appwidget.action.APPWIDGET_UPDATE"

    move-object/from16 v0, v20

    invoke-direct {v13, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :try_start_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mPm:Landroid/content/pm/IPackageManager;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x80

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mUserId:I

    move/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-interface {v0, v13, v1, v2, v3}, Landroid/content/pm/IPackageManager;->queryIntentReceivers(Landroid/content/Intent;Ljava/lang/String;II)Ljava/util/List;
    :try_end_3c
    .catch Landroid/os/RemoteException; {:try_start_13 .. :try_end_3c} :catch_60

    move-result-object v8

    if-nez v8, :cond_62

    const/4 v5, 0x0

    :goto_40
    const/4 v11, 0x0

    :goto_41
    if-ge v11, v5, :cond_139

    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/content/pm/ResolveInfo;

    move-object/from16 v0, v19

    iget-object v6, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v20, v0

    const/high16 v21, 0x4

    and-int v20, v20, v21

    if-eqz v20, :cond_67

    :cond_5d
    :goto_5d
    add-int/lit8 v11, v11, 0x1

    goto :goto_41

    :catch_60
    move-exception v18

    :cond_61
    return-void

    :cond_62
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v5

    goto :goto_40

    :cond_67
    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_5d

    new-instance v9, Landroid/content/ComponentName;

    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v20, v0

    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v9, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/server/AppWidgetServiceImpl;->lookupProviderLocked(Landroid/content/ComponentName;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v16

    if-nez v16, :cond_a2

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/server/AppWidgetServiceImpl;->addProviderLocked(Landroid/content/pm/ResolveInfo;)Z

    move-result v20

    if-eqz v20, :cond_5d

    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_5d

    :cond_a2
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v9, v1}, Lcom/android/server/AppWidgetServiceImpl;->parseProviderInfoXml(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;)Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-result-object v17

    if-eqz v17, :cond_5d

    iget-object v0, v6, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_5d

    invoke-static/range {v16 .. v16}, Lcom/android/server/AppWidgetServiceImpl;->getAppWidgetIds(Lcom/android/server/AppWidgetServiceImpl$Provider;)[I

    move-result-object v7

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/server/AppWidgetServiceImpl;->cancelBroadcasts(Lcom/android/server/AppWidgetServiceImpl$Provider;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v7}, Lcom/android/server/AppWidgetServiceImpl;->registerForBroadcastsLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V

    const/4 v14, 0x0

    :goto_e0
    if-ge v14, v4, :cond_130

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    const/16 v20, 0x0

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->views:Landroid/widget/RemoteViews;

    iget-object v0, v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v20, v0

    if-eqz v20, :cond_11f

    iget-object v0, v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    move-object/from16 v20, v0

    if-eqz v20, :cond_11f

    :try_start_108
    iget-object v0, v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    move-object/from16 v20, v0

    iget v0, v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    move/from16 v21, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v22, v0

    invoke-interface/range {v20 .. v22}, Lcom/android/internal/appwidget/IAppWidgetHost;->providerChanged(ILandroid/appwidget/AppWidgetProviderInfo;)V
    :try_end_11f
    .catch Landroid/os/RemoteException; {:try_start_108 .. :try_end_11f} :catch_122

    :cond_11f
    :goto_11f
    add-int/lit8 v14, v14, 0x1

    goto :goto_e0

    :catch_122
    move-exception v10

    iget-object v0, v12, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    iput-object v0, v1, Lcom/android/server/AppWidgetServiceImpl$Host;->callbacks:Lcom/android/internal/appwidget/IAppWidgetHost;

    goto :goto_11f

    :cond_130
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v7}, Lcom/android/server/AppWidgetServiceImpl;->sendUpdateIntentLocked(Lcom/android/server/AppWidgetServiceImpl$Provider;[I)V

    goto/16 :goto_5d

    :cond_139
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v11, v5, -0x1

    :goto_145
    if-ltz v11, :cond_61

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/android/server/AppWidgetServiceImpl$Provider;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_18e

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_18e

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v11, v1}, Lcom/android/server/AppWidgetServiceImpl;->removeProviderLocked(ILcom/android/server/AppWidgetServiceImpl$Provider;)V

    :cond_18e
    add-int/lit8 v11, v11, -0x1

    goto :goto_145
.end method

.method writeStateToFileLocked(Ljava/io/FileOutputStream;)Z
    .registers 15

    const/4 v10, 0x1

    :try_start_1
    new-instance v6, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v6}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    const-string v9, "utf-8"

    invoke-interface {v6, p1, v9}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    const/4 v9, 0x0

    const/4 v11, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    const/4 v9, 0x0

    const-string v11, "gs"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_22
    if-ge v3, v0, :cond_63

    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mInstalledProviders:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget-object v9, v7, Lcom/android/server/AppWidgetServiceImpl$Provider;->instances:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_60

    const/4 v9, 0x0

    const-string v11, "p"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "pkg"

    iget-object v12, v7, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v12, v12, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v12}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "cl"

    iget-object v12, v7, Lcom/android/server/AppWidgetServiceImpl$Provider;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v12, v12, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v12}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "p"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iput v8, v7, Lcom/android/server/AppWidgetServiceImpl$Provider;->tag:I

    add-int/lit8 v8, v8, 0x1

    :cond_60
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    :cond_63
    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_6a
    if-ge v3, v0, :cond_99

    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mHosts:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl$Host;

    const/4 v9, 0x0

    const-string v11, "h"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "pkg"

    iget-object v12, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->packageName:Ljava/lang/String;

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "id"

    iget v12, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->hostId:I

    invoke-static {v12}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "h"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iput v3, v2, Lcom/android/server/AppWidgetServiceImpl$Host;->tag:I

    add-int/lit8 v3, v3, 0x1

    goto :goto_6a

    :cond_99
    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_a0
    if-ge v3, v0, :cond_e5

    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mAppWidgetIds:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;

    const/4 v9, 0x0

    const-string v11, "g"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "id"

    iget v12, v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->appWidgetId:I

    invoke-static {v12}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "h"

    iget-object v12, v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->host:Lcom/android/server/AppWidgetServiceImpl$Host;

    iget v12, v12, Lcom/android/server/AppWidgetServiceImpl$Host;->tag:I

    invoke-static {v12}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v9, v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    if-eqz v9, :cond_dc

    const/4 v9, 0x0

    const-string v11, "p"

    iget-object v12, v4, Lcom/android/server/AppWidgetServiceImpl$AppWidgetId;->provider:Lcom/android/server/AppWidgetServiceImpl$Provider;

    iget v12, v12, Lcom/android/server/AppWidgetServiceImpl$Provider;->tag:I

    invoke-static {v12}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v9, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_dc
    const/4 v9, 0x0

    const-string v11, "g"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_a0

    :cond_e5
    iget-object v9, p0, Lcom/android/server/AppWidgetServiceImpl;->mPackagesWithBindWidgetPermission:Ljava/util/HashSet;

    invoke-virtual {v9}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_eb
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_125

    const/4 v9, 0x0

    const-string v11, "b"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v11, 0x0

    const-string v12, "packageName"

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v6, v11, v12, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v9, 0x0

    const-string v11, "b"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_109
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_109} :catch_10a

    goto :goto_eb

    :catch_10a
    move-exception v1

    const-string v9, "AppWidgetServiceImpl"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to write state: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v9, 0x0

    :goto_124
    return v9

    :cond_125
    const/4 v9, 0x0

    :try_start_126
    const-string v11, "gs"

    invoke-interface {v6, v9, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v6}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_12e
    .catch Ljava/io/IOException; {:try_start_126 .. :try_end_12e} :catch_10a

    move v9, v10

    goto :goto_124
.end method
