.class public Lcom/android/server/pm/UserManager;
.super Ljava/lang/Object;
.source "UserManager.java"


# static fields
.field private static final ATTR_FLAGS:Ljava/lang/String; = "flags"

.field private static final ATTR_ID:Ljava/lang/String; = "id"

.field private static final LOG_TAG:Ljava/lang/String; = "UserManager"

.field private static final TAG_NAME:Ljava/lang/String; = "name"

.field private static final TAG_USER:Ljava/lang/String; = "user"

.field private static final TAG_USERS:Ljava/lang/String; = "users"

.field private static final USER_INFO_DIR:Ljava/lang/String; = null

.field private static final USER_LIST_FILENAME:Ljava/lang/String; = "userlist.xml"


# instance fields
.field private mBaseUserPath:Ljava/io/File;

.field private mInstaller:Lcom/android/server/pm/Installer;

.field private mUserIds:[I

.field private final mUserListFile:Ljava/io/File;

.field private mUsers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/content/pm/UserInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mUsersDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "system"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "users"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/UserManager;->USER_INFO_DIR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/server/pm/Installer;Ljava/io/File;)V
    .registers 4

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/android/server/pm/UserManager;-><init>(Ljava/io/File;Ljava/io/File;)V

    iput-object p1, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    return-void
.end method

.method constructor <init>(Ljava/io/File;Ljava/io/File;)V
    .registers 7

    const/4 v3, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/android/server/pm/UserManager;->USER_INFO_DIR:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    const-string v2, "0"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    iput-object p2, p0, Lcom/android/server/pm/UserManager;->mBaseUserPath:Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1fd

    invoke-static {v1, v2, v3, v3}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    const-string v3, "userlist.xml"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/pm/UserManager;->mUserListFile:Ljava/io/File;

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->readUserList()V

    return-void
.end method

