.class Lcom/android/server/AppWidgetService$2;
.super Landroid/content/BroadcastReceiver;
.source "AppWidgetService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/AppWidgetService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/AppWidgetService;


# direct methods
.method constructor <init>(Lcom/android/server/AppWidgetService;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/AppWidgetService$2;->this$0:Lcom/android/server/AppWidgetService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v3, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    iget-object v3, p0, Lcom/android/server/AppWidgetService$2;->this$0:Lcom/android/server/AppWidgetService;

    #calls: Lcom/android/server/AppWidgetService;->getImplForUser()Lcom/android/server/AppWidgetServiceImpl;
    invoke-static {v3}, Lcom/android/server/AppWidgetService;->access$000(Lcom/android/server/AppWidgetService;)Lcom/android/server/AppWidgetServiceImpl;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/AppWidgetServiceImpl;->sendInitialBroadcasts()V

    :cond_15
    return-void

    :cond_16
    const-string v3, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    const/4 v1, 0x0

    :goto_1f
    iget-object v3, p0, Lcom/android/server/AppWidgetService$2;->this$0:Lcom/android/server/AppWidgetService;

    #getter for: Lcom/android/server/AppWidgetService;->mAppWidgetServices:Landroid/util/SparseArray;
    invoke-static {v3}, Lcom/android/server/AppWidgetService;->access$100(Lcom/android/server/AppWidgetService;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_15

    iget-object v3, p0, Lcom/android/server/AppWidgetService$2;->this$0:Lcom/android/server/AppWidgetService;

    #getter for: Lcom/android/server/AppWidgetService;->mAppWidgetServices:Landroid/util/SparseArray;
    invoke-static {v3}, Lcom/android/server/AppWidgetService;->access$100(Lcom/android/server/AppWidgetService;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl;

    invoke-virtual {v2}, Lcom/android/server/AppWidgetServiceImpl;->onConfigurationChanged()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    :cond_3d
    const/4 v1, 0x0

    :goto_3e
    iget-object v3, p0, Lcom/android/server/AppWidgetService$2;->this$0:Lcom/android/server/AppWidgetService;

    #getter for: Lcom/android/server/AppWidgetService;->mAppWidgetServices:Landroid/util/SparseArray;
    invoke-static {v3}, Lcom/android/server/AppWidgetService;->access$100(Lcom/android/server/AppWidgetService;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_15

    iget-object v3, p0, Lcom/android/server/AppWidgetService$2;->this$0:Lcom/android/server/AppWidgetService;

    #getter for: Lcom/android/server/AppWidgetService;->mAppWidgetServices:Landroid/util/SparseArray;
    invoke-static {v3}, Lcom/android/server/AppWidgetService;->access$100(Lcom/android/server/AppWidgetService;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppWidgetServiceImpl;

    invoke-virtual {v2, p2}, Lcom/android/server/AppWidgetServiceImpl;->onBroadcastReceived(Landroid/content/Intent;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3e
.end method
