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

.field private static final HDMI_EVT_START:Ljava/lang/String; = "hdmi_listner_started"

.field private static final HDMI_SOCKET:Ljava/lang/String; = "hdmid"

.field private static final TAG:Ljava/lang/String; = "HDMIListener"


# instance fields
.field private mEDIDs:[I

.field private mHDMIConnected:Z

.field private mHDMIEnabled:Z

.field private mOutputStream:Ljava/io/DataOutputStream;

.field private mService:Lcom/android/server/HDMIService;


# direct methods
.method constructor <init>(Lcom/android/server/HDMIService;)V
    .registers 3
    .parameter "service"

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    .line 63
    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    .line 64
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    .line 67
    iput-object p1, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    .line 68
    return-void
.end method

.method private handleEvent(Ljava/lang/String;)V
    .registers 8
    .parameter "event"

    .prologue
    .line 71
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

    .line 73
    const-string v3, "hdmi_connected"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_68

    .line 74
    const-string v3, "hdmi_connected"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, ids:[Ljava/lang/String;
    array-length v3, v2

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    .line 76
    const/4 v1, 0x0

    .local v1, i:I
    :goto_3e
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    array-length v3, v3

    if-ge v1, v3, :cond_5d

    .line 78
    :try_start_43
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v3, v1
    :try_end_51
    .catch Ljava/lang/NumberFormatException; {:try_start_43 .. :try_end_51} :catch_54

    .line 76
    :goto_51
    add-int/lit8 v1, v1, 0x1

    goto :goto_3e

    .line 79
    :catch_54
    move-exception v0

    .line 80
    .local v0, ex:Ljava/lang/NumberFormatException;
    const-string v3, "HDMIListener"

    const-string v4, "NumberFormatException in handleEvent"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_51

    .line 83
    .end local v0           #ex:Ljava/lang/NumberFormatException;
    :cond_5d
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    .line 84
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    iget-object v4, p0, Lcom/android/server/HDMIListener;->mEDIDs:[I

    invoke-virtual {v3, v4}, Lcom/android/server/HDMIService;->notifyHDMIConnected([I)V

    .line 95
    .end local v1           #i:I
    .end local v2           #ids:[Ljava/lang/String;
    :cond_67
    :goto_67
    return-void

    .line 85
    :cond_68
    const-string v3, "hdmi_disconnected"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_79

    .line 86
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    .line 87
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    invoke-virtual {v3}, Lcom/android/server/HDMIService;->notifyHDMIDisconnected()V

    goto :goto_67

    .line 88
    :cond_79
    const-string v3, "hdmi_audio_on"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_87

    .line 90
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    invoke-virtual {v3}, Lcom/android/server/HDMIService;->notifyHDMIAudioOn()V

    goto :goto_67

    .line 91
    :cond_87
    const-string v3, "hdmi_audio_off"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_67

    .line 93
    iget-object v3, p0, Lcom/android/server/HDMIListener;->mService:Lcom/android/server/HDMIService;

    invoke-virtual {v3}, Lcom/android/server/HDMIService;->notifyHDMIAudioOff()V

    goto :goto_67
.end method

.method private listenToSocket()V
    .registers 15

    .prologue
    .line 122
    const/4 v8, 0x0

    .line 125
    .local v8, socket:Landroid/net/LocalSocket;
    :try_start_1
    new-instance v9, Landroid/net/LocalSocket;

    invoke-direct {v9}, Landroid/net/LocalSocket;-><init>()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_69

    .line 126
    .end local v8           #socket:Landroid/net/LocalSocket;
    .local v9, socket:Landroid/net/LocalSocket;
    :try_start_6
    new-instance v0, Landroid/net/LocalSocketAddress;

    const-string v11, "hdmid"

    sget-object v12, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v0, v11, v12}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 129
    .local v0, address:Landroid/net/LocalSocketAddress;
    invoke-virtual {v9, v0}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 131
    invoke-virtual {v9}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 132
    .local v7, inputStream:Ljava/io/InputStream;
    new-instance v11, Ljava/io/DataOutputStream;

    invoke-virtual {v9}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    .line 141
    const/16 v11, 0x200

    new-array v1, v11, [B

    .line 143
    .local v1, buffer:[B
    const-string v11, "hdmi_listner_started"

    const/4 v12, 0x0

    invoke-direct {p0, v11, v12}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    :cond_2b
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_2e} :catch_87

    move-result v2

    .line 146
    .local v2, count:I
    if-gez v2, :cond_52

    move-object v8, v9

    .line 161
    .end local v0           #address:Landroid/net/LocalSocketAddress;
    .end local v1           #buffer:[B
    .end local v2           #count:I
    .end local v7           #inputStream:Ljava/io/InputStream;
    .end local v9           #socket:Landroid/net/LocalSocket;
    .restart local v8       #socket:Landroid/net/LocalSocket;
    :goto_32
    monitor-enter p0

    .line 162
    :try_start_33
    iget-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;
    :try_end_35
    .catchall {:try_start_33 .. :try_end_35} :catchall_7b

    if-eqz v11, :cond_3f

    .line 164
    :try_start_37
    iget-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v11}, Ljava/io/DataOutputStream;->close()V
    :try_end_3c
    .catchall {:try_start_37 .. :try_end_3c} :catchall_7b
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3c} :catch_72

    .line 169
    :goto_3c
    const/4 v11, 0x0

    :try_start_3d
    iput-object v11, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    .line 171
    :cond_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_7b

    .line 174
    if-eqz v8, :cond_45

    .line 175
    :try_start_42
    invoke-virtual {v8}, Landroid/net/LocalSocket;->close()V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_7e

    .line 181
    :cond_45
    :goto_45
    const-string v11, "HDMIListener"

    const-string v12, "Failed to connect to hdmi daemon"

    new-instance v13, Ljava/lang/IllegalStateException;

    invoke-direct {v13}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v11, v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 182
    return-void

    .line 148
    .end local v8           #socket:Landroid/net/LocalSocket;
    .restart local v0       #address:Landroid/net/LocalSocketAddress;
    .restart local v1       #buffer:[B
    .restart local v2       #count:I
    .restart local v7       #inputStream:Ljava/io/InputStream;
    .restart local v9       #socket:Landroid/net/LocalSocket;
    :cond_52
    const/4 v10, 0x0

    .line 149
    .local v10, start:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_54
    if-ge v6, v2, :cond_2b

    .line 150
    :try_start_56
    aget-byte v11, v1, v6

    if-nez v11, :cond_66

    .line 151
    new-instance v4, Ljava/lang/String;

    sub-int v11, v6, v10

    invoke-direct {v4, v1, v10, v11}, Ljava/lang/String;-><init>([BII)V

    .line 152
    .local v4, event:Ljava/lang/String;
    invoke-direct {p0, v4}, Lcom/android/server/HDMIListener;->handleEvent(Ljava/lang/String;)V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_64} :catch_87

    .line 153
    add-int/lit8 v10, v6, 0x1

    .line 149
    .end local v4           #event:Ljava/lang/String;
    :cond_66
    add-int/lit8 v6, v6, 0x1

    goto :goto_54

    .line 157
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

    .line 158
    .local v5, ex:Ljava/io/IOException;
    :goto_6a
    const-string v11, "HDMIListener"

    const-string v12, "Could not open listner socket"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_32

    .line 165
    .end local v5           #ex:Ljava/io/IOException;
    :catch_72
    move-exception v3

    .line 166
    .local v3, e:Ljava/io/IOException;
    :try_start_73
    const-string v11, "HDMIListener"

    const-string v12, "IOException closing output stream"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3c

    .line 171
    .end local v3           #e:Ljava/io/IOException;
    :catchall_7b
    move-exception v11

    monitor-exit p0
    :try_end_7d
    .catchall {:try_start_73 .. :try_end_7d} :catchall_7b

    throw v11

    .line 177
    :catch_7e
    move-exception v5

    .line 178
    .restart local v5       #ex:Ljava/io/IOException;
    const-string v11, "HDMIListener"

    const-string v12, "IOException closing socket"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_45

    .line 157
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
    .line 98
    monitor-enter p0

    .line 99
    :try_start_1
    iget-object v2, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    if-nez v2, :cond_11

    .line 100
    const-string v2, "HDMIListener"

    const-string v3, "No connection to hdmi daemon"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    :goto_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_68

    .line 118
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 119
    return-void

    .line 102
    :cond_11
    :try_start_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .local v0, builder:Ljava/lang/StringBuilder;
    if-eqz p2, :cond_1b

    .line 104
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    :cond_1b
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_1f
    .catchall {:try_start_11 .. :try_end_1f} :catchall_68

    .line 109
    :try_start_1f
    iget-object v2, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 110
    iget-object v2, p0, Lcom/android/server/HDMIListener;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    .line 111
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

    .line 113
    :catch_5f
    move-exception v1

    .line 114
    .local v1, ex:Ljava/io/IOException;
    :try_start_60
    const-string v2, "HDMIListener"

    const-string v3, "IOException in writeCommand"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c

    .line 117
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
    .line 216
    const-string v0, "change_mode: "

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method public enableHDMIOutput(Z)V
    .registers 4
    .parameter "hdmiEnable"

    .prologue
    const/4 v1, 0x0

    .line 201
    iget-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    if-ne v0, p1, :cond_d

    .line 202
    const-string v0, "HDMIListener"

    const-string v1, "enableHDMIOutput ignored, unchanged!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    :goto_c
    return-void

    .line 205
    :cond_d
    if-eqz p1, :cond_18

    .line 206
    const-string v0, "enable_hdmi"

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    goto :goto_c

    .line 210
    :cond_18
    const-string v0, "disable_hdmi"

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIEnabled:Z

    goto :goto_c
.end method

.method isHDMIConnected()Z
    .registers 2

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/android/server/HDMIListener;->mHDMIConnected:Z

    return v0
.end method

.method public run()V
    .registers 5

    .prologue
    .line 189
    :try_start_0
    invoke-direct {p0}, Lcom/android/server/HDMIListener;->listenToSocket()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 194
    :goto_3
    return-void

    .line 190
    :catch_4
    move-exception v0

    .line 192
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
    .line 224
    const-string v0, "set_asheight: "

    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, p1}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {v1}, Ljava/lang/Float;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public setActionsafeWidthRatio(F)V
    .registers 4
    .parameter "asWidthRatio"

    .prologue
    .line 220
    const-string v0, "set_aswidth: "

    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, p1}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {v1}, Ljava/lang/Float;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method public setHPD(Z)V
    .registers 5
    .parameter "hpdOption"

    .prologue
    .line 228
    const-string v1, "hdmi_hpd: "

    new-instance v2, Ljava/lang/Integer;

    if-eqz p1, :cond_12

    const/4 v0, 0x1

    :goto_7
    invoke-direct {v2, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/android/server/HDMIListener;->writeCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    return-void

    .line 228
    :cond_12
    const/4 v0, 0x0

    goto :goto_7
.end method
