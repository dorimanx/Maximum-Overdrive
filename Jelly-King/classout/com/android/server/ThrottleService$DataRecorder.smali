.class Lcom/android/server/ThrottleService$DataRecorder;
.super Ljava/lang/Object;
.source "ThrottleService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ThrottleService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataRecorder"
.end annotation


# static fields
.field private static final DATA_FILE_VERSION:I = 0x1

.field private static final MAX_SIMS_SUPPORTED:I = 0x3


# instance fields
.field mContext:Landroid/content/Context;

.field mCurrentPeriod:I

.field mImsi:Ljava/lang/String;

.field mParent:Lcom/android/server/ThrottleService;

.field mPeriodCount:I

.field mPeriodEnd:Ljava/util/Calendar;

.field mPeriodRxData:[J

.field mPeriodStart:Ljava/util/Calendar;

.field mPeriodTxData:[J

.field mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/android/server/ThrottleService;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mImsi:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mContext:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    const/4 v0, 0x6

    :try_start_1a
    iput v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodStart:Ljava/util/Calendar;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodEnd:Ljava/util/Calendar;

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->retrieve()V

    monitor-exit v1

    return-void

    :catchall_39
    move-exception v0

    monitor-exit v1
    :try_end_3b
    .catchall {:try_start_1a .. :try_end_3b} :catchall_39

    throw v0
.end method

.method private checkAndDeleteLRUDataFile(Ljava/io/File;)V
    .registers 13

    const/4 v10, 0x3

    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_a

    array-length v6, v2

    if-gt v6, v10, :cond_b

    :cond_a
    :goto_a
    return-void

    :cond_b
    const-string v6, "ThrottleService"

    const-string v7, "Too many data files"

    invoke-static {v6, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12
    const/4 v5, 0x0

    move-object v0, v2

    array-length v4, v0

    const/4 v3, 0x0

    :goto_16
    if-ge v3, v4, :cond_2c

    aget-object v1, v0, v3

    if-eqz v5, :cond_28

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_29

    :cond_28
    move-object v5, v1

    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_2c
    if-eqz v5, :cond_a

    const-string v6, "ThrottleService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " deleting "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v6, v2

    if-gt v6, v10, :cond_12

    goto :goto_a
.end method

.method private checkForSubscriberId()V
    .registers 2

    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mImsi:Ljava/lang/String;

    if-eqz v0, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mImsi:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mImsi:Ljava/lang/String;

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->retrieve()V

    goto :goto_4
.end method

.method private getDataFile()Ljava/io/File;
    .registers 8

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    new-instance v4, Ljava/io/File;

    const-string v5, "system/throttle"

    invoke-direct {v4, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    iget-object v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_25

    invoke-direct {p0, v4}, Lcom/android/server/ThrottleService$DataRecorder;->useMRUFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    :goto_1a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Ljava/io/File;->setLastModified(J)Z

    invoke-direct {p0, v4}, Lcom/android/server/ThrottleService$DataRecorder;->checkAndDeleteLRUDataFile(Ljava/io/File;)V

    return-object v1

    :cond_25
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_1a
.end method

.method private record()V
    .registers 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    :goto_19
    iget v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    if-ge v2, v5, :cond_2c

    iget-object v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    aget-wide v5, v5, v2

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    :cond_2c
    const/4 v2, 0x0

    :goto_2d
    iget v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    if-ge v2, v5, :cond_40

    iget-object v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    aget-wide v5, v5, v2

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    :cond_40
    iget v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodStart:Ljava/util/Calendar;

    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodEnd:Ljava/util/Calendar;

    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    :try_start_62
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->getDataFile()Ljava/io/File;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    const/16 v6, 0x100

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_72
    .catchall {:try_start_62 .. :try_end_72} :catchall_90
    .catch Ljava/io/IOException; {:try_start_62 .. :try_end_72} :catch_80

    :try_start_72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_79
    .catchall {:try_start_72 .. :try_end_79} :catchall_9b
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_79} :catch_9e

    if-eqz v4, :cond_7e

    :try_start_7b
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_7e} :catch_99

    :cond_7e
    :goto_7e
    move-object v3, v4

    :cond_7f
    :goto_7f
    return-void

    :catch_80
    move-exception v1

    :goto_81
    :try_start_81
    const-string v5, "ThrottleService"

    const-string v6, "Error writing data file"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_88
    .catchall {:try_start_81 .. :try_end_88} :catchall_90

    if-eqz v3, :cond_7f

    :try_start_8a
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_8d} :catch_8e

    goto :goto_7f

    :catch_8e
    move-exception v5

    goto :goto_7f

    :catchall_90
    move-exception v5

    :goto_91
    if-eqz v3, :cond_96

    :try_start_93
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_96} :catch_97

    :cond_96
    :goto_96
    throw v5

    :catch_97
    move-exception v6

    goto :goto_96

    :catch_99
    move-exception v5

    goto :goto_7e

    :catchall_9b
    move-exception v5

    move-object v3, v4

    goto :goto_91

    :catch_9e
    move-exception v1

    move-object v3, v4

    goto :goto_81
