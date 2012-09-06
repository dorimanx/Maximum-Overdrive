.class Lcom/android/server/pm/PackageSettingBase;
.super Lcom/android/server/pm/GrantedPermissions;
.source "PackageSettingBase.java"


# static fields
.field static final PKG_INSTALL_COMPLETE:I = 0x1

.field static final PKG_INSTALL_INCOMPLETE:I


# instance fields
.field codePath:Ljava/io/File;

.field codePathString:Ljava/lang/String;

.field private disabledComponents:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private enabled:Landroid/util/SparseIntArray;

.field private enabledComponents:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field firstInstallTime:J

.field haveGids:Z

.field installStatus:I

.field installerPackageName:Ljava/lang/String;

.field lastUpdateTime:J

.field final name:Ljava/lang/String;

.field nativeLibraryPathString:Ljava/lang/String;

.field private notLaunched:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field origPackage:Lcom/android/server/pm/PackageSettingBase;

.field permissionsFixed:Z

.field final realName:Ljava/lang/String;

.field resourcePath:Ljava/io/File;

.field resourcePathString:Ljava/lang/String;

.field signatures:Lcom/android/server/pm/PackageSignatures;

.field private stopped:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field timeStamp:J

.field uidError:Z

.field versionCode:I


# direct methods
.method constructor <init>(Lcom/android/server/pm/PackageSettingBase;)V
    .registers 4

    invoke-direct {p0, p1}, Lcom/android/server/pm/GrantedPermissions;-><init>(Lcom/android/server/pm/GrantedPermissions;)V

    new-instance v0, Lcom/android/server/pm/PackageSignatures;

    invoke-direct {v0}, Lcom/android/server/pm/PackageSignatures;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->name:Ljava/lang/String;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->realName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->realName:Ljava/lang/String;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->codePath:Ljava/io/File;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->codePath:Ljava/io/File;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->codePathString:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->codePathString:Ljava/lang/String;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->resourcePath:Ljava/io/File;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->resourcePath:Ljava/io/File;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->resourcePathString:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->resourcePathString:Ljava/lang/String;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->nativeLibraryPathString:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->nativeLibraryPathString:Ljava/lang/String;

    iget-wide v0, p1, Lcom/android/server/pm/PackageSettingBase;->timeStamp:J

    iput-wide v0, p0, Lcom/android/server/pm/PackageSettingBase;->timeStamp:J

    iget-wide v0, p1, Lcom/android/server/pm/PackageSettingBase;->firstInstallTime:J

    iput-wide v0, p0, Lcom/android/server/pm/PackageSettingBase;->firstInstallTime:J

    iget-wide v0, p1, Lcom/android/server/pm/PackageSettingBase;->lastUpdateTime:J

    iput-wide v0, p0, Lcom/android/server/pm/PackageSettingBase;->lastUpdateTime:J

    iget v0, p1, Lcom/android/server/pm/PackageSettingBase;->versionCode:I

    iput v0, p0, Lcom/android/server/pm/PackageSettingBase;->versionCode:I

    iget-boolean v0, p1, Lcom/android/server/pm/PackageSettingBase;->uidError:Z

    iput-boolean v0, p0, Lcom/android/server/pm/PackageSettingBase;->uidError:Z

    new-instance v0, Lcom/android/server/pm/PackageSignatures;

    iget-object v1, p1, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    invoke-direct {v0, v1}, Lcom/android/server/pm/PackageSignatures;-><init>(Lcom/android/server/pm/PackageSignatures;)V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-boolean v0, p1, Lcom/android/server/pm/PackageSettingBase;->permissionsFixed:Z

    iput-boolean v0, p0, Lcom/android/server/pm/PackageSettingBase;->permissionsFixed:Z

    iget-boolean v0, p1, Lcom/android/server/pm/PackageSettingBase;->haveGids:Z

    iput-boolean v0, p0, Lcom/android/server/pm/PackageSettingBase;->haveGids:Z

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clone()Landroid/util/SparseIntArray;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    iget v0, p1, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    iput v0, p0, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->origPackage:Lcom/android/server/pm/PackageSettingBase;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->origPackage:Lcom/android/server/pm/PackageSettingBase;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->installerPackageName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->installerPackageName:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/io/File;Ljava/lang/String;II)V
    .registers 9

    invoke-direct {p0, p7}, Lcom/android/server/pm/GrantedPermissions;-><init>(I)V

    new-instance v0, Lcom/android/server/pm/PackageSignatures;

    invoke-direct {v0}, Lcom/android/server/pm/PackageSignatures;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    iput-object p1, p0, Lcom/android/server/pm/PackageSettingBase;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/server/pm/PackageSettingBase;->realName:Ljava/lang/String;

    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/android/server/pm/PackageSettingBase;->init(Ljava/io/File;Ljava/io/File;Ljava/lang/String;I)V

    return-void
.end method

