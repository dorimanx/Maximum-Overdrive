.class Lcom/android/server/ServerThread$1;
.super Ljava/lang/Object;
.source "SystemServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/ServerThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/ServerThread;

.field final synthetic val$appWidgetF:Lcom/android/server/AppWidgetService;

.field final synthetic val$batteryF:Lcom/android/server/BatteryService;

.field final synthetic val$connectivityF:Lcom/android/server/ConnectivityService;

.field final synthetic val$contextF:Landroid/content/Context;

.field final synthetic val$countryDetectorF:Lcom/android/server/CountryDetectorService;

.field final synthetic val$dockF:Lcom/android/server/DockObserver;

.field final synthetic val$immF:Lcom/android/server/InputMethodManagerService;

.field final synthetic val$locationF:Lcom/android/server/LocationManagerService;

.field final synthetic val$networkManagementF:Lcom/android/server/NetworkManagementService;

.field final synthetic val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

.field final synthetic val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

.field final synthetic val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

.field final synthetic val$powerSaverF:Landroid/server/PowerSaverService;

.field final synthetic val$recognitionF:Lcom/android/server/RecognitionManagerService;

.field final synthetic val$safeMode:Z

.field final synthetic val$statusBarF:Lcom/android/server/StatusBarManagerService;

.field final synthetic val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

.field final synthetic val$throttleF:Lcom/android/server/ThrottleService;

.field final synthetic val$uiModeF:Lcom/android/server/UiModeManagerService;

.field final synthetic val$usbF:Lcom/android/server/usb/UsbService;

