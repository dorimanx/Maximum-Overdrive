.class public Lcom/android/server/ProfileManagerService;
.super Landroid/app/IProfileManager$Stub;
.source "ProfileManagerService.java"


# static fields
.field public static final INTENT_ACTION_PROFILE_SELECTED:Ljava/lang/String; = "android.intent.action.PROFILE_SELECTED"

.field private static final LOCAL_LOGV:Z = false

.field public static final PERMISSION_CHANGE_SETTINGS:Ljava/lang/String; = "android.permission.WRITE_SETTINGS"

.field private static final PROFILE_FILENAME:Ljava/lang/String; = "/data/system/profiles.xml"

.field private static final TAG:Ljava/lang/String; = "ProfileService"

.field private static final mWildcardUUID:Ljava/util/UUID;


# instance fields
.field private mActiveProfile:Landroid/app/Profile;

.field private mContext:Landroid/content/Context;

.field private mDirty:Z

.field private mGroups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Landroid/app/NotificationGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mProfileNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private mProfiles:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Landroid/app/Profile;",
            ">;"
        }
    .end annotation
.end field

.field private mWildcardGroup:Landroid/app/NotificationGroup;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "a126d48a-aaef-47c4-baed-7f0e44aeffe5"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/android/server/ProfileManagerService;->mWildcardUUID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    const v4, 0x10400df

    invoke-direct {p0}, Landroid/app/IProfileManager$Stub;-><init>()V

    new-instance v1, Lcom/android/server/ProfileManagerService$1;

    invoke-direct {v1, p0}, Lcom/android/server/ProfileManagerService$1;-><init>(Lcom/android/server/ProfileManagerService;)V

    iput-object v1, p0, Lcom/android/server/ProfileManagerService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/app/NotificationGroup;

    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/android/server/ProfileManagerService;->mWildcardUUID:Ljava/util/UUID;

    invoke-direct {v1, v2, v4, v3}, Landroid/app/NotificationGroup;-><init>(Ljava/lang/String;ILjava/util/UUID;)V

    iput-object v1, p0, Lcom/android/server/ProfileManagerService;->mWildcardGroup:Landroid/app/NotificationGroup;

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->initialize()V

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$000(Lcom/android/server/ProfileManagerService;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/ProfileManagerService;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->initialize()V

    return-void
.end method

.method private addNotificationGroupInternal(Landroid/app/NotificationGroup;)V
    .registers 6

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_27

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Profile;

    const/4 v2, 0x0

    invoke-direct {p0, v1, p1, v2}, Lcom/android/server/ProfileManagerService;->ensureGroupInProfile(Landroid/app/Profile;Landroid/app/NotificationGroup;Z)V

    goto :goto_16

    :cond_27
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    return-void
.end method

.method private addProfileInternal(Landroid/app/Profile;)V
    .registers 8

    const/4 v5, 0x1

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationGroup;

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2}, Lcom/android/server/ProfileManagerService;->ensureGroupInProfile(Landroid/app/Profile;Landroid/app/NotificationGroup;Z)V

    goto :goto_b

    :cond_1c
    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mWildcardGroup:Landroid/app/NotificationGroup;

    invoke-direct {p0, p1, v2, v5}, Lcom/android/server/ProfileManagerService;->ensureGroupInProfile(Landroid/app/Profile;Landroid/app/NotificationGroup;Z)V

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-boolean v5, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    return-void
.end method

