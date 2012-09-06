.class public final Lcom/android/server/AttributeCache;
.super Ljava/lang/Object;
.source "AttributeCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/AttributeCache$Entry;,
        Lcom/android/server/AttributeCache$Package;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/android/server/AttributeCache;


# instance fields
.field private final mConfiguration:Landroid/content/res/Configuration;

.field private final mContext:Landroid/content/Context;

.field private final mPackages:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/AttributeCache$Package;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/AttributeCache;->sInstance:Lcom/android/server/AttributeCache;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AttributeCache;->mPackages:Ljava/util/WeakHashMap;

    new-instance v0, Landroid/content/res/Configuration;

    invoke-direct {v0}, Landroid/content/res/Configuration;-><init>()V

    iput-object v0, p0, Lcom/android/server/AttributeCache;->mConfiguration:Landroid/content/res/Configuration;

    iput-object p1, p0, Lcom/android/server/AttributeCache;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .registers 2

    sget-object v0, Lcom/android/server/AttributeCache;->sInstance:Lcom/android/server/AttributeCache;

    if-nez v0, :cond_b

    new-instance v0, Lcom/android/server/AttributeCache;

    invoke-direct {v0, p0}, Lcom/android/server/AttributeCache;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/server/AttributeCache;->sInstance:Lcom/android/server/AttributeCache;

    :cond_b
    return-void
.end method

.method public static instance()Lcom/android/server/AttributeCache;
    .registers 1

    sget-object v0, Lcom/android/server/AttributeCache;->sInstance:Lcom/android/server/AttributeCache;

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;I[I)Lcom/android/server/AttributeCache$Entry;
    .registers 13

    const/4 v6, 0x0

    monitor-enter p0

    :try_start_2
    iget-object v7, p0, Lcom/android/server/AttributeCache;->mPackages:Ljava/util/WeakHashMap;

    invoke-virtual {v7, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/AttributeCache$Package;

    const/4 v4, 0x0

    const/4 v2, 0x0

    if-eqz v5, :cond_25

    #getter for: Lcom/android/server/AttributeCache$Package;->mMap:Landroid/util/SparseArray;
    invoke-static {v5}, Lcom/android/server/AttributeCache$Package;->access$000(Lcom/android/server/AttributeCache$Package;)Landroid/util/SparseArray;

    move-result-object v7

    invoke-virtual {v7, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    if-eqz v4, :cond_40

    invoke-virtual {v4, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AttributeCache$Entry;

    if-eqz v2, :cond_40

    monitor-exit p0
    :try_end_23
    .catchall {:try_start_2 .. :try_end_23} :catchall_30

    move-object v6, v2

    :goto_24
    return-object v6

    :cond_25
    :try_start_25
    iget-object v7, p0, Lcom/android/server/AttributeCache;->mContext:Landroid/content/Context;

    const/4 v8, 0x0

    invoke-virtual {v7, p1, v8}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    :try_end_2b
    .catchall {:try_start_25 .. :try_end_2b} :catchall_30
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_25 .. :try_end_2b} :catch_33

    move-result-object v0

    if-nez v0, :cond_36

    :try_start_2e
    monitor-exit p0

    goto :goto_24

    :catchall_30
    move-exception v6

    monitor-exit p0
    :try_end_32
    .catchall {:try_start_2e .. :try_end_32} :catchall_30

    throw v6

    :catch_33
    move-exception v1

    :try_start_34
    monitor-exit p0

    goto :goto_24

    :cond_36
    new-instance v5, Lcom/android/server/AttributeCache$Package;

    invoke-direct {v5, v0}, Lcom/android/server/AttributeCache$Package;-><init>(Landroid/content/Context;)V

    iget-object v7, p0, Lcom/android/server/AttributeCache;->mPackages:Ljava/util/WeakHashMap;

    invoke-virtual {v7, p1, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_40
    move-object v3, v2

    if-nez v4, :cond_4f

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    #getter for: Lcom/android/server/AttributeCache$Package;->mMap:Landroid/util/SparseArray;
    invoke-static {v5}, Lcom/android/server/AttributeCache$Package;->access$000(Lcom/android/server/AttributeCache$Package;)Landroid/util/SparseArray;

    move-result-object v7

    invoke-virtual {v7, p2, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_4f
    .catchall {:try_start_34 .. :try_end_4f} :catchall_30

    :cond_4f
    :try_start_4f
    new-instance v2, Lcom/android/server/AttributeCache$Entry;

    iget-object v7, v5, Lcom/android/server/AttributeCache$Package;->context:Landroid/content/Context;

    iget-object v8, v5, Lcom/android/server/AttributeCache$Package;->context:Landroid/content/Context;

    invoke-virtual {v8, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v8

    invoke-direct {v2, v7, v8}, Lcom/android/server/AttributeCache$Entry;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    :try_end_5c
    .catchall {:try_start_4f .. :try_end_5c} :catchall_30
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_4f .. :try_end_5c} :catch_62

    :try_start_5c
    invoke-virtual {v4, p3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5f
    .catchall {:try_start_5c .. :try_end_5f} :catchall_30
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5c .. :try_end_5f} :catch_66

    :try_start_5f
    monitor-exit p0

    move-object v6, v2

    goto :goto_24

    :catch_62
    move-exception v1

    move-object v2, v3

    :goto_64
    monitor-exit p0
    :try_end_65
    .catchall {:try_start_5f .. :try_end_65} :catchall_30

    goto :goto_24

    :catch_66
    move-exception v1

    goto :goto_64
.end method

.method public removePackage(Ljava/lang/String;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/server/AttributeCache;->mPackages:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p0

    return-void

    :catchall_8
    move-exception v0

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public updateConfiguration(Landroid/content/res/Configuration;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/android/server/AttributeCache;->mConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v1, p1}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    move-result v0

    const v1, -0x400000a1

    and-int/2addr v1, v0

    if-eqz v1, :cond_12

    iget-object v1, p0, Lcom/android/server/AttributeCache;->mPackages:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->clear()V

    :cond_12
    monitor-exit p0

    return-void

    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_14

    throw v1
.end method