.field final synthetic val$wallpaperF:Lcom/android/server/WallpaperManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/ServerThread;Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/TextServicesManagerService;Landroid/server/PowerSaverService;)V
    .registers 24
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 687
    iput-object p1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    iput-object p2, p0, Lcom/android/server/ServerThread$1;->val$contextF:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/server/ServerThread$1;->val$batteryF:Lcom/android/server/BatteryService;

    iput-object p4, p0, Lcom/android/server/ServerThread$1;->val$networkManagementF:Lcom/android/server/NetworkManagementService;

    iput-object p5, p0, Lcom/android/server/ServerThread$1;->val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

    iput-object p6, p0, Lcom/android/server/ServerThread$1;->val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

    iput-object p7, p0, Lcom/android/server/ServerThread$1;->val$connectivityF:Lcom/android/server/ConnectivityService;

    iput-object p8, p0, Lcom/android/server/ServerThread$1;->val$dockF:Lcom/android/server/DockObserver;

    iput-object p9, p0, Lcom/android/server/ServerThread$1;->val$usbF:Lcom/android/server/usb/UsbService;

    iput-object p10, p0, Lcom/android/server/ServerThread$1;->val$uiModeF:Lcom/android/server/UiModeManagerService;

    iput-object p11, p0, Lcom/android/server/ServerThread$1;->val$recognitionF:Lcom/android/server/RecognitionManagerService;

    iput-object p12, p0, Lcom/android/server/ServerThread$1;->val$appWidgetF:Lcom/android/server/AppWidgetService;

    iput-boolean p13, p0, Lcom/android/server/ServerThread$1;->val$safeMode:Z

    iput-object p14, p0, Lcom/android/server/ServerThread$1;->val$wallpaperF:Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$immF:Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$statusBarF:Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$locationF:Lcom/android/server/LocationManagerService;

    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$countryDetectorF:Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$throttleF:Lcom/android/server/ThrottleService;

    move-object/from16 v0, p20

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, p22

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$powerSaverF:Landroid/server/PowerSaverService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 689
    const-string v1, "SystemServer"

    const-string v2, "Making services ready"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 691
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$contextF:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/server/ServerThread;->startSystemUi(Landroid/content/Context;)V

    .line 693
    :try_start_c
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$batteryF:Lcom/android/server/BatteryService;

    if-eqz v1, :cond_15

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$batteryF:Lcom/android/server/BatteryService;

    invoke-virtual {v1}, Lcom/android/server/BatteryService;->systemReady()V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_15} :catch_ba

    .line 698
    :cond_15
    :goto_15
    :try_start_15
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkManagementF:Lcom/android/server/NetworkManagementService;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkManagementF:Lcom/android/server/NetworkManagementService;

    invoke-virtual {v1}, Lcom/android/server/NetworkManagementService;->systemReady()V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_1e} :catch_c4

    .line 703
    :cond_1e
    :goto_1e
    :try_start_1e
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

    if-eqz v1, :cond_27

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

    invoke-virtual {v1}, Lcom/android/server/net/NetworkStatsService;->systemReady()V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_27} :catch_ce

    .line 708
    :cond_27
    :goto_27
    :try_start_27
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

    if-eqz v1, :cond_30

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-virtual {v1}, Lcom/android/server/net/NetworkPolicyManagerService;->systemReady()V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_30} :catch_d8

    .line 713
    :cond_30
    :goto_30
    :try_start_30
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$connectivityF:Lcom/android/server/ConnectivityService;

    if-eqz v1, :cond_39

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$connectivityF:Lcom/android/server/ConnectivityService;

    invoke-virtual {v1}, Lcom/android/server/ConnectivityService;->systemReady()V
    :try_end_39
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_39} :catch_e2

    .line 718
    :cond_39
    :goto_39
    :try_start_39
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$dockF:Lcom/android/server/DockObserver;

    if-eqz v1, :cond_42

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$dockF:Lcom/android/server/DockObserver;

    invoke-virtual {v1}, Lcom/android/server/DockObserver;->systemReady()V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_42} :catch_ec

    .line 723
    :cond_42
    :goto_42
    :try_start_42
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$usbF:Lcom/android/server/usb/UsbService;

    if-eqz v1, :cond_4b

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$usbF:Lcom/android/server/usb/UsbService;

    invoke-virtual {v1}, Lcom/android/server/usb/UsbService;->systemReady()V
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_4b} :catch_f6

    .line 728
    :cond_4b
    :goto_4b
    :try_start_4b
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$uiModeF:Lcom/android/server/UiModeManagerService;

    if-eqz v1, :cond_54

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$uiModeF:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1}, Lcom/android/server/UiModeManagerService;->systemReady()V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_54} :catch_100

    .line 733
    :cond_54
    :goto_54
    :try_start_54
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$recognitionF:Lcom/android/server/RecognitionManagerService;

    if-eqz v1, :cond_5d

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$recognitionF:Lcom/android/server/RecognitionManagerService;

    invoke-virtual {v1}, Lcom/android/server/RecognitionManagerService;->systemReady()V
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_5d} :catch_10a

    .line 737
    :cond_5d
    :goto_5d
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/Watchdog;->start()V

    .line 743
    :try_start_64
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$appWidgetF:Lcom/android/server/AppWidgetService;

    if-eqz v1, :cond_6f

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$appWidgetF:Lcom/android/server/AppWidgetService;

    iget-boolean v2, p0, Lcom/android/server/ServerThread$1;->val$safeMode:Z

    invoke-virtual {v1, v2}, Lcom/android/server/AppWidgetService;->systemReady(Z)V
    :try_end_6f
    .catch Ljava/lang/Throwable; {:try_start_64 .. :try_end_6f} :catch_114

    .line 748
    :cond_6f
    :goto_6f
    :try_start_6f
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$wallpaperF:Lcom/android/server/WallpaperManagerService;

    if-eqz v1, :cond_78

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$wallpaperF:Lcom/android/server/WallpaperManagerService;

    invoke-virtual {v1}, Lcom/android/server/WallpaperManagerService;->systemReady()V
    :try_end_78
    .catch Ljava/lang/Throwable; {:try_start_6f .. :try_end_78} :catch_11e

    .line 753
    :cond_78
    :goto_78
    :try_start_78
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$immF:Lcom/android/server/InputMethodManagerService;

    if-eqz v1, :cond_83

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$immF:Lcom/android/server/InputMethodManagerService;

    iget-object v2, p0, Lcom/android/server/ServerThread$1;->val$statusBarF:Lcom/android/server/StatusBarManagerService;

    invoke-virtual {v1, v2}, Lcom/android/server/InputMethodManagerService;->systemReady(Lcom/android/server/StatusBarManagerService;)V
    :try_end_83
    .catch Ljava/lang/Throwable; {:try_start_78 .. :try_end_83} :catch_128

    .line 758
    :cond_83
    :goto_83
    :try_start_83
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$locationF:Lcom/android/server/LocationManagerService;

    if-eqz v1, :cond_8c

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$locationF:Lcom/android/server/LocationManagerService;

    invoke-virtual {v1}, Lcom/android/server/LocationManagerService;->systemReady()V
    :try_end_8c
    .catch Ljava/lang/Throwable; {:try_start_83 .. :try_end_8c} :catch_132

    .line 763
    :cond_8c
    :goto_8c
    :try_start_8c
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$countryDetectorF:Lcom/android/server/CountryDetectorService;

    if-eqz v1, :cond_95

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$countryDetectorF:Lcom/android/server/CountryDetectorService;

    invoke-virtual {v1}, Lcom/android/server/CountryDetectorService;->systemReady()V
    :try_end_95
    .catch Ljava/lang/Throwable; {:try_start_8c .. :try_end_95} :catch_13c

    .line 768
    :cond_95
    :goto_95
    :try_start_95
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$throttleF:Lcom/android/server/ThrottleService;

    if-eqz v1, :cond_9e

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$throttleF:Lcom/android/server/ThrottleService;

    invoke-virtual {v1}, Lcom/android/server/ThrottleService;->systemReady()V
    :try_end_9e
    .catch Ljava/lang/Throwable; {:try_start_95 .. :try_end_9e} :catch_146

    .line 773
    :cond_9e
    :goto_9e
    :try_start_9e
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

    if-eqz v1, :cond_a7

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

    invoke-virtual {v1}, Lcom/android/server/NetworkTimeUpdateService;->systemReady()V
    :try_end_a7
    .catch Ljava/lang/Throwable; {:try_start_9e .. :try_end_a7} :catch_150

    .line 778
    :cond_a7
    :goto_a7
    :try_start_a7
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

    if-eqz v1, :cond_b0

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

    invoke-virtual {v1}, Lcom/android/server/TextServicesManagerService;->systemReady()V
    :try_end_b0
    .catch Ljava/lang/Throwable; {:try_start_a7 .. :try_end_b0} :catch_15a

    .line 783
    :cond_b0
    :goto_b0
    :try_start_b0
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$powerSaverF:Landroid/server/PowerSaverService;

    if-eqz v1, :cond_b9

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$powerSaverF:Landroid/server/PowerSaverService;

    invoke-virtual {v1}, Landroid/server/PowerSaverService;->systemReady()V
    :try_end_b9
    .catch Ljava/lang/Throwable; {:try_start_b0 .. :try_end_b9} :catch_164

    .line 787
    :cond_b9
    :goto_b9
    return-void

    .line 694
    :catch_ba
    move-exception v0

    .line 695
    .local v0, e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Battery Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_15

    .line 699
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_c4
    move-exception v0

    .line 700
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Managment Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1e

    .line 704
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_ce
    move-exception v0

    .line 705
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Stats Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_27

    .line 709
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_d8
    move-exception v0

    .line 710
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Policy Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30

    .line 714
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_e2
    move-exception v0

    .line 715
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Connectivity Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_39

    .line 719
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_ec
    move-exception v0

    .line 720
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Dock Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42

    .line 724
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_f6
    move-exception v0

    .line 725
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making USB Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4b

    .line 729
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_100
    move-exception v0

    .line 730
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making UI Mode Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_54

    .line 734
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_10a
    move-exception v0

    .line 735
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Recognition Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5d

    .line 744
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_114
    move-exception v0

    .line 745
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making App Widget Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_6f

    .line 749
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_11e
    move-exception v0

    .line 750
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Wallpaper Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_78

    .line 754
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_128
    move-exception v0

    .line 755
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Input Method Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_83

    .line 759
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_132
    move-exception v0

    .line 760
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Location Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_8c

    .line 764
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_13c
    move-exception v0

    .line 765
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Country Detector Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_95

    .line 769
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_146
    move-exception v0

    .line 770
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Throttle Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_9e

    .line 774
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_150
    move-exception v0

    .line 775
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Time Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_a7

    .line 779
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_15a
    move-exception v0

    .line 780
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Text Services Manager Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_b0

    .line 784
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_164
    move-exception v0

    .line 785
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making PowerSaverService ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_b9
.end method
