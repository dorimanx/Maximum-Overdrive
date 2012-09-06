.class Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;
.super Landroid/os/Handler;
.source "BTGpsLocationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;


# direct methods
.method constructor <init>(Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;)V
    .registers 2
    .parameter

    .prologue
    .line 201
    iput-object p1, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 11
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 204
    iget v2, p1, Landroid/os/Message;->what:I

    .line 205
    .local v2, message:I
    sparse-switch v2, :sswitch_data_ec

    .line 249
    :cond_7
    :goto_7
    :sswitch_7
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$1100(Lcom/android/server/location/BTGpsLocationProvider;)Landroid/os/PowerManager$WakeLock;

    move-result-object v7

    monitor-enter v7

    .line 250
    :try_start_10
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    shl-int/2addr v6, v2

    xor-int/lit8 v6, v6, -0x1

    invoke-static {v5, v6}, Lcom/android/server/location/BTGpsLocationProvider;->access$1272(Lcom/android/server/location/BTGpsLocationProvider;I)I

    .line 251
    const/16 v5, 0x8

    if-eq v2, v5, :cond_22

    const/16 v5, 0x9

    if-ne v2, v5, :cond_29

    .line 252
    :cond_22
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$1310(Lcom/android/server/location/BTGpsLocationProvider;)I

    .line 254
    :cond_29
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->mPendingMessageBits:I
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$1200(Lcom/android/server/location/BTGpsLocationProvider;)I

    move-result v5

    if-nez v5, :cond_48

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->mPendingListenerMessages:I
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$1300(Lcom/android/server/location/BTGpsLocationProvider;)I

    move-result v5

    if-nez v5, :cond_48

    .line 255
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$1100(Lcom/android/server/location/BTGpsLocationProvider;)Landroid/os/PowerManager$WakeLock;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 257
    :cond_48
    monitor-exit v7
    :try_end_49
    .catchall {:try_start_10 .. :try_end_49} :catchall_e8

    .line 258
    return-void

    .line 207
    :sswitch_4a
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, [C

    move-object v3, v5

    check-cast v3, [C

    .line 208
    .local v3, writeBuf:[C
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 209
    .local v0, bytes:I
    if-eqz v3, :cond_7

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$300(Lcom/android/server/location/BTGpsLocationProvider;)Z

    move-result v5

    if-eqz v5, :cond_7

    if-lez v0, :cond_7

    .line 210
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v3, v7, v0}, Ljava/lang/String;-><init>([CII)V

    .line 211
    .local v4, writeMessage:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #calls: Lcom/android/server/location/BTGpsLocationProvider;->handleNMEAMessages(Ljava/lang/String;)V
    invoke-static {v5, v4}, Lcom/android/server/location/BTGpsLocationProvider;->access$400(Lcom/android/server/location/BTGpsLocationProvider;Ljava/lang/String;)V

    .line 212
    const/16 v5, 0x20

    invoke-static {v3, v5}, Ljava/util/Arrays;->fill([CC)V

    goto :goto_7

    .line 216
    .end local v0           #bytes:I
    .end local v3           #writeBuf:[C
    .end local v4           #writeMessage:Ljava/lang/String;
    :sswitch_73
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v8, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    iget v5, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_80

    move v5, v6

    :goto_7c
    #calls: Lcom/android/server/location/BTGpsLocationProvider;->notifyEnableDisableGPS(Z)V
    invoke-static {v8, v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$500(Lcom/android/server/location/BTGpsLocationProvider;Z)V

    goto :goto_7

    :cond_80
    move v5, v7

    goto :goto_7c

    .line 219
    :sswitch_82
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->mEnabled:Z
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$300(Lcom/android/server/location/BTGpsLocationProvider;)Z

    move-result v5

    if-eqz v5, :cond_7

    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$100(Lcom/android/server/location/BTGpsLocationProvider;)Lcom/android/server/location/BTGPSService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/server/location/BTGPSService;->getServiceState()I

    move-result v5

    const/4 v7, 0x3

    if-ne v5, v7, :cond_7

    .line 221
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, [B

    move-object v1, v5

    check-cast v1, [B

    .line 222
    .local v1, cmds:[B
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #getter for: Lcom/android/server/location/BTGpsLocationProvider;->btsvc:Lcom/android/server/location/BTGPSService;
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$100(Lcom/android/server/location/BTGpsLocationProvider;)Lcom/android/server/location/BTGPSService;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/android/server/location/BTGPSService;->write([B)V

    goto/16 :goto_7

    .line 226
    .end local v1           #cmds:[B
    :sswitch_af
    iget v5, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_bc

    .line 227
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #calls: Lcom/android/server/location/BTGpsLocationProvider;->handleEnable()V
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$600(Lcom/android/server/location/BTGpsLocationProvider;)V

    goto/16 :goto_7

    .line 229
    :cond_bc
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    #calls: Lcom/android/server/location/BTGpsLocationProvider;->handleDisable()V
    invoke-static {v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$700(Lcom/android/server/location/BTGpsLocationProvider;)V

    goto/16 :goto_7

    .line 239
    :sswitch_c5
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v7, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Landroid/location/Location;

    #calls: Lcom/android/server/location/BTGpsLocationProvider;->handleUpdateLocation(Landroid/location/Location;)V
    invoke-static {v7, v5}, Lcom/android/server/location/BTGpsLocationProvider;->access$800(Lcom/android/server/location/BTGpsLocationProvider;Landroid/location/Location;)V

    goto/16 :goto_7

    .line 242
    :sswitch_d2
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    iget v7, p1, Landroid/os/Message;->arg1:I

    #calls: Lcom/android/server/location/BTGpsLocationProvider;->handleAddListener(I)V
    invoke-static {v5, v7}, Lcom/android/server/location/BTGpsLocationProvider;->access$900(Lcom/android/server/location/BTGpsLocationProvider;I)V

    goto/16 :goto_7

    .line 245
    :sswitch_dd
    iget-object v5, p0, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread$1;->this$1:Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;

    iget-object v5, v5, Lcom/android/server/location/BTGpsLocationProvider$BTGPSMessageThread;->this$0:Lcom/android/server/location/BTGpsLocationProvider;

    iget v7, p1, Landroid/os/Message;->arg1:I

    #calls: Lcom/android/server/location/BTGpsLocationProvider;->handleRemoveListener(I)V
    invoke-static {v5, v7}, Lcom/android/server/location/BTGpsLocationProvider;->access$1000(Lcom/android/server/location/BTGpsLocationProvider;I)V

    goto/16 :goto_7

    .line 257
    :catchall_e8
    move-exception v5

    :try_start_e9
    monitor-exit v7
    :try_end_ea
    .catchall {:try_start_e9 .. :try_end_ea} :catchall_e8

    throw v5

    .line 205
    nop

    :sswitch_data_ec
    .sparse-switch
        0x2 -> :sswitch_af
        0x3 -> :sswitch_7
        0x4 -> :sswitch_7
        0x5 -> :sswitch_7
        0x6 -> :sswitch_7
        0x7 -> :sswitch_c5
        0x8 -> :sswitch_d2
        0x9 -> :sswitch_dd
        0xa -> :sswitch_7
        0x3e8 -> :sswitch_4a
        0x3e9 -> :sswitch_73
        0x3ea -> :sswitch_82
    .end sparse-switch
.end method
