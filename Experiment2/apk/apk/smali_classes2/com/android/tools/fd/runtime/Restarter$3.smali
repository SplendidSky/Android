.class final Lcom/android/tools/fd/runtime/Restarter$3;
.super Ljava/lang/Object;
.source "Restarter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/tools/fd/runtime/Restarter;->showToastWhenPossible(Landroid/content/Context;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$remainingAttempts:I


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 294
    iput-object p1, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$message:Ljava/lang/String;

    iput p3, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$remainingAttempts:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 297
    iget-object v1, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 298
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_1

    .line 299
    iget-object v1, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$message:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 305
    :cond_0
    :goto_0
    return-void

    .line 301
    :cond_1
    iget v1, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$remainingAttempts:I

    if-lez v1, :cond_0

    .line 302
    iget-object v1, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$message:Ljava/lang/String;

    iget v3, p0, Lcom/android/tools/fd/runtime/Restarter$3;->val$remainingAttempts:I

    add-int/lit8 v3, v3, -0x1

    # invokes: Lcom/android/tools/fd/runtime/Restarter;->showToastWhenPossible(Landroid/content/Context;Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/android/tools/fd/runtime/Restarter;->access$100(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method
