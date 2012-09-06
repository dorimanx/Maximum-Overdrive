.class Lcom/android/server/CpuGovernorService$1;
.super Landroid/content/BroadcastReceiver;
.source "CpuGovernorService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/CpuGovernorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/CpuGovernorService;


# direct methods
.method constructor <init>(Lcom/android/server/CpuGovernorService;)V
    .registers 2
    .parameter

    .prologue
    .line 82
    iput-object p1, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 85
    const/4 v0, 0x0

    .line 89
    .local v0, changeAdded:Z
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.SCREEN_ON"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_54

    .line 90
    const-string v2, "dev.pm.dyn_samplingrate"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_50

    .line 91
    :goto_17
    if-nez v0, :cond_2d

    .line 93
    :try_start_19
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSamplingRateChangeRequests()Ljava/util/Vector;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_2b
    .catch Ljava/util/ConcurrentModificationException; {:try_start_19 .. :try_end_2b} :catch_1ae

    .line 95
    const/4 v0, 0x1

    goto :goto_17

    .line 101
    :cond_2d
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 102
    :try_start_38
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 103
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/SamplingRateChangeProcessor;->setNotificationPending(Z)V

    .line 104
    monitor-exit v3

    .line 170
    :cond_50
    :goto_50
    return-void

    .line 104
    :catchall_51
    move-exception v2

    monitor-exit v3
    :try_end_53
    .catchall {:try_start_38 .. :try_end_53} :catchall_51

    throw v2

    .line 106
    :cond_54
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a5

    .line 107
    const-string v2, "dev.pm.dyn_samplingrate"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_50

    .line 108
    :goto_68
    if-nez v0, :cond_7e

    .line 110
    :try_start_6a
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSamplingRateChangeRequests()Ljava/util/Vector;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_7c
    .catch Ljava/util/ConcurrentModificationException; {:try_start_6a .. :try_end_7c} :catch_1ab

    .line 112
    const/4 v0, 0x1

    goto :goto_68

    .line 118
    :cond_7e
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 119
    :try_start_89
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 120
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/SamplingRateChangeProcessor;->setNotificationPending(Z)V

    .line 121
    monitor-exit v3

    goto :goto_50

    :catchall_a2
    move-exception v2

    monitor-exit v3
    :try_end_a4
    .catchall {:try_start_89 .. :try_end_a4} :catchall_a2

    throw v2

    .line 123
    :cond_a5
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.action.IOBUSY_VOTE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_128

    .line 124
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.voteType"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 125
    .local v1, voteType:I
    const-string v2, "CpuGovernorService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOBUSY vote: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :goto_d3
    if-nez v0, :cond_100

    .line 129
    if-ne v1, v5, :cond_eb

    .line 130
    :try_start_d7
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getIOBusyChangeRequests()Ljava/util/Vector;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 136
    :goto_e9
    const/4 v0, 0x1

    goto :goto_d3

    .line 133
    :cond_eb
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getIOBusyChangeRequests()Ljava/util/Vector;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_fd
    .catch Ljava/util/ConcurrentModificationException; {:try_start_d7 .. :try_end_fd} :catch_fe

    goto :goto_e9

    .line 137
    :catch_fe
    move-exception v2

    goto :goto_d3

    .line 142
    :cond_100
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 143
    :try_start_10b
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 144
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/IOBusyVoteProcessor;->setNotificationPending(Z)V

    .line 145
    monitor-exit v3

    goto/16 :goto_50

    :catchall_125
    move-exception v2

    monitor-exit v3
    :try_end_127
    .catchall {:try_start_10b .. :try_end_127} :catchall_125

    throw v2

    .line 146
    .end local v1           #voteType:I
    :cond_128
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.action.IOBUSY_UNVOTE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 147
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.voteType"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 148
    .restart local v1       #voteType:I
    const-string v2, "CpuGovernorService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOBUSY unvote: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    :goto_156
    if-nez v0, :cond_183

    .line 152
    if-ne v1, v5, :cond_16e

    .line 153
    :try_start_15a
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getIOBusyChangeRequests()Ljava/util/Vector;

    move-result-object v2

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 159
    :goto_16c
    const/4 v0, 0x1

    goto :goto_156

    .line 156
    :cond_16e
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getIOBusyChangeRequests()Ljava/util/Vector;

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_180
    .catch Ljava/util/ConcurrentModificationException; {:try_start_15a .. :try_end_180} :catch_181

    goto :goto_16c

    .line 160
    :catch_181
    move-exception v2

    goto :goto_156

    .line 165
    :cond_183
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 166
    :try_start_18e
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 167
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/IOBusyVoteProcessor;->setNotificationPending(Z)V

    .line 168
    monitor-exit v3

    goto/16 :goto_50

    :catchall_1a8
    move-exception v2

    monitor-exit v3
    :try_end_1aa
    .catchall {:try_start_18e .. :try_end_1aa} :catchall_1a8

    throw v2

    .line 113
    .end local v1           #voteType:I
    :catch_1ab
    move-exception v2

    goto/16 :goto_68

    .line 96
    :catch_1ae
    move-exception v2

    goto/16 :goto_17
.end method
