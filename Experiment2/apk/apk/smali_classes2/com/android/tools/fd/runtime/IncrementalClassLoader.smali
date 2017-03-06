.class public Lcom/android/tools/fd/runtime/IncrementalClassLoader;
.super Ljava/lang/ClassLoader;
.source "IncrementalClassLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/fd/runtime/IncrementalClassLoader$1;,
        Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;
    }
.end annotation


# static fields
.field public static final DEBUG_CLASS_LOADING:Z


# instance fields
.field private final delegateClassLoader:Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "original"    # Ljava/lang/ClassLoader;
    .param p2, "nativeLibraryPath"    # Ljava/lang/String;
    .param p3, "codeCacheDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p4, "dexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 55
    invoke-static {p2, p3, p4, p1}, Lcom/android/tools/fd/runtime/IncrementalClassLoader;->createDelegateClassLoader(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/ClassLoader;)Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/android/tools/fd/runtime/IncrementalClassLoader;->delegateClassLoader:Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;

    .line 57
    return-void
.end method

.method private static createDelegateClassLoader(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/ClassLoader;)Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;
    .locals 6
    .param p0, "nativeLibraryPath"    # Ljava/lang/String;
    .param p1, "codeCacheDir"    # Ljava/lang/String;
    .param p3, "original"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;"
        }
    .end annotation

    .prologue
    .line 110
    .local p2, "dexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p2}, Lcom/android/tools/fd/runtime/IncrementalClassLoader;->createDexPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "pathBuilder":Ljava/lang/String;
    new-instance v0, Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x0

    move-object v3, p0

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/ClassLoader;Lcom/android/tools/fd/runtime/IncrementalClassLoader$1;)V

    return-object v0
.end method

.method private static createDexPath(Ljava/util/List;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "dexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .local v3, "pathBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 119
    .local v1, "first":Z
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 120
    .local v0, "dex":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 121
    const/4 v1, 0x0

    .line 126
    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 123
    :cond_0
    sget-object v4, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 129
    .end local v0    # "dex":Ljava/lang/String;
    :cond_1
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 130
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Incremental dex path is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0xa

    invoke-static {v6, p0}, Lcom/android/tools/fd/runtime/BootstrapApplication;->join(CLjava/util/List;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static inject(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/ClassLoader;
    .locals 1
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "nativeLibraryPath"    # Ljava/lang/String;
    .param p2, "codeCacheDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/ClassLoader;"
        }
    .end annotation

    .prologue
    .line 153
    .local p3, "dexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/android/tools/fd/runtime/IncrementalClassLoader;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/tools/fd/runtime/IncrementalClassLoader;-><init>(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 155
    .local v0, "incrementalClassLoader":Lcom/android/tools/fd/runtime/IncrementalClassLoader;
    invoke-static {p0, v0}, Lcom/android/tools/fd/runtime/IncrementalClassLoader;->setParent(Ljava/lang/ClassLoader;Ljava/lang/ClassLoader;)V

    .line 174
    return-object v0
.end method

.method private static setParent(Ljava/lang/ClassLoader;Ljava/lang/ClassLoader;)V
    .locals 4
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "newParent"    # Ljava/lang/ClassLoader;

    .prologue
    .line 138
    :try_start_0
    const-class v2, Ljava/lang/ClassLoader;

    const-string/jumbo v3, "parent"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 139
    .local v1, "parent":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 140
    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_2

    .line 148
    return-void

    .line 141
    .end local v1    # "parent":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 143
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 145
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public findClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 62
    :try_start_0
    iget-object v2, p0, Lcom/android/tools/fd/runtime/IncrementalClassLoader;->delegateClassLoader:Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;

    invoke-virtual {v2, p1}, Lcom/android/tools/fd/runtime/IncrementalClassLoader$DelegateClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 68
    .local v0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    return-object v0

    .line 69
    .end local v0    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v1

    .line 74
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    throw v1
.end method
