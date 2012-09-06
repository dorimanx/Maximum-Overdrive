.class Lcom/android/server/location/GeocoderProxy$Connection;
.super Ljava/lang/Object;
.source "GeocoderProxy.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/location/GeocoderProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Connection"
.end annotation


# instance fields
.field private mProvider:Landroid/location/IGeocodeProvider;

.field final synthetic this$0:Lcom/android/server/location/GeocoderProxy;


# direct methods
.method private constructor <init>(Lcom/android/server/location/GeocoderProxy;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/location/GeocoderProxy$Connection;->this$0:Lcom/android/server/location/GeocoderProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/location/GeocoderProxy;Lcom/android/server/location/GeocoderProxy$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/android/server/location/GeocoderProxy$Connection;-><init>(Lcom/android/server/location/GeocoderProxy;)V

    return-void
.end method


# virtual methods
.method public getProvider()Landroid/location/IGeocodeProvider;
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/server/location/GeocoderProxy$Connection;->mProvider:Landroid/location/IGeocodeProvider;

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    invoke-static {p2}, Landroid/location/IGeocodeProvider$Stub;->asInterface(Landroid/os/IBinder;)Landroid/location/IGeocodeProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/location/GeocoderProxy$Connection;->mProvider:Landroid/location/IGeocodeProvider;

    monitor-exit p0

    return-void

    :catchall_9
    move-exception v0

    monitor-exit p0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 3

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/android/server/location/GeocoderProxy$Connection;->mProvider:Landroid/location/IGeocodeProvider;

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_6

    throw v0
.end method
