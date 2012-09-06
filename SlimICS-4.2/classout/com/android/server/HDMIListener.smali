.class final Lcom/android/server/HDMIListener;
.super Ljava/lang/Object;
.source "HDMIListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final HDMI_CMD_CHANGE_MODE:Ljava/lang/String; = "change_mode: "

.field private static final HDMI_CMD_DISABLE_HDMI:Ljava/lang/String; = "disable_hdmi"

.field private static final HDMI_CMD_ENABLE_HDMI:Ljava/lang/String; = "enable_hdmi"

.field private static final HDMI_CMD_HPDOPTION:Ljava/lang/String; = "hdmi_hpd: "

.field private static final HDMI_CMD_SET_ASHEIGHT:Ljava/lang/String; = "set_asheight: "

.field private static final HDMI_CMD_SET_ASWIDTH:Ljava/lang/String; = "set_aswidth: "

.field private static final HDMI_EVT_AUDIO_OFF:Ljava/lang/String; = "hdmi_audio_off"

.field private static final HDMI_EVT_AUDIO_ON:Ljava/lang/String; = "hdmi_audio_on"

.field private static final HDMI_EVT_CONNECTED:Ljava/lang/String; = "hdmi_connected"

.field private static final HDMI_EVT_DISCONNECTED:Ljava/lang/String; = "hdmi_disconnected"

.field private static final HDMI_EVT_NO_BROADCAST_ONLINE:Ljava/lang/String; = "hdmi_no_broadcast_online"

.field private static final HDMI_EVT_START:Ljava/lang/String; = "hdmi_listner_started"

.field private static final HDMI_SOCKET:Ljava/lang/String; = "hdmid"

.field private static final TAG:Ljava/lang/String; = "HDMIListener"


