.class final Lcom/android/server/wm/WindowManagerService$H;
.super Landroid/os/Handler;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "H"
.end annotation


# static fields
.field public static final ADD_STARTING:I = 0x5

.field public static final ANIMATE:I = 0x4

.field public static final APP_FREEZE_TIMEOUT:I = 0x11

.field public static final APP_TRANSITION_TIMEOUT:I = 0xd

.field public static final BOOT_TIMEOUT:I = 0x17

.field public static final DRAG_END_TIMEOUT:I = 0x15

.field public static final DRAG_START_TIMEOUT:I = 0x14

.field public static final ENABLE_SCREEN:I = 0x10

.field public static final FINISHED_STARTING:I = 0x7

.field public static final FORCE_GC:I = 0xf

.field public static final HOLD_SCREEN_CHANGED:I = 0xc

.field public static final PERSIST_ANIMATION_SCALE:I = 0xe

.field public static final REMOVE_STARTING:I = 0x6

.field public static final REPORT_APPLICATION_TOKEN_DRAWN:I = 0x9

.field public static final REPORT_APPLICATION_TOKEN_WINDOWS:I = 0x8

.field public static final REPORT_FOCUS_CHANGE:I = 0x2

.field public static final REPORT_HARD_KEYBOARD_STATUS_CHANGE:I = 0x16

.field public static final REPORT_LOSING_FOCUS:I = 0x3

.field public static final REPORT_WINDOWS_CHANGE:I = 0x13

.field public static final SEND_NEW_CONFIGURATION:I = 0x12

.field public static final WAITING_FOR_DRAWN_TIMEOUT:I = 0x18

.field public static final WINDOW_FREEZE_TIMEOUT:I = 0xb


# instance fields
.field private mLastReportedHold:Lcom/android/server/wm/Session;