.method private createPackageFolders(ILjava/io/File;)Z
    .registers 8

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x1

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    if-nez v0, :cond_8

    :goto_7
    return v4

    :cond_8
    invoke-virtual {p2}, Ljava/io/File;->mkdir()Z

    invoke-virtual {p2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1f9

    invoke-static {v0, v1, v2, v2}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    invoke-virtual {v0, v3, p1, v3}, Lcom/android/server/pm/Installer;->cloneUserData(IIZ)I

    goto :goto_7
.end method

.method private fallbackToSingleUserLocked()V
    .registers 5

    const/4 v3, 0x0

    new-instance v0, Landroid/content/pm/UserInfo;

    const-string v1, "Primary"

    const/4 v2, 0x3

    invoke-direct {v0, v3, v1, v2}, Landroid/content/pm/UserInfo;-><init>(ILjava/lang/String;I)V

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->updateUserIdsLocked()V

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->writeUserListLocked()V

    invoke-direct {p0, v0}, Lcom/android/server/pm/UserManager;->writeUserLocked(Landroid/content/pm/UserInfo;)V

    return-void
.end method

.method private getNextAvailableId()I
    .registers 3

    const/4 v0, 0x0

    :goto_1
    const v1, 0x7fffffff

    if-ge v0, v1, :cond_e

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    if-gez v1, :cond_f

    :cond_e
    return v0

    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private readUser(I)Landroid/content/pm/UserInfo;
    .registers 15

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v0, 0x0

    :try_start_3
    new-instance v8, Ljava/io/File;

    iget-object v10, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".xml"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_c1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_26} :catch_c8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_26} :catch_d2

    :try_start_26
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v5

    const/4 v10, 0x0

    invoke-interface {v5, v1, v10}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    :cond_2e
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    const/4 v10, 0x2

    if-eq v7, v10, :cond_38

    const/4 v10, 0x1

    if-ne v7, v10, :cond_2e

    :cond_38
    const/4 v10, 0x2

    if-eq v7, v10, :cond_5b

    const-string v10, "UserManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unable to read user "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_53
    .catchall {:try_start_26 .. :try_end_53} :catchall_e2
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_53} :catch_e8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_26 .. :try_end_53} :catch_e5

    const/4 v9, 0x0

    if-eqz v1, :cond_59

    :try_start_56
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_59} :catch_db

    :cond_59
    :goto_59
    move-object v0, v1

    :goto_5a
    return-object v9

    :cond_5b
    const/4 v10, 0x2

    if-ne v7, v10, :cond_b5

    :try_start_5e
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "user"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b5

    const/4 v10, 0x0

    const-string v11, "id"

    invoke-interface {v5, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    if-eq v10, p1, :cond_86

    const-string v10, "UserManager"

    const-string v11, "User id does not match the file name"

    invoke-static {v10, v11}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7e
    .catchall {:try_start_5e .. :try_end_7e} :catchall_e2
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_7e} :catch_e8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5e .. :try_end_7e} :catch_e5

    const/4 v9, 0x0

    if-eqz v1, :cond_84

    :try_start_81
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_de

    :cond_84
    :goto_84
    move-object v0, v1

    goto :goto_5a

    :cond_86
    const/4 v10, 0x0

    :try_start_87
    const-string v11, "flags"

    invoke-interface {v5, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :cond_91
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    const/4 v10, 0x2

    if-eq v7, v10, :cond_9b

    const/4 v10, 0x1

    if-ne v7, v10, :cond_91

    :cond_9b
    const/4 v10, 0x2

    if-ne v7, v10, :cond_b5

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "name"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b5

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    const/4 v10, 0x4

    if-ne v7, v10, :cond_b5

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v4

    :cond_b5
    new-instance v9, Landroid/content/pm/UserInfo;

    invoke-direct {v9, p1, v4, v3}, Landroid/content/pm/UserInfo;-><init>(ILjava/lang/String;I)V
    :try_end_ba
    .catchall {:try_start_87 .. :try_end_ba} :catchall_e2
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_ba} :catch_e8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_87 .. :try_end_ba} :catch_e5

    if-eqz v1, :cond_bf

    :try_start_bc
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_bf
    .catch Ljava/io/IOException; {:try_start_bc .. :try_end_bf} :catch_e0

    :cond_bf
    :goto_bf
    move-object v0, v1

    goto :goto_5a

    :catchall_c1
    move-exception v10

    :goto_c2
    if-eqz v0, :cond_c7

    :try_start_c4
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_c4 .. :try_end_c7} :catch_d9

    :cond_c7
    :goto_c7
    throw v10

    :catch_c8
    move-exception v10

    :goto_c9
    if-eqz v0, :cond_ce

    :try_start_cb
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    :cond_ce
    :goto_ce
    const/4 v9, 0x0

    goto :goto_5a

    :catch_d0
    move-exception v10

    goto :goto_ce

    :catch_d2
    move-exception v10

    :goto_d3
    if-eqz v0, :cond_ce

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_d8
    .catch Ljava/io/IOException; {:try_start_cb .. :try_end_d8} :catch_d0

    goto :goto_ce

    :catch_d9
    move-exception v11

    goto :goto_c7

    :catch_db
    move-exception v10

    goto/16 :goto_59

    :catch_de
    move-exception v10

    goto :goto_84

    :catch_e0
    move-exception v10

    goto :goto_bf

    :catchall_e2
    move-exception v10

    move-object v0, v1

    goto :goto_c2

    :catch_e5
    move-exception v10

    move-object v0, v1

    goto :goto_d3

    :catch_e8
    move-exception v10

    move-object v0, v1

    goto :goto_c9
.end method

.method private readUserList()V
    .registers 3

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v1

    :try_start_3
    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->readUserListLocked()V

    monitor-exit v1

    return-void

    :catchall_8
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8

    throw v0
.end method

