.class Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;
.super Ljava/lang/Object;
.source "MiscPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/enterprise/MiscPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SystemFontChanger"
.end annotation


# static fields
.field public static final KEY_PREFERENCE:Ljava/lang/String; = "MONOTYPE"


# instance fields
.field mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

.field final synthetic this$0:Lcom/android/server/enterprise/MiscPolicy;


# direct methods
.method private constructor <init>(Lcom/android/server/enterprise/MiscPolicy;)V
    .registers 3
    .parameter

    .prologue
    .line 948
    iput-object p1, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 952
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/enterprise/MiscPolicy;Lcom/android/server/enterprise/MiscPolicy$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 948
    invoke-direct {p0, p1}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;-><init>(Lcom/android/server/enterprise/MiscPolicy;)V

    return-void
.end method

.method private changeFont(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 27
    .parameter "fontName"
    .parameter "apkPath"

    .prologue
    .line 1029
    const/16 v17, 0x0

    .line 1033
    .local v17, ret:Z
    if-eqz p2, :cond_36

    .line 1036
    const/4 v13, 0x0

    .line 1037
    .local v13, installState:Z
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    move-object/from16 v21, v0

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static/range {v21 .. v21}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v21

    const-string v22, "enterprise_policy"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 1039
    .local v5, edm:Landroid/app/enterprise/EnterpriseDeviceManager;
    invoke-virtual {v5}, Landroid/app/enterprise/EnterpriseDeviceManager;->getApplicationPolicy()Landroid/app/enterprise/ApplicationPolicy;

    move-result-object v21

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/app/enterprise/ApplicationPolicy;->installApplication(Ljava/lang/String;Z)Z

    move-result v13

    .line 1040
    if-nez v13, :cond_36

    .line 1041
    const-string v21, "MiscPolicy"

    const-string v22, "changeFont():New font install failed"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_30} :catch_31

    .line 1137
    .end local v5           #edm:Landroid/app/enterprise/EnterpriseDeviceManager;
    .end local v13           #installState:Z
    .end local v17           #ret:Z
    :goto_30
    return v17

    .line 1044
    .restart local v13       #installState:Z
    .restart local v17       #ret:Z
    :catch_31
    move-exception v4

    .line 1045
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_30

    .line 1050
    .end local v4           #e:Ljava/lang/Exception;
    .end local v13           #installState:Z
    :cond_36
    new-instance v8, Lcom/android/server/enterprise/FontWriter;

    invoke-direct {v8}, Lcom/android/server/enterprise/FontWriter;-><init>()V

    .line 1051
    .local v8, fontWriter:Lcom/android/server/enterprise/FontWriter;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    move-object/from16 v21, v0

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static/range {v21 .. v21}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v15

    .line 1054
    .local v15, packageManager:Landroid/content/pm/PackageManager;
    const/4 v12, 0x0

    .line 1055
    .local v12, index:I
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->getFontString()[Ljava/lang/String;

    move-result-object v14

    .line 1057
    .local v14, installedFontList:[Ljava/lang/String;
    if-nez v14, :cond_58

    .line 1058
    const-string v21, "MiscPolicy"

    const-string v22, "changeFont():Installed font list is null"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_30

    .line 1062
    :cond_58
    const/4 v10, 0x0

    .local v10, i:I
    :goto_59
    array-length v0, v14

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_87

    .line 1063
    aget-object v21, v14, v10

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_d1

    .line 1064
    move v12, v10

    .line 1065
    const-string v21, "MiscPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "index"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1070
    :cond_87
    const-string v21, "default"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_d4

    .line 1072
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    move-object/from16 v21, v0

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static/range {v21 .. v21}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v21

    const-string v22, "sans.loc"

    const-string v23, "default"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v8, v0, v1, v2}, Lcom/android/server/enterprise/FontWriter;->writeLoc(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 1074
    aget-object v21, v14, v12

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v12}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->savePreferences(Ljava/lang/String;I)V

    .line 1075
    const-string v21, "MiscPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "default font is selected..."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1076
    const/16 v17, 0x1

    goto/16 :goto_30

    .line 1062
    :cond_d1
    add-int/lit8 v10, v10, 0x1

    goto :goto_59

    .line 1079
    :cond_d4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/android/server/enterprise/TypefaceFinder;->findMatchingTypefaceByName(Ljava/lang/String;)Lcom/android/server/enterprise/Typeface;

    move-result-object v18

    .line 1080
    .local v18, sansTypeface:Lcom/android/server/enterprise/Typeface;
    if-nez v18, :cond_ed

    .line 1081
    const-string v21, "MiscPolicy"

    const-string v22, "change font failed"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_30

    .line 1085
    :cond_ed
    invoke-virtual/range {v18 .. v18}, Lcom/android/server/enterprise/Typeface;->getFontPackageName()Ljava/lang/String;

    move-result-object p2

    .line 1086
    invoke-virtual/range {v18 .. v18}, Lcom/android/server/enterprise/Typeface;->getTypefaceFilename()Ljava/lang/String;

    move-result-object v19

    .line 1089
    .local v19, selectedFont:Ljava/lang/String;
    const-string v21, ".xml"

    const-string v22, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1091
    .local v9, fontdir:Ljava/lang/String;
    const-string v21, " "

    const-string v22, "-"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v9, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1093
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    move-object/from16 v21, v0

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static/range {v21 .. v21}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v8, v0, v9}, Lcom/android/server/enterprise/FontWriter;->createFontDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    .line 1094
    .local v7, fontDir:Ljava/io/File;
    if-nez v7, :cond_12c

    .line 1095
    const-string v21, "MiscPolicy"

    const-string v22, "create fontDir object is null "

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1096
    const/16 v17, 0x0

    goto/16 :goto_30

    .line 1101
    :cond_12c
    const/16 v20, 0x0

    .line 1102
    .local v20, tpf:Lcom/android/server/enterprise/TypefaceFile;
    if-eqz v18, :cond_1a4

    .line 1103
    const/4 v10, 0x0

    :goto_131
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/enterprise/Typeface;->mSansFonts:Ljava/util/List;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v21

    move/from16 v0, v21

    if-ge v10, v0, :cond_1a4

    .line 1105
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/enterprise/Typeface;->mSansFonts:Ljava/util/List;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20           #tpf:Lcom/android/server/enterprise/TypefaceFile;
    check-cast v20, Lcom/android/server/enterprise/TypefaceFile;

    .line 1112
    .restart local v20       #tpf:Lcom/android/server/enterprise/TypefaceFile;
    :try_start_14d
    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v16

    .line 1114
    .local v16, res:Landroid/content/res/Resources;
    invoke-virtual/range {v16 .. v16}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    .line 1116
    .local v3, assetManager:Landroid/content/res/AssetManager;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "fonts/"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v20 .. v20}, Lcom/android/server/enterprise/TypefaceFile;->getFileName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v11

    .line 1117
    .local v11, in:Ljava/io/InputStream;
    invoke-virtual/range {v20 .. v20}, Lcom/android/server/enterprise/TypefaceFile;->getDroidName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v8, v7, v11, v0}, Lcom/android/server/enterprise/FontWriter;->copyFontFile(Ljava/io/File;Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_17d
    .catch Ljava/lang/Exception; {:try_start_14d .. :try_end_17d} :catch_180

    .line 1103
    add-int/lit8 v10, v10, 0x1

    goto :goto_131

    .line 1121
    .end local v3           #assetManager:Landroid/content/res/AssetManager;
    .end local v11           #in:Ljava/io/InputStream;
    .end local v16           #res:Landroid/content/res/Resources;
    :catch_180
    move-exception v6

    .line 1122
    .local v6, ex:Ljava/lang/Exception;
    const-string v21, "MiscPolicy"

    const-string v22, "changeFont():Exception"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1123
    const-string v21, "MiscPolicy"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Exception"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_30

    .line 1134
    .end local v6           #ex:Ljava/lang/Exception;
    :cond_1a4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    move-object/from16 v21, v0

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static/range {v21 .. v21}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v21

    const-string v22, "sans.loc"

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v8, v0, v1, v2}, Lcom/android/server/enterprise/FontWriter;->writeLoc(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 1135
    invoke-virtual/range {v18 .. v18}, Lcom/android/server/enterprise/Typeface;->getTypefaceFilename()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v12}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->savePreferences(Ljava/lang/String;I)V

    .line 1136
    const-string v21, "MiscPolicy"

    const-string v22, "change font:Done"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1137
    const/16 v17, 0x1

    goto/16 :goto_30
