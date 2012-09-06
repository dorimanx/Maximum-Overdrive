.class public Lcom/android/server/accessibility/TouchExplorer;
.super Ljava/lang/Object;
.source "TouchExplorer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/accessibility/TouchExplorer$1;,
        Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;,
        Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;,
        Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;,
        Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;,
        Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;,
        Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;
    }
.end annotation


# static fields
.field private static final ALL_POINTER_ID_BITS:I = -0x1

.field private static final DEBUG:Z = false

.field private static final EXIT_GESTURE_DETECTION_TIMEOUT:I = 0x7d0

.field private static final GESTURE_DETECTION_VELOCITY_DIP:I = 0x3e8

.field private static final INVALID_POINTER_ID:I = -0x1

.field private static final LOG_TAG:Ljava/lang/String; = "TouchExplorer"

.field private static final MAX_DRAGGING_ANGLE_COS:F = 0.52532196f

.field private static final MAX_POINTER_COUNT:I = 0x20

.field private static final MIN_POINTER_DISTANCE_TO_USE_MIDDLE_LOCATION_DIP:I = 0xc8

.field private static final MIN_PREDICTION_SCORE:F = 2.0f

.field private static final STATE_DELEGATING:I = 0x4

.field private static final STATE_DRAGGING:I = 0x2

.field private static final STATE_GESTURE_DETECTING:I = 0x5

.field private static final STATE_TOUCH_EXPLORING:I = 0x1

.field private static final TOUCH_TOLERANCE:I = 0x3


# instance fields
.field private final mAms:Lcom/android/server/accessibility/AccessibilityManagerService;

.field private mCurrentState:I

.field private final mDetermineUserIntentTimeout:I

.field private final mDoubleTapDetector:Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

.field private final mDoubleTapSlop:I

.field private final mDoubleTapTimeout:I

.field private mDraggingPointerId:I

.field private final mExitGestureDetectionModeDelayed:Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;

.field private mGestureLibrary:Landroid/gesture/GestureLibrary;

.field private final mHandler:Landroid/os/Handler;

.field private final mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

.field private final mInputFilter:Lcom/android/server/input/InputFilter;

.field private mLastTouchedWindowId:I

.field private mLongPressingPointerDeltaX:I

.field private mLongPressingPointerDeltaY:I

.field private mLongPressingPointerId:I

.field private final mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

.field private mPreviousX:F

.field private mPreviousY:F

.field private final mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

.field private final mScaledGestureDetectionVelocity:I

.field private final mScaledMinPointerDistanceToUseMiddleLocation:I

.field private final mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

.field private final mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

.field private final mStrokeBuffer:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/gesture/GesturePoint;",
            ">;"
        }
    .end annotation
.end field

.field private final mTapTimeout:I

.field private final mTempPointerIds:[I

.field private final mTempRect:Landroid/graphics/Rect;

.field private final mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Lcom/android/server/input/InputFilter;Landroid/content/Context;Lcom/android/server/accessibility/AccessibilityManagerService;)V
    .registers 9

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v1, 0x20

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mTempPointerIds:[I

    iput v3, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mTempRect:Landroid/graphics/Rect;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-direct {v1, p0, p2}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;-><init>(Lcom/android/server/accessibility/TouchExplorer;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-direct {v1, p0}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;-><init>(Lcom/android/server/accessibility/TouchExplorer;)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    iput-object p1, p0, Lcom/android/server/accessibility/TouchExplorer;->mInputFilter:Lcom/android/server/input/InputFilter;

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mTapTimeout:I

    iget v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mTapTimeout:I

    int-to-float v1, v1

    const/high16 v2, 0x3fc0

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mDetermineUserIntentTimeout:I

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapTimeout:I

    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mTouchSlop:I

    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapSlop:I

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-direct {v1, p0, v4}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;-><init>(Lcom/android/server/accessibility/TouchExplorer;Lcom/android/server/accessibility/TouchExplorer$1;)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;

    invoke-direct {v1, p0, v4}, Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;-><init>(Lcom/android/server/accessibility/TouchExplorer;Lcom/android/server/accessibility/TouchExplorer$1;)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mExitGestureDetectionModeDelayed:Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;

    const/high16 v1, 0x110

    invoke-static {p2, v1}, Landroid/gesture/GestureLibraries;->fromRawResource(Landroid/content/Context;I)Landroid/gesture/GestureLibrary;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mGestureLibrary:Landroid/gesture/GestureLibrary;

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mGestureLibrary:Landroid/gesture/GestureLibrary;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/gesture/GestureLibrary;->setOrientationStyle(I)V

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mGestureLibrary:Landroid/gesture/GestureLibrary;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/gesture/GestureLibrary;->setSequenceType(I)V

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mGestureLibrary:Landroid/gesture/GestureLibrary;

    invoke-virtual {v1}, Landroid/gesture/GestureLibrary;->load()Z

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2, v3}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;-><init>(Lcom/android/server/accessibility/TouchExplorer;IZ)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;-><init>(Lcom/android/server/accessibility/TouchExplorer;IZ)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    new-instance v1, Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

    invoke-direct {v1, p0, v4}, Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;-><init>(Lcom/android/server/accessibility/TouchExplorer;Lcom/android/server/accessibility/TouchExplorer$1;)V

    iput-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapDetector:Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x4348

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mScaledMinPointerDistanceToUseMiddleLocation:I

    const/high16 v1, 0x447a

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mScaledGestureDetectionVelocity:I

    return-void
.end method

.method static synthetic access$1000(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/server/accessibility/TouchExplorer;)Landroid/graphics/Rect;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mTempRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/AccessibilityManagerService;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/server/accessibility/TouchExplorer;)I
    .registers 2

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mLastTouchedWindowId:I

    return v0