.method private enforceChangePermissions()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.WRITE_SETTINGS"

    const-string v2, "You do not have permissions to change the Profile Manager."

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private ensureGroupInProfile(Landroid/app/Profile;Landroid/app/NotificationGroup;Z)V
    .registers 10

    invoke-virtual {p2}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/app/Profile;->getProfileGroup(Ljava/util/UUID;)Landroid/app/ProfileGroup;

    move-result-object v4

    if-eqz v4, :cond_b

    :cond_a
    :goto_a
    return-void

    :cond_b
    invoke-virtual {p1}, Landroid/app/Profile;->getProfileGroups()[Landroid/app/ProfileGroup;

    move-result-object v0

    array-length v2, v0

    const/4 v1, 0x0

    :goto_11
    if-ge v1, v2, :cond_1e

    aget-object v3, v0, v1

    invoke-virtual {v3, p2, p3}, Landroid/app/ProfileGroup;->matches(Landroid/app/NotificationGroup;Z)Z

    move-result v4

    if-nez v4, :cond_a

    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_1e
    new-instance v4, Landroid/app/ProfileGroup;

    invoke-virtual {p2}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-direct {v4, v5, p3}, Landroid/app/ProfileGroup;-><init>(Ljava/util/UUID;Z)V

    invoke-virtual {p1, v4}, Landroid/app/Profile;->addProfileGroup(Landroid/app/ProfileGroup;)V

    goto :goto_a
.end method

.method private getXmlString()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<profiles>\n<active>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/server/ProfileManagerService;->getActiveProfile()Landroid/app/Profile;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "</active>\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Profile;

    iget-object v4, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0, v4}, Landroid/app/Profile;->getXmlString(Ljava/lang/StringBuilder;Landroid/content/Context;)V

    goto :goto_2c

    :cond_3e
    iget-object v4, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_48
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationGroup;

    iget-object v4, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0, v4}, Landroid/app/NotificationGroup;->getXmlString(Ljava/lang/StringBuilder;Landroid/content/Context;)V

    goto :goto_48

    :cond_5a
    const-string v4, "</profiles>\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private initialiseStructure()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10f000c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    :try_start_d
    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0, v1}, Lcom/android/server/ProfileManagerService;->loadXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/Context;)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V
    :try_end_18
    .catchall {:try_start_d .. :try_end_18} :catchall_1c

    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    return-void

    :catchall_1c
    move-exception v1

    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    throw v1
.end method

.method private initialize()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/ProfileManagerService;->initialize(Z)V

    return-void
.end method

.method private initialize(Z)V
    .registers 7

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    move v2, p1

    if-nez p1, :cond_1e

    :try_start_1b
    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->loadFromFile()V
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_1e} :catch_24
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1b .. :try_end_1e} :catch_29
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1e} :catch_2c

    :cond_1e
    :goto_1e
    if-eqz v2, :cond_23

    :try_start_20
    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->initialiseStructure()V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_23} :catch_2f

    :cond_23
    :goto_23
    return-void

    :catch_24
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1e

    :catch_29
    move-exception v0

    const/4 v2, 0x1

    goto :goto_1e

    :catch_2c
    move-exception v0

    const/4 v2, 0x1

    goto :goto_1e

    :catch_2f
    move-exception v1

    const-string v3, "ProfileService"

    const-string v4, "Error loading xml from resource: "

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_23
.end method

.method private loadFromFile()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v2

    invoke-virtual {v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    new-instance v0, Ljava/io/FileReader;

    const-string v3, "/data/system/profiles.xml"

    invoke-direct {v0, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    iget-object v3, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1, v3}, Lcom/android/server/ProfileManagerService;->loadXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/io/FileReader;->close()V

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    return-void
.end method

.method private loadXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/Context;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v10, 0x1

    const/4 v9, 0x0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v0, 0x0

    :goto_7
    const/4 v6, 0x3

    if-ne v2, v6, :cond_16

    const-string v6, "profiles"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7a

    :cond_16
    const/4 v6, 0x2

    if-ne v2, v6, :cond_70

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "active"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_46

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    const-string v6, "ProfileService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Found active: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_41
    :goto_41
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_7

    :cond_46
    const-string v6, "profile"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_60

    invoke-static {p1, p2}, Landroid/app/Profile;->fromXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/Context;)Landroid/app/Profile;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/server/ProfileManagerService;->addProfileInternal(Landroid/app/Profile;)V

    if-nez v0, :cond_41

    invoke-virtual {v5}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_41

    :cond_60
    const-string v6, "notificationGroup"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_41

    invoke-static {p1, p2}, Landroid/app/NotificationGroup;->fromXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/Context;)Landroid/app/NotificationGroup;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/server/ProfileManagerService;->addNotificationGroupInternal(Landroid/app/NotificationGroup;)V

    goto :goto_41

    :cond_70
    if-ne v2, v10, :cond_41

    new-instance v6, Ljava/io/IOException;

    const-string v7, "Premature end of file while reading /data/system/profiles.xml"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_7a
    :try_start_7a
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {p0, v6, v7}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Ljava/util/UUID;Z)Z
    :try_end_82
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7a .. :try_end_82} :catch_83

    :goto_82
    return-void

    :catch_83
    move-exception v1

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9a

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/UUID;

    invoke-direct {p0, v6, v9}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Ljava/util/UUID;Z)Z

    :goto_97
    iput-boolean v10, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    goto :goto_82

    :cond_9a
    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/Profile;

    invoke-direct {p0, v6, v9}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Landroid/app/Profile;Z)Z

    goto :goto_97