.method private readUserListLocked()V
    .registers 13

    const/4 v11, 0x1

    const/4 v10, 0x2

    iget-object v8, p0, Lcom/android/server/pm/UserManager;->mUserListFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_e

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->fallbackToSingleUserLocked()V

    :cond_d
    :goto_d
    return-void

    :cond_e
    const/4 v0, 0x0

    :try_start_f
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v8, p0, Lcom/android/server/pm/UserManager;->mUserListFile:Ljava/io/File;

    invoke-direct {v1, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_16
    .catchall {:try_start_f .. :try_end_16} :catchall_86
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_16} :catch_97
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f .. :try_end_16} :catch_7c

    :try_start_16
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    const/4 v8, 0x0

    invoke-interface {v4, v1, v8}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    :cond_1e
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    if-eq v6, v10, :cond_26

    if-ne v6, v11, :cond_1e

    :cond_26
    if-eq v6, v10, :cond_3a

    const-string v8, "UserManager"

    const-string v9, "Unable to read user list"

    invoke-static {v8, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->fallbackToSingleUserLocked()V
    :try_end_32
    .catchall {:try_start_16 .. :try_end_32} :catchall_91
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_32} :catch_67
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_16 .. :try_end_32} :catch_94

    if-eqz v1, :cond_d

    :try_start_34
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_37} :catch_38

    goto :goto_d

    :catch_38
    move-exception v8

    goto :goto_d

    :cond_3a
    :goto_3a
    :try_start_3a
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    if-eq v6, v11, :cond_72

    if-ne v6, v10, :cond_3a

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "user"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3a

    const/4 v8, 0x0

    const-string v9, "id"

    invoke-interface {v4, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-direct {p0, v8}, Lcom/android/server/pm/UserManager;->readUser(I)Landroid/content/pm/UserInfo;

    move-result-object v7

    if-eqz v7, :cond_3a

    iget-object v8, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    iget v9, v7, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v8, v9, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_66
    .catchall {:try_start_3a .. :try_end_66} :catchall_91
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_66} :catch_67
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3a .. :try_end_66} :catch_94

    goto :goto_3a

    :catch_67
    move-exception v3

    move-object v0, v1

    :goto_69
    :try_start_69
    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->fallbackToSingleUserLocked()V
    :try_end_6c
    .catchall {:try_start_69 .. :try_end_6c} :catchall_86

    if-eqz v0, :cond_d

    :try_start_6e
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_38

    goto :goto_d

    :cond_72
    :try_start_72
    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->updateUserIdsLocked()V
    :try_end_75
    .catchall {:try_start_72 .. :try_end_75} :catchall_91
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_67
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_72 .. :try_end_75} :catch_94

    if-eqz v1, :cond_7a

    :try_start_77
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_7a
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_7a} :catch_8f

    :cond_7a
    :goto_7a
    move-object v0, v1

    goto :goto_d

    :catch_7c
    move-exception v5

    :goto_7d
    :try_start_7d
    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->fallbackToSingleUserLocked()V
    :try_end_80
    .catchall {:try_start_7d .. :try_end_80} :catchall_86

    if-eqz v0, :cond_d

    :try_start_82
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_82 .. :try_end_85} :catch_38

    goto :goto_d

    :catchall_86
    move-exception v8

    :goto_87
    if-eqz v0, :cond_8c

    :try_start_89
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_8c
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_8c} :catch_8d

    :cond_8c
    :goto_8c
    throw v8

    :catch_8d
    move-exception v9

    goto :goto_8c

    :catch_8f
    move-exception v8

    goto :goto_7a

    :catchall_91
    move-exception v8

    move-object v0, v1

    goto :goto_87

    :catch_94
    move-exception v5

    move-object v0, v1

    goto :goto_7d

    :catch_97
    move-exception v3

    goto :goto_69
.end method

.method private removeUserLocked(I)Z
    .registers 7

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/UserInfo;

    if-eqz v1, :cond_34

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->writeUserListLocked()V

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->updateUserIdsLocked()V

    const/4 v2, 0x1

    :goto_33
    return v2

    :cond_34
    const/4 v2, 0x0

    goto :goto_33
.end method

.method private updateUserIdsLocked()V
    .registers 4

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    array-length v1, v1

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-eq v1, v2, :cond_19

    :cond_f
    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2f

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2f
    return-void
.end method