.end method

.method static synthetic access$1400(Lcom/android/server/accessibility/TouchExplorer;Landroid/view/MotionEvent;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendActionDownAndUp(Landroid/view/MotionEvent;I)V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/server/accessibility/TouchExplorer;)I
    .registers 2

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mTapTimeout:I

    return v0
.end method

.method static synthetic access$1600(Lcom/android/server/accessibility/TouchExplorer;)I
    .registers 2

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mTouchSlop:I

    return v0
.end method

.method static synthetic access$1700(Lcom/android/server/accessibility/TouchExplorer;)I
    .registers 2

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapSlop:I

    return v0
.end method

.method static synthetic access$1800(Lcom/android/server/accessibility/TouchExplorer;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/android/server/accessibility/TouchExplorer;I)I
    .registers 2

    iput p1, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerId:I

    return p1
.end method

.method static synthetic access$2102(Lcom/android/server/accessibility/TouchExplorer;I)I
    .registers 2

    iput p1, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaX:I

    return p1
.end method

.method static synthetic access$2202(Lcom/android/server/accessibility/TouchExplorer;I)I
    .registers 2

    iput p1, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaY:I

    return p1
.end method

.method static synthetic access$2302(Lcom/android/server/accessibility/TouchExplorer;I)I
    .registers 2

    iput p1, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    return p1
.end method

.method static synthetic access$2400(Lcom/android/server/accessibility/TouchExplorer;Landroid/view/MotionEvent;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    return-void
.end method

.method static synthetic access$2500(Lcom/android/server/accessibility/TouchExplorer;)I
    .registers 2

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mDetermineUserIntentTimeout:I

    return v0
.end method

.method static synthetic access$2600(Lcom/android/server/accessibility/TouchExplorer;Landroid/view/MotionEvent;III)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/accessibility/TouchExplorer;)I
    .registers 2

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapTimeout:I

    return v0
.end method