.end method

.method private declared-synchronized persistIfDirty()V
    .registers 9

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    if-nez v0, :cond_22

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_22

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/Profile;

    invoke-virtual {v5}, Landroid/app/Profile;->isDirty()Z

    move-result v6

    if-eqz v6, :cond_f

    const/4 v0, 0x1

    :cond_22
    if-nez v0, :cond_41

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_41

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationGroup;

    invoke-virtual {v3}, Landroid/app/NotificationGroup;->isDirty()Z
    :try_end_3d
    .catchall {:try_start_1 .. :try_end_3d} :catchall_6c

    move-result v6

    if-eqz v6, :cond_2e

    const/4 v0, 0x1

    :cond_41
    if-eqz v0, :cond_65

    :try_start_43
    const-string v6, "ProfileService"

    const-string v7, "Saving profile data..."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/io/FileWriter;

    const-string v6, "/data/system/profiles.xml"

    invoke-direct {v2, v6}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->getXmlString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V

    const-string v6, "ProfileService"

    const-string v7, "Save completed."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z
    :try_end_65
    .catchall {:try_start_43 .. :try_end_65} :catchall_6c
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_65} :catch_67

    :cond_65
    :goto_65
    monitor-exit p0

    return-void

    :catch_67
    move-exception v1

    :try_start_68
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_6b
    .catchall {:try_start_68 .. :try_end_6b} :catchall_6c

    goto :goto_65

    :catchall_6c
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method private setActiveProfile(Landroid/app/Profile;Z)Z
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v5, 0x1

    :try_start_1
    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    const-string v6, "ProfileService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Set active profile to: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    iput-object p1, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    if-eqz p2, :cond_88

    invoke-static {}, Lcom/android/server/ProfileManagerService;->clearCallingIdentity()J

    move-result-wide v3

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    iget-object v7, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v7}, Landroid/app/Profile;->doSelect(Landroid/content/Context;)V

    new-instance v0, Landroid/content/Intent;

    const-string v6, "android.intent.action.PROFILE_SELECTED"

    invoke-direct {v0, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v6, "name"

    iget-object v7, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    invoke-virtual {v7}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v6, "uuid"

    iget-object v7, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    invoke-virtual {v7}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v6, "lastName"

    invoke-virtual {v2}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v6, "lastUuid"

    invoke-virtual {v2}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    invoke-static {v3, v4}, Lcom/android/server/ProfileManagerService;->restoreCallingIdentity(J)V

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_88} :catch_89

    :cond_88
    :goto_88
    return v5

    :catch_89
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v5, 0x0

    goto :goto_88
.end method

.method private setActiveProfile(Ljava/util/UUID;Z)Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Profile;

    invoke-direct {p0, v0, p2}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Landroid/app/Profile;Z)Z

    move-result v0

    :goto_14
    return v0

    :cond_15
    const-string v0, "ProfileService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot set active profile to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    goto :goto_14
.end method


