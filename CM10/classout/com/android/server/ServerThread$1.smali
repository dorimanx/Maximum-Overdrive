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

.field final synthetic val$bluetoothF:Landroid/server/BluetoothService;

.field final synthetic val$commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;

.field final synthetic val$connectivityF:Lcom/android/server/ConnectivityService;

.field final synthetic val$contextF:Landroid/content/Context;

.field final synthetic val$countryDetectorF:Lcom/android/server/CountryDetectorService;

.field final synthetic val$dockF:Lcom/android/server/DockObserver;

.field final synthetic val$dreamyF:Landroid/service/dreams/DreamManagerService;

.field final synthetic val$headless:Z

.field final synthetic val$immF:Lcom/android/server/InputMethodManagerService;

.field final synthetic val$inputManagerF:Lcom/android/server/input/InputManagerService;

.field final synthetic val$locationF:Lcom/android/server/LocationManagerService;

.field final synthetic val$networkManagementF:Lcom/android/server/NetworkManagementService;

.field final synthetic val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

.field final synthetic val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

.field final synthetic val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

.field final synthetic val$recognitionF:Lcom/android/server/RecognitionManagerService;

.field final synthetic val$rotateSwitchF:Lcom/android/server/RotationSwitchObserver;

.field final synthetic val$safeMode:Z

.field final synthetic val$statusBarF:Lcom/android/server/StatusBarManagerService;

.field final synthetic val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

.field final synthetic val$throttleF:Lcom/android/server/ThrottleService;

.field final synthetic val$uiModeF:Lcom/android/server/UiModeManagerService;

.field final synthetic val$usbF:Lcom/android/server/usb/UsbService;

