.class Lcom/android/server/PowerManagerService$PokeLock;
.super Ljava/lang/Object;
.source "PowerManagerService.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PokeLock"
.end annotation


# instance fields
.field awakeOnSet:Z

.field binder:Landroid/os/IBinder;

.field pokey:I

.field tag:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/PowerManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/PowerManagerService;ILandroid/os/IBinder;Ljava/lang/String;)V
    .registers 7

    iput-object p1, p0, Lcom/android/server/PowerManagerService$PokeLock;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/android/server/PowerManagerService$PokeLock;->pokey:I

    iput-object p3, p0, Lcom/android/server/PowerManagerService$PokeLock;->binder:Landroid/os/IBinder;

    iput-object p4, p0, Lcom/android/server/PowerManagerService$PokeLock;->tag:Ljava/lang/String;

    const/4 v1, 0x0

    :try_start_c
    invoke-interface {p3, p0, v1}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_f} :catch_10

    :goto_f
    return-void

    :catch_10
    move-exception v0

    invoke-virtual {p0}, Lcom/android/server/PowerManagerService$PokeLock;->binderDied()V

    goto :goto_f
.end method


# virtual methods
.method public binderDied()V
    .registers 5

    iget-object v0, p0, Lcom/android/server/PowerManagerService$PokeLock;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/server/PowerManagerService$PokeLock;->binder:Landroid/os/IBinder;

    iget-object v3, p0, Lcom/android/server/PowerManagerService$PokeLock;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/PowerManagerService;->setPokeLock(ILandroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method
