.class public Lcom/android/server/ClipboardService;
.super Landroid/content/IClipboard$Stub;
.source "ClipboardService.java"


# instance fields
.field private edm:Landroid/app/enterprise/EnterpriseDeviceManager;

.field private final mActivePermissionOwners:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mAm:Landroid/app/IActivityManager;

.field private final mContext:Landroid/content/Context;

.field private final mPermissionOwner:Landroid/os/IBinder;

.field private final mPm:Landroid/content/pm/PackageManager;

.field private mPrimaryClip:Landroid/content/ClipData;

.field private final mPrimaryClipListeners:Landroid/os/RemoteCallbackList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/RemoteCallbackList",
            "<",
            "Landroid/content/IOnPrimaryClipChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private mRestrictionPolicy:Landroid/app/enterprise/RestrictionPolicy;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    .line 72
    invoke-direct {p0}, Landroid/content/IClipboard$Stub;-><init>()V

    .line 56
    new-instance v2, Landroid/os/RemoteCallbackList;

    invoke-direct {v2}, Landroid/os/RemoteCallbackList;-><init>()V

    iput-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClipListeners:Landroid/os/RemoteCallbackList;

    .line 61
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/android/server/ClipboardService;->mActivePermissionOwners:Ljava/util/HashSet;

    .line 74
    const-string v2, "enterprise_policy"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/enterprise/EnterpriseDeviceManager;

    iput-object v2, p0, Lcom/android/server/ClipboardService;->edm:Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 76
    iget-object v2, p0, Lcom/android/server/ClipboardService;->edm:Landroid/app/enterprise/EnterpriseDeviceManager;

    if-eqz v2, :cond_27

    .line 77
    iget-object v2, p0, Lcom/android/server/ClipboardService;->edm:Landroid/app/enterprise/EnterpriseDeviceManager;

    invoke-virtual {v2}, Landroid/app/enterprise/EnterpriseDeviceManager;->getRestrictionPolicy()Landroid/app/enterprise/RestrictionPolicy;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ClipboardService;->mRestrictionPolicy:Landroid/app/enterprise/RestrictionPolicy;

    .line 80
    :cond_27
    iput-object p1, p0, Lcom/android/server/ClipboardService;->mContext:Landroid/content/Context;

    .line 81
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ClipboardService;->mAm:Landroid/app/IActivityManager;

    .line 82
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ClipboardService;->mPm:Landroid/content/pm/PackageManager;

    .line 83
    const/4 v1, 0x0

    .line 85
    .local v1, permOwner:Landroid/os/IBinder;
    :try_start_36
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mAm:Landroid/app/IActivityManager;

    const-string v3, "clipboard"

    invoke-interface {v2, v3}, Landroid/app/IActivityManager;->newUriPermissionOwner(Ljava/lang/String;)Landroid/os/IBinder;
    :try_end_3d
    .catch Landroid/os/RemoteException; {:try_start_36 .. :try_end_3d} :catch_41

    move-result-object v1

    .line 89
    :goto_3e
    iput-object v1, p0, Lcom/android/server/ClipboardService;->mPermissionOwner:Landroid/os/IBinder;

    .line 90
    return-void

    .line 86
    :catch_41
    move-exception v0

    .line 87
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "clipboard"

    const-string v3, "AM dead"

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3e
.end method

