.class Lcom/android/server/input/InputManagerService$3;
.super Ljava/lang/Object;
.source "InputManagerService.java"

# interfaces
.implements Lcom/android/server/input/InputManagerService$KeyboardLayoutVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/input/InputManagerService;->updateKeyboardLayouts()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/input/InputManagerService;

.field final synthetic val$availableKeyboardLayouts:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Lcom/android/server/input/InputManagerService;Ljava/util/HashSet;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 682
    iput-object p1, p0, Lcom/android/server/input/InputManagerService$3;->this$0:Lcom/android/server/input/InputManagerService;

    iput-object p2, p0, Lcom/android/server/input/InputManagerService$3;->val$availableKeyboardLayouts:Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visitKeyboardLayout(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 7
    .parameter "resources"
    .parameter "descriptor"
    .parameter "label"
    .parameter "collection"
    .parameter "keyboardLayoutResId"

    .prologue
    .line 686
    iget-object v0, p0, Lcom/android/server/input/InputManagerService$3;->val$availableKeyboardLayouts:Ljava/util/HashSet;

    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 687
    return-void
.end method