# virtual methods
.method public addNotificationGroup(Landroid/app/NotificationGroup;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    invoke-direct {p0, p1}, Lcom/android/server/ProfileManagerService;->addNotificationGroupInternal(Landroid/app/NotificationGroup;)V

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    return-void
.end method

.method public addProfile(Landroid/app/Profile;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    invoke-direct {p0, p1}, Lcom/android/server/ProfileManagerService;->addProfileInternal(Landroid/app/Profile;)V

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    const/4 v0, 0x1

    return v0
.end method

.method public getActiveProfile()Landroid/app/Profile;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    return-object v0
.end method

.method public getNotificationGroup(Landroid/os/ParcelUuid;)Landroid/app/NotificationGroup;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mWildcardGroup:Landroid/app/NotificationGroup;

    invoke-virtual {v1}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mWildcardGroup:Landroid/app/NotificationGroup;

    :goto_12
    return-object v0

    :cond_13
    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationGroup;

    goto :goto_12
.end method

.method public getNotificationGroupForPackage(Ljava/lang/String;)Landroid/app/NotificationGroup;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationGroup;

    invoke-virtual {v0, p1}, Landroid/app/NotificationGroup;->hasPackage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    :goto_1c
    return-object v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public getNotificationGroups()[Landroid/app/NotificationGroup;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    new-array v1, v1, [Landroid/app/NotificationGroup;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/app/NotificationGroup;

    return-object v0
.end method

.method public getProfile(Landroid/os/ParcelUuid;)Landroid/app/Profile;
    .registers 4

    invoke-virtual {p1}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/server/ProfileManagerService;->getProfile(Ljava/util/UUID;)Landroid/app/Profile;

    move-result-object v1

    return-object v1
.end method

.method public getProfile(Ljava/util/UUID;)Landroid/app/Profile;
    .registers 9

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/Profile;

    :goto_10
    return-object v6

    :cond_11
    iget-object v6, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/Profile;

    invoke-virtual {v4}, Landroid/app/Profile;->getSecondaryUuids()[Ljava/util/UUID;

    move-result-object v0

    array-length v3, v0

    const/4 v2, 0x0

    :goto_2d
    if-ge v2, v3, :cond_1b

    aget-object v5, v0, v2

    invoke-virtual {p1, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39

    move-object v6, v4

    goto :goto_10

    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    :cond_3c
    const/4 v6, 0x0

    goto :goto_10
.end method

.method public getProfileByName(Ljava/lang/String;)Landroid/app/Profile;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Profile;

    :goto_16
    return-object v0

    :cond_17
    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-static {p1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-static {p1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Profile;

    goto :goto_16

    :cond_30
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public getProfiles()[Landroid/app/Profile;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Landroid/app/Profile;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/app/Profile;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    return-object v0
.end method

.method public notificationGroupExistsByName(Ljava/lang/String;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationGroup;

    invoke-virtual {v0}, Landroid/app/NotificationGroup;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v2, 0x1

    :goto_21
    return v2

    :cond_22
    const/4 v2, 0x0

    goto :goto_21
.end method

.method public profileExists(Landroid/os/ParcelUuid;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public profileExistsByName(Ljava/lang/String;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v2, 0x1

    :goto_23
    return v2

    :cond_24
    const/4 v2, 0x0

    goto :goto_23
.end method

.method public removeNotificationGroup(Landroid/app/NotificationGroup;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    iget-boolean v3, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_33

    const/4 v2, 0x1

    :goto_12
    or-int/2addr v2, v3

    iput-boolean v2, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    iget-object v2, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Profile;

    invoke-virtual {p1}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/Profile;->removeProfileGroup(Ljava/util/UUID;)V

    goto :goto_1f

    :cond_33
    const/4 v2, 0x0

    goto :goto_12

    :cond_35
    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    return-void
.end method

.method public removeProfile(Landroid/app/Profile;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_22

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_22

    iput-boolean v0, p0, Lcom/android/server/ProfileManagerService;->mDirty:Z

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public resetAll()V
    .registers 2

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/ProfileManagerService;->initialize(Z)V

    return-void
.end method

.method public setActiveProfile(Landroid/os/ParcelUuid;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-virtual {p1}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Profile;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Landroid/app/Profile;Z)Z

    move-result v1

    :goto_19
    return v1

    :cond_1a
    const-string v1, "ProfileService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot set active profile to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - does not exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    goto :goto_19
.end method

.method public setActiveProfileByName(Ljava/lang/String;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Profile;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Landroid/app/Profile;Z)Z

    move-result v0

    :goto_1b
    return v0

    :cond_1c
    const-string v0, "ProfileService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to find profile to set active, based on string: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    goto :goto_1b
.end method

.method public updateNotificationGroup(Landroid/app/NotificationGroup;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationGroup;

    if-eqz v0, :cond_1d

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mGroups:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/NotificationGroup;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    :cond_1d
    return-void
.end method

.method public updateProfile(Landroid/app/Profile;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->enforceChangePermissions()V

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Profile;

    if-eqz v0, :cond_4b

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfileNames:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mProfiles:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/android/server/ProfileManagerService;->persistIfDirty()V

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    if-eqz v1, :cond_4b

    iget-object v1, p0, Lcom/android/server/ProfileManagerService;->mActiveProfile:Landroid/app/Profile;

    invoke-virtual {v1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Lcom/android/server/ProfileManagerService;->setActiveProfile(Landroid/app/Profile;Z)Z

    :cond_4b
    return-void
.end method