.end method

.method private retrieve()V
    .registers 22

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/server/ThrottleService$DataRecorder;->zeroData(I)V

    invoke-direct/range {p0 .. p0}, Lcom/android/server/ThrottleService$DataRecorder;->getDataFile()Ljava/io/File;

    move-result-object v6

    const/16 v16, 0x0

    :try_start_f
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v18

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v2, v0, [B

    new-instance v17, Ljava/io/FileInputStream;

    move-object/from16 v0, v17

    invoke-direct {v0, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_23
    .catchall {:try_start_f .. :try_end_23} :catchall_54
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_23} :catch_44

    :try_start_23
    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/io/FileInputStream;->read([B)I
    :try_end_28
    .catchall {:try_start_23 .. :try_end_28} :catchall_16a
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_28} :catch_16f

    if-eqz v17, :cond_2d

    :try_start_2a
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->close()V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2d} :catch_165

    :cond_2d
    :goto_2d
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v2}, Ljava/lang/String;-><init>([B)V

    if-eqz v4, :cond_3a

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v18

    if-nez v18, :cond_5b

    :cond_3a
    const-string v18, "ThrottleService"

    const-string v19, "data file empty"

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v16, v17

    :cond_43
    :goto_43
    return-void

    :catch_44
    move-exception v5

    :goto_45
    :try_start_45
    const-string v18, "ThrottleService"

    const-string v19, "Error reading data file"

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4c
    .catchall {:try_start_45 .. :try_end_4c} :catchall_54

    if-eqz v16, :cond_43

    :try_start_4e
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_51} :catch_52

    goto :goto_43

    :catch_52
    move-exception v18

    goto :goto_43

    :catchall_54
    move-exception v18

    :goto_55
    if-eqz v16, :cond_5a

    :try_start_57
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_5a} :catch_162

    :cond_5a
    :goto_5a
    throw v18

    :cond_5b
    const-string v18, ":"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    array-length v0, v8

    move/from16 v18, v0

    const/16 v19, 0x6

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_79

    const-string v18, "ThrottleService"

    const-string v19, "reading data file with insufficient length - ignoring"

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v16, v17

    goto :goto_43

    :cond_79
    add-int/lit8 v10, v9, 0x1

    :try_start_7b
    aget-object v18, v8, v9

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_93

    const-string v18, "ThrottleService"

    const-string v19, "reading data file with bad version - ignoring"

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_90} :catch_152

    move-object/from16 v16, v17

    goto :goto_43

    :cond_93
    add-int/lit8 v9, v10, 0x1

    :try_start_95
    aget-object v18, v8, v10

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    array-length v0, v8

    move/from16 v18, v0

    mul-int/lit8 v19, v11, 0x2

    add-int/lit8 v19, v19, 0x5

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_db

    const-string v18, "ThrottleService"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "reading data file with bad length ("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    array-length v0, v8

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " != "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    mul-int/lit8 v20, v11, 0x2

    add-int/lit8 v20, v20, 0x5

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ") - ignoring"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v16, v17

    goto/16 :goto_43

    :cond_db
    new-array v13, v11, [J

    const/4 v7, 0x0

    move v10, v9

    :goto_df
    if-ge v7, v11, :cond_ef

    add-int/lit8 v9, v10, 0x1

    aget-object v18, v8, v10

    invoke-static/range {v18 .. v18}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    aput-wide v18, v13, v7
    :try_end_eb
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_eb} :catch_168

    add-int/lit8 v7, v7, 0x1

    move v10, v9

    goto :goto_df

    :cond_ef
    :try_start_ef
    new-array v15, v11, [J
    :try_end_f1
    .catch Ljava/lang/Exception; {:try_start_ef .. :try_end_f1} :catch_152

    const/4 v7, 0x0

    :goto_f2
    if-ge v7, v11, :cond_102

    add-int/lit8 v9, v10, 0x1

    :try_start_f6
    aget-object v18, v8, v10

    invoke-static/range {v18 .. v18}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    aput-wide v18, v15, v7

    add-int/lit8 v7, v7, 0x1

    move v10, v9

    goto :goto_f2

    :cond_102
    add-int/lit8 v9, v10, 0x1

    aget-object v18, v8, v10

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    new-instance v14, Ljava/util/GregorianCalendar;

    invoke-direct {v14}, Ljava/util/GregorianCalendar;-><init>()V
    :try_end_10f
    .catch Ljava/lang/Exception; {:try_start_f6 .. :try_end_10f} :catch_168

    add-int/lit8 v10, v9, 0x1

    :try_start_111
    aget-object v18, v8, v9

    invoke-static/range {v18 .. v18}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v14, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    new-instance v12, Ljava/util/GregorianCalendar;

    invoke-direct {v12}, Ljava/util/GregorianCalendar;-><init>()V
    :try_end_121
    .catch Ljava/lang/Exception; {:try_start_111 .. :try_end_121} :catch_152

    add-int/lit8 v9, v10, 0x1

    :try_start_123
    aget-object v18, v8, v10

    invoke-static/range {v18 .. v18}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V
    :try_end_12e
    .catch Ljava/lang/Exception; {:try_start_123 .. :try_end_12e} :catch_168

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    move-object/from16 v19, v0

    monitor-enter v19

    :try_start_135
    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodStart:Ljava/util/Calendar;

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodEnd:Ljava/util/Calendar;

    monitor-exit v19
    :try_end_14e
    .catchall {:try_start_135 .. :try_end_14e} :catchall_15f

    move-object/from16 v16, v17

    goto/16 :goto_43

    :catch_152
    move-exception v5

    move v9, v10

    :goto_154
    const-string v18, "ThrottleService"

    const-string v19, "Error parsing data file - ignoring"

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v16, v17

    goto/16 :goto_43

    :catchall_15f
    move-exception v18

    :try_start_160
    monitor-exit v19
    :try_end_161
    .catchall {:try_start_160 .. :try_end_161} :catchall_15f

    throw v18

    :catch_162
    move-exception v19

    goto/16 :goto_5a

    :catch_165
    move-exception v18

    goto/16 :goto_2d

    :catch_168
    move-exception v5

    goto :goto_154

    :catchall_16a
    move-exception v18

    move-object/from16 v16, v17

    goto/16 :goto_55

    :catch_16f
    move-exception v5

    move-object/from16 v16, v17

    goto/16 :goto_45
.end method

.method private setPeriodEnd(Ljava/util/Calendar;)V
    .registers 4

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodEnd:Ljava/util/Calendar;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method private setPeriodStart(Ljava/util/Calendar;)V
    .registers 4

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodStart:Ljava/util/Calendar;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method private useMRUFile(Ljava/io/File;)Ljava/io/File;
    .registers 12

    const/4 v5, 0x0

    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_20

    move-object v0, v2

    array-length v4, v0

    const/4 v3, 0x0

    :goto_a
    if-ge v3, v4, :cond_20

    aget-object v1, v0, v3

    if-eqz v5, :cond_1c

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_1d

    :cond_1c
    move-object v5, v1

    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_20
    if-nez v5, :cond_29

    new-instance v5, Ljava/io/File;

    const-string v6, "temp"

    invoke-direct {v5, p1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :cond_29
    return-object v5
.end method

.method private zeroData(I)V
    .registers 7

    iget-object v2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v2

    const/4 v0, 0x0

    :goto_4
    :try_start_4
    iget v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    if-ge v0, v1, :cond_17

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    const-wide/16 v3, 0x0

    aput-wide v3, v1, v0

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    const-wide/16 v3, 0x0

    aput-wide v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_17
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    monitor-exit v2

    return-void

    :catchall_1c
    move-exception v1

    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_4 .. :try_end_1e} :catchall_1c

    throw v1
.end method


# virtual methods
.method addData(JJ)V
    .registers 10

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->checkForSubscriberId()V

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    :try_start_6
    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    iget v2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    aget-wide v3, v0, v2

    add-long/2addr v3, p1

    aput-wide v3, v0, v2

    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    iget v2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    aget-wide v3, v0, v2

    add-long/2addr v3, p3

    aput-wide v3, v0, v2

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_6 .. :try_end_19} :catchall_1d

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->record()V

    return-void

    :catchall_1d
    move-exception v0

    :try_start_1e
    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public getPeriodCount()I
    .registers 3

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public getPeriodEnd()J
    .registers 5

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodEnd:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method getPeriodRx(I)J
    .registers 5

    iget-object v2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v2

    :try_start_3
    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    if-le p1, v0, :cond_b

    const-wide/16 v0, 0x0

    monitor-exit v2

    :goto_a
    return-wide v0

    :cond_b
    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    sub-int p1, v0, p1

    if-gez p1, :cond_14

    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    add-int/2addr p1, v0

    :cond_14
    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    aget-wide v0, v0, p1

    monitor-exit v2

    goto :goto_a

    :catchall_1a
    move-exception v0

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public getPeriodStart()J
    .registers 5

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodStart:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method getPeriodTx(I)J
    .registers 5

    iget-object v2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v2

    :try_start_3
    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    if-le p1, v0, :cond_b

    const-wide/16 v0, 0x0

    monitor-exit v2

    :goto_a
    return-wide v0

    :cond_b
    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    sub-int p1, v0, p1

    if-gez p1, :cond_14

    iget v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    add-int/2addr p1, v0

    :cond_14
    iget-object v0, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    aget-wide v0, v0, p1

    monitor-exit v2

    goto :goto_a

    :catchall_1a
    move-exception v0

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method setNextPeriod(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .registers 9

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->checkForSubscriberId()V

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodStart:Ljava/util/Calendar;

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodEnd:Ljava/util/Calendar;

    invoke-virtual {p2, v1}, Ljava/util/Calendar;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    const/4 v0, 0x0

    :goto_15
    invoke-direct {p0, p1}, Lcom/android/server/ThrottleService$DataRecorder;->setPeriodStart(Ljava/util/Calendar;)V

    invoke-direct {p0, p2}, Lcom/android/server/ThrottleService$DataRecorder;->setPeriodEnd(Ljava/util/Calendar;)V

    invoke-direct {p0}, Lcom/android/server/ThrottleService$DataRecorder;->record()V

    return v0

    :cond_1f
    iget-object v2, p0, Lcom/android/server/ThrottleService$DataRecorder;->mParent:Lcom/android/server/ThrottleService;

    monitor-enter v2

    :try_start_22
    iget v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    iget v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    iget v3, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodCount:I

    if-lt v1, v3, :cond_31

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    :cond_31
    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodRxData:[J

    iget v3, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    const-wide/16 v4, 0x0

    aput-wide v4, v1, v3

    iget-object v1, p0, Lcom/android/server/ThrottleService$DataRecorder;->mPeriodTxData:[J

    iget v3, p0, Lcom/android/server/ThrottleService$DataRecorder;->mCurrentPeriod:I

    const-wide/16 v4, 0x0

    aput-wide v4, v1, v3

    monitor-exit v2

    goto :goto_15

    :catchall_43
    move-exception v1

    monitor-exit v2
    :try_end_45
    .catchall {:try_start_22 .. :try_end_45} :catchall_43

    throw v1
.end method
