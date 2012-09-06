.class Lcom/android/server/accessibility/AccessibilityManagerService$Service$1;
.super Landroid/os/Handler;
.source "AccessibilityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/accessibility/AccessibilityManagerService$Service;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/accessibility/AccessibilityManagerService$Service;


# direct methods
.method constructor <init>(Lcom/android/server/accessibility/AccessibilityManagerService$Service;Landroid/os/Looper;)V
    .registers 3

    iput-object p1, p0, Lcom/android/server/accessibility/AccessibilityManagerService$Service$1;->this$1:Lcom/android/server/accessibility/AccessibilityManagerService$Service;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6

    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_14

    move v0, v2

    iget-object v3, p0, Lcom/android/server/accessibility/AccessibilityManagerService$Service$1;->this$1:Lcom/android/server/accessibility/AccessibilityManagerService$Service;

    #calls: Lcom/android/server/accessibility/AccessibilityManagerService$Service;->notifyAccessibilityEventInternal(I)V
    invoke-static {v3, v0}, Lcom/android/server/accessibility/AccessibilityManagerService$Service;->access$2400(Lcom/android/server/accessibility/AccessibilityManagerService$Service;I)V

    :goto_b
    return-void

    :pswitch_c
    iget v1, p1, Landroid/os/Message;->arg1:I

    iget-object v3, p0, Lcom/android/server/accessibility/AccessibilityManagerService$Service$1;->this$1:Lcom/android/server/accessibility/AccessibilityManagerService$Service;

    #calls: Lcom/android/server/accessibility/AccessibilityManagerService$Service;->notifyGestureInternal(I)V
    invoke-static {v3, v1}, Lcom/android/server/accessibility/AccessibilityManagerService$Service;->access$2300(Lcom/android/server/accessibility/AccessibilityManagerService$Service;I)V

    goto :goto_b

    :pswitch_data_14
    .packed-switch -0x80000000
        :pswitch_c
    .end packed-switch
.end method