.method private getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;>;I)",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-nez v0, :cond_11

    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {p1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_11
    return-object v0
.end method


# virtual methods
.method addDisabledComponent(Ljava/lang/String;I)V
    .registers 5

    iget-object v1, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v1, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addEnabledComponent(Ljava/lang/String;I)V
    .registers 5

    iget-object v1, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v1, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public copyFrom(Lcom/android/server/pm/PackageSettingBase;)V
    .registers 4

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->grantedPermissions:Ljava/util/HashSet;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->grantedPermissions:Ljava/util/HashSet;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->gids:[I

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->gids:[I

    iget-wide v0, p1, Lcom/android/server/pm/PackageSettingBase;->timeStamp:J

    iput-wide v0, p0, Lcom/android/server/pm/PackageSettingBase;->timeStamp:J

    iget-wide v0, p1, Lcom/android/server/pm/PackageSettingBase;->firstInstallTime:J

    iput-wide v0, p0, Lcom/android/server/pm/PackageSettingBase;->firstInstallTime:J

    iget-wide v0, p1, Lcom/android/server/pm/PackageSettingBase;->lastUpdateTime:J

    iput-wide v0, p0, Lcom/android/server/pm/PackageSettingBase;->lastUpdateTime:J

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-boolean v0, p1, Lcom/android/server/pm/PackageSettingBase;->permissionsFixed:Z

    iput-boolean v0, p0, Lcom/android/server/pm/PackageSettingBase;->permissionsFixed:Z

    iget-boolean v0, p1, Lcom/android/server/pm/PackageSettingBase;->haveGids:Z

    iput-boolean v0, p0, Lcom/android/server/pm/PackageSettingBase;->haveGids:Z

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    iget-object v0, p1, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    iget v0, p1, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    iput v0, p0, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    return-void
.end method

.method disableComponentLPw(Ljava/lang/String;I)Z
    .registers 7

    iget-object v3, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v3, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v1

    iget-object v3, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v3, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v0, v3

    return v0
.end method

.method enableComponentLPw(Ljava/lang/String;I)Z
    .registers 7

    iget-object v3, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v3, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v1

    iget-object v3, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v3, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v0, v3

    return v0
.end method

.method getCurrentEnabledStateLPr(Ljava/lang/String;I)I
    .registers 6

    iget-object v2, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v2, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v0

    iget-object v2, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v2, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    const/4 v2, 0x1

    :goto_13
    return v2

    :cond_14
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    const/4 v2, 0x2

    goto :goto_13

    :cond_1c
    const/4 v2, 0x0

    goto :goto_13
.end method

.method getDisabledComponents(I)Ljava/util/HashSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v0, p1}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v0

    return-object v0
.end method

.method getEnabled(I)I
    .registers 4

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    return v0
.end method

.method getEnabledComponents(I)Ljava/util/HashSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v0, p1}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v0

    return-object v0
.end method

.method public getInstallStatus()I
    .registers 2

    iget v0, p0, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    return v0
.end method

.method getInstallerPackageName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->installerPackageName:Ljava/lang/String;

    return-object v0
.end method

.method getNotLaunched(I)Z
    .registers 4

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method getStopped(I)Z
    .registers 4

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method init(Ljava/io/File;Ljava/io/File;Ljava/lang/String;I)V
    .registers 6

    iput-object p1, p0, Lcom/android/server/pm/PackageSettingBase;->codePath:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->codePathString:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/server/pm/PackageSettingBase;->resourcePath:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->resourcePathString:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/server/pm/PackageSettingBase;->nativeLibraryPathString:Ljava/lang/String;

    iput p4, p0, Lcom/android/server/pm/PackageSettingBase;->versionCode:I

    return-void
.end method

.method removeUser(I)V
    .registers 3

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->delete(I)V

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    return-void
.end method

.method restoreComponentLPw(Ljava/lang/String;I)Z
    .registers 7

    iget-object v3, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v3, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v1

    iget-object v3, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-direct {p0, v3, p2}, Lcom/android/server/pm/PackageSettingBase;->getComponentHashSet(Landroid/util/SparseArray;I)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v0, v3

    return v0
.end method

.method setDisabledComponents(Ljava/util/HashSet;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->disabledComponents:Landroid/util/SparseArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method setEnabled(II)V
    .registers 4

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabled:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method

.method setEnabledComponents(Ljava/util/HashSet;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->enabledComponents:Landroid/util/SparseArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public setInstallStatus(I)V
    .registers 2

    iput p1, p0, Lcom/android/server/pm/PackageSettingBase;->installStatus:I

    return-void
.end method

.method public setInstallerPackageName(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/pm/PackageSettingBase;->installerPackageName:Ljava/lang/String;

    return-void
.end method

.method setNotLaunched(ZI)V
    .registers 5

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->notLaunched:Landroid/util/SparseArray;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method setStopped(ZI)V
    .registers 5

    iget-object v0, p0, Lcom/android/server/pm/PackageSettingBase;->stopped:Landroid/util/SparseArray;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public setTimeStamp(J)V
    .registers 3

    iput-wide p1, p0, Lcom/android/server/pm/PackageSettingBase;->timeStamp:J

    return-void
.end method
