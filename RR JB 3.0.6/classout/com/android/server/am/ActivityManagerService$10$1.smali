.class Lcom/android/server/am/ActivityManagerService$10$1;
.super Ljava/lang/Object;
.source "ActivityManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ActivityManagerService$10;->performReceive(Landroid/content/Intent;ILjava/lang/String;Landroid/os/Bundle;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/am/ActivityManagerService$10;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService$10;)V
    .registers 2
    .parameter

    .prologue
    .line 7531
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 7533
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v1, v0, Lcom/android/server/am/ActivityManagerService$10;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    .line 7534
    :try_start_5
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService$10;->this$0:Lcom/android/server/am/ActivityManagerService;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/android/server/am/ActivityManagerService;->mDidUpdate:Z

    .line 7535
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_35

    .line 7536
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService$10;->val$doneReceivers:Ljava/util/ArrayList;

    #calls: Lcom/android/server/am/ActivityManagerService;->writeLastDonePreBootReceivers(Ljava/util/ArrayList;)V
    invoke-static {v0}, Lcom/android/server/am/ActivityManagerService;->access$900(Ljava/util/ArrayList;)V

    .line 7537
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService$10;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService$10;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    const v2, 0x10403f6

    invoke-virtual {v1, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/server/am/ActivityManagerService;->showBootMessage(Ljava/lang/CharSequence;Z)V

    .line 7540
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService$10;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$10$1;->this$1:Lcom/android/server/am/ActivityManagerService$10;

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService$10;->val$goingCallback:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 7541
    return-void

    .line 7535
    :catchall_35
    move-exception v0

    :try_start_36
    monitor-exit v1
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw v0
.end method
