.class Lcom/android/server/enterprise/SecurityPolicy$1;
.super Landroid/content/BroadcastReceiver;
.source "SecurityPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/enterprise/SecurityPolicy;->formatStorageCard(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/enterprise/SecurityPolicy;

.field final synthetic val$lock:Ljava/lang/Object;

.field final synthetic val$storageVolumes:[Landroid/os/storage/StorageVolume;


# direct methods
.method constructor <init>(Lcom/android/server/enterprise/SecurityPolicy;[Landroid/os/storage/StorageVolume;Ljava/lang/Object;)V
    .registers 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 242
    iput-object p1, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->this$0:Lcom/android/server/enterprise/SecurityPolicy;

    iput-object p2, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->val$storageVolumes:[Landroid/os/storage/StorageVolume;

    iput-object p3, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->val$lock:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    .line 244
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 245
    .local v0, action:Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, path:Ljava/lang/String;
    const-string v3, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    iget-object v3, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->val$storageVolumes:[Landroid/os/storage/StorageVolume;

    aget-object v3, v3, v4

    invoke-virtual {v3}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 248
    iget-object v4, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->val$lock:Ljava/lang/Object;

    monitor-enter v4

    .line 250
    :try_start_26
    iget-object v3, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->this$0:Lcom/android/server/enterprise/SecurityPolicy;

    const/4 v5, 0x1

    #setter for: Lcom/android/server/enterprise/SecurityPolicy;->mMediaFormatRet:Z
    invoke-static {v3, v5}, Lcom/android/server/enterprise/SecurityPolicy;->access$002(Lcom/android/server/enterprise/SecurityPolicy;Z)Z

    .line 251
    iget-object v3, p0, Lcom/android/server/enterprise/SecurityPolicy$1;->val$lock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V
    :try_end_31
    .catchall {:try_start_26 .. :try_end_31} :catchall_3c
    .catch Ljava/lang/IllegalMonitorStateException; {:try_start_26 .. :try_end_31} :catch_33

    .line 255
    :goto_31
    :try_start_31
    monitor-exit v4

    .line 257
    :cond_32
    return-void

    .line 252
    :catch_33
    move-exception v1

    .line 253
    .local v1, e:Ljava/lang/IllegalMonitorStateException;
    const-string v3, "SecurityPolicy"

    const-string v5, "formatStorageCard - IllegalMonitorStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_31

    .line 255
    .end local v1           #e:Ljava/lang/IllegalMonitorStateException;
    :catchall_3c
    move-exception v3

    monitor-exit v4
    :try_end_3e
    .catchall {:try_start_31 .. :try_end_3e} :catchall_3c

    throw v3
.end method