.field final synthetic val$wallpaperF:Lcom/android/server/WallpaperManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/RotationSwitchObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Landroid/service/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Landroid/server/BluetoothService;)V
    .registers 29
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
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 823
    iput-object p1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    iput-boolean p2, p0, Lcom/android/server/ServerThread$1;->val$headless:Z

    iput-object p3, p0, Lcom/android/server/ServerThread$1;->val$contextF:Landroid/content/Context;

    iput-object p4, p0, Lcom/android/server/ServerThread$1;->val$batteryF:Lcom/android/server/BatteryService;

    iput-object p5, p0, Lcom/android/server/ServerThread$1;->val$networkManagementF:Lcom/android/server/NetworkManagementService;

    iput-object p6, p0, Lcom/android/server/ServerThread$1;->val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

    iput-object p7, p0, Lcom/android/server/ServerThread$1;->val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

    iput-object p8, p0, Lcom/android/server/ServerThread$1;->val$connectivityF:Lcom/android/server/ConnectivityService;

    iput-object p9, p0, Lcom/android/server/ServerThread$1;->val$dockF:Lcom/android/server/DockObserver;

    iput-object p10, p0, Lcom/android/server/ServerThread$1;->val$rotateSwitchF:Lcom/android/server/RotationSwitchObserver;

    iput-object p11, p0, Lcom/android/server/ServerThread$1;->val$usbF:Lcom/android/server/usb/UsbService;

    iput-object p12, p0, Lcom/android/server/ServerThread$1;->val$uiModeF:Lcom/android/server/UiModeManagerService;

    iput-object p13, p0, Lcom/android/server/ServerThread$1;->val$recognitionF:Lcom/android/server/RecognitionManagerService;

    iput-object p14, p0, Lcom/android/server/ServerThread$1;->val$appWidgetF:Lcom/android/server/AppWidgetService;

    move/from16 v0, p15

    iput-boolean v0, p0, Lcom/android/server/ServerThread$1;->val$safeMode:Z

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$wallpaperF:Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$immF:Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$statusBarF:Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$locationF:Lcom/android/server/LocationManagerService;

    move-object/from16 v0, p20

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$countryDetectorF:Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$throttleF:Lcom/android/server/ThrottleService;

    move-object/from16 v0, p22

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, p23

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, p25

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$dreamyF:Landroid/service/dreams/DreamManagerService;

    move-object/from16 v0, p26

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$inputManagerF:Lcom/android/server/input/InputManagerService;

    move-object/from16 v0, p27

    iput-object v0, p0, Lcom/android/server/ServerThread$1;->val$bluetoothF:Landroid/server/BluetoothService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 825
    const-string v1, "SystemServer"

    const-string v2, "Making services ready"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    iget-boolean v1, p0, Lcom/android/server/ServerThread$1;->val$headless:Z

    if-nez v1, :cond_10

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$contextF:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/server/ServerThread;->startSystemUi(Landroid/content/Context;)V

    .line 829
    :cond_10
    :try_start_10
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$batteryF:Lcom/android/server/BatteryService;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$batteryF:Lcom/android/server/BatteryService;

    invoke-virtual {v1}, Lcom/android/server/BatteryService;->systemReady()V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_19} :catch_db

    .line 834
    :cond_19
    :goto_19
    :try_start_19
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkManagementF:Lcom/android/server/NetworkManagementService;

    if-eqz v1, :cond_22

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkManagementF:Lcom/android/server/NetworkManagementService;

    invoke-virtual {v1}, Lcom/android/server/NetworkManagementService;->systemReady()V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_22} :catch_e5

    .line 839
    :cond_22
    :goto_22
    :try_start_22
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkStatsF:Lcom/android/server/net/NetworkStatsService;

    invoke-virtual {v1}, Lcom/android/server/net/NetworkStatsService;->systemReady()V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_2b} :catch_ef

    .line 844
    :cond_2b
    :goto_2b
    :try_start_2b
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

    if-eqz v1, :cond_34

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-virtual {v1}, Lcom/android/server/net/NetworkPolicyManagerService;->systemReady()V
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_34} :catch_f9

    .line 849
    :cond_34
    :goto_34
    :try_start_34
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$connectivityF:Lcom/android/server/ConnectivityService;

    if-eqz v1, :cond_3d

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$connectivityF:Lcom/android/server/ConnectivityService;

    invoke-virtual {v1}, Lcom/android/server/ConnectivityService;->systemReady()V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_3d} :catch_103

    .line 854
    :cond_3d
    :goto_3d
    :try_start_3d
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$dockF:Lcom/android/server/DockObserver;

    if-eqz v1, :cond_46

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$dockF:Lcom/android/server/DockObserver;

    invoke-virtual {v1}, Lcom/android/server/DockObserver;->systemReady()V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_46} :catch_10d

    .line 859
    :cond_46
    :goto_46
    :try_start_46
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$rotateSwitchF:Lcom/android/server/RotationSwitchObserver;

    if-eqz v1, :cond_4f

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$rotateSwitchF:Lcom/android/server/RotationSwitchObserver;

    invoke-virtual {v1}, Lcom/android/server/RotationSwitchObserver;->systemReady()V
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_4f} :catch_117

    .line 864
    :cond_4f
    :goto_4f
    :try_start_4f
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$usbF:Lcom/android/server/usb/UsbService;

    if-eqz v1, :cond_58

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$usbF:Lcom/android/server/usb/UsbService;

    invoke-virtual {v1}, Lcom/android/server/usb/UsbService;->systemReady()V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_4f .. :try_end_58} :catch_121

    .line 869
    :cond_58
    :goto_58
    :try_start_58
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$uiModeF:Lcom/android/server/UiModeManagerService;

    if-eqz v1, :cond_61

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$uiModeF:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1}, Lcom/android/server/UiModeManagerService;->systemReady()V
    :try_end_61
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_61} :catch_12b

    .line 874
    :cond_61
    :goto_61
    :try_start_61
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$recognitionF:Lcom/android/server/RecognitionManagerService;

    if-eqz v1, :cond_6a

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$recognitionF:Lcom/android/server/RecognitionManagerService;

    invoke-virtual {v1}, Lcom/android/server/RecognitionManagerService;->systemReady()V
    :try_end_6a
    .catch Ljava/lang/Throwable; {:try_start_61 .. :try_end_6a} :catch_135

    .line 878
    :cond_6a
    :goto_6a
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/Watchdog;->start()V

    .line 884
    :try_start_71
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$appWidgetF:Lcom/android/server/AppWidgetService;

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$appWidgetF:Lcom/android/server/AppWidgetService;

    iget-boolean v2, p0, Lcom/android/server/ServerThread$1;->val$safeMode:Z

    invoke-virtual {v1, v2}, Lcom/android/server/AppWidgetService;->systemReady(Z)V
    :try_end_7c
    .catch Ljava/lang/Throwable; {:try_start_71 .. :try_end_7c} :catch_13f

    .line 889
    :cond_7c
    :goto_7c
    :try_start_7c
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$wallpaperF:Lcom/android/server/WallpaperManagerService;

    if-eqz v1, :cond_85

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$wallpaperF:Lcom/android/server/WallpaperManagerService;

    invoke-virtual {v1}, Lcom/android/server/WallpaperManagerService;->systemReady()V
    :try_end_85
    .catch Ljava/lang/Throwable; {:try_start_7c .. :try_end_85} :catch_149

    .line 894
    :cond_85
    :goto_85
    :try_start_85
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$immF:Lcom/android/server/InputMethodManagerService;

    if-eqz v1, :cond_90

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$immF:Lcom/android/server/InputMethodManagerService;

    iget-object v2, p0, Lcom/android/server/ServerThread$1;->val$statusBarF:Lcom/android/server/StatusBarManagerService;

    invoke-virtual {v1, v2}, Lcom/android/server/InputMethodManagerService;->systemReady(Lcom/android/server/StatusBarManagerService;)V
    :try_end_90
    .catch Ljava/lang/Throwable; {:try_start_85 .. :try_end_90} :catch_153

    .line 899
    :cond_90
    :goto_90
    :try_start_90
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$locationF:Lcom/android/server/LocationManagerService;

    if-eqz v1, :cond_99

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$locationF:Lcom/android/server/LocationManagerService;

    invoke-virtual {v1}, Lcom/android/server/LocationManagerService;->systemReady()V
    :try_end_99
    .catch Ljava/lang/Throwable; {:try_start_90 .. :try_end_99} :catch_15d

    .line 904
    :cond_99
    :goto_99
    :try_start_99
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$countryDetectorF:Lcom/android/server/CountryDetectorService;

    if-eqz v1, :cond_a2

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$countryDetectorF:Lcom/android/server/CountryDetectorService;

    invoke-virtual {v1}, Lcom/android/server/CountryDetectorService;->systemReady()V
    :try_end_a2
    .catch Ljava/lang/Throwable; {:try_start_99 .. :try_end_a2} :catch_167

    .line 909
    :cond_a2
    :goto_a2
    :try_start_a2
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$throttleF:Lcom/android/server/ThrottleService;

    if-eqz v1, :cond_ab

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$throttleF:Lcom/android/server/ThrottleService;

    invoke-virtual {v1}, Lcom/android/server/ThrottleService;->systemReady()V
    :try_end_ab
    .catch Ljava/lang/Throwable; {:try_start_a2 .. :try_end_ab} :catch_171

    .line 914
    :cond_ab
    :goto_ab
    :try_start_ab
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

    if-eqz v1, :cond_b4

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;

    invoke-virtual {v1}, Lcom/android/server/NetworkTimeUpdateService;->systemReady()V
    :try_end_b4
    .catch Ljava/lang/Throwable; {:try_start_ab .. :try_end_b4} :catch_17b

    .line 919
    :cond_b4
    :goto_b4
    :try_start_b4
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;

    if-eqz v1, :cond_bd

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;

    invoke-virtual {v1}, Lcom/android/server/CommonTimeManagementService;->systemReady()V
    :try_end_bd
    .catch Ljava/lang/Throwable; {:try_start_b4 .. :try_end_bd} :catch_185

    .line 924
    :cond_bd
    :goto_bd
    :try_start_bd
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

    if-eqz v1, :cond_c6

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;

    invoke-virtual {v1}, Lcom/android/server/TextServicesManagerService;->systemReady()V
    :try_end_c6
    .catch Ljava/lang/Throwable; {:try_start_bd .. :try_end_c6} :catch_18f

    .line 929
    :cond_c6
    :goto_c6
    :try_start_c6
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$dreamyF:Landroid/service/dreams/DreamManagerService;

    if-eqz v1, :cond_cf

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$dreamyF:Landroid/service/dreams/DreamManagerService;

    invoke-virtual {v1}, Landroid/service/dreams/DreamManagerService;->systemReady()V
    :try_end_cf
    .catch Ljava/lang/Throwable; {:try_start_c6 .. :try_end_cf} :catch_199

    .line 934
    :cond_cf
    :goto_cf
    :try_start_cf
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$inputManagerF:Lcom/android/server/input/InputManagerService;

    if-eqz v1, :cond_da

    iget-object v1, p0, Lcom/android/server/ServerThread$1;->val$inputManagerF:Lcom/android/server/input/InputManagerService;

    iget-object v2, p0, Lcom/android/server/ServerThread$1;->val$bluetoothF:Landroid/server/BluetoothService;

    invoke-virtual {v1, v2}, Lcom/android/server/input/InputManagerService;->systemReady(Landroid/server/BluetoothService;)V
    :try_end_da
    .catch Ljava/lang/Throwable; {:try_start_cf .. :try_end_da} :catch_1a3

    .line 938
    :cond_da
    :goto_da
    return-void

    .line 830
    :catch_db
    move-exception v0

    .line 831
    .local v0, e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Battery Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_19

    .line 835
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_e5
    move-exception v0

    .line 836
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Managment Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_22

    .line 840
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_ef
    move-exception v0

    .line 841
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Stats Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b

    .line 845
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_f9
    move-exception v0

    .line 846
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Policy Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34

    .line 850
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_103
    move-exception v0

    .line 851
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Connectivity Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d

    .line 855
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_10d
    move-exception v0

    .line 856
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Dock Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_46

    .line 860
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_117
    move-exception v0

    .line 861
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Rotation Switch Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4f

    .line 865
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_121
    move-exception v0

    .line 866
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making USB Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_58

    .line 870
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_12b
    move-exception v0

    .line 871
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making UI Mode Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_61

    .line 875
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_135
    move-exception v0

    .line 876
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Recognition Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_6a

    .line 885
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_13f
    move-exception v0

    .line 886
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making App Widget Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_7c

    .line 890
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_149
    move-exception v0

    .line 891
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Wallpaper Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_85

    .line 895
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_153
    move-exception v0

    .line 896
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Input Method Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_90

    .line 900
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_15d
    move-exception v0

    .line 901
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Location Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_99

    .line 905
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_167
    move-exception v0

    .line 906
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Country Detector Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_a2

    .line 910
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_171
    move-exception v0

    .line 911
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Throttle Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_ab

    .line 915
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_17b
    move-exception v0

    .line 916
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Network Time Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_b4

    .line 920
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_185
    move-exception v0

    .line 921
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Common time management service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_bd

    .line 925
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_18f
    move-exception v0

    .line 926
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making Text Services Manager Service ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c6

    .line 930
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_199
    move-exception v0

    .line 931
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making DreamManagerService ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_cf

    .line 935
    .end local v0           #e:Ljava/lang/Throwable;
    :catch_1a3
    move-exception v0

    .line 936
    .restart local v0       #e:Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/android/server/ServerThread$1;->this$0:Lcom/android/server/ServerThread;

    const-string v2, "making InputManagerService ready"

    invoke-virtual {v1, v2, v0}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_da
.end method
