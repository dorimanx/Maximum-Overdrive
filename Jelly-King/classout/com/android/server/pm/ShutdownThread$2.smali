.class final Lcom/android/server/pm/ShutdownThread$2;
.super Ljava/lang/Object;
.source "ShutdownThread.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/pm/ShutdownThread;->shutdownInner(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/pm/ShutdownThread$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/server/pm/ShutdownThread;->access$002(Z)Z

    iget-object v0, p0, Lcom/android/server/pm/ShutdownThread$2;->val$context:Landroid/content/Context;

    #calls: Lcom/android/server/pm/ShutdownThread;->beginShutdownSequence(Landroid/content/Context;)V
    invoke-static {v0}, Lcom/android/server/pm/ShutdownThread;->access$100(Landroid/content/Context;)V

    return-void
.end method
