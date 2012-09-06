.class Lcom/android/server/pm/ShutdownThread$9;
.super Ljava/lang/Thread;
.source "ShutdownThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/pm/ShutdownThread;->shutdownRadios(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/pm/ShutdownThread;

.field final synthetic val$done:[Z

.field final synthetic val$endTime:J


# direct methods
.method constructor <init>(Lcom/android/server/pm/ShutdownThread;J[Z)V
    .registers 5

    iput-object p1, p0, Lcom/android/server/pm/ShutdownThread$9;->this$0:Lcom/android/server/pm/ShutdownThread;

    iput-wide p2, p0, Lcom/android/server/pm/ShutdownThread$9;->val$endTime:J

    iput-object p4, p0, Lcom/android/server/pm/ShutdownThread$9;->val$done:[Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    const/16 v13, 0xa

    const/4 v7, 0x1

    const/4 v8, 0x0

    const-string v9, "nfc"

    invoke-static {v9}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v9

    invoke-static {v9}, Landroid/nfc/INfcAdapter$Stub;->asInterface(Landroid/os/IBinder;)Landroid/nfc/INfcAdapter;

    move-result-object v3

    const-string v9, "phone"

    invoke-static {v9}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v9

    invoke-static {v9}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v5

    const-string v9, "bluetooth"

    invoke-static {v9}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v9

    invoke-static {v9}, Landroid/bluetooth/IBluetooth$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetooth;

    move-result-object v0

    if-eqz v3, :cond_2a

    :try_start_24
    invoke-interface {v3}, Landroid/nfc/INfcAdapter;->getState()I

    move-result v9

    if-ne v9, v7, :cond_bd

    :cond_2a
    move v4, v7

    :goto_2b
    if-nez v4, :cond_38

    const-string v9, "ShutdownThread"

    const-string v10, "Turning off NFC..."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v9, 0x0

    invoke-interface {v3, v9}, Landroid/nfc/INfcAdapter;->disable(Z)Z
    :try_end_38
    .catch Landroid/os/RemoteException; {:try_start_24 .. :try_end_38} :catch_c0

    :cond_38
    :goto_38
    if-eqz v0, :cond_40

    :try_start_3a
    invoke-interface {v0}, Landroid/bluetooth/IBluetooth;->getBluetoothState()I

    move-result v9

    if-ne v9, v13, :cond_cb

    :cond_40
    move v1, v7

    :goto_41
    if-nez v1, :cond_4e

    const-string v9, "ShutdownThread"

    const-string v10, "Disabling Bluetooth..."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v9, 0x0

    invoke-interface {v0, v9}, Landroid/bluetooth/IBluetooth;->disable(Z)Z
    :try_end_4e
    .catch Landroid/os/RemoteException; {:try_start_3a .. :try_end_4e} :catch_ce

    :cond_4e
    :goto_4e
    if-eqz v5, :cond_56

    :try_start_50
    invoke-interface {v5}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z

    move-result v9

    if-nez v9, :cond_d9

    :cond_56
    move v6, v7

    :goto_57
    if-nez v6, :cond_64

    const-string v9, "ShutdownThread"

    const-string v10, "Turning off radio..."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v9, 0x0

    invoke-interface {v5, v9}, Lcom/android/internal/telephony/ITelephony;->setRadio(Z)Z
    :try_end_64
    .catch Landroid/os/RemoteException; {:try_start_50 .. :try_end_64} :catch_dc

    :cond_64
    :goto_64
    const-string v9, "ShutdownThread"

    const-string v10, "Waiting for NFC, Bluetooth and Radio..."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_6b
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    iget-wide v11, p0, Lcom/android/server/pm/ShutdownThread$9;->val$endTime:J

    cmp-long v9, v9, v11

    if-gez v9, :cond_bc

    if-nez v1, :cond_87

    :try_start_77
    invoke-interface {v0}, Landroid/bluetooth/IBluetooth;->getBluetoothState()I
    :try_end_7a
    .catch Landroid/os/RemoteException; {:try_start_77 .. :try_end_7a} :catch_e9

    move-result v9

    if-ne v9, v13, :cond_e7

    move v1, v7

    :goto_7e
    if-eqz v1, :cond_87

    const-string v9, "ShutdownThread"

    const-string v10, "Bluetooth turned off."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_87
    if-nez v6, :cond_99

    :try_start_89
    invoke-interface {v5}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z
    :try_end_8c
    .catch Landroid/os/RemoteException; {:try_start_89 .. :try_end_8c} :catch_f5

    move-result v9

    if-nez v9, :cond_f3

    move v6, v7

    :goto_90
    if-eqz v6, :cond_99

    const-string v9, "ShutdownThread"

    const-string v10, "Radio turned off."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_99
    if-nez v4, :cond_ab

    :try_start_9b
    invoke-interface {v3}, Landroid/nfc/INfcAdapter;->getState()I
    :try_end_9e
    .catch Landroid/os/RemoteException; {:try_start_9b .. :try_end_9e} :catch_101

    move-result v9

    if-ne v9, v7, :cond_ff

    move v4, v7

    :goto_a2
    if-eqz v6, :cond_ab

    const-string v9, "ShutdownThread"

    const-string v10, "NFC turned off."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_ab
    if-eqz v6, :cond_10b

    if-eqz v1, :cond_10b

    if-eqz v4, :cond_10b

    const-string v9, "ShutdownThread"

    const-string v10, "NFC, Radio and Bluetooth shutdown complete."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v9, p0, Lcom/android/server/pm/ShutdownThread$9;->val$done:[Z

    aput-boolean v7, v9, v8

    :cond_bc
    return-void

    :cond_bd
    move v4, v8

    goto/16 :goto_2b

    :catch_c0
    move-exception v2

    const-string v9, "ShutdownThread"

    const-string v10, "RemoteException during NFC shutdown"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v4, 0x1

    goto/16 :goto_38

    :cond_cb
    move v1, v8

    goto/16 :goto_41

    :catch_ce
    move-exception v2

    const-string v9, "ShutdownThread"

    const-string v10, "RemoteException during bluetooth shutdown"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v1, 0x1

    goto/16 :goto_4e

    :cond_d9
    move v6, v8

    goto/16 :goto_57

    :catch_dc
    move-exception v2

    const-string v9, "ShutdownThread"

    const-string v10, "RemoteException during radio shutdown"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v6, 0x1

    goto/16 :goto_64

    :cond_e7
    move v1, v8

    goto :goto_7e

    :catch_e9
    move-exception v2

    const-string v9, "ShutdownThread"

    const-string v10, "RemoteException during bluetooth shutdown"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v1, 0x1

    goto :goto_7e

    :cond_f3
    move v6, v8

    goto :goto_90

    :catch_f5
    move-exception v2

    const-string v9, "ShutdownThread"

    const-string v10, "RemoteException during radio shutdown"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v6, 0x1

    goto :goto_90

    :cond_ff
    move v4, v8

    goto :goto_a2

    :catch_101
    move-exception v2

    const-string v9, "ShutdownThread"

    const-string v10, "RemoteException during NFC shutdown"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v4, 0x1

    goto :goto_a2

    :cond_10b
    const-wide/16 v9, 0x1f4

    invoke-static {v9, v10}, Landroid/os/SystemClock;->sleep(J)V

    goto/16 :goto_6b
.end method