# instance fields
.field private mEDIDs:[I

.field private mHDMIConnected:Z

.field private mHDMIEnabled:Z

.field private mOnlineBroadCast:Z

.field private mOutputStream:Ljava/io/DataOutputStream;

.field private mService:Lcom/android/server/HDMIService;


# direct methods
.method constructor <init>(Lcom/android/server/HDMIService;)V
    .registers 4
    .parameter "service"

    .prologue
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v1, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    .line 64
    iput-boolean v1, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mOnlineBroadCast:Z

    .line 67
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    .line 70
    iput-object p1, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    .line 71
    return-void
.end method

.method private handleEvent(Ljava/lang/String;)V
    .registers 9
    .parameter "event"

    .prologue
    const/4 v6, 0x0

    .line 74
    const-string v3, "HDMIListener"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleEvent \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const-string v3, "hdmi_connected"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_69

    .line 77
    const-string v3, "hdmi_connected"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, ids:[Ljava/lang/String;
    array-length v3, v2

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    .line 79
    const/4 v1, 0x0

    .local v1, i:I
    :goto_3f
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    array-length v3, v3

    if-ge v1, v3, :cond_5e

    .line 81
    :try_start_44
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v3, v1
    :try_end_52
    .catch Ljava/lang/NumberFormatException; {:try_start_44 .. :try_end_52} :catch_55

    .line 79
    :goto_52
    add-int/lit8 v1, v1, 0x1

    goto :goto_3f

    .line 82
    :catch_55
    move-exception v0

    .line 83
    .local v0, ex:Ljava/lang/NumberFormatException;
    const-string v3, "HDMIListener"

    const-string v4, "NumberFormatException in handleEvent"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_52

    .line 86
    .end local v0           #ex:Ljava/lang/NumberFormatException;
    :cond_5e
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    .line 87
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    iget-object v4, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    invoke-virtual {v3, v4}, Lcom/android/server/HDMIService;->notifyHDMIConnected([I)V

    .line 101
    .end local v1           #i:I
    .end local v2           #ids:[Ljava/lang/String;
    :cond_68
    :goto_68
    return-void

    .line 88
    :cond_69
    const-string v3, "hdmi_disconnected"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_79

    .line 89
    iput-boolean v6, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    .line 90
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    invoke-virtual {v3}, Lcom/android/server/HDMIService;->notifyHDMIDisconnected()V

    goto :goto_68

    .line 91
    :cond_79
    const-string v3, "hdmi_audio_on"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_87

    .line 93
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    invoke-virtual {v3}, Lcom/android/server/HDMIService;->notifyHDMIAudioOn()V

    goto :goto_68

    .line 94
    :cond_87
    const-string v3, "hdmi_audio_off"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_95

    .line 96
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    invoke-virtual {v3}, Lcom/android/server/HDMIService;->notifyHDMIAudioOff()V

    goto :goto_68

    .line 97
    :cond_95
    const-string v3, "hdmi_no_broadcast_online"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_68

    .line 99
    iput-boolean v6, p0, Lcom/android/server/HDMIListener;->mOnlineBroadCast:Z

    goto :goto_68
.end method

.method private listenToSocket()V
    .registers 15

    .prologue
    .line 128
    const/4 v8, 0x0

    .line 131
    .local v8, socket:Landroid/net/LocalSocket;
    :try_start_1
    new-instance v9, Landroid/net/LocalSocket;

    invoke-direct {v9}, Landroid/net/LocalSocket;-><init>()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_69

    .line 132
    .end local v8           #socket:Landroid/net/LocalSocket;
    .local v9, socket:Landroid/net/LocalSocket;
    :try_start_6
    new-instance v0, Landroid/net/LocalSocketAddress;

    const-string v11, "hdmid"

    sget-object v12, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v0, v11, v12}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 135
    .local v0, address:Landroid/net/LocalSocketAddress;
    invoke-virtual {v9, v0}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 137
    invoke-virtual {v9}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 138
    .local v7, inputStream:Ljava/io/InputStream;
    new-instance v11, Ljava/io/DataOutputStream;

    invoke-virtual {v9}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    .line 147
    const/16 v11, 0x200

    new-array v1, v11, [B

    .line 149
    .local v1, buffer:[B
    const-string v11, "hdmi_listner_started"

    const/4 v12, 0x0

    invoke-direct {p0, v11, v12}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    :cond_2b
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_2e} :catch_87

    move-result v2

    .line 152
    .local v2, count:I
    if-gez v2, :cond_52

    move-object v8, v9

    .line 167
    .end local v0           #address:Landroid/net/LocalSocketAddress;
    .end local v1           #buffer:[B
    .end local v2           #count:I
    .end local v7           #inputStream:Ljava/io/InputStream;
    .end local v9           #socket:Landroid/net/LocalSocket;
    .restart local v8       #socket:Landroid/net/LocalSocket;
    :goto_32
    monitor-enter p0

    .line 168
    :try_start_33
    iget-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;
    :try_end_35
    .catchall {:try_start_33 .. :try_end_35} :catchall_7b

    if-eqz v11, :cond_3f

    .line 170
    :try_start_37
    iget-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v11}, Ljava/io/DataOutputStream;->close()V
    :try_end_3c
    .catchall {:try_start_37 .. :try_end_3c} :catchall_7b
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3c} :catch_72

    .line 175
    :goto_3c
    const/4 v11, 0x0

    :try_start_3d
    iput-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    .line 177
    :cond_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_7b

    .line 180
    if-eqz v8, :cond_45

    .line 181
    :try_start_42
    invoke-virtual {v8}, Landroid/net/LocalSocket;->close()V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_7e

    .line 187
    :cond_45
    :goto_45
    const-string v11, "HDMIListener"

    const-string v12, "Failed to connect to hdmi daemon"

    new-instance v13, Ljava/lang/IllegalStateException;

    invoke-direct {v13}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v11, v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 188
    return-void

    .line 154
    .end local v8           #socket:Landroid/net/LocalSocket;
    .restart local v0       #address:Landroid/net/LocalSocketAddress;
    .restart local v1       #buffer:[B
    .restart local v2       #count:I
    .restart local v7       #inputStream:Ljava/io/InputStream;
    .restart local v9       #socket:Landroid/net/LocalSocket;
    :cond_52
    const/4 v10, 0x0

    .line 155
    .local v10, start:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_54
    if-ge v6, v2, :cond_2b

    .line 156
    :try_start_56
    aget-byte v11, v1, v6

    if-nez v11, :cond_66

    .line 157
    new-instance v4, Ljava/lang/String;

    sub-int v11, v6, v10

    invoke-direct {v4, v1, v10, v11}, Ljava/lang/String;-><init>([BII)V

    .line 158
    .local v4, event:Ljava/lang/String;
    invoke-direct {p0, v4}, Lcom/android/server/HDMIListener;->handleEvent(Ljava/lang/String;)V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_64} :catch_87

    .line 159
    add-int/lit8 v10, v6, 0x1

    .line 155
    .end local v4           #event:Ljava/lang/String;
    :cond_66
    add-int/lit8 v6, v6, 0x1

    goto :goto_54

    .line 163
    .end local v0           #address:Landroid/net/LocalSocketAddress;
    .end local v1           #buffer:[B
    .end local v2           #count:I
    .end local v6           #i:I
    .end local v7           #inputStream:Ljava/io/InputStream;
    .end local v9           #socket:Landroid/net/LocalSocket;
    .end local v10           #start:I
    .restart local v8       #socket:Landroid/net/LocalSocket;
    :catch_69
    move-exception v5

    .line 164
    .local v5, ex:Ljava/io/IOException;
    :goto_6a
    const-string v11, "HDMIListener"

    const-string v12, "Could not open listner socket"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_32

    .line 171
    .end local v5           #ex:Ljava/io/IOException;
    :catch_72
    move-exception v3

    .line 172
    .local v3, e:Ljava/io/IOException;
    :try_start_73
    const-string v11, "HDMIListener"

    const-string v12, "IOException closing output stream"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3c

    .line 177
    .end local v3           #e:Ljava/io/IOException;
    :catchall_7b
    move-exception v11

    monitor-exit p0
    :try_end_7d
    .catchall {:try_start_73 .. :try_end_7d} :catchall_7b

    throw v11

    .line 183
    :catch_7e
    move-exception v5

    .line 184
    .restart local v5       #ex:Ljava/io/IOException;
    const-string v11, "HDMIListener"

    const-string v12, "IOException closing socket"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_45

    .line 163
    .end local v5           #ex:Ljava/io/IOException;
    .end local v8           #socket:Landroid/net/LocalSocket;
    .restart local v9       #socket:Landroid/net/LocalSocket;
    :catch_87
    move-exception v5

    move-object v8, v9

    .end local v9           #socket:Landroid/net/LocalSocket;
    .restart local v8       #socket:Landroid/net/LocalSocket;
    goto :goto_6a
.end method

.method private writeCommand(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .parameter "command"
    .parameter "argument"

    .prologue
    .line 104
    monitor-enter p0

    .line 105
    :try_start_1
    iget-object v2, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    if-nez v2, :cond_11

    .line 106
    const-string v2, "HDMIListener"

    const-string v3, "No connection to hdmi daemon"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    :goto_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_68

    .line 124
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 125
    return-void

    .line 108
    :cond_11
    :try_start_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .local v0, builder:Ljava/lang/StringBuilder;
    if-eqz p2, :cond_1b

    .line 110
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    :cond_1b
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_1f
    .catchall {:try_start_11 .. :try_end_1f} :catchall_68

    .line 115
    :try_start_1f
    iget-object v2, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 116
    iget-object v2, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    .line 117
    const-string v2, "HDMIListener"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writeCommand: \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5e
    .catchall {:try_start_1f .. :try_end_5e} :catchall_68
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_5e} :catch_5f

    goto :goto_c

    .line 119
    :catch_5f
    move-exception v1

    .line 120
    .local v1, ex:Ljava/io/IOException;
    :try_start_60
    const-string v2, "HDMIListener"

    const-string v3, "IOException in writeCommand"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c

    .line 123
    .end local v0           #builder:Ljava/lang/StringBuilder;
    .end local v1           #ex:Ljava/io/IOException;
    :catchall_68
    move-exception v2

    monitor-exit p0
    :try_end_6a
    .catchall {:try_start_60 .. :try_end_6a} :catchall_68

    throw v2
.end method


# virtual methods
.method public changeDisplayMode(I)V
    .registers 4
    .parameter "mode"

    .prologue
    .line 226
    const-string v0, "change_mode: "

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method public enableHDMIOutput(Z)V
    .registers 4
    .parameter "hdmiEnable"

    .prologue
    const/4 v1, 0x0

    .line 211
    iget-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    if-ne v0, p1, :cond_d

    .line 212
    const-string v0, "HDMIListener"

    const-string v1, "enableHDMIOutput ignored, unchanged!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    :goto_c
    return-void

    .line 215
    :cond_d
    if-eqz p1, :cond_18

    .line 216
    const-string v0, "enable_hdmi"

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    goto :goto_c

    .line 220
    :cond_18
    const-string v0, "disable_hdmi"

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    goto :goto_c
.end method

.method getOnlineBroadcast()Z
    .registers 2

    .prologue
    .line 207
    iget-boolean v0, p0, Lcom/android/server/HDMIListener;->mOnlineBroadCast:Z

    return v0
.end method

.method isHDMIConnected()Z
    .registers 2

    .prologue
    .line 203
    iget-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    return v0
.end method

.method public run()V
    .registers 5

    .prologue
    .line 195
    :try_start_0
    invoke-direct {p0}, Lcom/android/server/HDMIListener;->listenToSocket()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 200
    :goto_3
    return-void

    .line 196
    :catch_4
    move-exception v0

    .line 198
    .local v0, t:Ljava/lang/Throwable;
    const-string v1, "HDMIListener"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fatal error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in HDMIListener thread!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method

.method public setActionsafeHeightRatio(F)V
    .registers 4
    .parameter "asHeightRatio"

    .prologue
    .line 234
    const-string v0, "set_asheight: "

    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, p1}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {v1}, Ljava/lang/Float;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    return-void
.end method

.method public setActionsafeWidthRatio(F)V
    .registers 4
    .parameter "asWidthRatio"

    .prologue
    .line 230
    const-string v0, "set_aswidth: "

    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, p1}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {v1}, Ljava/lang/Float;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    return-void
.end method

.method public setHPD(Z)V
    .registers 5
    .parameter "hpdOption"

    .prologue
    .line 238
    const-string v1, "hdmi_hpd: "

    new-instance v2, Ljava/lang/Integer;

    if-eqz p1, :cond_12

    const/4 v0, 0x1

    :goto_7
    invoke-direct {v2, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    return-void

    .line 238
    :cond_12
    const/4 v0, 0x0

    goto :goto_7
.end method
