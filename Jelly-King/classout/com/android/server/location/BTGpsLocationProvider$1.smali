.class Lcom/android/server/location/BTGpsLocationProvider$1;
.super Landroid/content/BroadcastReceiver;
.source "BTGpsLocationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/location/BTGpsLocationProvider;-><init>(Landroid/content/Context;Landroid/location/ILocationManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/location/BTGpsLocationProvider;


# direct methods
.method constructor <init>(Lcom/android/server/location/BTGpsLocationProvider;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/location/BTGpsLocationProvider$1;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    const-string v2, "android.bluetooth.adapter.extra.STATE"

    const/high16 v3, -0x8000

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    packed-switch v1, :pswitch_data_3e

    :cond_17
    :goto_17
    return-void

    :pswitch_18
    const-string v2, "BTGpsLocationProvider"

    const-string v3, "BT turned on -> notify services?"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17

    :pswitch_20
    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider$1;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;
    invoke-static {v2}, Lcom/android/server/location/BTGpsLocationProvider;->access$100(Lcom/android/server/location/BTGpsLocationProvider;)Lcom/android/server/location/BTGPSService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/location/BTGPSService;->getServiceState()I

    move-result v2

    if-eqz v2, :cond_17

    const-string v2, "BTGpsLocationProvider"

    const-string v3, "BT turned off -> stopping services"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/server/location/BTGpsLocationProvider$1;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;
    invoke-static {v2}, Lcom/android/server/location/BTGpsLocationProvider;->access$100(Lcom/android/server/location/BTGpsLocationProvider;)Lcom/android/server/location/BTGPSService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/location/BTGPSService;->stop()V

    goto :goto_17

    nop

    :pswitch_data_3e
    .packed-switch 0xc
        :pswitch_18
        :pswitch_20
    .end packed-switch
.end method