.method private final addActiveOwnerLocked(ILjava/lang/String;)V
    .registers 10
    .parameter "uid"
    .parameter "pkg"

    .prologue
    .line 235
    :try_start_0
    iget-object v4, p0, Lcom/android/server/ClipboardService;->mPm:Landroid/content/pm/PackageManager;

    const/4 v5, 0x0

    invoke-virtual {v4, p2, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 236
    .local v3, pi:Landroid/content/pm/PackageInfo;
    iget-object v4, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    if-eq v4, p1, :cond_4a

    .line 237
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Calling uid "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " does not own package "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_30
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_30} :catch_30

    .line 240
    .end local v3           #pi:Landroid/content/pm/PackageInfo;
    :catch_30
    move-exception v1

    .line 241
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown package "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 243
    .end local v1           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3       #pi:Landroid/content/pm/PackageInfo;
    :cond_4a
    iget-object v4, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    if-eqz v4, :cond_70

    iget-object v4, p0, Lcom/android/server/ClipboardService;->mActivePermissionOwners:Ljava/util/HashSet;

    invoke-virtual {v4, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_70

    .line 244
    iget-object v4, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    invoke-virtual {v4}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    .line 245
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_5d
    if-ge v2, v0, :cond_6b

    .line 246
    iget-object v4, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    invoke-virtual {v4, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    invoke-direct {p0, v4, p2}, Lcom/android/server/ClipboardService;->grantItemLocked(Landroid/content/ClipData$Item;Ljava/lang/String;)V

    .line 245
    add-int/lit8 v2, v2, 0x1

    goto :goto_5d

    .line 248
    :cond_6b
    iget-object v4, p0, Lcom/android/server/ClipboardService;->mActivePermissionOwners:Ljava/util/HashSet;

    invoke-virtual {v4, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 250
    .end local v0           #N:I
    .end local v2           #i:I
    :cond_70
    return-void
.end method

.method private final checkDataOwnerLocked(Landroid/content/ClipData;I)V
    .registers 6
    .parameter "data"
    .parameter "uid"

    .prologue
    .line 205
    invoke-virtual {p1}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    .line 206
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_5
    if-ge v1, v0, :cond_11

    .line 207
    invoke-virtual {p1, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/android/server/ClipboardService;->checkItemOwnerLocked(Landroid/content/ClipData$Item;I)V

    .line 206
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 209
    :cond_11
    return-void
.end method

.method private final checkItemOwnerLocked(Landroid/content/ClipData$Item;I)V
    .registers 5
    .parameter "item"
    .parameter "uid"

    .prologue
    .line 195
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_d

    .line 196
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/android/server/ClipboardService;->checkUriOwnerLocked(Landroid/net/Uri;I)V

    .line 198
    :cond_d
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 199
    .local v0, intent:Landroid/content/Intent;
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 200
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/android/server/ClipboardService;->checkUriOwnerLocked(Landroid/net/Uri;I)V

    .line 202
    :cond_20
    return-void
.end method

.method private final checkUriOwnerLocked(Landroid/net/Uri;I)V
    .registers 9
    .parameter "uri"
    .parameter "uid"

    .prologue
    .line 180
    const-string v3, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 192
    :goto_c
    return-void

    .line 183
    :cond_d
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 184
    .local v1, ident:J
    const/4 v0, 0x0

    .line 187
    .local v0, allowed:Z
    :try_start_12
    iget-object v3, p0, Lcom/android/server/ClipboardService;->mAm:Landroid/app/IActivityManager;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-interface {v3, p2, v4, p1, v5}, Landroid/app/IActivityManager;->checkGrantUriPermission(ILjava/lang/String;Landroid/net/Uri;I)I
    :try_end_19
    .catchall {:try_start_12 .. :try_end_19} :catchall_1d
    .catch Landroid/os/RemoteException; {:try_start_12 .. :try_end_19} :catch_22

    .line 190
    :goto_19
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_c

    :catchall_1d
    move-exception v3

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3

    .line 188
    :catch_22
    move-exception v3

    goto :goto_19
.end method

.method private final clearActiveOwnersLocked()V
    .registers 4

    .prologue
    .line 275
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mActivePermissionOwners:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 276
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    if-nez v2, :cond_a

    .line 283
    :cond_9
    return-void

    .line 279
    :cond_a
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    invoke-virtual {v2}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    .line 280
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_11
    if-ge v1, v0, :cond_9

    .line 281
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    invoke-virtual {v2, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/server/ClipboardService;->revokeItemLocked(Landroid/content/ClipData$Item;)V

    .line 280
    add-int/lit8 v1, v1, 0x1

    goto :goto_11
.end method

.method private final grantItemLocked(Landroid/content/ClipData$Item;Ljava/lang/String;)V
    .registers 5
    .parameter "item"
    .parameter "pkg"

    .prologue
    .line 223
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_d

    .line 224
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/android/server/ClipboardService;->grantUriLocked(Landroid/net/Uri;Ljava/lang/String;)V

    .line 226
    :cond_d
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 227
    .local v0, intent:Landroid/content/Intent;
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 228
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/android/server/ClipboardService;->grantUriLocked(Landroid/net/Uri;Ljava/lang/String;)V

    .line 230
    :cond_20
    return-void
.end method

.method private final grantUriLocked(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 11
    .parameter "uri"
    .parameter "pkg"

    .prologue
    .line 212
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v6

    .line 214
    .local v6, ident:J
    :try_start_4
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mAm:Landroid/app/IActivityManager;

    iget-object v1, p0, Lcom/android/server/ClipboardService;->mPermissionOwner:Landroid/os/IBinder;

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    const/4 v5, 0x1

    move-object v3, p2

    move-object v4, p1

    invoke-interface/range {v0 .. v5}, Landroid/app/IActivityManager;->grantUriPermissionFromOwner(Landroid/os/IBinder;ILjava/lang/String;Landroid/net/Uri;I)V
    :try_end_12
    .catchall {:try_start_4 .. :try_end_12} :catchall_16
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_12} :catch_1b

    .line 218
    :goto_12
    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 220
    return-void

    .line 218
    :catchall_16
    move-exception v0

    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v0

    .line 216
    :catch_1b
    move-exception v0

    goto :goto_12
.end method

.method private final revokeItemLocked(Landroid/content/ClipData$Item;)V
    .registers 4
    .parameter "item"

    .prologue
    .line 265
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_d

    .line 266
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/server/ClipboardService;->revokeUriLocked(Landroid/net/Uri;)V

    .line 268
    :cond_d
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 269
    .local v0, intent:Landroid/content/Intent;
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 270
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/server/ClipboardService;->revokeUriLocked(Landroid/net/Uri;)V

    .line 272
    :cond_20
    return-void
.end method

.method private final revokeUriLocked(Landroid/net/Uri;)V
    .registers 7
    .parameter "uri"

    .prologue
    .line 253
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 255
    .local v0, ident:J
    :try_start_4
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mAm:Landroid/app/IActivityManager;

    iget-object v3, p0, Lcom/android/server/ClipboardService;->mPermissionOwner:Landroid/os/IBinder;

    const/4 v4, 0x3

    invoke-interface {v2, v3, p1, v4}, Landroid/app/IActivityManager;->revokeUriPermissionFromOwner(Landroid/os/IBinder;Landroid/net/Uri;I)V
    :try_end_c
    .catchall {:try_start_4 .. :try_end_c} :catchall_10
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_c} :catch_15

    .line 260
    :goto_c
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 262
    return-void

    .line 260
    :catchall_10
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2

    .line 258
    :catch_15
    move-exception v2

    goto :goto_c
.end method


# virtual methods
.method public addPrimaryClipChangedListener(Landroid/content/IOnPrimaryClipChangedListener;)V
    .registers 3
    .parameter "listener"

    .prologue
    .line 158
    monitor-enter p0

    .line 159
    :try_start_1
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mPrimaryClipListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    .line 160
    monitor-exit p0

    .line 161
    return-void

    .line 160
    :catchall_8
    move-exception v0

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public getPrimaryClip(Ljava/lang/String;)Landroid/content/ClipData;
    .registers 5
    .parameter "pkg"

    .prologue
    const/4 v0, 0x0

    .line 133
    monitor-enter p0

    .line 135
    :try_start_2
    iget-object v1, p0, Lcom/android/server/ClipboardService;->mRestrictionPolicy:Landroid/app/enterprise/RestrictionPolicy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/enterprise/RestrictionPolicy;->isClipboardAllowed(Z)Z

    move-result v1

    if-nez v1, :cond_10

    .line 136
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    .line 137
    monitor-exit p0

    .line 141
    :goto_f
    return-object v0

    .line 140
    :cond_10
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/android/server/ClipboardService;->addActiveOwnerLocked(ILjava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    monitor-exit p0

    goto :goto_f

    .line 142
    :catchall_1b
    move-exception v0

    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_2 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public getPrimaryClipDescription()Landroid/content/ClipDescription;
    .registers 2

    .prologue
    .line 146
    monitor-enter p0

    .line 147
    :try_start_1
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    invoke-virtual {v0}, Landroid/content/ClipData;->getDescription()Landroid/content/ClipDescription;

    move-result-object v0

    :goto_b
    monitor-exit p0

    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_b

    .line 148
    :catchall_f
    move-exception v0

    monitor-exit p0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public hasClipboardText()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 170
    monitor-enter p0

    .line 171
    :try_start_2
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    if-eqz v2, :cond_1c

    .line 172
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 173
    .local v0, text:Ljava/lang/CharSequence;
    if-eqz v0, :cond_1a

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    monitor-exit p0

    .line 175
    .end local v0           #text:Ljava/lang/CharSequence;
    :goto_1b
    return v1

    :cond_1c
    monitor-exit p0

    goto :goto_1b

    .line 176
    :catchall_1e
    move-exception v1

    monitor-exit p0
    :try_end_20
    .catchall {:try_start_2 .. :try_end_20} :catchall_1e

    throw v1
.end method

.method public hasPrimaryClip()Z
    .registers 2

    .prologue
    .line 152
    monitor-enter p0

    .line 153
    :try_start_1
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_6

    .line 154
    :catchall_a
    move-exception v0

    monitor-exit p0
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 8
    .parameter "code"
    .parameter "data"
    .parameter "reply"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 96
    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/content/IClipboard$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    return v1

    .line 97
    :catch_5
    move-exception v0

    .line 98
    .local v0, e:Ljava/lang/RuntimeException;
    const-string v1, "clipboard"

    const-string v2, "Exception: "

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    throw v0
.end method

.method public removePrimaryClipChangedListener(Landroid/content/IOnPrimaryClipChangedListener;)V
    .registers 3
    .parameter "listener"

    .prologue
    .line 164
    monitor-enter p0

    .line 165
    :try_start_1
    iget-object v0, p0, Lcom/android/server/ClipboardService;->mPrimaryClipListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z

    .line 166
    monitor-exit p0

    .line 167
    return-void

    .line 166
    :catchall_8
    move-exception v0

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public setPrimaryClip(Landroid/content/ClipData;)V
    .registers 6
    .parameter "clip"

    .prologue
    .line 105
    monitor-enter p0

    .line 107
    :try_start_1
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mRestrictionPolicy:Landroid/app/enterprise/RestrictionPolicy;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/enterprise/RestrictionPolicy;->isClipboardAllowed(Z)Z

    move-result v2

    if-nez v2, :cond_f

    .line 108
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    .line 109
    monitor-exit p0

    .line 130
    :goto_e
    return-void

    .line 112
    :cond_f
    if-eqz p1, :cond_22

    invoke-virtual {p1}, Landroid/content/ClipData;->getItemCount()I

    move-result v2

    if-gtz v2, :cond_22

    .line 113
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No items"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 129
    :catchall_1f
    move-exception v2

    monitor-exit p0
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_1f

    throw v2

    .line 115
    :cond_22
    :try_start_22
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    invoke-direct {p0, p1, v2}, Lcom/android/server/ClipboardService;->checkDataOwnerLocked(Landroid/content/ClipData;I)V

    .line 116
    invoke-direct {p0}, Lcom/android/server/ClipboardService;->clearActiveOwnersLocked()V

    .line 117
    iput-object p1, p0, Lcom/android/server/ClipboardService;->mPrimaryClip:Landroid/content/ClipData;

    .line 118
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClipListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2}, Landroid/os/RemoteCallbackList;->beginBroadcast()I
    :try_end_33
    .catchall {:try_start_22 .. :try_end_33} :catchall_1f

    move-result v1

    .line 119
    .local v1, n:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_35
    if-ge v0, v1, :cond_45

    .line 121
    :try_start_37
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClipListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2, v0}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v2

    check-cast v2, Landroid/content/IOnPrimaryClipChangedListener;

    invoke-interface {v2}, Landroid/content/IOnPrimaryClipChangedListener;->dispatchPrimaryClipChanged()V
    :try_end_42
    .catchall {:try_start_37 .. :try_end_42} :catchall_1f
    .catch Landroid/os/RemoteException; {:try_start_37 .. :try_end_42} :catch_4c

    .line 119
    :goto_42
    add-int/lit8 v0, v0, 0x1

    goto :goto_35

    .line 128
    :cond_45
    :try_start_45
    iget-object v2, p0, Lcom/android/server/ClipboardService;->mPrimaryClipListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    .line 129
    monitor-exit p0
    :try_end_4b
    .catchall {:try_start_45 .. :try_end_4b} :catchall_1f

    goto :goto_e

    .line 122
    :catch_4c
    move-exception v2

    goto :goto_42
.end method
