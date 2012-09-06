.class final Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WiredAccessoryObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WiredAccessoryObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SettingsChangedReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WiredAccessoryObserver;


# direct methods
.method private constructor <init>(Lcom/android/server/WiredAccessoryObserver;)V
    .registers 2
    .parameter

    .prologue
    .line 202
    iput-object p1, p0, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/WiredAccessoryObserver;Lcom/android/server/WiredAccessoryObserver$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;-><init>(Lcom/android/server/WiredAccessoryObserver;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 205
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, action:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Recieved a Settings Changed Action "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    const-string v2, "com.cyanogenmod.settings.SamsungDock"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 208
    const-string v2, "data"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 209
    .local v1, data:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Recieved a Dock Audio change "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    if-eqz v1, :cond_57

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 211
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    const/4 v3, 0x1

    #setter for: Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z
    invoke-static {v2, v3}, Lcom/android/server/WiredAccessoryObserver;->access$402(Lcom/android/server/WiredAccessoryObserver;Z)Z

    .line 216
    .end local v1           #data:Ljava/lang/String;
    :cond_56
    :goto_56
    return-void

    .line 213
    .restart local v1       #data:Ljava/lang/String;
    :cond_57
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    const/4 v3, 0x0

    #setter for: Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z
    invoke-static {v2, v3}, Lcom/android/server/WiredAccessoryObserver;->access$402(Lcom/android/server/WiredAccessoryObserver;Z)Z

    goto :goto_56
.end method
