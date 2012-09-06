.class final Lcom/android/server/pm/ShutdownThread$3;
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
    .parameter

    .prologue
    .line 132
    iput-object p1, p0, Lcom/android/server/pm/ShutdownThread$3;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 134
    if-gez p2, :cond_3

    .line 141
    :cond_2
    :goto_2
    return-void

    .line 137
    :cond_3
    iget-object v1, p0, Lcom/android/server/pm/ShutdownThread$3;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1070012

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, actions:[Ljava/lang/String;
    if-eqz v0, :cond_2

    array-length v1, v0

    if-ge p2, v1, :cond_2

    .line 140
    aget-object v1, v0, p2

    invoke-static {v1}, Lcom/android/server/pm/ShutdownThread;->access$202(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_2
.end method