.end method

.method private getFontString()[Ljava/lang/String;
    .registers 5

    .prologue
    .line 1185
    const/4 v2, 0x0

    .line 1186
    .local v2, retString:[Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->getFontsVector()Ljava/util/Vector;

    move-result-object v0

    .line 1187
    .local v0, fontNames:Ljava/util/Vector;
    if-nez v0, :cond_9

    .line 1188
    const/4 v3, 0x0

    .line 1196
    :goto_8
    return-object v3

    .line 1189
    :cond_9
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v2, v3, [Ljava/lang/String;

    .line 1192
    const/4 v1, 0x0

    .local v1, i:I
    :goto_10
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v1, v3, :cond_21

    .line 1194
    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aput-object v3, v2, v1

    .line 1192
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_21
    move-object v3, v2

    .line 1196
    goto :goto_8
.end method

.method private getFontsVector()Ljava/util/Vector;
    .registers 14

    .prologue
    const/4 v12, 0x0

    .line 1200
    iput-object v12, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

    .line 1202
    new-instance v11, Lcom/android/server/enterprise/TypefaceFinder;

    invoke-direct {v11}, Lcom/android/server/enterprise/TypefaceFinder;-><init>()V

    iput-object v11, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

    .line 1204
    const-string v0, "com.monotype.android.font."

    .line 1207
    .local v0, FONT_PACKAGE:Ljava/lang/String;
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 1210
    .local v5, fontPackageNames:Ljava/util/Vector;
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 1213
    .local v3, fontNames:Ljava/util/Vector;
    new-instance v10, Ljava/util/Vector;

    invoke-direct {v10}, Ljava/util/Vector;-><init>()V

    .line 1215
    .local v10, typefaceFiles:Ljava/util/Vector;
    const/4 v2, 0x0

    .line 1217
    .local v2, fontAssetManager:Landroid/content/res/AssetManager;
    const/4 v8, 0x0

    .line 1218
    .local v8, packageManager:Landroid/content/pm/PackageManager;
    const/4 v7, 0x0

    .line 1219
    .local v7, installedApplications:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    iget-object v11, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static {v11}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    .line 1222
    const/16 v11, 0x80

    :try_start_2a
    invoke-virtual {v8, v11}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v7

    .line 1227
    const/4 v4, 0x0

    .line 1229
    .local v4, fontPackageName:Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, i:I
    :goto_30
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v11

    if-ge v6, v11, :cond_54

    .line 1231
    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/ApplicationInfo;

    iget-object v4, v11, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1233
    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_51

    .line 1235
    invoke-virtual {v8, v4}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v9

    .line 1237
    .local v9, res:Landroid/content/res/Resources;
    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    .line 1239
    iget-object v11, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

    invoke-virtual {v11, v2, v4}, Lcom/android/server/enterprise/TypefaceFinder;->findTypefaces(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    .line 1229
    .end local v9           #res:Landroid/content/res/Resources;
    :cond_51
    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    .line 1245
    :cond_54
    iget-object v11, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->mTypefaceFinder:Lcom/android/server/enterprise/TypefaceFinder;

    invoke-virtual {v11, v3, v10, v5}, Lcom/android/server/enterprise/TypefaceFinder;->getSansEntries(Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_59} :catch_5a

    .line 1251
    .end local v3           #fontNames:Ljava/util/Vector;
    .end local v4           #fontPackageName:Ljava/lang/String;
    .end local v6           #i:I
    :goto_59
    return-object v3

    .line 1247
    .restart local v3       #fontNames:Ljava/util/Vector;
    :catch_5a
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    move-object v3, v12

    .line 1248
    goto :goto_59
.end method


# virtual methods
.method public getActiveFontPosition()I
    .registers 9

    .prologue
    const/4 v4, 0x0

    .line 1155
    const-string v5, "MiscPolicy"

    const-string v6, "getActiveFontPosition():getting active font position:"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1157
    const/4 v1, 0x0

    .line 1158
    .local v1, mode:I
    const/4 v3, 0x0

    .line 1160
    .local v3, settingContext:Landroid/content/Context;
    :try_start_a
    iget-object v5, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v5

    const-string v6, "com.android.settings"

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    :try_end_16
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_16} :catch_21

    move-result-object v3

    .line 1167
    :goto_17
    if-nez v3, :cond_26

    .line 1168
    const-string v5, "MiscPolicy"

    const-string v6, "Setting Context is Null"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1175
    :goto_20
    return v4

    .line 1162
    :catch_21
    move-exception v0

    .line 1164
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_17

    .line 1172
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_26
    const-string v5, "prefs"

    invoke-virtual {v3, v5, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 1175
    .local v2, mySharedPreference:Landroid/content/SharedPreferences;
    const-string v5, "SavedClickedItem"

    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    goto :goto_20
.end method

.method public getSystemActiveFont()Ljava/lang/String;
    .registers 6

    .prologue
    .line 1142
    const-string v2, "MiscPolicy"

    const-string v3, "getSystemActiveFont():getting active system font:"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1143
    invoke-virtual {p0}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->getActiveFontPosition()I

    move-result v1

    .line 1144
    .local v1, position:I
    const-string v2, "MiscPolicy"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getActiveFontPosition():"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1145
    invoke-virtual {p0}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->getSystemFonts()[Ljava/lang/String;

    move-result-object v0

    .line 1146
    .local v0, fonts:[Ljava/lang/String;
    if-eqz v0, :cond_2c

    .line 1147
    aget-object v2, v0, v1

    .line 1149
    :goto_2b
    return-object v2

    :cond_2c
    const/4 v2, 0x0

    goto :goto_2b
.end method

.method public getSystemFonts()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 1180
    const-string v0, "MiscPolicy"

    const-string v1, "getSystemFonts():getting all system fonts"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1181
    invoke-direct {p0}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->getFontString()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected savePreferences(Ljava/lang/String;I)V
    .registers 13
    .parameter "fontName"
    .parameter "position"

    .prologue
    .line 1257
    const/4 v3, 0x0

    .line 1258
    .local v3, mode:I
    const/4 v6, 0x0

    .line 1261
    .local v6, settingContext:Landroid/content/Context;
    :try_start_2
    iget-object v7, p0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v7

    const-string v8, "com.android.settings"

    const/4 v9, 0x2

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_e} :catch_19

    move-result-object v6

    .line 1268
    :goto_f
    if-nez v6, :cond_1e

    .line 1269
    const-string v7, "MiscPolicy"

    const-string v8, "Setting Context is Null"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1287
    :goto_18
    return-void

    .line 1263
    :catch_19
    move-exception v0

    .line 1265
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_f

    .line 1273
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1e
    const-string v7, "prefs"

    invoke-virtual {v6, v7, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1276
    .local v4, mySharedPreference:Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1277
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v7, "SavedClickedItem"

    invoke-interface {v1, v7, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1279
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1281
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_preferences"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1282
    .local v5, prefName:Ljava/lang/String;
    invoke-virtual {v6, v5, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1283
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1284
    .local v2, editor1:Landroid/content/SharedPreferences$Editor;
    const-string v7, "MONOTYPE"

    invoke-interface {v2, v7, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1285
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_18
.end method

.method public setSystemActiveFont(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 24
    .parameter "fontName"
    .parameter "apkPath"

    .prologue
    .line 955
    const-string v19, "MiscPolicy"

    const-string v20, "setSystemActiveFont():Start"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 956
    const/4 v15, 0x0

    .line 958
    .local v15, ret:Z
    if-nez p1, :cond_14

    .line 960
    const-string v19, "MiscPolicy"

    const-string v20, "setSystemActiveFont():Invalid input"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v19, v15

    .line 1025
    :goto_13
    return v19

    .line 966
    :cond_14
    invoke-direct/range {p0 .. p2}, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->changeFont(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v15

    .line 968
    if-nez v15, :cond_1d

    .line 969
    const/16 v19, 0x0

    goto :goto_13

    .line 973
    :cond_1d
    :try_start_1d
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v17

    .line 974
    .local v17, token:J
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v5

    .line 976
    .local v5, am:Landroid/app/IActivityManager;
    invoke-interface {v5}, Landroid/app/IActivityManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    .line 978
    .local v6, config:Landroid/content/res/Configuration;
    new-instance v14, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    move-wide/from16 v0, v19

    invoke-direct {v14, v0, v1}, Ljava/util/Random;-><init>(J)V

    .line 980
    .local v14, randomizer:Ljava/util/Random;
    const/4 v13, 0x0

    .line 982
    .local v13, min:I
    const/16 v12, 0x2710

    .line 986
    .local v12, max:I
    invoke-interface {v5, v6}, Landroid/app/IActivityManager;->updateConfiguration(Landroid/content/res/Configuration;)V

    .line 987
    invoke-static/range {v17 .. v18}, Landroid/os/Binder;->restoreCallingIdentity(J)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_3d} :catch_7a

    .line 1000
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v10

    .line 1001
    .local v10, identity:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/MiscPolicy$SystemFontChanger;->this$0:Lcom/android/server/enterprise/MiscPolicy;

    move-object/from16 v19, v0

    #getter for: Lcom/android/server/enterprise/MiscPolicy;->mContext:Landroid/content/Context;
    invoke-static/range {v19 .. v19}, Lcom/android/server/enterprise/MiscPolicy;->access$700(Lcom/android/server/enterprise/MiscPolicy;)Landroid/content/Context;

    move-result-object v19

    const-string v20, "activity"

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    .line 1004
    .local v3, activityManager:Landroid/app/ActivityManager;
    const/16 v19, 0x32

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v4

    .line 1006
    .local v4, allTasks:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    const/4 v8, 0x1

    .line 1008
    .local v8, i:I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_60
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_85

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 1010
    .local v2, aTask:Landroid/app/ActivityManager$RunningTaskInfo;
    iget-object v0, v2, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v16

    .line 1017
    .local v16, s:Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/app/ActivityManager;->restartPackage(Ljava/lang/String;)V

    goto :goto_60

    .line 992
    .end local v2           #aTask:Landroid/app/ActivityManager$RunningTaskInfo;
    .end local v3           #activityManager:Landroid/app/ActivityManager;
    .end local v4           #allTasks:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    .end local v5           #am:Landroid/app/IActivityManager;
    .end local v6           #config:Landroid/content/res/Configuration;
    .end local v8           #i:I
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v10           #identity:J
    .end local v12           #max:I
    .end local v13           #min:I
    .end local v14           #randomizer:Ljava/util/Random;
    .end local v16           #s:Ljava/lang/String;
    .end local v17           #token:J
    :catch_7a
    move-exception v7

    .line 994
    .local v7, e:Ljava/lang/Exception;
    const-string v19, "MiscPolicy"

    const-string v20, "setSystemActiveFont():Exception"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 995
    const/16 v19, 0x0

    goto :goto_13

    .line 1024
    .end local v7           #e:Ljava/lang/Exception;
    .restart local v3       #activityManager:Landroid/app/ActivityManager;
    .restart local v4       #allTasks:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    .restart local v5       #am:Landroid/app/IActivityManager;
    .restart local v6       #config:Landroid/content/res/Configuration;
    .restart local v8       #i:I
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v10       #identity:J
    .restart local v12       #max:I
    .restart local v13       #min:I
    .restart local v14       #randomizer:Ljava/util/Random;
    .restart local v17       #token:J
    :cond_85
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move/from16 v19, v15

    .line 1025
    goto :goto_13
.end method