.method private writeUserListLocked()V
    .registers 11

    const/4 v1, 0x0

    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v7, p0, Lcom/android/server/pm/UserManager;->mUserListFile:Ljava/io/File;

    invoke-direct {v2, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_78
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_8} :catch_68

    :try_start_8
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v5, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v5}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    const-string v7, "utf-8"

    invoke-interface {v5, v0, v7}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v7, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v8, 0x1

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    const/4 v7, 0x0

    const-string v8, "users"

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v3, 0x0

    :goto_2d
    iget-object v7, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v7

    if-ge v3, v7, :cond_58

    iget-object v7, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v7, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/UserInfo;

    const/4 v7, 0x0

    const-string v8, "user"

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v7, 0x0

    const-string v8, "id"

    iget v9, v6, Landroid/content/pm/UserInfo;->id:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v7, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v7, 0x0

    const-string v8, "user"

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2d

    :cond_58
    const/4 v7, 0x0

    const-string v8, "users"

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_61
    .catchall {:try_start_8 .. :try_end_61} :catchall_83
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_61} :catch_86

    if-eqz v2, :cond_66

    :try_start_63
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_66} :catch_81

    :cond_66
    :goto_66
    move-object v1, v2

    :cond_67
    :goto_67
    return-void

    :catch_68
    move-exception v4

    :goto_69
    :try_start_69
    const-string v7, "UserManager"

    const-string v8, "Error writing user list"

    invoke-static {v7, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_70
    .catchall {:try_start_69 .. :try_end_70} :catchall_78

    if-eqz v1, :cond_67

    :try_start_72
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_76

    goto :goto_67

    :catch_76
    move-exception v7

    goto :goto_67

    :catchall_78
    move-exception v7

    :goto_79
    if-eqz v1, :cond_7e

    :try_start_7b
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7e
    .catch Ljava/io/IOException; {:try_start_7b .. :try_end_7e} :catch_7f

    :cond_7e
    :goto_7e
    throw v7

    :catch_7f
    move-exception v8

    goto :goto_7e

    :catch_81
    move-exception v7

    goto :goto_66

    :catchall_83
    move-exception v7

    move-object v1, v2

    goto :goto_79

    :catch_86
    move-exception v4

    move-object v1, v2

    goto :goto_69
.end method

.method private writeUserLocked(Landroid/content/pm/UserInfo;)V
    .registers 11

    const/4 v1, 0x0

    :try_start_1
    new-instance v4, Ljava/io/File;

    iget-object v6, p0, Lcom/android/server/pm/UserManager;->mUsersDir:Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v8, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".xml"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_22
    .catchall {:try_start_1 .. :try_end_22} :catchall_ac
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_22} :catch_7f

    :try_start_22
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v5, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v5}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    const-string v6, "utf-8"

    invoke-interface {v5, v0, v6}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v6, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v7, 0x1

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    const/4 v6, 0x0

    const-string v7, "user"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v6, 0x0

    const-string v7, "id"

    iget v8, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v6, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v6, 0x0

    const-string v7, "flags"

    iget v8, p1, Landroid/content/pm/UserInfo;->flags:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v6, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v6, 0x0

    const-string v7, "name"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v6, p1, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v6, 0x0

    const-string v7, "name"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const/4 v6, 0x0

    const-string v7, "user"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_78
    .catchall {:try_start_22 .. :try_end_78} :catchall_b7
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_78} :catch_ba

    if-eqz v2, :cond_7d

    :try_start_7a
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_7d} :catch_b5

    :cond_7d
    :goto_7d
    move-object v1, v2

    :cond_7e
    :goto_7e
    return-void

    :catch_7f
    move-exception v3

    :goto_80
    :try_start_80
    const-string v6, "UserManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error writing user info "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a4
    .catchall {:try_start_80 .. :try_end_a4} :catchall_ac

    if-eqz v1, :cond_7e

    :try_start_a6
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a6 .. :try_end_a9} :catch_aa

    goto :goto_7e

    :catch_aa
    move-exception v6

    goto :goto_7e

    :catchall_ac
    move-exception v6

    :goto_ad
    if-eqz v1, :cond_b2

    :try_start_af
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_b2
    .catch Ljava/io/IOException; {:try_start_af .. :try_end_b2} :catch_b3

    :cond_b2
    :goto_b2
    throw v6

    :catch_b3
    move-exception v7

    goto :goto_b2

    :catch_b5
    move-exception v6

    goto :goto_7d

    :catchall_b7
    move-exception v6

    move-object v1, v2

    goto :goto_ad

    :catch_ba
    move-exception v3

    move-object v1, v2

    goto :goto_80
.end method


