.class Lcom/android/server/BatteryService$Led;
.super Ljava/lang/Object;
.source "BatteryService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BatteryService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Led"
.end annotation


# instance fields
.field private mBatteryCharging:Z

.field private mBatteryFull:Z

.field private mBatteryLedOff:I

.field private mBatteryLedOn:I

.field private mBatteryLight:Lcom/android/server/LightsService$Light;

.field private mBatteryLow:Z

.field private mLightsService:Lcom/android/server/LightsService;

.field final synthetic this$0:Lcom/android/server/BatteryService;


# direct methods
.method constructor <init>(Lcom/android/server/BatteryService;Landroid/content/Context;Lcom/android/server/LightsService;)V
    .registers 6
    .parameter
    .parameter "context"
    .parameter "lights"

    .prologue
    .line 592
    iput-object p1, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 594
    iput-object p3, p0, Lcom/android/server/BatteryService$Led;->mLightsService:Lcom/android/server/LightsService;

    .line 595
    const/4 v0, 0x3

    invoke-virtual {p3, v0}, Lcom/android/server/LightsService;->getLight(I)Lcom/android/server/LightsService$Light;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    .line 598
    #getter for: Lcom/android/server/BatteryService;->mContext:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/server/BatteryService;->access$300(Lcom/android/server/BatteryService;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x111001d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    #setter for: Lcom/android/server/BatteryService;->mMultiColorLed:Z
    invoke-static {p1, v0}, Lcom/android/server/BatteryService;->access$202(Lcom/android/server/BatteryService;Z)Z

    .line 601
    #getter for: Lcom/android/server/BatteryService;->mContext:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/server/BatteryService;->access$300(Lcom/android/server/BatteryService;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e001b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOn:I

    .line 603
    #getter for: Lcom/android/server/BatteryService;->mContext:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/server/BatteryService;->access$300(Lcom/android/server/BatteryService;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e001c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOff:I

    .line 605
    return-void
.end method


# virtual methods
.method updateLightsLocked()V
    .registers 8

    .prologue
    const/4 v4, 0x5

    const/4 v6, 0x1

    const/4 v3, 0x2

    .line 611
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryLevel:I
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$400(Lcom/android/server/BatteryService;)I

    move-result v0

    .line 612
    .local v0, level:I
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryStatus:I
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$500(Lcom/android/server/BatteryService;)I

    move-result v1

    .line 614
    .local v1, status:I
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mLightEnabled:Z
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$600(Lcom/android/server/BatteryService;)Z

    move-result v2

    if-nez v2, :cond_1d

    .line 616
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v2}, Lcom/android/server/LightsService$Light;->turnOff()V

    .line 653
    :goto_1c
    return-void

    .line 617
    :cond_1d
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #calls: Lcom/android/server/BatteryService;->inQuietHours()Z
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$700(Lcom/android/server/BatteryService;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mQuietHoursDim:Z
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$800(Lcom/android/server/BatteryService;)Z

    move-result v2

    if-eqz v2, :cond_55

    .line 618
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mLedPulseEnabled:Z
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$900(Lcom/android/server/BatteryService;)Z

    move-result v2

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mLowBatteryWarningLevel:I
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$1000(Lcom/android/server/BatteryService;)I

    move-result v2

    if-ge v0, v2, :cond_4f

    if-eq v1, v3, :cond_4f

    .line 622
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    iget-object v3, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryLowARGB:I
    invoke-static {v3}, Lcom/android/server/BatteryService;->access$1100(Lcom/android/server/BatteryService;)I

    move-result v3

    iget v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOn:I

    iget v5, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOff:I

    invoke-virtual {v2, v3, v6, v4, v5}, Lcom/android/server/LightsService$Light;->setFlashing(IIII)V

    goto :goto_1c

    .line 626
    :cond_4f
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v2}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto :goto_1c

    .line 628
    :cond_55
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mLowBatteryWarningLevel:I
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$1000(Lcom/android/server/BatteryService;)I

    move-result v2

    if-ge v0, v2, :cond_89

    .line 629
    if-ne v1, v3, :cond_6b

    .line 631
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    iget-object v3, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryLowARGB:I
    invoke-static {v3}, Lcom/android/server/BatteryService;->access$1100(Lcom/android/server/BatteryService;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto :goto_1c

    .line 632
    :cond_6b
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mLedPulseEnabled:Z
    invoke-static {v2}, Lcom/android/server/BatteryService;->access$900(Lcom/android/server/BatteryService;)Z

    move-result v2

    if-eqz v2, :cond_83

    .line 634
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    iget-object v3, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryLowARGB:I
    invoke-static {v3}, Lcom/android/server/BatteryService;->access$1100(Lcom/android/server/BatteryService;)I

    move-result v3

    iget v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOn:I

    iget v5, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOff:I

    invoke-virtual {v2, v3, v6, v4, v5}, Lcom/android/server/LightsService$Light;->setFlashing(IIII)V

    goto :goto_1c

    .line 638
    :cond_83
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v2}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto :goto_1c

    .line 640
    :cond_89
    if-eq v1, v3, :cond_8d

    if-ne v1, v4, :cond_ad

    .line 642
    :cond_8d
    if-eq v1, v4, :cond_93

    const/16 v2, 0x5a

    if-lt v0, v2, :cond_a0

    .line 644
    :cond_93
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    iget-object v3, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryFullARGB:I
    invoke-static {v3}, Lcom/android/server/BatteryService;->access$1200(Lcom/android/server/BatteryService;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto/16 :goto_1c

    .line 647
    :cond_a0
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    iget-object v3, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    #getter for: Lcom/android/server/BatteryService;->mBatteryMediumARGB:I
    invoke-static {v3}, Lcom/android/server/BatteryService;->access$1300(Lcom/android/server/BatteryService;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto/16 :goto_1c

    .line 651
    :cond_ad
    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v2}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto/16 :goto_1c
.end method
