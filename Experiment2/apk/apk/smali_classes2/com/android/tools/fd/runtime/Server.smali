.class public Lcom/android/tools/fd/runtime/Server;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/fd/runtime/Server$1;,
        Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;,
        Lcom/android/tools/fd/runtime/Server$SocketServerThread;
    }
.end annotation


# static fields
.field private static final POST_ALIVE_STATUS:Z

.field private static final RESTART_LOCALLY:Z

.field private static sWrongTokenCount:I


# instance fields
.field private final mApplication:Landroid/app/Application;

.field private mServerSocket:Landroid/net/LocalServerSocket;


# direct methods
.method private constructor <init>(Ljava/lang/String;Landroid/app/Application;)V
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "application"    # Landroid/app/Application;

    .prologue
    const/4 v4, 0x2

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p2, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    .line 94
    :try_start_0
    new-instance v1, Landroid/net/LocalServerSocket;

    invoke-direct {v1, p1}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/tools/fd/runtime/Server;->mServerSocket:Landroid/net/LocalServerSocket;

    .line 95
    const-string/jumbo v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Starting server socket listening for package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/tools/fd/runtime/Server;->mServerSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v3}, Landroid/net/LocalServerSocket;->getLocalSocketAddress()Landroid/net/LocalSocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :cond_0
    invoke-direct {p0}, Lcom/android/tools/fd/runtime/Server;->startServer()V

    .line 105
    const-string/jumbo v1, "InstantRun"

    invoke-static {v1, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 106
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Started server for package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :cond_1
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "IO Error creating local socket at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/android/tools/fd/runtime/Server;)Landroid/net/LocalServerSocket;
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Server;->mServerSocket:Landroid/net/LocalServerSocket;

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 61
    sget v0, Lcom/android/tools/fd/runtime/Server;->sWrongTokenCount:I

    return v0
.end method

.method static synthetic access$208()I
    .locals 2

    .prologue
    .line 61
    sget v0, Lcom/android/tools/fd/runtime/Server;->sWrongTokenCount:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/android/tools/fd/runtime/Server;->sWrongTokenCount:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/app/Application;
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    return-object v0
.end method

.method static synthetic access$400(Ljava/util/List;)Z
    .locals 1
    .param p0, "x0"    # Ljava/util/List;

    .prologue
    .line 61
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Server;->hasResources(Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/android/tools/fd/runtime/Server;Ljava/util/List;ZI)I
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z
    .param p3, "x3"    # I

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/android/tools/fd/runtime/Server;->handlePatches(Ljava/util/List;ZI)I

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/android/tools/fd/runtime/Server;IZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/android/tools/fd/runtime/Server;->restart(IZZ)V

    return-void
.end method

.method public static create(Ljava/lang/String;Landroid/app/Application;)V
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "application"    # Landroid/app/Application;

    .prologue
    .line 88
    new-instance v0, Lcom/android/tools/fd/runtime/Server;

    invoke-direct {v0, p0, p1}, Lcom/android/tools/fd/runtime/Server;-><init>(Ljava/lang/String;Landroid/app/Application;)V

    .line 89
    return-void
.end method

.method private static handleColdSwapPatch(Lcom/android/tools/fd/runtime/ApplicationPatch;)V
    .locals 4
    .param p0, "patch"    # Lcom/android/tools/fd/runtime/ApplicationPatch;

    .prologue
    .line 479
    iget-object v1, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->path:Ljava/lang/String;

    const-string/jumbo v2, "slice-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 480
    invoke-virtual {p0}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v1

    iget-object v2, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->path:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/android/tools/fd/runtime/FileManager;->writeDexShard([BLjava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 481
    .local v0, "file":Ljava/io/File;
    const-string/jumbo v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 482
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Received dex shard "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    return-void
.end method

.method private handleHotSwapPatch(ILcom/android/tools/fd/runtime/ApplicationPatch;)I
    .locals 16
    .param p1, "updateMode"    # I
    .param p2, "patch"    # Lcom/android/tools/fd/runtime/ApplicationPatch;

    .prologue
    .line 427
    const-string/jumbo v13, "InstantRun"

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 428
    const-string/jumbo v13, "InstantRun"

    const-string/jumbo v14, "Received incremental code patch"

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :cond_0
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v13

    invoke-static {v13}, Lcom/android/tools/fd/runtime/FileManager;->writeTempDexFile([B)Ljava/lang/String;

    move-result-object v4

    .line 432
    .local v4, "dexFile":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 433
    const-string/jumbo v13, "InstantRun"

    const-string/jumbo v14, "No file to write the code to"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v12, p1

    .line 475
    .end local v4    # "dexFile":Ljava/lang/String;
    .end local p1    # "updateMode":I
    .local v12, "updateMode":I
    :goto_0
    return v12

    .line 435
    .end local v12    # "updateMode":I
    .restart local v4    # "dexFile":Ljava/lang/String;
    .restart local p1    # "updateMode":I
    :cond_1
    const-string/jumbo v13, "InstantRun"

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 436
    const-string/jumbo v13, "InstantRun"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Reading live code from "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    :cond_2
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getNativeLibraryFolder()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v13}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    .line 439
    .local v11, "nativeLibraryPath":Ljava/lang/String;
    new-instance v3, Ldalvik/system/DexClassLoader;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    invoke-virtual {v13}, Landroid/app/Application;->getCacheDir()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v13}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v14

    invoke-direct {v3, v4, v13, v11, v14}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 444
    .local v3, "dexClassLoader":Ldalvik/system/DexClassLoader;
    const-string/jumbo v13, "com.android.tools.fd.runtime.AppPatchesLoaderImpl"

    const/4 v14, 0x1

    invoke-static {v13, v14, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 447
    .local v1, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    const-string/jumbo v13, "InstantRun"

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 448
    const-string/jumbo v13, "InstantRun"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Got the patcher class "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/tools/fd/runtime/PatchesLoader;

    .line 452
    .local v10, "loader":Lcom/android/tools/fd/runtime/PatchesLoader;
    const-string/jumbo v13, "InstantRun"

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 453
    const-string/jumbo v13, "InstantRun"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Got the patcher instance "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    :cond_4
    const-string/jumbo v13, "getPatchedClasses"

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Class;

    invoke-virtual {v1, v13, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v13

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    invoke-virtual {v13, v10, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    move-object v0, v13

    check-cast v0, [Ljava/lang/String;

    move-object v7, v0

    .line 457
    .local v7, "getPatchedClasses":[Ljava/lang/String;
    const-string/jumbo v13, "InstantRun"

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 458
    const-string/jumbo v13, "InstantRun"

    const-string/jumbo v14, "Got the list of classes "

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    move-object v2, v7

    .local v2, "arr$":[Ljava/lang/String;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_1
    if-ge v8, v9, :cond_5

    aget-object v6, v2, v8

    .line 460
    .local v6, "getPatchedClass":Ljava/lang/String;
    const-string/jumbo v13, "InstantRun"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "class "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 463
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v6    # "getPatchedClass":Ljava/lang/String;
    .end local v8    # "i$":I
    .end local v9    # "len$":I
    :cond_5
    invoke-interface {v10}, Lcom/android/tools/fd/runtime/PatchesLoader;->load()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v13

    if-nez v13, :cond_6

    .line 464
    const/16 p1, 0x3

    .end local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .end local v4    # "dexFile":Ljava/lang/String;
    .end local v7    # "getPatchedClasses":[Ljava/lang/String;
    .end local v10    # "loader":Lcom/android/tools/fd/runtime/PatchesLoader;
    .end local v11    # "nativeLibraryPath":Ljava/lang/String;
    :cond_6
    :goto_2
    move/from16 v12, p1

    .line 475
    .end local p1    # "updateMode":I
    .restart local v12    # "updateMode":I
    goto/16 :goto_0

    .line 466
    .end local v12    # "updateMode":I
    .restart local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .restart local v4    # "dexFile":Ljava/lang/String;
    .restart local v11    # "nativeLibraryPath":Ljava/lang/String;
    .restart local p1    # "updateMode":I
    :catch_0
    move-exception v5

    .line 467
    .local v5, "e":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v13, "InstantRun"

    const-string/jumbo v14, "Couldn\'t apply code changes"

    invoke-static {v13, v14, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 468
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 469
    const/16 p1, 0x3

    goto :goto_2

    .line 471
    .end local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .end local v4    # "dexFile":Ljava/lang/String;
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v11    # "nativeLibraryPath":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 472
    .local v5, "e":Ljava/lang/Throwable;
    const-string/jumbo v13, "InstantRun"

    const-string/jumbo v14, "Couldn\'t apply code changes"

    invoke-static {v13, v14, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 473
    const/16 p1, 0x3

    goto :goto_2
.end method

.method private handlePatches(Ljava/util/List;ZI)I
    .locals 8
    .param p2, "hasResources"    # Z
    .param p3, "updateMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/tools/fd/runtime/ApplicationPatch;",
            ">;ZI)I"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    if-eqz p2, :cond_0

    .line 378
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->startUpdate()V

    .line 381
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/tools/fd/runtime/ApplicationPatch;

    .line 382
    .local v2, "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    invoke-virtual {v2}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 383
    .local v5, "path":Ljava/lang/String;
    const-string/jumbo v6, ".dex"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 384
    invoke-static {v2}, Lcom/android/tools/fd/runtime/Server;->handleColdSwapPatch(Lcom/android/tools/fd/runtime/ApplicationPatch;)V

    .line 389
    const/4 v1, 0x0

    .line 390
    .local v1, "canHotSwap":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/tools/fd/runtime/ApplicationPatch;

    .line 391
    .local v0, "c":Lcom/android/tools/fd/runtime/ApplicationPatch;
    invoke-virtual {v0}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "classes.dex.3"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 392
    const/4 v1, 0x1

    .line 397
    .end local v0    # "c":Lcom/android/tools/fd/runtime/ApplicationPatch;
    :cond_3
    if-nez v1, :cond_1

    .line 398
    const/4 p3, 0x3

    goto :goto_0

    .line 401
    .end local v1    # "canHotSwap":Z
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_4
    const-string/jumbo v6, "classes.dex.3"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 402
    invoke-direct {p0, p3, v2}, Lcom/android/tools/fd/runtime/Server;->handleHotSwapPatch(ILcom/android/tools/fd/runtime/ApplicationPatch;)I

    move-result p3

    goto :goto_0

    .line 403
    :cond_5
    invoke-static {v5}, Lcom/android/tools/fd/runtime/Server;->isResourcePath(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 404
    invoke-static {p3, v2, v5}, Lcom/android/tools/fd/runtime/Server;->handleResourcePatch(ILcom/android/tools/fd/runtime/ApplicationPatch;Ljava/lang/String;)I

    move-result p3

    goto :goto_0

    .line 408
    .end local v2    # "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    .end local v5    # "path":Ljava/lang/String;
    :cond_6
    if-eqz p2, :cond_7

    .line 409
    const/4 v6, 0x1

    invoke-static {v6}, Lcom/android/tools/fd/runtime/FileManager;->finishUpdate(Z)V

    .line 412
    :cond_7
    return p3
.end method

.method private static handleResourcePatch(ILcom/android/tools/fd/runtime/ApplicationPatch;Ljava/lang/String;)I
    .locals 4
    .param p0, "updateMode"    # I
    .param p1, "patch"    # Lcom/android/tools/fd/runtime/ApplicationPatch;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x2

    .line 417
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 418
    const-string/jumbo v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Received resource changes ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    :cond_0
    invoke-virtual {p1}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/tools/fd/runtime/FileManager;->writeAaptResources(Ljava/lang/String;[B)V

    .line 422
    invoke-static {p0, v3}, Ljava/lang/Math;->max(II)I

    move-result p0

    .line 423
    return p0
.end method

.method private static hasResources(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/tools/fd/runtime/ApplicationPatch;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 365
    .local p0, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/tools/fd/runtime/ApplicationPatch;

    .line 366
    .local v0, "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    invoke-virtual {v0}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 367
    .local v2, "path":Ljava/lang/String;
    invoke-static {v2}, Lcom/android/tools/fd/runtime/Server;->isResourcePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 368
    const/4 v3, 0x1

    .line 372
    .end local v0    # "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    .end local v2    # "path":Ljava/lang/String;
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static isResourcePath(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 359
    const-string/jumbo v0, "resources.ap_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "res/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private restart(IZZ)V
    .locals 13
    .param p1, "updateMode"    # I
    .param p2, "incrementalResources"    # Z
    .param p3, "toast"    # Z

    .prologue
    .line 488
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 489
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Finished loading changes; update mode ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    :cond_0
    if-eqz p1, :cond_1

    const/4 v8, 0x1

    if-ne p1, v8, :cond_5

    .line 493
    :cond_1
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 494
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Applying incremental code without restart"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    :cond_2
    if-eqz p3, :cond_3

    .line 498
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    invoke-static {v8}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    .line 499
    .local v3, "foreground":Landroid/app/Activity;
    if-eqz v3, :cond_4

    .line 500
    const-string/jumbo v8, "Applied code changes without activity restart"

    invoke-static {v3, v8}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 590
    .end local v3    # "foreground":Landroid/app/Activity;
    :cond_3
    :goto_0
    return-void

    .line 502
    .restart local v3    # "foreground":Landroid/app/Activity;
    :cond_4
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 503
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Couldn\'t show toast: no activity found"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 509
    .end local v3    # "foreground":Landroid/app/Activity;
    :cond_5
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/android/tools/fd/runtime/Restarter;->getActivities(Landroid/content/Context;Z)Ljava/util/List;

    move-result-object v0

    .line 511
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    if-eqz p2, :cond_7

    const/4 v8, 0x2

    if-ne p1, v8, :cond_7

    .line 513
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getExternalResourceFile()Ljava/io/File;

    move-result-object v2

    .line 515
    .local v2, "file":Ljava/io/File;
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 516
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "About to update resource file="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ", activities="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    :cond_6
    if-eqz v2, :cond_c

    .line 521
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 522
    .local v6, "resources":Ljava/lang/String;
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v8, v9, v10, v6}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->monkeyPatchApplication(Landroid/content/Context;Landroid/app/Application;Landroid/app/Application;Ljava/lang/String;)V

    .line 523
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    invoke-static {v8, v6, v0}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V

    .line 530
    .end local v2    # "file":Ljava/io/File;
    .end local v6    # "resources":Ljava/lang/String;
    :cond_7
    :goto_1
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;

    invoke-static {v8}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    .line 531
    .local v1, "activity":Landroid/app/Activity;
    const/4 v8, 0x2

    if-ne p1, v8, :cond_f

    .line 532
    if-eqz v1, :cond_d

    .line 533
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 534
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Restarting activity only!"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    :cond_8
    const/4 v4, 0x0

    .line 542
    .local v4, "handledRestart":Z
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string/jumbo v9, "onHandleCodeChange"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    sget-object v12, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 543
    .local v5, "method":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v5, v1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 544
    .local v7, "result":Ljava/lang/Object;
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 545
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Activity "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " provided manual restart method; return "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    :cond_9
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 549
    const/4 v4, 0x1

    .line 550
    if-eqz p3, :cond_a

    .line 551
    const-string/jumbo v8, "Applied changes"

    invoke-static {v1, v8}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 557
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "result":Ljava/lang/Object;
    :cond_a
    :goto_2
    if-nez v4, :cond_3

    .line 558
    if-eqz p3, :cond_b

    .line 559
    const-string/jumbo v8, "Applied changes, restarted activity"

    invoke-static {v1, v8}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 561
    :cond_b
    invoke-static {v1}, Lcom/android/tools/fd/runtime/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V

    goto/16 :goto_0

    .line 525
    .end local v1    # "activity":Landroid/app/Activity;
    .end local v4    # "handledRestart":Z
    .restart local v2    # "file":Ljava/io/File;
    :cond_c
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "No resource file found to apply"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    const/4 p1, 0x3

    goto/16 :goto_1

    .line 566
    .end local v2    # "file":Ljava/io/File;
    .restart local v1    # "activity":Landroid/app/Activity;
    :cond_d
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 567
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "No activity found, falling through to do a full app restart"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    :cond_e
    const/4 p1, 0x3

    .line 572
    :cond_f
    const/4 v8, 0x3

    if-eq p1, v8, :cond_10

    .line 573
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x6

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 574
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Unexpected update mode: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 586
    :cond_10
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 587
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Waiting for app to be killed and restarted by the IDE..."

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 554
    .restart local v4    # "handledRestart":Z
    :catch_0
    move-exception v8

    goto :goto_2
.end method

.method private startServer()V
    .locals 4

    .prologue
    .line 112
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/android/tools/fd/runtime/Server$SocketServerThread;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/android/tools/fd/runtime/Server$SocketServerThread;-><init>(Lcom/android/tools/fd/runtime/Server;Lcom/android/tools/fd/runtime/Server$1;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 113
    .local v1, "socketServerThread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .end local v1    # "socketServerThread":Ljava/lang/Thread;
    :cond_0
    :goto_0
    return-void

    .line 114
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "InstantRun"

    const/4 v3, 0x6

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 118
    const-string/jumbo v2, "InstantRun"

    const-string/jumbo v3, "Fatal error starting Instant Run server"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