# virtual methods
.method public clearUserDataForAllUsers(Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    array-length v2, v0

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v2, :cond_13

    aget v3, v0, v1

    if-nez v3, :cond_d

    :goto_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_d
    iget-object v4, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    invoke-virtual {v4, p1, v3}, Lcom/android/server/pm/Installer;->clearUserData(Ljava/lang/String;I)I

    goto :goto_a

    :cond_13
    return-void
.end method

.method public createUser(Ljava/lang/String;I)Landroid/content/pm/UserInfo;
    .registers 8

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->getNextAvailableId()I

    move-result v0

    new-instance v1, Landroid/content/pm/UserInfo;

    invoke-direct {v1, v0, p1, p2}, Landroid/content/pm/UserInfo;-><init>(ILjava/lang/String;I)V

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/android/server/pm/UserManager;->mBaseUserPath:Ljava/io/File;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v0, v2}, Lcom/android/server/pm/UserManager;->createPackageFolders(ILjava/io/File;)Z

    move-result v3

    if-nez v3, :cond_1c

    const/4 v1, 0x0

    :goto_1b
    return-object v1

    :cond_1c
    iget-object v4, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v4

    :try_start_1f
    iget-object v3, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v3, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->writeUserListLocked()V

    invoke-direct {p0, v1}, Lcom/android/server/pm/UserManager;->writeUserLocked(Landroid/content/pm/UserInfo;)V

    invoke-direct {p0}, Lcom/android/server/pm/UserManager;->updateUserIdsLocked()V

    monitor-exit v4

    goto :goto_1b

    :catchall_2f
    move-exception v3

    monitor-exit v4
    :try_end_31
    .catchall {:try_start_1f .. :try_end_31} :catchall_2f

    throw v3
.end method

.method public exists(I)Z
    .registers 4

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    invoke-static {v0, p1}, Lcom/android/internal/util/ArrayUtils;->contains([II)Z

    move-result v0

    monitor-exit v1

    return v0

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public getUser(I)Landroid/content/pm/UserInfo;
    .registers 5

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v2

    :try_start_3
    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/UserInfo;

    monitor-exit v2

    return-object v0

    :catchall_d
    move-exception v1

    monitor-exit v2
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v1
.end method

.method getUserIds()[I
    .registers 2

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    return-object v0
.end method

.method public getUsers()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/UserInfo;",
            ">;"
        }
    .end annotation

    iget-object v3, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v3

    :try_start_3
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v0, 0x0

    :goto_f
    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_23

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_23
    monitor-exit v3

    return-object v1

    :catchall_25
    move-exception v2

    monitor-exit v3
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v2
.end method

.method public installPackageForAllUsers(Ljava/lang/String;I)V
    .registers 9

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    array-length v2, v0

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v2, :cond_17

    aget v3, v0, v1

    if-nez v3, :cond_d

    :goto_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_d
    iget-object v4, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    invoke-static {v3, p2}, Landroid/os/UserId;->getUid(II)I

    move-result v5

    invoke-virtual {v4, p1, v5, v3}, Lcom/android/server/pm/Installer;->createUserData(Ljava/lang/String;II)I

    goto :goto_a

    :cond_17
    return-void
.end method

.method removePackageFolders(I)Z
    .registers 4

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    if-nez v0, :cond_6

    :goto_5
    return v1

    :cond_6
    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    invoke-virtual {v0, p1}, Lcom/android/server/pm/Installer;->removeUserDataDirs(I)I

    goto :goto_5
.end method

.method public removePackageForAllUsers(Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lcom/android/server/pm/UserManager;->mUserIds:[I

    array-length v2, v0

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v2, :cond_13

    aget v3, v0, v1

    if-nez v3, :cond_d

    :goto_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_d
    iget-object v4, p0, Lcom/android/server/pm/UserManager;->mInstaller:Lcom/android/server/pm/Installer;

    invoke-virtual {v4, p1, v3}, Lcom/android/server/pm/Installer;->remove(Ljava/lang/String;I)I

    goto :goto_a

    :cond_13
    return-void
.end method

.method public removeUser(I)Z
    .registers 4

    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v1

    :try_start_3
    invoke-direct {p0, p1}, Lcom/android/server/pm/UserManager;->removeUserLocked(I)Z

    move-result v0

    monitor-exit v1

    return v0

    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public updateUserName(ILjava/lang/String;)V
    .registers 6

    iget-object v2, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    monitor-enter v2

    :try_start_3
    iget-object v1, p0, Lcom/android/server/pm/UserManager;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/UserInfo;

    if-eqz p2, :cond_1a

    iget-object v1, v0, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    iput-object p2, v0, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/pm/UserManager;->writeUserLocked(Landroid/content/pm/UserInfo;)V

    :cond_1a
    monitor-exit v2

    return-void

    :catchall_1c
    move-exception v1

    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v1
.end method
