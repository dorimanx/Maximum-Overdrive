.class Lcom/android/server/am/ActivityManagerService$7;
.super Landroid/content/BroadcastReceiver;
.source "ActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ActivityManagerService;->finishBooting()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ActivityManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 4094
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$7;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 4097
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$7;->this$0:Lcom/android/server/am/ActivityManagerService;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/server/am/ActivityManagerService;->mUiContext:Landroid/content/Context;

    .line 4098
    return-void
.end method