.field final synthetic this$0:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/wm/WindowManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 6539
    iput-object p1, p0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 6540
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 32
    .parameter "msg"

    .prologue
    .line 6544
    move-object/from16 v0, p1

    iget v2, v0, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_50e

    .line 6945
    :cond_7
    :goto_7
    :pswitch_7
    return-void

    .line 6549
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6550
    :try_start_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v15, v2, Lcom/android/server/wm/WindowManagerService;->mLastFocus:Lcom/android/server/wm/WindowState;

    .line 6551
    .local v15, lastFocus:Lcom/android/server/wm/WindowState;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v2, Lcom/android/server/wm/WindowManagerService;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    move-object/from16 v17, v0

    .line 6552
    .local v17, newFocus:Lcom/android/server/wm/WindowState;
    move-object/from16 v0, v17

    if-ne v15, v0, :cond_26

    .line 6554
    monitor-exit v3

    goto :goto_7

    .line 6565
    .end local v15           #lastFocus:Lcom/android/server/wm/WindowState;
    .end local v17           #newFocus:Lcom/android/server/wm/WindowState;
    :catchall_23
    move-exception v2

    monitor-exit v3
    :try_end_25
    .catchall {:try_start_f .. :try_end_25} :catchall_23

    throw v2

    .line 6556
    .restart local v15       #lastFocus:Lcom/android/server/wm/WindowState;
    .restart local v17       #newFocus:Lcom/android/server/wm/WindowState;
    :cond_26
    :try_start_26
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v0, v17

    iput-object v0, v2, Lcom/android/server/wm/WindowManagerService;->mLastFocus:Lcom/android/server/wm/WindowState;

    .line 6559
    if-eqz v17, :cond_42

    if-eqz v15, :cond_42

    invoke-virtual/range {v17 .. v17}, Lcom/android/server/wm/WindowState;->isDisplayedLw()Z

    move-result v2

    if-nez v2, :cond_42

    .line 6562
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mLosingFocus:Ljava/util/ArrayList;

    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6563
    const/4 v15, 0x0

    .line 6565
    :cond_42
    monitor-exit v3
    :try_end_43
    .catchall {:try_start_26 .. :try_end_43} :catchall_23

    .line 6567
    move-object/from16 v0, v17

    if-eq v15, v0, :cond_7

    .line 6570
    if-eqz v17, :cond_5e

    .line 6573
    :try_start_49
    move-object/from16 v0, v17

    iget-object v2, v0, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowManagerService;->mInTouchMode:Z

    invoke-interface {v2, v3, v4}, Landroid/view/IWindow;->windowFocusChanged(ZZ)V
    :try_end_57
    .catch Landroid/os/RemoteException; {:try_start_49 .. :try_end_57} :catch_50b

    .line 6577
    :goto_57
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    #calls: Lcom/android/server/wm/WindowManagerService;->notifyFocusChanged()V
    invoke-static {v2}, Lcom/android/server/wm/WindowManagerService;->access$400(Lcom/android/server/wm/WindowManagerService;)V

    .line 6580
    :cond_5e
    if-eqz v15, :cond_7

    .line 6583
    :try_start_60
    iget-object v2, v15, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowManagerService;->mInTouchMode:Z

    invoke-interface {v2, v3, v4}, Landroid/view/IWindow;->windowFocusChanged(ZZ)V
    :try_end_6c
    .catch Landroid/os/RemoteException; {:try_start_60 .. :try_end_6c} :catch_6d

    goto :goto_7

    .line 6584
    :catch_6d
    move-exception v2

    goto :goto_7

    .line 6594
    .end local v15           #lastFocus:Lcom/android/server/wm/WindowState;
    .end local v17           #newFocus:Lcom/android/server/wm/WindowState;
    :pswitch_6f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6595
    :try_start_76
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v2, Lcom/android/server/wm/WindowManagerService;->mLosingFocus:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    .line 6596
    .local v16, losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/wm/WindowState;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v2, Lcom/android/server/wm/WindowManagerService;->mLosingFocus:Ljava/util/ArrayList;

    .line 6597
    monitor-exit v3
    :try_end_8a
    .catchall {:try_start_76 .. :try_end_8a} :catchall_a8

    .line 6599
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 6600
    .local v11, N:I
    const/4 v14, 0x0

    .local v14, i:I
    :goto_8f
    if-ge v14, v11, :cond_7

    .line 6603
    :try_start_91
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mClient:Landroid/view/IWindow;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowManagerService;->mInTouchMode:Z

    invoke-interface {v2, v3, v4}, Landroid/view/IWindow;->windowFocusChanged(ZZ)V
    :try_end_a5
    .catch Landroid/os/RemoteException; {:try_start_91 .. :try_end_a5} :catch_508

    .line 6600
    :goto_a5
    add-int/lit8 v14, v14, 0x1

    goto :goto_8f

    .line 6597
    .end local v11           #N:I
    .end local v14           #i:I
    .end local v16           #losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/wm/WindowState;>;"
    :catchall_a8
    move-exception v2

    :try_start_a9
    monitor-exit v3
    :try_end_aa
    .catchall {:try_start_a9 .. :try_end_aa} :catchall_a8

    throw v2

    .line 6611
    :pswitch_ab
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6612
    :try_start_b2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x0

    iput-boolean v4, v2, Lcom/android/server/wm/WindowManagerService;->mAnimationPending:Z

    .line 6613
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    #calls: Lcom/android/server/wm/WindowManagerService;->performLayoutAndPlaceSurfacesLocked()V
    invoke-static {v2}, Lcom/android/server/wm/WindowManagerService;->access$500(Lcom/android/server/wm/WindowManagerService;)V

    .line 6614
    monitor-exit v3

    goto/16 :goto_7

    :catchall_c3
    move-exception v2

    monitor-exit v3
    :try_end_c5
    .catchall {:try_start_b2 .. :try_end_c5} :catchall_c3

    throw v2

    .line 6618
    :pswitch_c6
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Lcom/android/server/wm/AppWindowToken;

    .line 6619
    .local v29, wtoken:Lcom/android/server/wm/AppWindowToken;
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    move-object/from16 v23, v0

    .line 6621
    .local v23, sd:Lcom/android/server/wm/StartingData;
    if-eqz v23, :cond_7

    .line 6629
    const/16 v26, 0x0

    .line 6631
    .local v26, view:Landroid/view/View;
    :try_start_d8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object/from16 v0, v29

    iget-object v3, v0, Lcom/android/server/wm/AppWindowToken;->token:Landroid/os/IBinder;

    move-object/from16 v0, v23

    iget-object v4, v0, Lcom/android/server/wm/StartingData;->pkg:Ljava/lang/String;

    move-object/from16 v0, v23

    iget v5, v0, Lcom/android/server/wm/StartingData;->theme:I

    move-object/from16 v0, v23

    iget-object v6, v0, Lcom/android/server/wm/StartingData;->compatInfo:Landroid/content/res/CompatibilityInfo;

    move-object/from16 v0, v23

    iget-object v7, v0, Lcom/android/server/wm/StartingData;->nonLocalizedLabel:Ljava/lang/CharSequence;

    move-object/from16 v0, v23

    iget v8, v0, Lcom/android/server/wm/StartingData;->labelRes:I

    move-object/from16 v0, v23

    iget v9, v0, Lcom/android/server/wm/StartingData;->icon:I

    move-object/from16 v0, v23

    iget v10, v0, Lcom/android/server/wm/StartingData;->windowFlags:I

    invoke-interface/range {v2 .. v10}, Landroid/view/WindowManagerPolicy;->addStartingWindow(Landroid/os/IBinder;Ljava/lang/String;ILandroid/content/res/CompatibilityInfo;Ljava/lang/CharSequence;III)Landroid/view/View;
    :try_end_101
    .catch Ljava/lang/Exception; {:try_start_d8 .. :try_end_101} :catch_147

    move-result-object v26

    .line 6638
    :goto_102
    if-eqz v26, :cond_7

    .line 6639
    const/4 v12, 0x0

    .line 6641
    .local v12, abort:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6642
    :try_start_10c
    move-object/from16 v0, v29

    iget-boolean v2, v0, Lcom/android/server/wm/AppWindowToken;->removed:Z

    if-nez v2, :cond_118

    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    if-nez v2, :cond_150

    .line 6645
    :cond_118
    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    if-eqz v2, :cond_129

    .line 6650
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    .line 6651
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    .line 6652
    const/4 v12, 0x1

    .line 6662
    :cond_129
    :goto_129
    monitor-exit v3
    :try_end_12a
    .catchall {:try_start_10c .. :try_end_12a} :catchall_157

    .line 6664
    if-eqz v12, :cond_7

    .line 6666
    :try_start_12c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object/from16 v0, v29

    iget-object v3, v0, Lcom/android/server/wm/AppWindowToken;->token:Landroid/os/IBinder;

    move-object/from16 v0, v26

    invoke-interface {v2, v3, v0}, Landroid/view/WindowManagerPolicy;->removeStartingWindow(Landroid/os/IBinder;Landroid/view/View;)V
    :try_end_13b
    .catch Ljava/lang/Exception; {:try_start_12c .. :try_end_13b} :catch_13d

    goto/16 :goto_7

    .line 6667
    :catch_13d
    move-exception v13

    .line 6668
    .local v13, e:Ljava/lang/Exception;
    const-string v2, "WindowManager"

    const-string v3, "Exception when removing starting window"

    invoke-static {v2, v3, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .line 6634
    .end local v12           #abort:Z
    .end local v13           #e:Ljava/lang/Exception;
    :catch_147
    move-exception v13

    .line 6635
    .restart local v13       #e:Ljava/lang/Exception;
    const-string v2, "WindowManager"

    const-string v3, "Exception when adding starting window"

    invoke-static {v2, v3, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_102

    .line 6655
    .end local v13           #e:Ljava/lang/Exception;
    .restart local v12       #abort:Z
    :cond_150
    :try_start_150
    move-object/from16 v0, v26

    move-object/from16 v1, v29

    iput-object v0, v1, Lcom/android/server/wm/AppWindowToken;->startingView:Landroid/view/View;

    goto :goto_129

    .line 6662
    :catchall_157
    move-exception v2

    monitor-exit v3
    :try_end_159
    .catchall {:try_start_150 .. :try_end_159} :catchall_157

    throw v2

    .line 6675
    .end local v12           #abort:Z
    .end local v23           #sd:Lcom/android/server/wm/StartingData;
    .end local v26           #view:Landroid/view/View;
    .end local v29           #wtoken:Lcom/android/server/wm/AppWindowToken;
    :pswitch_15a
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Lcom/android/server/wm/AppWindowToken;

    .line 6676
    .restart local v29       #wtoken:Lcom/android/server/wm/AppWindowToken;
    const/16 v25, 0x0

    .line 6677
    .local v25, token:Landroid/os/IBinder;
    const/16 v26, 0x0

    .line 6678
    .restart local v26       #view:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6683
    :try_start_16d
    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    if-eqz v2, :cond_18e

    .line 6684
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->startingView:Landroid/view/View;

    move-object/from16 v26, v0

    .line 6685
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->token:Landroid/os/IBinder;

    move-object/from16 v25, v0

    .line 6686
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    .line 6687
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingView:Landroid/view/View;

    .line 6688
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    .line 6690
    :cond_18e
    monitor-exit v3
    :try_end_18f
    .catchall {:try_start_16d .. :try_end_18f} :catchall_1aa

    .line 6691
    if-eqz v26, :cond_7

    .line 6693
    :try_start_191
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-interface {v2, v0, v1}, Landroid/view/WindowManagerPolicy;->removeStartingWindow(Landroid/os/IBinder;Landroid/view/View;)V
    :try_end_19e
    .catch Ljava/lang/Exception; {:try_start_191 .. :try_end_19e} :catch_1a0

    goto/16 :goto_7

    .line 6694
    :catch_1a0
    move-exception v13

    .line 6695
    .restart local v13       #e:Ljava/lang/Exception;
    const-string v2, "WindowManager"

    const-string v3, "Exception when removing starting window"

    invoke-static {v2, v3, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .line 6690
    .end local v13           #e:Ljava/lang/Exception;
    :catchall_1aa
    move-exception v2

    :try_start_1ab
    monitor-exit v3
    :try_end_1ac
    .catchall {:try_start_1ab .. :try_end_1ac} :catchall_1aa

    throw v2

    .line 6701
    .end local v25           #token:Landroid/os/IBinder;
    .end local v26           #view:Landroid/view/View;
    .end local v29           #wtoken:Lcom/android/server/wm/AppWindowToken;
    :pswitch_1ad
    const/16 v25, 0x0

    .line 6702
    .restart local v25       #token:Landroid/os/IBinder;
    const/16 v26, 0x0

    .line 6704
    .restart local v26       #view:Landroid/view/View;
    :goto_1b1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6705
    :try_start_1b8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 6706
    .restart local v11       #N:I
    if-gtz v11, :cond_1ca

    .line 6707
    monitor-exit v3

    goto/16 :goto_7

    .line 6725
    .end local v11           #N:I
    :catchall_1c7
    move-exception v2

    monitor-exit v3
    :try_end_1c9
    .catchall {:try_start_1b8 .. :try_end_1c9} :catchall_1c7

    throw v2

    .line 6709
    .restart local v11       #N:I
    :cond_1ca
    :try_start_1ca
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    add-int/lit8 v4, v11, -0x1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lcom/android/server/wm/AppWindowToken;

    .line 6716
    .restart local v29       #wtoken:Lcom/android/server/wm/AppWindowToken;
    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    if-nez v2, :cond_1e0

    .line 6717
    monitor-exit v3

    goto :goto_1b1

    .line 6720
    :cond_1e0
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->startingView:Landroid/view/View;

    move-object/from16 v26, v0

    .line 6721
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->token:Landroid/os/IBinder;

    move-object/from16 v25, v0

    .line 6722
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    .line 6723
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingView:Landroid/view/View;

    .line 6724
    const/4 v2, 0x0

    move-object/from16 v0, v29

    iput-object v2, v0, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    .line 6725
    monitor-exit v3
    :try_end_1fc
    .catchall {:try_start_1ca .. :try_end_1fc} :catchall_1c7

    .line 6728
    :try_start_1fc
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-interface {v2, v0, v1}, Landroid/view/WindowManagerPolicy;->removeStartingWindow(Landroid/os/IBinder;Landroid/view/View;)V
    :try_end_209
    .catch Ljava/lang/Exception; {:try_start_1fc .. :try_end_209} :catch_20a

    goto :goto_1b1

    .line 6729
    :catch_20a
    move-exception v13

    .line 6730
    .restart local v13       #e:Ljava/lang/Exception;
    const-string v2, "WindowManager"

    const-string v3, "Exception when removing starting window"

    invoke-static {v2, v3, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1b1

    .line 6736
    .end local v11           #N:I
    .end local v13           #e:Ljava/lang/Exception;
    .end local v25           #token:Landroid/os/IBinder;
    .end local v26           #view:Landroid/view/View;
    .end local v29           #wtoken:Lcom/android/server/wm/AppWindowToken;
    :pswitch_213
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Lcom/android/server/wm/AppWindowToken;

    .line 6741
    .restart local v29       #wtoken:Lcom/android/server/wm/AppWindowToken;
    :try_start_21b
    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    invoke-interface {v2}, Landroid/view/IApplicationToken;->windowsDrawn()V
    :try_end_222
    .catch Landroid/os/RemoteException; {:try_start_21b .. :try_end_222} :catch_224

    goto/16 :goto_7

    .line 6742
    :catch_224
    move-exception v2

    goto/16 :goto_7

    .line 6747
    .end local v29           #wtoken:Lcom/android/server/wm/AppWindowToken;
    :pswitch_227
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Lcom/android/server/wm/AppWindowToken;

    .line 6749
    .restart local v29       #wtoken:Lcom/android/server/wm/AppWindowToken;
    move-object/from16 v0, p1

    iget v2, v0, Landroid/os/Message;->arg1:I

    if-eqz v2, :cond_24d

    const/16 v20, 0x1

    .line 6750
    .local v20, nowVisible:Z
    :goto_237
    move-object/from16 v0, p1

    iget v2, v0, Landroid/os/Message;->arg2:I

    if-eqz v2, :cond_250

    const/16 v19, 0x1

    .line 6757
    .local v19, nowGone:Z
    :goto_23f
    if-eqz v20, :cond_253

    .line 6758
    :try_start_241
    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    invoke-interface {v2}, Landroid/view/IApplicationToken;->windowsVisible()V

    goto/16 :goto_7

    .line 6762
    :catch_24a
    move-exception v2

    goto/16 :goto_7

    .line 6749
    .end local v19           #nowGone:Z
    .end local v20           #nowVisible:Z
    :cond_24d
    const/16 v20, 0x0

    goto :goto_237

    .line 6750
    .restart local v20       #nowVisible:Z
    :cond_250
    const/16 v19, 0x0

    goto :goto_23f

    .line 6760
    .restart local v19       #nowGone:Z
    :cond_253
    move-object/from16 v0, v29

    iget-object v2, v0, Lcom/android/server/wm/AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    invoke-interface {v2}, Landroid/view/IApplicationToken;->windowsGone()V
    :try_end_25a
    .catch Landroid/os/RemoteException; {:try_start_241 .. :try_end_25a} :catch_24a

    goto/16 :goto_7

    .line 6767
    .end local v19           #nowGone:Z
    .end local v20           #nowVisible:Z
    .end local v29           #wtoken:Lcom/android/server/wm/AppWindowToken;
    :pswitch_25c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6768
    :try_start_263
    const-string v2, "WindowManager"

    const-string v4, "Window freeze timeout expired."

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6769
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 6770
    .restart local v14       #i:I
    :cond_274
    :goto_274
    if-lez v14, :cond_2ad

    .line 6771
    add-int/lit8 v14, v14, -0x1

    .line 6772
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/android/server/wm/WindowState;

    .line 6773
    .local v27, w:Lcom/android/server/wm/WindowState;
    move-object/from16 v0, v27

    iget-boolean v2, v0, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    if-eqz v2, :cond_274

    .line 6774
    const/4 v2, 0x0

    move-object/from16 v0, v27

    iput-boolean v2, v0, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    .line 6775
    const-string v2, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Force clearing orientation change: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_274

    .line 6779
    .end local v14           #i:I
    .end local v27           #w:Lcom/android/server/wm/WindowState;
    :catchall_2aa
    move-exception v2

    monitor-exit v3
    :try_end_2ac
    .catchall {:try_start_263 .. :try_end_2ac} :catchall_2aa

    throw v2

    .line 6778
    .restart local v14       #i:I
    :cond_2ad
    :try_start_2ad
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    #calls: Lcom/android/server/wm/WindowManagerService;->performLayoutAndPlaceSurfacesLocked()V
    invoke-static {v2}, Lcom/android/server/wm/WindowManagerService;->access$500(Lcom/android/server/wm/WindowManagerService;)V

    .line 6779
    monitor-exit v3
    :try_end_2b5
    .catchall {:try_start_2ad .. :try_end_2b5} :catchall_2aa

    goto/16 :goto_7

    .line 6786
    .end local v14           #i:I
    :pswitch_2b7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6787
    :try_start_2be
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService$H;->mLastReportedHold:Lcom/android/server/wm/Session;

    move-object/from16 v21, v0

    .line 6788
    .local v21, oldHold:Lcom/android/server/wm/Session;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, Lcom/android/server/wm/Session;

    .line 6789
    .local v18, newHold:Lcom/android/server/wm/Session;
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/wm/WindowManagerService$H;->mLastReportedHold:Lcom/android/server/wm/Session;

    .line 6790
    monitor-exit v3
    :try_end_2d3
    .catchall {:try_start_2be .. :try_end_2d3} :catchall_304

    .line 6792
    move-object/from16 v0, v21

    move-object/from16 v1, v18

    if-eq v0, v1, :cond_7

    .line 6794
    if-eqz v21, :cond_2ec

    .line 6795
    :try_start_2db
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    move-object/from16 v0, v21

    iget v3, v0, Lcom/android/server/wm/Session;->mUid:I

    const/4 v4, -0x1

    const-string v5, "window"

    const/4 v6, 0x2

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/android/internal/app/IBatteryStats;->noteStopWakelock(IILjava/lang/String;I)V

    .line 6799
    :cond_2ec
    if-eqz v18, :cond_7

    .line 6800
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    move-object/from16 v0, v18

    iget v3, v0, Lcom/android/server/wm/Session;->mUid:I

    const/4 v4, -0x1

    const-string v5, "window"

    const/4 v6, 0x2

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/android/internal/app/IBatteryStats;->noteStartWakelock(IILjava/lang/String;I)V
    :try_end_2ff
    .catch Landroid/os/RemoteException; {:try_start_2db .. :try_end_2ff} :catch_301

    goto/16 :goto_7

    .line 6804
    :catch_301
    move-exception v2

    goto/16 :goto_7

    .line 6790
    .end local v18           #newHold:Lcom/android/server/wm/Session;
    .end local v21           #oldHold:Lcom/android/server/wm/Session;
    :catchall_304
    move-exception v2

    :try_start_305
    monitor-exit v3
    :try_end_306
    .catchall {:try_start_305 .. :try_end_306} :catchall_304

    throw v2

    .line 6811
    :pswitch_307
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6812
    :try_start_30e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget v2, v2, Lcom/android/server/wm/WindowManagerService;->mNextAppTransition:I

    const/4 v4, -0x1

    if-eq v2, v4, :cond_32c

    .line 6815
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/android/server/wm/WindowManagerService;->mAppTransitionReady:Z

    .line 6816
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/android/server/wm/WindowManagerService;->mAppTransitionTimeout:Z

    .line 6817
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    #calls: Lcom/android/server/wm/WindowManagerService;->performLayoutAndPlaceSurfacesLocked()V
    invoke-static {v2}, Lcom/android/server/wm/WindowManagerService;->access$500(Lcom/android/server/wm/WindowManagerService;)V

    .line 6819
    :cond_32c
    monitor-exit v3

    goto/16 :goto_7

    :catchall_32f
    move-exception v2

    monitor-exit v3
    :try_end_331
    .catchall {:try_start_30e .. :try_end_331} :catchall_32f

    throw v2

    .line 6824
    :pswitch_332
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "window_animation_scale"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mWindowAnimationScale:F

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 6826
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "transition_animation_scale"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mTransitionAnimationScale:F

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    goto/16 :goto_7

    .line 6832
    :pswitch_35e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6833
    :try_start_365
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v2, v2, Lcom/android/server/wm/WindowManagerService;->mAnimationPending:Z

    if-eqz v2, :cond_38a

    .line 6836
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/16 v5, 0xf

    invoke-virtual {v4, v5}, Lcom/android/server/wm/WindowManagerService$H;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    const-wide/16 v5, 0x7d0

    invoke-virtual {v2, v4, v5, v6}, Lcom/android/server/wm/WindowManagerService$H;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 6838
    monitor-exit v3

    goto/16 :goto_7

    .line 6845
    :catchall_387
    move-exception v2

    monitor-exit v3
    :try_end_389
    .catchall {:try_start_365 .. :try_end_389} :catchall_387

    throw v2

    .line 6842
    :cond_38a
    :try_start_38a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-boolean v2, v2, Lcom/android/server/wm/WindowManagerService;->mDisplayFrozen:Z

    if-eqz v2, :cond_395

    .line 6843
    monitor-exit v3

    goto/16 :goto_7

    .line 6845
    :cond_395
    monitor-exit v3
    :try_end_396
    .catchall {:try_start_38a .. :try_end_396} :catchall_387

    .line 6846
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->gc()V

    goto/16 :goto_7

    .line 6851
    :pswitch_39f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowManagerService;->performEnableScreen()V

    goto/16 :goto_7

    .line 6856
    :pswitch_3a8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6857
    :try_start_3af
    const-string v2, "WindowManager"

    const-string v4, "App freeze timeout expired."

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6858
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 6859
    .restart local v14       #i:I
    :cond_3c0
    :goto_3c0
    if-lez v14, :cond_3ff

    .line 6860
    add-int/lit8 v14, v14, -0x1

    .line 6861
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/android/server/wm/AppWindowToken;

    .line 6862
    .local v24, tok:Lcom/android/server/wm/AppWindowToken;
    move-object/from16 v0, v24

    iget-boolean v2, v0, Lcom/android/server/wm/AppWindowToken;->freezingScreen:Z

    if-eqz v2, :cond_3c0

    .line 6863
    const-string v2, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Force clearing freeze: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6864
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object/from16 v0, v24

    invoke-virtual {v2, v0, v4, v5}, Lcom/android/server/wm/WindowManagerService;->unsetAppFreezingScreenLocked(Lcom/android/server/wm/AppWindowToken;ZZ)V

    goto :goto_3c0

    .line 6867
    .end local v14           #i:I
    .end local v24           #tok:Lcom/android/server/wm/AppWindowToken;
    :catchall_3fc
    move-exception v2

    monitor-exit v3
    :try_end_3fe
    .catchall {:try_start_3af .. :try_end_3fe} :catchall_3fc

    throw v2

    .restart local v14       #i:I
    :cond_3ff
    :try_start_3ff
    monitor-exit v3
    :try_end_400
    .catchall {:try_start_3ff .. :try_end_400} :catchall_3fc

    goto/16 :goto_7

    .line 6872
    .end local v14           #i:I
    :pswitch_402
    const/16 v2, 0x12

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/server/wm/WindowManagerService$H;->removeMessages(I)V

    .line 6873
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowManagerService;->sendNewConfiguration()V

    goto/16 :goto_7

    .line 6878
    :pswitch_412
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    #getter for: Lcom/android/server/wm/WindowManagerService;->mWindowsChanged:Z
    invoke-static {v2}, Lcom/android/server/wm/WindowManagerService;->access$600(Lcom/android/server/wm/WindowManagerService;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 6879
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6880
    :try_start_423
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x0

    #setter for: Lcom/android/server/wm/WindowManagerService;->mWindowsChanged:Z
    invoke-static {v2, v4}, Lcom/android/server/wm/WindowManagerService;->access$602(Lcom/android/server/wm/WindowManagerService;Z)Z

    .line 6881
    monitor-exit v3
    :try_end_42c
    .catchall {:try_start_423 .. :try_end_42c} :catchall_435

    .line 6882
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    #calls: Lcom/android/server/wm/WindowManagerService;->notifyWindowsChanged()V
    invoke-static {v2}, Lcom/android/server/wm/WindowManagerService;->access$700(Lcom/android/server/wm/WindowManagerService;)V

    goto/16 :goto_7

    .line 6881
    :catchall_435
    move-exception v2

    :try_start_436
    monitor-exit v3
    :try_end_437
    .catchall {:try_start_436 .. :try_end_437} :catchall_435

    throw v2

    .line 6888
    :pswitch_438
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v28, v0

    check-cast v28, Landroid/os/IBinder;

    .line 6892
    .local v28, win:Landroid/os/IBinder;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6894
    :try_start_447
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    if-eqz v2, :cond_472

    .line 6895
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    invoke-virtual {v2}, Lcom/android/server/wm/DragState;->unregister()V

    .line 6896
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mInputMonitor:Lcom/android/server/wm/InputMonitor;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/wm/InputMonitor;->updateInputWindowsLw(Z)V

    .line 6897
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    invoke-virtual {v2}, Lcom/android/server/wm/DragState;->reset()V

    .line 6898
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x0

    iput-object v4, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    .line 6900
    :cond_472
    monitor-exit v3

    goto/16 :goto_7

    :catchall_475
    move-exception v2

    monitor-exit v3
    :try_end_477
    .catchall {:try_start_447 .. :try_end_477} :catchall_475

    throw v2

    .line 6905
    .end local v28           #win:Landroid/os/IBinder;
    :pswitch_478
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v28, v0

    check-cast v28, Landroid/os/IBinder;

    .line 6909
    .restart local v28       #win:Landroid/os/IBinder;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6911
    :try_start_487
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    if-eqz v2, :cond_4a1

    .line 6912
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    const/4 v4, 0x0

    iput-boolean v4, v2, Lcom/android/server/wm/DragState;->mDragResult:Z

    .line 6913
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    invoke-virtual {v2}, Lcom/android/server/wm/DragState;->endDragLw()V

    .line 6915
    :cond_4a1
    monitor-exit v3

    goto/16 :goto_7

    :catchall_4a4
    move-exception v2

    monitor-exit v3
    :try_end_4a6
    .catchall {:try_start_487 .. :try_end_4a6} :catchall_4a4

    throw v2

    .line 6920
    .end local v28           #win:Landroid/os/IBinder;
    :pswitch_4a7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowManagerService;->notifyHardKeyboardStatusChange()V

    goto/16 :goto_7

    .line 6925
    :pswitch_4b0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowManagerService;->performBootTimeout()V

    goto/16 :goto_7

    .line 6931
    :pswitch_4b9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 6932
    :try_start_4c0
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, Landroid/util/Pair;

    .line 6933
    .local v22, pair:Landroid/util/Pair;,"Landroid/util/Pair<Lcom/android/server/wm/WindowState;Landroid/os/IRemoteCallback;>;"
    const-string v2, "WindowManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Timeout waiting for drawn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v22

    iget-object v5, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6934
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/wm/WindowManagerService$H;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mWaitingForDrawn:Ljava/util/ArrayList;

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4f8

    .line 6935
    monitor-exit v3

    goto/16 :goto_7

    .line 6937
    .end local v22           #pair:Landroid/util/Pair;,"Landroid/util/Pair<Lcom/android/server/wm/WindowState;Landroid/os/IRemoteCallback;>;"
    :catchall_4f5
    move-exception v2

    monitor-exit v3
    :try_end_4f7
    .catchall {:try_start_4c0 .. :try_end_4f7} :catchall_4f5

    throw v2

    .restart local v22       #pair:Landroid/util/Pair;,"Landroid/util/Pair<Lcom/android/server/wm/WindowState;Landroid/os/IRemoteCallback;>;"
    :cond_4f8
    :try_start_4f8
    monitor-exit v3
    :try_end_4f9
    .catchall {:try_start_4f8 .. :try_end_4f9} :catchall_4f5

    .line 6939
    :try_start_4f9
    move-object/from16 v0, v22

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Landroid/os/IRemoteCallback;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/os/IRemoteCallback;->sendResult(Landroid/os/Bundle;)V
    :try_end_503
    .catch Landroid/os/RemoteException; {:try_start_4f9 .. :try_end_503} :catch_505

    goto/16 :goto_7

    .line 6940
    :catch_505
    move-exception v2

    goto/16 :goto_7

    .line 6604
    .end local v22           #pair:Landroid/util/Pair;,"Landroid/util/Pair<Lcom/android/server/wm/WindowState;Landroid/os/IRemoteCallback;>;"
    .restart local v11       #N:I
    .restart local v14       #i:I
    .restart local v16       #losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/wm/WindowState;>;"
    :catch_508
    move-exception v2

    goto/16 :goto_a5

    .line 6574
    .end local v11           #N:I
    .end local v14           #i:I
    .end local v16           #losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/wm/WindowState;>;"
    .restart local v15       #lastFocus:Lcom/android/server/wm/WindowState;
    .restart local v17       #newFocus:Lcom/android/server/wm/WindowState;
    :catch_50b
    move-exception v2

    goto/16 :goto_57

    .line 6544
    :pswitch_data_50e
    .packed-switch 0x2
        :pswitch_8
        :pswitch_6f
        :pswitch_ab
        :pswitch_c6
        :pswitch_15a
        :pswitch_1ad
        :pswitch_227
        :pswitch_213
        :pswitch_7
        :pswitch_25c
        :pswitch_2b7
        :pswitch_307
        :pswitch_332
        :pswitch_35e
        :pswitch_39f
        :pswitch_3a8
        :pswitch_402
        :pswitch_412
        :pswitch_438
        :pswitch_478
        :pswitch_4a7
        :pswitch_4b0
        :pswitch_4b9
    .end packed-switch
.end method
