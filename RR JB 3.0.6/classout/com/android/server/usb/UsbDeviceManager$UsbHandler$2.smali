.class Lcom/android/server/usb/UsbDeviceManager$UsbHandler$2;
.super Landroid/database/ContentObserver;
.source "UsbDeviceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/usb/UsbDeviceManager$UsbHandler;-><init>(Lcom/android/server/usb/UsbDeviceManager;Landroid/os/Looper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

.field final synthetic val$this$0:Lcom/android/server/usb/UsbDeviceManager;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbDeviceManager$UsbHandler;Landroid/os/Handler;Lcom/android/server/usb/UsbDeviceManager;)V
    .registers 4
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 355
    iput-object p1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler$2;->this$1:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    iput-object p3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler$2;->val$this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 3
    .parameter "selfChange"

    .prologue
    .line 357
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler$2;->this$1:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    #calls: Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateAdbNotification()V
    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->access$700(Lcom/android/server/usb/UsbDeviceManager$UsbHandler;)V

    .line 358
    return-void
.end method
