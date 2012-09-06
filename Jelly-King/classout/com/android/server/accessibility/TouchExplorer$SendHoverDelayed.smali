.class Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;
.super Ljava/lang/Object;
.source "TouchExplorer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/accessibility/TouchExplorer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SendHoverDelayed"
.end annotation


# instance fields
.field private final LOG_TAG_SEND_HOVER_DELAYED:Ljava/lang/String;

.field private final mGestureStarted:Z

.field private final mHoverAction:I

.field private mPointerIdBits:I

.field private mPolicyFlags:I

.field private mPrototype:Landroid/view/MotionEvent;

.field final synthetic this$0:Lcom/android/server/accessibility/TouchExplorer;


# direct methods
.method public constructor <init>(Lcom/android/server/accessibility/TouchExplorer;IZ)V
    .registers 5

    iput-object p1, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->LOG_TAG_SEND_HOVER_DELAYED:Ljava/lang/String;

    iput p2, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mHoverAction:I

    iput-boolean p3, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mGestureStarted:Z

    return-void
.end method

.method static synthetic access$400(Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;)Z
    .registers 2

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z

    move-result v0

    return v0
.end method

.method private clear()V
    .registers 2

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPointerIdBits:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPolicyFlags:I

    goto :goto_6
.end method

.method private isPending()Z
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method


# virtual methods
.method public forceSendAndRemove()V
    .registers 2

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->run()V

    invoke-virtual {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    :cond_c
    return-void
.end method

.method public getX()F
    .registers 2

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getY()F
    .registers 2

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public post(Landroid/view/MotionEvent;II)V
    .registers 7

    invoke-virtual {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    iput p2, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPointerIdBits:I

    iput p3, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPolicyFlags:I

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    #getter for: Lcom/android/server/accessibility/TouchExplorer;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->access$1800(Lcom/android/server/accessibility/TouchExplorer;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    #getter for: Lcom/android/server/accessibility/TouchExplorer;->mDetermineUserIntentTimeout:I
    invoke-static {v1}, Lcom/android/server/accessibility/TouchExplorer;->access$2500(Lcom/android/server/accessibility/TouchExplorer;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public remove()V
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    #getter for: Lcom/android/server/accessibility/TouchExplorer;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->access$1800(Lcom/android/server/accessibility/TouchExplorer;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->clear()V

    return-void
.end method

.method public run()V
    .registers 6

    iget-boolean v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mGestureStarted:Z

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    #getter for: Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;
    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->access$1200(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/AccessibilityManagerService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/accessibility/AccessibilityManagerService;->touchExplorationGestureStarted()V

    :goto_d
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPrototype:Landroid/view/MotionEvent;

    iget v2, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mHoverAction:I

    iget v3, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPointerIdBits:I

    iget v4, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->mPolicyFlags:I

    #calls: Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/accessibility/TouchExplorer;->access$2600(Lcom/android/server/accessibility/TouchExplorer;Landroid/view/MotionEvent;III)V

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->clear()V

    return-void

    :cond_1e
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    #getter for: Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;
    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->access$1200(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/AccessibilityManagerService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/accessibility/AccessibilityManagerService;->touchExplorationGestureEnded()V

    goto :goto_d
.end method