.method static synthetic access$600(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;
    .registers 2

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/server/accessibility/TouchExplorer;I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/accessibility/TouchExplorer;->sendExitEventsIfNeeded(I)V

    return-void
.end method

.method private computeInjectionAction(II)I
    .registers 6

    const/4 v1, 0x1

    sparse-switch p1, :sswitch_data_24

    :goto_4
    return p1

    :sswitch_5
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->getInjectedPointerDownCount()I

    move-result v1

    if-nez v1, :cond_f

    const/4 p1, 0x0

    goto :goto_4

    :cond_f
    shl-int/lit8 v1, p2, 0x8

    or-int/lit8 p1, v1, 0x5

    goto :goto_4

    :sswitch_14
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->getInjectedPointerDownCount()I

    move-result v2

    if-ne v2, v1, :cond_1e

    move p1, v1

    goto :goto_4

    :cond_1e
    shl-int/lit8 v1, p2, 0x8

    or-int/lit8 p1, v1, 0x6

    goto :goto_4

    nop

    :sswitch_data_24
    .sparse-switch
        0x0 -> :sswitch_5
        0x5 -> :sswitch_5
        0x6 -> :sswitch_14
    .end sparse-switch
.end method

.method private getNotInjectedActivePointerCount(Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;)I
    .registers 6

    invoke-virtual {p1}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointers()I

    move-result v1

    invoke-virtual {p2}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->getInjectedPointersDown()I

    move-result v2

    xor-int/lit8 v2, v2, -0x1

    and-int v0, v1, v2

    invoke-static {v0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v1

    return v1
.end method

.method private static getStateSymbolicName(I)Ljava/lang/String;
    .registers 4

    packed-switch p0, :pswitch_data_28

    :pswitch_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_1c
    const-string v0, "STATE_TOUCH_EXPLORING"

    :goto_1e
    return-object v0

    :pswitch_1f
    const-string v0, "STATE_DRAGGING"

    goto :goto_1e

    :pswitch_22
    const-string v0, "STATE_DELEGATING"

    goto :goto_1e

    :pswitch_25
    const-string v0, "STATE_GESTURE_DETECTING"

    goto :goto_1e

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1f
        :pswitch_3
        :pswitch_22
        :pswitch_25
    .end packed-switch
.end method

.method private handleMotionEventGestureDetecting(Landroid/view/MotionEvent;I)V
    .registers 16

    const/high16 v10, 0x4040

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    packed-switch v9, :pswitch_data_d4

    :cond_9
    :goto_9
    return-void

    :pswitch_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iput v7, p0, Lcom/android/server/accessibility/TouchExplorer;->mPreviousX:F

    iput v8, p0, Lcom/android/server/accessibility/TouchExplorer;->mPreviousY:F

    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    new-instance v10, Landroid/gesture/GesturePoint;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v11

    invoke-direct {v10, v7, v8, v11, v12}, Landroid/gesture/GesturePoint;-><init>(FFJ)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :pswitch_25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iget v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mPreviousX:F

    sub-float v9, v7, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mPreviousY:F

    sub-float v9, v8, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v9, v1, v10

    if-gez v9, :cond_45

    cmpl-float v9, v2, v10

    if-ltz v9, :cond_9

    :cond_45
    iput v7, p0, Lcom/android/server/accessibility/TouchExplorer;->mPreviousX:F

    iput v8, p0, Lcom/android/server/accessibility/TouchExplorer;->mPreviousY:F

    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    new-instance v10, Landroid/gesture/GesturePoint;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v11

    invoke-direct {v10, v7, v8, v11, v12}, Landroid/gesture/GesturePoint;-><init>(FFJ)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :pswitch_58
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    new-instance v10, Landroid/gesture/GesturePoint;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v11

    invoke-direct {v10, v7, v8, v11, v12}, Landroid/gesture/GesturePoint;-><init>(FFJ)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Landroid/gesture/Gesture;

    invoke-direct {v3}, Landroid/gesture/Gesture;-><init>()V

    new-instance v9, Landroid/gesture/GestureStroke;

    iget-object v10, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-direct {v9, v10}, Landroid/gesture/GestureStroke;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v3, v9}, Landroid/gesture/Gesture;->addStroke(Landroid/gesture/GestureStroke;)V

    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mGestureLibrary:Landroid/gesture/GestureLibrary;

    invoke-virtual {v9, v3}, Landroid/gesture/GestureLibrary;->recognize(Landroid/gesture/Gesture;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_a3

    const/4 v9, 0x0

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gesture/Prediction;

    iget-wide v9, v0, Landroid/gesture/Prediction;->score:D

    const-wide/high16 v11, 0x4000

    cmpl-double v9, v9, v11

    if-ltz v9, :cond_a3

    :try_start_98
    iget-object v9, v0, Landroid/gesture/Prediction;->name:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-virtual {v9, v4}, Lcom/android/server/accessibility/AccessibilityManagerService;->onGesture(I)Z
    :try_end_a3
    .catch Ljava/lang/NumberFormatException; {:try_start_98 .. :try_end_a3} :catch_b2

    :cond_a3
    :goto_a3
    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    iget-object v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mExitGestureDetectionModeDelayed:Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;

    invoke-virtual {v9}, Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;->remove()V

    const/4 v9, 0x1

    iput v9, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    goto/16 :goto_9

    :catch_b2
    move-exception v5

    const-string v9, "TouchExplorer"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Non numeric gesture id:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v0, Landroid/gesture/Prediction;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a3

    :pswitch_ce
    invoke-virtual {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->clear(Landroid/view/MotionEvent;I)V

    goto/16 :goto_9

    nop

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_a
        :pswitch_58
        :pswitch_25
        :pswitch_ce
    .end packed-switch
.end method

.method private handleMotionEventStateDelegating(Landroid/view/MotionEvent;I)V
    .registers 7

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    packed-switch v2, :pswitch_data_3e

    :cond_8
    :goto_8
    :pswitch_8
    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEventStripInactivePointers(Landroid/view/MotionEvent;I)V

    return-void

    :pswitch_c
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Delegating state can only be reached if there is at least one pointer down!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_14
    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    iget-object v3, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-direct {p0, v2, v3}, Lcom/android/server/accessibility/TouchExplorer;->getNotInjectedActivePointerCount(Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;)I

    move-result v0

    if-lez v0, :cond_8

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    goto :goto_8

    :pswitch_26
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerId:I

    iput v3, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaX:I

    iput v3, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaY:I

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {v2}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointerCount()I

    move-result v2

    if-nez v2, :cond_8

    const/4 v2, 0x1

    iput v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    goto :goto_8

    :pswitch_39
    invoke-virtual {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->clear(Landroid/view/MotionEvent;I)V

    goto :goto_8

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_c
        :pswitch_26
        :pswitch_14
        :pswitch_39
        :pswitch_8
        :pswitch_8
        :pswitch_26
    .end packed-switch
.end method

.method private handleMotionEventStateDragging(Landroid/view/MotionEvent;I)V
    .registers 24

    const/16 v17, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/accessibility/TouchExplorer;->mDraggingPointerId:I

    move/from16 v18, v0

    shl-int v12, v17, v18

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v17

    packed-switch v17, :pswitch_data_12a

    :goto_11
    :pswitch_11
    return-void

    :pswitch_12
    new-instance v17, Ljava/lang/IllegalStateException;

    const-string v18, "Dragging state can be reached only if two pointers are already down"

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v17

    :pswitch_1a
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    const/16 v17, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, p2

    invoke-direct {v0, v1, v2, v12, v3}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    goto :goto_11

    :pswitch_33
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointerCount()I

    move-result v4

    packed-switch v4, :pswitch_data_13c

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    const/16 v17, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, p2

    invoke-direct {v0, v1, v2, v12, v3}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    goto :goto_11

    :pswitch_59
    invoke-direct/range {p0 .. p1}, Lcom/android/server/accessibility/TouchExplorer;->isDraggingGesture(Landroid/view/MotionEvent;)Z

    move-result v17

    if-eqz v17, :cond_db

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mTempPointerIds:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->populateActivePointerIds([I)V

    const/16 v17, 0x0

    aget v17, v13, v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v9

    const/16 v17, 0x1

    aget v17, v13, v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v16

    sub-float v5, v10, v15

    sub-float v6, v11, v16

    float-to-double v0, v5

    move-wide/from16 v17, v0

    float-to-double v0, v6

    move-wide/from16 v19, v0

    invoke-static/range {v17 .. v20}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/accessibility/TouchExplorer;->mScaledMinPointerDistanceToUseMiddleLocation:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v17, v0

    cmpl-double v17, v7, v17

    if-lez v17, :cond_cc

    const/high16 v17, 0x4000

    div-float v17, v5, v17

    const/high16 v18, 0x4000

    div-float v18, v6, v18

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->setLocation(FF)V

    :cond_cc
    const/16 v17, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, p2

    invoke-direct {v0, v1, v2, v12, v3}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto/16 :goto_11

    :cond_db
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    const/16 v17, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, p2

    invoke-direct {v0, v1, v2, v12, v3}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    goto/16 :goto_11

    :pswitch_f5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointerCount()I

    move-result v4

    packed-switch v4, :pswitch_data_144

    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    goto/16 :goto_11

    :pswitch_10c
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, p2

    invoke-direct {v0, v1, v2, v12, v3}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto/16 :goto_11

    :pswitch_11b
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    goto/16 :goto_11

    :pswitch_125
    invoke-virtual/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->clear(Landroid/view/MotionEvent;I)V

    goto/16 :goto_11

    :pswitch_data_12a
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11b
        :pswitch_33
        :pswitch_125
        :pswitch_11
        :pswitch_1a
        :pswitch_f5
    .end packed-switch

    :pswitch_data_13c
    .packed-switch 0x1
        :pswitch_11
        :pswitch_59
    .end packed-switch

    :pswitch_data_144
    .packed-switch 0x1
        :pswitch_10c
    .end packed-switch
.end method

.method private handleMotionEventStateTouchExploring(Landroid/view/MotionEvent;I)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {v12}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointerCount()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v13, :cond_16

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_16
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapDetector:Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v13, v0, v1}, Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;->onMotionEvent(Landroid/view/MotionEvent;I)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v13

    packed-switch v13, :pswitch_data_26c

    :cond_31
    :goto_31
    :pswitch_31
    return-void

    :pswitch_32
    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->handleMotionEventGestureDetecting(Landroid/view/MotionEvent;I)V

    :pswitch_35
    packed-switch v3, :pswitch_data_27e

    goto :goto_31

    :pswitch_39
    new-instance v13, Ljava/lang/IllegalStateException;

    const-string v14, "The must always be one active pointer intouch exploring state!"

    invoke-direct {v13, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v13

    :pswitch_41
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    #calls: Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z
    invoke-static {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->access$400(Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;)Z

    move-result v13

    if-eqz v13, :cond_59

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    :cond_59
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapDetector:Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;->firstTapDetected()Z

    move-result v13

    if-eqz v13, :cond_76

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v13, v0, v1}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->post(Landroid/view/MotionEvent;I)V

    goto :goto_31

    :cond_76
    invoke-virtual {v12}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getPrimaryActivePointerId()I

    move-result v9

    const/4 v13, 0x1

    shl-int v10, v13, v9

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v13, v0, v10, v1}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->post(Landroid/view/MotionEvent;II)V

    goto :goto_31

    :pswitch_89
    invoke-virtual {v12}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getPrimaryActivePointerId()I

    move-result v9

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v11

    const/4 v13, 0x1

    shl-int v10, v13, v9

    packed-switch v3, :pswitch_data_286

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    #calls: Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z
    invoke-static {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->access$400(Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;)Z

    move-result v13

    if-eqz v13, :cond_206

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    :goto_b8
    const/4 v13, 0x4

    move-object/from16 v0, p0

    iput v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    goto/16 :goto_31

    :pswitch_c2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    #calls: Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z
    invoke-static {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->access$400(Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;)Z

    move-result v13

    if-eqz v13, :cond_168

    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->handleMotionEventGestureDetecting(Landroid/view/MotionEvent;I)V

    invoke-virtual {v12, v9}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownX(I)F

    move-result v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    sub-float v4, v13, v14

    invoke-virtual {v12, v9}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownY(I)F

    move-result v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v14

    sub-float v5, v13, v14

    float-to-double v13, v4

    float-to-double v15, v5

    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v7

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapSlop:I

    int-to-double v13, v13

    cmpl-double v13, v7, v13

    if-lez v13, :cond_31

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v14, 0x3e8

    invoke-virtual {v13, v14}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v13, v9}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v13

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v14, v9}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v14

    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(FF)F

    move-result v6

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mScaledGestureDetectionVelocity:I

    int-to-float v13, v13

    cmpl-float v13, v6, v13

    if-lez v13, :cond_147

    const/4 v13, 0x5

    move-object/from16 v0, p0

    iput v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mExitGestureDetectionModeDelayed:Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;->post()V

    goto/16 :goto_31

    :cond_147
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->forceSendAndRemove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    const/4 v13, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-direct {v0, v1, v13, v10, v2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto/16 :goto_31

    :cond_168
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapDetector:Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;->firstTapDetected()Z

    move-result v13

    if-nez v13, :cond_31

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/server/accessibility/TouchExplorer;->sendEnterEventsIfNeeded(I)V

    const/4 v13, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-direct {v0, v1, v13, v10, v2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto/16 :goto_31

    :pswitch_185
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    #calls: Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z
    invoke-static {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->access$400(Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;)Z

    move-result v13

    if-eqz v13, :cond_1c6

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    :goto_1a4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    invoke-direct/range {p0 .. p1}, Lcom/android/server/accessibility/TouchExplorer;->isDraggingGesture(Landroid/view/MotionEvent;)Z

    move-result v13

    if-eqz v13, :cond_1fc

    const/4 v13, 0x2

    move-object/from16 v0, p0

    iput v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    move-object/from16 v0, p0

    iput v9, v0, Lcom/android/server/accessibility/TouchExplorer;->mDraggingPointerId:I

    const/4 v13, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-direct {v0, v1, v13, v10, v2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto/16 :goto_31

    :cond_1c6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    invoke-virtual {v12, v9}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownX(I)F

    move-result v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    sub-float v4, v13, v14

    invoke-virtual {v12, v9}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownY(I)F

    move-result v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v14

    sub-float v5, v13, v14

    float-to-double v13, v4

    float-to-double v15, v5

    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v7

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapSlop:I

    int-to-double v13, v13

    cmpg-double v13, v7, v13

    if-ltz v13, :cond_31

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/server/accessibility/TouchExplorer;->sendExitEventsIfNeeded(I)V

    goto :goto_1a4

    :cond_1fc
    const/4 v13, 0x4

    move-object/from16 v0, p0

    iput v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    invoke-direct/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V

    goto/16 :goto_31

    :cond_206
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/server/accessibility/TouchExplorer;->sendExitEventsIfNeeded(I)V

    goto/16 :goto_b8

    :pswitch_216
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    :pswitch_21d
    invoke-virtual {v12}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getLastReceivedUpPointerId()I

    move-result v9

    const/4 v13, 0x1

    shl-int v10, v13, v9

    packed-switch v3, :pswitch_data_290

    :cond_227
    :goto_227
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v13, :cond_31

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v13}, Landroid/view/VelocityTracker;->clear()V

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_31

    :pswitch_23b
    invoke-virtual {v12}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->wasLastReceivedUpPointerActive()Z

    move-result v13

    if-eqz v13, :cond_227

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v13}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    #calls: Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->isPending()Z
    invoke-static {v13}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->access$400(Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;)Z

    move-result v13

    if-eqz v13, :cond_25e

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v13, v0, v10, v1}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->post(Landroid/view/MotionEvent;II)V

    goto :goto_227

    :cond_25e
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/server/accessibility/TouchExplorer;->sendExitEventsIfNeeded(I)V

    goto :goto_227

    :pswitch_266
    invoke-virtual/range {p0 .. p2}, Lcom/android/server/accessibility/TouchExplorer;->clear(Landroid/view/MotionEvent;I)V

    goto/16 :goto_31

    nop

    :pswitch_data_26c
    .packed-switch 0x0
        :pswitch_32
        :pswitch_216
        :pswitch_89
        :pswitch_266
        :pswitch_31
        :pswitch_35
        :pswitch_21d
    .end packed-switch

    :pswitch_data_27e
    .packed-switch 0x0
        :pswitch_39
        :pswitch_41
    .end packed-switch

    :pswitch_data_286
    .packed-switch 0x0
        :pswitch_31
        :pswitch_c2
        :pswitch_185
    .end packed-switch

    :pswitch_data_290
    .packed-switch 0x0
        :pswitch_23b
    .end packed-switch
.end method

.method private isDraggingGesture(Landroid/view/MotionEvent;)Z
    .registers 25

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/accessibility/TouchExplorer;->mTempPointerIds:[I

    invoke-virtual {v12, v11}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->populateActivePointerIds([I)V

    const/16 v21, 0x0

    aget v21, v11, v21

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v6

    const/16 v21, 0x1

    aget v21, v11, v21

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v16

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v17

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v18

    invoke-virtual {v12, v6}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownX(I)F

    move-result v21

    sub-float v3, v7, v21

    invoke-virtual {v12, v6}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownY(I)F

    move-result v21

    sub-float v4, v8, v21

    const/16 v21, 0x0

    cmpl-float v21, v3, v21

    if-nez v21, :cond_5a

    const/16 v21, 0x0

    cmpl-float v21, v4, v21

    if-nez v21, :cond_5a

    const/16 v21, 0x1

    :goto_59
    return v21

    :cond_5a
    mul-float v21, v3, v3

    mul-float v22, v4, v4

    add-float v21, v21, v22

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v21

    move-wide/from16 v0, v21

    double-to-float v5, v0

    const/16 v21, 0x0

    cmpl-float v21, v5, v21

    if-lez v21, :cond_9b

    div-float v9, v3, v5

    :goto_74
    const/16 v21, 0x0

    cmpl-float v21, v5, v21

    if-lez v21, :cond_9d

    div-float v10, v4, v5

    :goto_7c
    move/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownX(I)F

    move-result v21

    sub-float v13, v17, v21

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getReceivedPointerDownY(I)F

    move-result v21

    sub-float v14, v18, v21

    const/16 v21, 0x0

    cmpl-float v21, v13, v21

    if-nez v21, :cond_9f

    const/16 v21, 0x0

    cmpl-float v21, v14, v21

    if-nez v21, :cond_9f

    const/16 v21, 0x1

    goto :goto_59

    :cond_9b
    move v9, v3

    goto :goto_74

    :cond_9d
    move v10, v4

    goto :goto_7c

    :cond_9f
    mul-float v21, v13, v13

    mul-float v22, v14, v14

    add-float v21, v21, v22

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v21

    move-wide/from16 v0, v21

    double-to-float v15, v0

    const/16 v21, 0x0

    cmpl-float v21, v15, v21

    if-lez v21, :cond_d1

    div-float v19, v13, v15

    :goto_b9
    const/16 v21, 0x0

    cmpl-float v21, v15, v21

    if-lez v21, :cond_d4

    div-float v20, v14, v15

    :goto_c1
    mul-float v21, v9, v19

    mul-float v22, v10, v20

    add-float v2, v21, v22

    const v21, 0x3f067b80

    cmpg-float v21, v2, v21

    if-gez v21, :cond_d7

    const/16 v21, 0x0

    goto :goto_59

    :cond_d1
    move/from16 v19, v13

    goto :goto_b9

    :cond_d4
    move/from16 v20, v14

    goto :goto_c1

    :cond_d7
    const/16 v21, 0x1

    goto :goto_59
.end method

.method private sendActionDownAndUp(Landroid/view/MotionEvent;I)V
    .registers 7

    const/4 v3, 0x1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    shl-int v1, v3, v0

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    invoke-direct {p0, p1, v3, v1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    return-void
.end method

.method private sendDownForAllActiveNotInjectedPointers(Landroid/view/MotionEvent;I)V
    .registers 12

    const/4 v8, 0x1

    iget-object v6, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    const/4 v5, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v3, :cond_1d

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->isInjectedPointerDown(I)Z

    move-result v7

    if-eqz v7, :cond_1a

    shl-int v7, v8, v4

    or-int/2addr v5, v7

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_1d
    const/4 v1, 0x0

    :goto_1e
    if-ge v1, v3, :cond_3f

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    invoke-virtual {v6, v4}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->isActivePointer(I)Z

    move-result v7

    if-nez v7, :cond_2d

    :cond_2a
    :goto_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    :cond_2d
    invoke-virtual {v2, v4}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->isInjectedPointerDown(I)Z

    move-result v7

    if-nez v7, :cond_2a

    shl-int v7, v8, v4

    or-int/2addr v5, v7

    const/4 v7, 0x0

    invoke-direct {p0, v7, v1}, Lcom/android/server/accessibility/TouchExplorer;->computeInjectionAction(II)I

    move-result v0

    invoke-direct {p0, p1, v0, v5, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto :goto_2a

    :cond_3f
    return-void
.end method

.method private sendEnterEventsIfNeeded(I)V
    .registers 6

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-virtual {v2}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->getLastInjectedHoverEvent()Landroid/view/MotionEvent;

    move-result-object v0

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1e

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerIdBits()I

    move-result v1

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-virtual {v2}, Lcom/android/server/accessibility/AccessibilityManagerService;->touchExplorationGestureStarted()V

    const/16 v2, 0x9

    invoke-direct {p0, v0, v2, v1, p1}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    :cond_1e
    return-void
.end method

.method private sendExitEventsIfNeeded(I)V
    .registers 6

    const/16 v3, 0xa

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-virtual {v2}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->getLastInjectedHoverEvent()Landroid/view/MotionEvent;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eq v2, v3, :cond_1c

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerIdBits()I

    move-result v1

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mAms:Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-virtual {v2}, Lcom/android/server/accessibility/AccessibilityManagerService;->touchExplorationGestureEnded()V

    invoke-direct {p0, v0, v3, v1, p1}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    :cond_1c
    return-void
.end method

.method private sendMotionEvent(Landroid/view/MotionEvent;III)V
    .registers 28

    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->setAction(I)V

    const/16 v18, 0x0

    const/4 v2, -0x1

    move/from16 v0, p3

    if-ne v0, v2, :cond_6e

    move-object/from16 v18, p1

    :goto_c
    if-nez p2, :cond_77

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3}, Landroid/view/MotionEvent;->setDownTime(J)V

    :goto_17
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerId:I

    if-ltz v2, :cond_c0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerId:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v22

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v20

    invoke-static/range {v20 .. v20}, Landroid/view/MotionEvent$PointerProperties;->createArray(I)[Landroid/view/MotionEvent$PointerProperties;

    move-result-object v8

    invoke-static/range {v20 .. v20}, Landroid/view/MotionEvent$PointerCoords;->createArray(I)[Landroid/view/MotionEvent$PointerCoords;

    move-result-object v9

    const/16 v19, 0x0

    :goto_35
    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_85

    aget-object v2, v8, v19

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->getPointerProperties(ILandroid/view/MotionEvent$PointerProperties;)V

    aget-object v2, v9, v19

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Landroid/view/MotionEvent;->getPointerCoords(ILandroid/view/MotionEvent$PointerCoords;)V

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_6b

    aget-object v2, v9, v19

    iget v3, v2, Landroid/view/MotionEvent$PointerCoords;->x:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaX:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->x:F

    aget-object v2, v9, v19

    iget v3, v2, Landroid/view/MotionEvent$PointerCoords;->y:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaY:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->y:F

    :cond_6b
    add-int/lit8 v19, v19, 0x1

    goto :goto_35

    :cond_6e
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->split(I)Landroid/view/MotionEvent;

    move-result-object v18

    goto :goto_c

    :cond_77
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-virtual {v2}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->getLastInjectedDownEventTime()J

    move-result-wide v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3}, Landroid/view/MotionEvent;->setDownTime(J)V

    goto :goto_17

    :cond_85
    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v11

    const/high16 v12, 0x3f80

    const/high16 v13, 0x3f80

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getSource()I

    move-result v16

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v21

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    if-eq v0, v1, :cond_be

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->recycle()V

    :cond_be
    move-object/from16 v18, v21

    :cond_c0
    const/high16 v2, 0x4000

    or-int p4, p4, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/accessibility/TouchExplorer;->mInputFilter:Lcom/android/server/input/InputFilter;

    move-object/from16 v0, v18

    move/from16 v1, p4

    invoke-virtual {v2, v0, v1}, Lcom/android/server/input/InputFilter;->sendInputEvent(Landroid/view/InputEvent;I)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->onMotionEvent(Landroid/view/MotionEvent;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    if-eq v0, v1, :cond_e1

    invoke-virtual/range {v18 .. v18}, Landroid/view/MotionEvent;->recycle()V

    :cond_e1
    return-void
.end method

.method private sendMotionEventStripInactivePointers(Landroid/view/MotionEvent;I)V
    .registers 12

    iget-object v6, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    invoke-virtual {v6}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointerCount()I

    move-result v8

    if-ne v7, v8, :cond_15

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {p0, p1, v7, v8, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    :cond_14
    :goto_14
    return-void

    :cond_15
    invoke-virtual {v6}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getActivePointerCount()I

    move-result v7

    if-nez v7, :cond_21

    invoke-virtual {v6}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->wasLastReceivedUpPointerActive()Z

    move-result v7

    if-eqz v7, :cond_14

    :cond_21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v7

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    const/4 v7, 0x2

    if-eq v0, v7, :cond_36

    invoke-virtual {v6, v1}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->isActiveOrWasLastActiveUpPointer(I)Z

    move-result v7

    if-eqz v7, :cond_14

    :cond_36
    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v5, 0x0

    :goto_3c
    if-ge v5, v2, :cond_4e

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    invoke-virtual {v6, v3}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->isActiveOrWasLastActiveUpPointer(I)Z

    move-result v7

    if-eqz v7, :cond_4b

    const/4 v7, 0x1

    shl-int/2addr v7, v3

    or-int/2addr v4, v7

    :cond_4b
    add-int/lit8 v5, v5, 0x1

    goto :goto_3c

    :cond_4e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    invoke-direct {p0, p1, v7, v4, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto :goto_14
.end method

.method private sendUpForInjectedDownPointers(Landroid/view/MotionEvent;I)V
    .registers 11

    const/4 v7, 0x1

    iget-object v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    const/4 v5, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v3, :cond_23

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->isInjectedPointerDown(I)Z

    move-result v6

    if-nez v6, :cond_18

    :goto_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_18
    shl-int v6, v7, v4

    or-int/2addr v5, v6

    invoke-direct {p0, v7, v1}, Lcom/android/server/accessibility/TouchExplorer;->computeInjectionAction(II)I

    move-result v0

    invoke-direct {p0, p1, v0, v5, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendMotionEvent(Landroid/view/MotionEvent;III)V

    goto :goto_15

    :cond_23
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 4

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {v1}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getLastReceivedEvent()Landroid/view/MotionEvent;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {v1}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getLastReceivedEvent()Landroid/view/MotionEvent;

    move-result-object v1

    const/high16 v2, 0x200

    invoke-virtual {p0, v1, v2}, Lcom/android/server/accessibility/TouchExplorer;->clear(Landroid/view/MotionEvent;I)V

    :cond_13
    return-void
.end method

.method public clear(Landroid/view/MotionEvent;I)V
    .registers 6

    const/4 v2, 0x0

    const/4 v1, -0x1

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    packed-switch v0, :pswitch_data_48

    :goto_7
    :pswitch_7
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverEnterDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mSendHoverExitDelayed:Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$SendHoverDelayed;->remove()V

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mPerformLongPressDelayed:Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->remove()V

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mExitGestureDetectionModeDelayed:Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$ExitGestureDetectionModeDelayed;->remove()V

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->clear()V

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->clear()V

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mDoubleTapDetector:Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;

    invoke-virtual {v0}, Lcom/android/server/accessibility/TouchExplorer$DoubleTapDetector;->clear()V

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerId:I

    iput v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaX:I

    iput v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mLongPressingPointerDeltaY:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    return-void

    :pswitch_34
    invoke-direct {p0, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendExitEventsIfNeeded(I)V

    goto :goto_7

    :pswitch_38
    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mDraggingPointerId:I

    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendUpForInjectedDownPointers(Landroid/view/MotionEvent;I)V

    goto :goto_7

    :pswitch_3e
    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->sendUpForInjectedDownPointers(Landroid/view/MotionEvent;I)V

    goto :goto_7

    :pswitch_42
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    goto :goto_7

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_34
        :pswitch_38
        :pswitch_7
        :pswitch_3e
        :pswitch_42
    .end packed-switch
.end method

.method public onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    sparse-switch v0, :sswitch_data_2a

    :goto_7
    return-void

    :sswitch_8
    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    #getter for: Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->mLastInjectedHoverEventForClick:Landroid/view/MotionEvent;
    invoke-static {v1}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->access$300(Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;)Landroid/view/MotionEvent;

    move-result-object v1

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    #getter for: Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->mLastInjectedHoverEventForClick:Landroid/view/MotionEvent;
    invoke-static {v1}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->access$300(Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;)Landroid/view/MotionEvent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    iget-object v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mInjectedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;

    const/4 v2, 0x0

    #setter for: Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->mLastInjectedHoverEventForClick:Landroid/view/MotionEvent;
    invoke-static {v1, v2}, Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;->access$302(Lcom/android/server/accessibility/TouchExplorer$InjectedPointerTracker;Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    :cond_1f
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mLastTouchedWindowId:I

    goto :goto_7

    :sswitch_23
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getWindowId()I

    move-result v1

    iput v1, p0, Lcom/android/server/accessibility/TouchExplorer;->mLastTouchedWindowId:I

    goto :goto_7

    :sswitch_data_2a
    .sparse-switch
        0x20 -> :sswitch_8
        0x80 -> :sswitch_23
        0x100 -> :sswitch_23
        0x8000 -> :sswitch_8
    .end sparse-switch
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;I)V
    .registers 6

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mReceivedPointerTracker:Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    invoke-virtual {v0, p1}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->onMotionEvent(Landroid/view/MotionEvent;)V

    iget v0, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    packed-switch v0, :pswitch_data_36

    :pswitch_a
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/accessibility/TouchExplorer;->mCurrentState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_25
    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->handleMotionEventStateTouchExploring(Landroid/view/MotionEvent;I)V

    :goto_28
    return-void

    :pswitch_29
    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->handleMotionEventStateDragging(Landroid/view/MotionEvent;I)V

    goto :goto_28

    :pswitch_2d
    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->handleMotionEventStateDelegating(Landroid/view/MotionEvent;I)V

    goto :goto_28

    :pswitch_31
    invoke-direct {p0, p1, p2}, Lcom/android/server/accessibility/TouchExplorer;->handleMotionEventGestureDetecting(Landroid/view/MotionEvent;I)V

    goto :goto_28

    nop

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_25
        :pswitch_29
        :pswitch_a
        :pswitch_2d
        :pswitch_31
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    const-string v0, "TouchExplorer"

    return-object v0
.end method
