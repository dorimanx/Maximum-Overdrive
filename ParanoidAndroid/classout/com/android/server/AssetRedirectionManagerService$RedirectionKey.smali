.class Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;
.super Ljava/lang/Object;
.source "AssetRedirectionManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/AssetRedirectionManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RedirectionKey"
.end annotation


# instance fields
.field public targetPackageName:Ljava/lang/String;

.field public themeId:Ljava/lang/String;

.field public themePackageName:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/AssetRedirectionManagerService$1;)V
    .registers 2
    .parameter "x0"

    .prologue
    .line 258
    invoke-direct {p0}, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;-><init>()V

    return-void
.end method

.method private static nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v0, 0x0

    .line 288
    if-nez p0, :cond_7

    .line 289
    if-ne p1, p0, :cond_6

    const/4 v0, 0x1

    .line 293
    :cond_6
    :goto_6
    return v0

    .line 290
    :cond_7
    if-eqz p1, :cond_6

    .line 293
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_6
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 265
    if-ne p1, p0, :cond_5

    .line 277
    :cond_4
    :goto_4
    return v1

    .line 266
    :cond_5
    instance-of v3, p1, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 267
    check-cast v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;

    .line 268
    .local v0, oo:Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;
    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    move v1, v2

    .line 269
    goto :goto_4

    .line 271
    :cond_1a
    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_26

    move v1, v2

    .line 272
    goto :goto_4

    .line 274
    :cond_26
    iget-object v3, p0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 275
    goto :goto_4
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 282
    iget-object v0, p0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themePackageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->themeId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/server/AssetRedirectionManagerService$RedirectionKey;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
