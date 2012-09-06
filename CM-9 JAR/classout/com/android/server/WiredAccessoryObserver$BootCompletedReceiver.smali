.class final Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WiredAccessoryObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WiredAccessoryObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BootCompletedReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WiredAccessoryObserver;


# direct methods
.method private constructor <init>(Lcom/android/server/WiredAccessoryObserver;)V
    .registers 2
    .parameter

    .prologue
    .line 93
    iput-object p1, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/WiredAccessoryObserver;Lcom/android/server/WiredAccessoryObserver$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;-><init>(Lcom/android/server/WiredAccessoryObserver;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 96
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 102
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    #calls: Lcom/android/server/WiredAccessoryObserver;->init()V
    invoke-static {v2}, Lcom/android/server/WiredAccessoryObserver;->access$100(Lcom/android/server/WiredAccessoryObserver;)V

    .line 104
    const/4 v1, 0x0

    .local v1, i:I
    :goto_15
    if-ge v1, v6, :cond_27

    .line 105
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->access$200()[[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/android/server/WiredAccessoryObserver;->startObserving(Ljava/lang/String;)V

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 109
    :cond_27
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "dock_usb_audio_enabled"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v5, :cond_85

    .line 111
    const/4 v1, 0x0

    :goto_34
    if-ge v1, v5, :cond_85

    .line 112
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->access$300()[[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/android/server/WiredAccessoryObserver;->startObserving(Ljava/lang/String;)V

    .line 111
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .line 115
    .end local v1           #i:I
    :cond_46
    const-string v2, "DOCK_AUDIO_SETTING_CHANGED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 117
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "dock_usb_audio_enabled"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v5, :cond_6d

    .line 119
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_5b
    if-ge v1, v5, :cond_85

    .line 120
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->access$300()[[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/android/server/WiredAccessoryObserver;->startObserving(Ljava/lang/String;)V

    .line 119
    add-int/lit8 v1, v1, 0x1

    goto :goto_5b

    .line 123
    .end local v1           #i:I
    :cond_6d
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-virtual {v2}, Lcom/android/server/WiredAccessoryObserver;->stopObserving()V

    .line 124
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_73
    if-ge v1, v6, :cond_85

    .line 125
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;->this$0:Lcom/android/server/WiredAccessoryObserver;

    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->access$200()[[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/android/server/WiredAccessoryObserver;->startObserving(Ljava/lang/String;)V

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_73

    .line 129
    .end local v1           #i:I
    :cond_85
    return-void
.end method
