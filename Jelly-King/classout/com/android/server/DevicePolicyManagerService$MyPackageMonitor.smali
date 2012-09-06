.class Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;
.super Lcom/android/internal/content/PackageMonitor;
.source "DevicePolicyManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/DevicePolicyManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPackageMonitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/DevicePolicyManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/DevicePolicyManagerService;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    invoke-direct {p0}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    return-void
.end method


# virtual methods
.method public onSomePackagesChanged()V
    .registers 10

    iget-object v6, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    monitor-enter v6

    const/4 v4, 0x0

    :try_start_4
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v5, v5, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v3, v5, -0x1

    :goto_e
    if-ltz v3, :cond_9d

    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v5, v5, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;

    iget-object v5, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v5}, Landroid/app/admin/DeviceAdminInfo;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->isPackageDisappearing(Ljava/lang/String;)I

    move-result v1

    const/4 v5, 0x3

    if-eq v1, v5, :cond_2a

    const/4 v5, 0x2

    if-ne v1, v5, :cond_53

    :cond_2a
    const-string v5, "DevicePolicyManagerService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Admin unexpectedly uninstalled: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v8}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v5, v5, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_50
    :goto_50
    add-int/lit8 v3, v3, -0x1

    goto :goto_e

    :cond_53
    iget-object v5, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v5}, Landroid/app/admin/DeviceAdminInfo;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->isPackageModified(Ljava/lang/String;)Z
    :try_end_5c
    .catchall {:try_start_4 .. :try_end_5c} :catchall_9a

    move-result v5

    if-eqz v5, :cond_50

    :try_start_5f
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v5, v5, Lcom/android/server/DevicePolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v7, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v7}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_71
    .catchall {:try_start_5f .. :try_end_71} :catchall_9a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5f .. :try_end_71} :catch_72

    goto :goto_50

    :catch_72
    move-exception v2

    :try_start_73
    const-string v5, "DevicePolicyManagerService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Admin package change removed component: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Lcom/android/server/DevicePolicyManagerService$ActiveAdmin;->info:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v8}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    iget-object v5, v5, Lcom/android/server/DevicePolicyManagerService;->mAdminList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_50

    :catchall_9a
    move-exception v5

    monitor-exit v6
    :try_end_9c
    .catchall {:try_start_73 .. :try_end_9c} :catchall_9a

    throw v5

    :cond_9d
    if-eqz v4, :cond_ae

    :try_start_9f
    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    invoke-virtual {v5}, Lcom/android/server/DevicePolicyManagerService;->validatePasswordOwnerLocked()V

    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    invoke-virtual {v5}, Lcom/android/server/DevicePolicyManagerService;->syncDeviceCapabilitiesLocked()V

    iget-object v5, p0, Lcom/android/server/DevicePolicyManagerService$MyPackageMonitor;->this$0:Lcom/android/server/DevicePolicyManagerService;

    #calls: Lcom/android/server/DevicePolicyManagerService;->saveSettingsLocked()V
    invoke-static {v5}, Lcom/android/server/DevicePolicyManagerService;->access$100(Lcom/android/server/DevicePolicyManagerService;)V

    :cond_ae
    monitor-exit v6
    :try_end_af
    .catchall {:try_start_9f .. :try_end_af} :catchall_9a

    return-void
.end method
