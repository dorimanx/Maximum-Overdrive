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
    .line 72
    iput-object p1, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 75
    const/4 v0, 0x0

    .line 77
    .local v0, changeAdded:Z
    const-string v2, "CpuGovernorService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "intent action: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.SCREEN_ON"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_70

    .line 80
    const-string v2, "dev.pm.dyn_samplingrate"

    invoke-static {v2, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_6c

    .line 81
    :goto_33
    if-nez v0, :cond_49

    .line 83
    :try_start_35
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
    :try_end_47
    .catch Ljava/util/ConcurrentModificationException; {:try_start_35 .. :try_end_47} :catch_1ca

    .line 85
    const/4 v0, 0x1

    goto :goto_33

    .line 91
    :cond_49
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 92
    :try_start_54
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 93
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/SamplingRateChangeProcessor;->setNotificationPending(Z)V

    .line 94
    monitor-exit v3

    .line 160
    :cond_6c
    :goto_6c
    return-void

    .line 94
    :catchall_6d
    move-exception v2

    monitor-exit v3
    :try_end_6f
    .catchall {:try_start_54 .. :try_end_6f} :catchall_6d

    throw v2

    .line 96
    :cond_70
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c1

    .line 97
    const-string v2, "dev.pm.dyn_samplingrate"

    invoke-static {v2, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_6c

    .line 98
    :goto_84
    if-nez v0, :cond_9a

    .line 100
    :try_start_86
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
    :try_end_98
    .catch Ljava/util/ConcurrentModificationException; {:try_start_86 .. :try_end_98} :catch_1c7

    .line 102
    const/4 v0, 0x1

    goto :goto_84

    .line 108
    :cond_9a
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 109
    :try_start_a5
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/SamplingRateChangeProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 110
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mSamplingRateChangeProcessor:Lcom/android/server/SamplingRateChangeProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$000(Lcom/android/server/CpuGovernorService;)Lcom/android/server/SamplingRateChangeProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/SamplingRateChangeProcessor;->setNotificationPending(Z)V

    .line 111
    monitor-exit v3

    goto :goto_6c

    :catchall_be
    move-exception v2

    monitor-exit v3
    :try_end_c0
    .catchall {:try_start_a5 .. :try_end_c0} :catchall_be

    throw v2

    .line 113
    :cond_c1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.action.IOBUSY_VOTE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_144

    .line 114
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.voteType"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 115
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

    .line 117
    :goto_ef
    if-nez v0, :cond_11c

    .line 119
    if-ne v1, v5, :cond_107

    .line 120
    :try_start_f3
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

    .line 126
    :goto_105
    const/4 v0, 0x1

    goto :goto_ef

    .line 123
    :cond_107
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
    :try_end_119
    .catch Ljava/util/ConcurrentModificationException; {:try_start_f3 .. :try_end_119} :catch_11a

    goto :goto_105

    .line 127
    :catch_11a
    move-exception v2

    goto :goto_ef

    .line 132
    :cond_11c
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 133
    :try_start_127
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 134
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/IOBusyVoteProcessor;->setNotificationPending(Z)V

    .line 135
    monitor-exit v3

    goto/16 :goto_6c

    :catchall_141
    move-exception v2

    monitor-exit v3
    :try_end_143
    .catchall {:try_start_127 .. :try_end_143} :catchall_141

    throw v2

    .line 136
    .end local v1           #voteType:I
    :cond_144
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.action.IOBUSY_UNVOTE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6c

    .line 137
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "com.android.server.CpuGovernorService.voteType"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 138
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

    .line 140
    :goto_172
    if-nez v0, :cond_19f

    .line 142
    if-ne v1, v5, :cond_18a

    .line 143
    :try_start_176
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

    .line 149
    :goto_188
    const/4 v0, 0x1

    goto :goto_172

    .line 146
    :cond_18a
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
    :try_end_19c
    .catch Ljava/util/ConcurrentModificationException; {:try_start_176 .. :try_end_19c} :catch_19d

    goto :goto_188

    .line 150
    :catch_19d
    move-exception v2

    goto :goto_172

    .line 155
    :cond_19f
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 156
    :try_start_1aa
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/IOBusyVoteProcessor;->getSynchObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 157
    iget-object v2, p0, Lcom/android/server/CpuGovernorService$1;->this$0:Lcom/android/server/CpuGovernorService;

    #getter for: Lcom/android/server/CpuGovernorService;->mIOBusyVoteChangeProcessor:Lcom/android/server/IOBusyVoteProcessor;
    invoke-static {v2}, Lcom/android/server/CpuGovernorService;->access$100(Lcom/android/server/CpuGovernorService;)Lcom/android/server/IOBusyVoteProcessor;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/server/IOBusyVoteProcessor;->setNotificationPending(Z)V

    .line 158
    monitor-exit v3

    goto/16 :goto_6c

    :catchall_1c4
    move-exception v2

    monitor-exit v3
    :try_end_1c6
    .catchall {:try_start_1aa .. :try_end_1c6} :catchall_1c4

    throw v2

    .line 103
    .end local v1           #voteType:I
    :catch_1c7
    move-exception v2

    goto/16 :goto_84

    .line 86
    :catch_1ca
    move-exception v2

    goto/16 :goto_33
.end method
