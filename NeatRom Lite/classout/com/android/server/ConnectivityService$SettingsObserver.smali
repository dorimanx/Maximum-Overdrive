.class Lcom/android/server/ConnectivityService$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "ConnectivityService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ConnectivityService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SettingsObserver"
.end annotation


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mWhat:I


# direct methods
.method constructor <init>(Landroid/os/Handler;I)V
    .registers 3
    .parameter "handler"
    .parameter "what"

    .prologue
    .line 3095
    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 3096
    iput-object p1, p0, Lcom/android/server/ConnectivityService$SettingsObserver;->mHandler:Landroid/os/Handler;

    .line 3097
    iput p2, p0, Lcom/android/server/ConnectivityService$SettingsObserver;->mWhat:I

    .line 3098
    return-void
.end method


# virtual methods
.method observe(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 3101
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 3102
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "http_proxy"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 3104
    return-void
.end method

.method public onChange(Z)V
    .registers 4
    .parameter "selfChange"

    .prologue
    .line 3108
    iget-object v0, p0, Lcom/android/server/ConnectivityService$SettingsObserver;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/server/ConnectivityService$SettingsObserver;->mWhat:I

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 3109
    return-void
.end method
