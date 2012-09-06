.class public Lcom/android/server/location/GeocoderProxy;
.super Ljava/lang/Object;
.source "GeocoderProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/location/GeocoderProxy$1;,
        Lcom/android/server/location/GeocoderProxy$Connection;
    }
.end annotation


# static fields
.field public static final SERVICE_ACTION:Ljava/lang/String; = "com.android.location.service.GeocodeProvider"

.field private static final TAG:Ljava/lang/String; = "GeocoderProxy"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mIntent:Landroid/content/Intent;

.field private final mMutex:Ljava/lang/Object;

.field private mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mMutex:Ljava/lang/Object;

    iput-object p1, p0, Lcom/android/server/location/GeocoderProxy;->mContext:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.location.service.GeocodeProvider"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mIntent:Landroid/content/Intent;

    invoke-virtual {p0, p2}, Lcom/android/server/location/GeocoderProxy;->reconnect(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getFromLocation(DDILandroid/location/GeocoderParams;Ljava/util/List;)Ljava/lang/String;
    .registers 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDI",
            "Landroid/location/GeocoderParams;",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    iget-object v2, p0, Lcom/android/server/location/GeocoderProxy;->mMutex:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    iget-object v1, p0, Lcom/android/server/location/GeocoderProxy;->mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;

    invoke-virtual {v1}, Lcom/android/server/location/GeocoderProxy$Connection;->getProvider()Landroid/location/IGeocodeProvider;

    move-result-object v0

    monitor-exit v2
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_17

    if-eqz v0, :cond_22

    move-wide v1, p1

    move-wide v3, p3

    move v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    :try_start_12
    invoke-interface/range {v0 .. v7}, Landroid/location/IGeocodeProvider;->getFromLocation(DDILandroid/location/GeocoderParams;Ljava/util/List;)Ljava/lang/String;
    :try_end_15
    .catch Landroid/os/RemoteException; {:try_start_12 .. :try_end_15} :catch_1a

    move-result-object v1

    :goto_16
    return-object v1

    :catchall_17
    move-exception v1

    :try_start_18
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v1

    :catch_1a
    move-exception v8

    const-string v1, "GeocoderProxy"

    const-string v2, "getFromLocation failed"

    invoke-static {v1, v2, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_22
    const-string v1, "Service not Available"

    goto :goto_16
.end method

.method public getFromLocationName(Ljava/lang/String;DDDDILandroid/location/GeocoderParams;Ljava/util/List;)Ljava/lang/String;
    .registers 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "DDDDI",
            "Landroid/location/GeocoderParams;",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    iget-object v2, p0, Lcom/android/server/location/GeocoderProxy;->mMutex:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    iget-object v1, p0, Lcom/android/server/location/GeocoderProxy;->mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;

    invoke-virtual {v1}, Lcom/android/server/location/GeocoderProxy$Connection;->getProvider()Landroid/location/IGeocodeProvider;

    move-result-object v0

    monitor-exit v2
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_20

    if-eqz v0, :cond_2b

    move-object v1, p1

    move-wide/from16 v2, p2

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move-wide/from16 v8, p8

    move/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    :try_start_1b
    invoke-interface/range {v0 .. v12}, Landroid/location/IGeocodeProvider;->getFromLocationName(Ljava/lang/String;DDDDILandroid/location/GeocoderParams;Ljava/util/List;)Ljava/lang/String;
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_1e} :catch_23

    move-result-object v1

    :goto_1f
    return-object v1

    :catchall_20
    move-exception v1

    :try_start_21
    monitor-exit v2
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw v1

    :catch_23
    move-exception v13

    const-string v1, "GeocoderProxy"

    const-string v2, "getFromLocationName failed"

    invoke-static {v1, v2, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2b
    const-string v1, "Service not Available"

    goto :goto_1f
.end method

.method public reconnect(Ljava/lang/String;)V
    .registers 7

    iget-object v1, p0, Lcom/android/server/location/GeocoderProxy;->mMutex:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/location/GeocoderProxy;->mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_e
    new-instance v0, Lcom/android/server/location/GeocoderProxy$Connection;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/android/server/location/GeocoderProxy$Connection;-><init>(Lcom/android/server/location/GeocoderProxy;Lcom/android/server/location/GeocoderProxy$1;)V

    iput-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;

    iget-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/android/server/location/GeocoderProxy;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/location/GeocoderProxy;->mIntent:Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/server/location/GeocoderProxy;->mServiceConnection:Lcom/android/server/location/GeocoderProxy$Connection;

    const/16 v4, 0x15

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    monitor-exit v1

    return-void

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v0
.end method
