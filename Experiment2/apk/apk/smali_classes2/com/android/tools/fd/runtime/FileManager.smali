.class public Lcom/android/tools/fd/runtime/FileManager;
.super Ljava/lang/Object;
.source "FileManager.java"


# static fields
.field public static final CLASSES_DEX_SUFFIX:Ljava/lang/String; = ".dex"

.field private static final FILE_NAME_ACTIVE:Ljava/lang/String; = "active"

.field private static final FOLDER_NAME_LEFT:Ljava/lang/String; = "left"

.field private static final FOLDER_NAME_RIGHT:Ljava/lang/String; = "right"

.field private static final RELOAD_DEX_PREFIX:Ljava/lang/String; = "reload"

.field private static final RESOURCE_FILE_NAME:Ljava/lang/String; = "resources.ap_"

.field private static final RESOURCE_FOLDER_NAME:Ljava/lang/String; = "resources"

.field private static final USE_EXTRACTED_RESOURCES:Z

.field private static sHavePurgedTempDexFolder:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkInbox()V
    .locals 7

    .prologue
    .line 242
    new-instance v2, Ljava/io/File;

    sget-object v4, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/tools/fd/runtime/Paths;->getInboxDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 243
    .local v2, "inbox":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 244
    new-instance v3, Ljava/io/File;

    const-string/jumbo v4, "resources.ap_"

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 245
    .local v3, "resources":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 246
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 247
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Processing resource file from inbox ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    :cond_0
    invoke-static {v3}, Lcom/android/tools/fd/runtime/FileManager;->readRawBytes(Ljava/io/File;)[B

    move-result-object v0

    .line 250
    .local v0, "bytes":[B
    if-eqz v0, :cond_1

    .line 251
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->startUpdate()V

    .line 252
    const-string/jumbo v4, "resources.ap_"

    invoke-static {v4, v0}, Lcom/android/tools/fd/runtime/FileManager;->writeAaptResources(Ljava/lang/String;[B)V

    .line 253
    const/4 v4, 0x1

    invoke-static {v4}, Lcom/android/tools/fd/runtime/FileManager;->finishUpdate(Z)V

    .line 254
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    .line 255
    .local v1, "deleted":Z
    if-nez v1, :cond_1

    .line 256
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x6

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 257
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Couldn\'t remove inbox resource file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .end local v0    # "bytes":[B
    .end local v1    # "deleted":Z
    .end local v3    # "resources":Ljava/io/File;
    :cond_1
    return-void
.end method

.method private static delete(Ljava/io/File;)V
    .locals 9
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 176
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 178
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 179
    .local v3, "files":[Ljava/io/File;
    if-eqz v3, :cond_0

    .line 180
    move-object v0, v3

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v1, v0, v4

    .line 181
    .local v1, "child":Ljava/io/File;
    invoke-static {v1}, Lcom/android/tools/fd/runtime/FileManager;->delete(Ljava/io/File;)V

    .line 180
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 187
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "child":Ljava/io/File;
    .end local v3    # "files":[Ljava/io/File;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    .line 188
    .local v2, "deleted":Z
    if-nez v2, :cond_1

    .line 189
    const-string/jumbo v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Failed to delete file "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    :cond_1
    return-void
.end method

.method private static extractSlices(Ljava/io/File;[Ljava/io/File;J)[Ljava/io/File;
    .locals 30
    .param p0, "dexFolder"    # Ljava/io/File;
    .param p1, "dexFolderFiles"    # [Ljava/io/File;
    .param p2, "apkModified"    # J

    .prologue
    .line 395
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 396
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Extracting slices into "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    :cond_0
    const-class v25, Lcom/android/tools/fd/runtime/BootstrapApplication;

    const-string/jumbo v26, "/instant-run.zip"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v23

    .line 399
    .local v23, "stream":Ljava/io/InputStream;
    if-nez v23, :cond_2

    .line 400
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x6

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_1

    .line 401
    const-string/jumbo v25, "InstantRun"

    const-string/jumbo v26, "Could not find slices in APK; aborting."

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    :cond_1
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/io/File;

    move-object/from16 v25, v0

    .line 504
    :goto_0
    return-object v25

    .line 405
    :cond_2
    new-instance v21, Ljava/util/ArrayList;

    const/16 v25, 0x1e

    move-object/from16 v0, v21

    move/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 406
    .local v21, "slices":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    new-instance v20, Ljava/util/HashSet;

    const/16 v25, 0x1e

    move-object/from16 v0, v20

    move/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 408
    .local v20, "sliceNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :try_start_0
    new-instance v24, Ljava/util/zip/ZipInputStream;

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 410
    .local v24, "zipInputStream":Ljava/util/zip/ZipInputStream;
    const/16 v25, 0x7d0

    :try_start_1
    move/from16 v0, v25

    new-array v5, v0, [B

    .line 412
    .local v5, "buffer":[B
    invoke-virtual/range {v24 .. v24}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v10

    .line 413
    .local v10, "entry":Ljava/util/zip/ZipEntry;
    :goto_1
    if-eqz v10, :cond_9

    .line 415
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v15

    .line 417
    .local v15, "name":Ljava/lang/String;
    const-string/jumbo v25, "META-INF"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_4

    .line 414
    :cond_3
    :goto_2
    invoke-virtual/range {v24 .. v24}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v10

    goto :goto_1

    .line 420
    :cond_4
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v25

    if-nez v25, :cond_3

    const/16 v25, 0x2f

    move/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v25

    const/16 v26, -0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_3

    const-string/jumbo v25, ".dex"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 429
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v26, "slice-"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 430
    .local v17, "sliceName":Ljava/lang/String;
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 431
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v9, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 432
    .local v9, "dest":Ljava/io/File;
    move-object/from16 v0, v21

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 434
    const-wide/16 v26, 0x0

    cmp-long v25, p2, v26

    if-lez v25, :cond_5

    .line 435
    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v18

    .line 436
    .local v18, "sliceModified":J
    cmp-long v25, v18, p2

    if-lez v25, :cond_5

    .line 438
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 439
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Ignoring slice "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ": newer on disk than in APK"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto/16 :goto_2

    .line 491
    .end local v5    # "buffer":[B
    .end local v9    # "dest":Ljava/io/File;
    .end local v10    # "entry":Ljava/util/zip/ZipEntry;
    .end local v15    # "name":Ljava/lang/String;
    .end local v17    # "sliceName":Ljava/lang/String;
    .end local v18    # "sliceModified":J
    :catch_0
    move-exception v13

    .line 492
    .local v13, "ioe":Ljava/io/IOException;
    :try_start_2
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Failed to extract slices into directory "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-static {v0, v1, v13}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 493
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/io/File;

    move-object/from16 v25, v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 496
    :try_start_3
    invoke-virtual/range {v24 .. v24}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 502
    :goto_3
    :try_start_4
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 503
    :catch_1
    move-exception v26

    goto/16 :goto_0

    .line 445
    .end local v13    # "ioe":Ljava/io/IOException;
    .restart local v5    # "buffer":[B
    .restart local v9    # "dest":Ljava/io/File;
    .restart local v10    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v15    # "name":Ljava/lang/String;
    .restart local v17    # "sliceName":Ljava/lang/String;
    :cond_5
    :try_start_5
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_6

    .line 446
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Extracting slice "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, " into "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    :cond_6
    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v16

    .line 449
    .local v16, "parent":Ljava/io/File;
    if-eqz v16, :cond_7

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v25

    if-nez v25, :cond_7

    .line 450
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->mkdirs()Z

    move-result v7

    .line 451
    .local v7, "created":Z
    if-nez v7, :cond_7

    .line 452
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Failed to create directory "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/io/File;

    move-object/from16 v25, v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 496
    :try_start_6
    invoke-virtual/range {v24 .. v24}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 502
    :goto_4
    :try_start_7
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto/16 :goto_0

    .line 503
    :catch_2
    move-exception v26

    goto/16 :goto_0

    .line 457
    .end local v7    # "created":Z
    :cond_7
    :try_start_8
    new-instance v22, Ljava/io/BufferedOutputStream;

    new-instance v25, Ljava/io/FileOutputStream;

    move-object/from16 v0, v25

    invoke-direct {v0, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 460
    .local v22, "src":Ljava/io/OutputStream;
    :goto_5
    :try_start_9
    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v6

    .local v6, "bytesRead":I
    const/16 v25, -0x1

    move/from16 v0, v25

    if-eq v6, v0, :cond_8

    .line 461
    const/16 v25, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-virtual {v0, v5, v1, v6}, Ljava/io/OutputStream;->write([BII)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_5

    .line 464
    .end local v6    # "bytesRead":I
    :catchall_0
    move-exception v25

    :try_start_a
    invoke-virtual/range {v22 .. v22}, Ljava/io/OutputStream;->close()V

    throw v25
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 495
    .end local v5    # "buffer":[B
    .end local v9    # "dest":Ljava/io/File;
    .end local v10    # "entry":Ljava/util/zip/ZipEntry;
    .end local v15    # "name":Ljava/lang/String;
    .end local v16    # "parent":Ljava/io/File;
    .end local v17    # "sliceName":Ljava/lang/String;
    .end local v22    # "src":Ljava/io/OutputStream;
    :catchall_1
    move-exception v25

    .line 496
    :try_start_b
    invoke-virtual/range {v24 .. v24}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 498
    :goto_6
    :try_start_c
    throw v25
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 501
    .end local v24    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :catchall_2
    move-exception v25

    .line 502
    :try_start_d
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_8

    .line 504
    :goto_7
    throw v25

    .line 464
    .restart local v5    # "buffer":[B
    .restart local v6    # "bytesRead":I
    .restart local v9    # "dest":Ljava/io/File;
    .restart local v10    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v15    # "name":Ljava/lang/String;
    .restart local v16    # "parent":Ljava/io/File;
    .restart local v17    # "sliceName":Ljava/lang/String;
    .restart local v22    # "src":Ljava/io/OutputStream;
    .restart local v24    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :cond_8
    :try_start_e
    invoke-virtual/range {v22 .. v22}, Ljava/io/OutputStream;->close()V

    .line 466
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 467
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "File written at "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v28

    move-object/from16 v0, v26

    move-wide/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "File last modified reported : "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v28

    move-object/from16 v0, v26

    move-wide/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 474
    .end local v6    # "bytesRead":I
    .end local v9    # "dest":Ljava/io/File;
    .end local v15    # "name":Ljava/lang/String;
    .end local v16    # "parent":Ljava/io/File;
    .end local v17    # "sliceName":Ljava/lang/String;
    .end local v22    # "src":Ljava/io/OutputStream;
    :cond_9
    if-eqz p1, :cond_c

    .line 475
    move-object/from16 v4, p1

    .local v4, "arr$":[Ljava/io/File;
    array-length v14, v4

    .local v14, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_8
    if-ge v12, v14, :cond_c

    aget-object v11, v4, v12

    .line 476
    .local v11, "file":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_b

    .line 477
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_a

    .line 478
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Removing old slice "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    :cond_a
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    move-result v8

    .line 481
    .local v8, "deleted":Z
    if-nez v8, :cond_b

    .line 482
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_b

    .line 483
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Could not delete "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    .end local v8    # "deleted":Z
    :cond_b
    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    .line 490
    .end local v4    # "arr$":[Ljava/io/File;
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "i$":I
    .end local v14    # "len$":I
    :cond_c
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v25

    move/from16 v0, v25

    new-array v0, v0, [Ljava/io/File;

    move-object/from16 v25, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v25

    check-cast v25, [Ljava/io/File;
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 496
    :try_start_f
    invoke-virtual/range {v24 .. v24}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_5
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 502
    :goto_9
    :try_start_10
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_3

    goto/16 :goto_0

    .line 503
    :catch_3
    move-exception v26

    goto/16 :goto_0

    .line 497
    .restart local v7    # "created":Z
    .restart local v9    # "dest":Ljava/io/File;
    .restart local v15    # "name":Ljava/lang/String;
    .restart local v16    # "parent":Ljava/io/File;
    .restart local v17    # "sliceName":Ljava/lang/String;
    :catch_4
    move-exception v26

    goto/16 :goto_4

    .end local v7    # "created":Z
    .end local v9    # "dest":Ljava/io/File;
    .end local v15    # "name":Ljava/lang/String;
    .end local v16    # "parent":Ljava/io/File;
    .end local v17    # "sliceName":Ljava/lang/String;
    :catch_5
    move-exception v26

    goto :goto_9

    .end local v5    # "buffer":[B
    .end local v10    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v13    # "ioe":Ljava/io/IOException;
    :catch_6
    move-exception v26

    goto/16 :goto_3

    .end local v13    # "ioe":Ljava/io/IOException;
    :catch_7
    move-exception v26

    goto/16 :goto_6

    .line 503
    .end local v24    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :catch_8
    move-exception v26

    goto/16 :goto_7
.end method

.method public static extractZip(Ljava/io/File;Ljava/io/InputStream;)Z
    .locals 14
    .param p0, "destDir"    # Ljava/io/File;
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    const/4 v10, 0x0

    .line 588
    new-instance v9, Ljava/util/zip/ZipInputStream;

    invoke-direct {v9, p1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 590
    .local v9, "zipInputStream":Ljava/util/zip/ZipInputStream;
    const/16 v11, 0x7d0

    :try_start_0
    new-array v0, v11, [B

    .line 592
    .local v0, "buffer":[B
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v4

    .line 593
    .local v4, "entry":Ljava/util/zip/ZipEntry;
    :goto_0
    if-eqz v4, :cond_4

    .line 595
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    .line 597
    .local v6, "name":Ljava/lang/String;
    const-string/jumbo v11, "META-INF"

    invoke-virtual {v6, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 594
    :cond_0
    :goto_1
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v4

    goto :goto_0

    .line 600
    :cond_1
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v11

    if-nez v11, :cond_0

    .line 603
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 604
    .local v3, "dest":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 605
    .local v7, "parent":Ljava/io/File;
    if-eqz v7, :cond_2

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_2

    .line 606
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    move-result v2

    .line 607
    .local v2, "created":Z
    if-nez v2, :cond_2

    .line 608
    const-string/jumbo v11, "InstantRun"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Failed to create directory "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 631
    :try_start_1
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 633
    .end local v0    # "buffer":[B
    .end local v2    # "created":Z
    .end local v3    # "dest":Ljava/io/File;
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "parent":Ljava/io/File;
    :goto_2
    return v10

    .line 613
    .restart local v0    # "buffer":[B
    .restart local v3    # "dest":Ljava/io/File;
    .restart local v4    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v7    # "parent":Ljava/io/File;
    :cond_2
    :try_start_2
    new-instance v8, Ljava/io/BufferedOutputStream;

    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v11}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 616
    .local v8, "src":Ljava/io/OutputStream;
    :goto_3
    :try_start_3
    invoke-virtual {v9, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v1

    .local v1, "bytesRead":I
    const/4 v11, -0x1

    if-eq v1, v11, :cond_3

    .line 617
    const/4 v11, 0x0

    invoke-virtual {v8, v0, v11, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 620
    .end local v1    # "bytesRead":I
    :catchall_0
    move-exception v11

    :try_start_4
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    throw v11
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 626
    .end local v0    # "buffer":[B
    .end local v3    # "dest":Ljava/io/File;
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "parent":Ljava/io/File;
    .end local v8    # "src":Ljava/io/OutputStream;
    :catch_0
    move-exception v5

    .line 627
    .local v5, "ioe":Ljava/io/IOException;
    :try_start_5
    const-string/jumbo v11, "InstantRun"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Failed to extract zip contents into directory "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 631
    :try_start_6
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    .line 632
    :catch_1
    move-exception v11

    goto :goto_2

    .line 620
    .end local v5    # "ioe":Ljava/io/IOException;
    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    .restart local v3    # "dest":Ljava/io/File;
    .restart local v4    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v7    # "parent":Ljava/io/File;
    .restart local v8    # "src":Ljava/io/OutputStream;
    :cond_3
    :try_start_7
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1

    .line 630
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v3    # "dest":Ljava/io/File;
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "parent":Ljava/io/File;
    .end local v8    # "src":Ljava/io/OutputStream;
    :catchall_1
    move-exception v10

    .line 631
    :try_start_8
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 633
    :goto_4
    throw v10

    .line 625
    .restart local v0    # "buffer":[B
    .restart local v4    # "entry":Ljava/util/zip/ZipEntry;
    :cond_4
    const/4 v10, 0x1

    .line 631
    :try_start_9
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    goto :goto_2

    .line 632
    :catch_2
    move-exception v11

    goto :goto_2

    .restart local v2    # "created":Z
    .restart local v3    # "dest":Ljava/io/File;
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v7    # "parent":Ljava/io/File;
    :catch_3
    move-exception v11

    goto :goto_2

    .end local v0    # "buffer":[B
    .end local v2    # "created":Z
    .end local v3    # "dest":Ljava/io/File;
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "parent":Ljava/io/File;
    :catch_4
    move-exception v11

    goto :goto_4
.end method

.method public static extractZip(Ljava/io/File;[B)Z
    .locals 2
    .param p0, "destination"    # Ljava/io/File;
    .param p1, "zipBytes"    # [B

    .prologue
    .line 583
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 584
    .local v0, "inputStream":Ljava/io/InputStream;
    invoke-static {p0, v0}, Lcom/android/tools/fd/runtime/FileManager;->extractZip(Ljava/io/File;Ljava/io/InputStream;)Z

    move-result v1

    return v1
.end method

.method public static finishUpdate(Z)V
    .locals 0
    .param p0, "wroteResources"    # Z

    .prologue
    .line 643
    if-eqz p0, :cond_0

    .line 644
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->swapFolders()V

    .line 646
    :cond_0
    return-void
.end method

.method public static getCheckSum(Ljava/io/File;)[B
    .locals 10
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v8, 0x6

    .line 785
    :try_start_0
    const-string/jumbo v7, "MD5"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 786
    .local v1, "digest":Ljava/security/MessageDigest;
    const/16 v7, 0x1000

    new-array v0, v7, [B

    .line 787
    .local v0, "buffer":[B
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 790
    .local v3, "input":Ljava/io/BufferedInputStream;
    :goto_0
    :try_start_1
    invoke-virtual {v3, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v5

    .line 791
    .local v5, "read":I
    const/4 v7, -0x1

    if-ne v5, v7, :cond_0

    .line 796
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v7

    .line 798
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 813
    .end local v0    # "buffer":[B
    .end local v1    # "digest":Ljava/security/MessageDigest;
    .end local v3    # "input":Ljava/io/BufferedInputStream;
    .end local v5    # "read":I
    :goto_1
    return-object v7

    .line 794
    .restart local v0    # "buffer":[B
    .restart local v1    # "digest":Ljava/security/MessageDigest;
    .restart local v3    # "input":Ljava/io/BufferedInputStream;
    .restart local v5    # "read":I
    :cond_0
    const/4 v7, 0x0

    :try_start_3
    invoke-virtual {v1, v0, v7, v5}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 798
    .end local v5    # "read":I
    :catchall_0
    move-exception v7

    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    throw v7
    :try_end_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    .line 800
    .end local v0    # "buffer":[B
    .end local v1    # "digest":Ljava/security/MessageDigest;
    .end local v3    # "input":Ljava/io/BufferedInputStream;
    :catch_0
    move-exception v2

    .line 801
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    const-string/jumbo v7, "InstantRun"

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 802
    const-string/jumbo v7, "InstantRun"

    const-string/jumbo v8, "Couldn\'t look up message digest"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 813
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :cond_1
    :goto_2
    const/4 v7, 0x0

    goto :goto_1

    .line 804
    :catch_1
    move-exception v4

    .line 805
    .local v4, "ioe":Ljava/io/IOException;
    const-string/jumbo v7, "InstantRun"

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 806
    const-string/jumbo v7, "InstantRun"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to read file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 808
    .end local v4    # "ioe":Ljava/io/IOException;
    :catch_2
    move-exception v6

    .line 809
    .local v6, "t":Ljava/lang/Throwable;
    const-string/jumbo v7, "InstantRun"

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 810
    const-string/jumbo v7, "InstantRun"

    const-string/jumbo v8, "Unexpected checksum exception"

    invoke-static {v7, v8, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public static getCheckSum(Ljava/lang/String;)[B
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 765
    const-string/jumbo v1, "resources.ap_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 766
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getExternalResourceFile()Ljava/io/File;

    move-result-object v0

    .line 767
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 768
    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->getCheckSum(Ljava/io/File;)[B

    move-result-object v1

    .line 772
    .end local v0    # "file":Ljava/io/File;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getDataFolder()Ljava/io/File;
    .locals 2

    .prologue
    .line 100
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/tools/fd/runtime/Paths;->getDataDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static getDexFileFolder(Ljava/io/File;Z)Ljava/io/File;
    .locals 5
    .param p0, "base"    # Ljava/io/File;
    .param p1, "createIfNecessary"    # Z

    .prologue
    .line 114
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "dex"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 115
    .local v1, "file":Ljava/io/File;
    if-eqz p1, :cond_0

    .line 116
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_0

    .line 117
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 118
    .local v0, "created":Z
    if-nez v0, :cond_0

    .line 119
    const-string/jumbo v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Failed to create directory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const/4 v1, 0x0

    .line 125
    .end local v0    # "created":Z
    .end local v1    # "file":Ljava/io/File;
    :cond_0
    return-object v1
.end method

.method public static getDexList(Landroid/content/Context;J)Ljava/util/List;
    .locals 27
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apkModified"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 285
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v5

    .line 287
    .local v5, "dataFolder":Ljava/io/File;
    invoke-static {v5}, Lcom/android/tools/fd/runtime/FileManager;->getMostRecentTempDexTime(Ljava/io/File;)J

    move-result-wide v18

    .line 291
    .local v18, "newestHotswapPatch":J
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/android/tools/fd/runtime/FileManager;->getDexFileFolder(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v8

    .line 305
    .local v8, "dexFolder":Ljava/io/File;
    const/4 v9, 0x0

    .line 307
    .local v9, "extractedSlices":Z
    if-eqz v8, :cond_0

    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v22

    if-nez v22, :cond_6

    .line 310
    :cond_0
    const-string/jumbo v22, "InstantRun"

    const/16 v23, 0x2

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v22

    if-eqz v22, :cond_1

    .line 311
    const-string/jumbo v22, "InstantRun"

    const-string/jumbo v23, "No local dex slice folder: First run since installation."

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    :cond_1
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/android/tools/fd/runtime/FileManager;->getDexFileFolder(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v8

    .line 314
    if-nez v8, :cond_2

    .line 316
    const-string/jumbo v22, "InstantRun"

    const-string/jumbo v23, "Couldn\'t create dex code folder"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v14

    .line 383
    :goto_0
    return-object v14

    .line 319
    :cond_2
    const/16 v22, 0x0

    const-wide/16 v24, -0x1

    move-object/from16 v0, v22

    move-wide/from16 v1, v24

    invoke-static {v8, v0, v1, v2}, Lcom/android/tools/fd/runtime/FileManager;->extractSlices(Ljava/io/File;[Ljava/io/File;J)[Ljava/io/File;

    move-result-object v7

    .line 320
    .local v7, "dexFiles":[Ljava/io/File;
    array-length v0, v7

    move/from16 v22, v0

    if-lez v22, :cond_5

    const/4 v9, 0x1

    .line 324
    :goto_1
    if-eqz v7, :cond_3

    array-length v0, v7

    move/from16 v22, v0

    if-nez v22, :cond_7

    .line 325
    :cond_3
    const-string/jumbo v22, "InstantRun"

    const/16 v23, 0x2

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v22

    if-eqz v22, :cond_4

    .line 326
    const-string/jumbo v22, "InstantRun"

    const-string/jumbo v23, "Cannot find dex classes, not patching them in"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    :cond_4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v14

    goto :goto_0

    .line 320
    :cond_5
    const/4 v9, 0x0

    goto :goto_1

    .line 322
    .end local v7    # "dexFiles":[Ljava/io/File;
    :cond_6
    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v7

    .restart local v7    # "dexFiles":[Ljava/io/File;
    goto :goto_1

    .line 337
    :cond_7
    move-wide/from16 v16, p1

    .line 338
    .local v16, "newestColdswapPatch":J
    if-nez v9, :cond_e

    array-length v0, v7

    move/from16 v22, v0

    if-lez v22, :cond_e

    .line 339
    move-wide/from16 v20, p1

    .line 340
    .local v20, "oldestColdSwapPatch":J
    move-object v4, v7

    .local v4, "arr$":[Ljava/io/File;
    array-length v13, v4

    .local v13, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_2
    if-ge v12, v13, :cond_8

    aget-object v6, v4, v12

    .line 341
    .local v6, "dex":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    .line 342
    .local v10, "dexModified":J
    move-wide/from16 v0, v20

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v20

    .line 343
    move-wide/from16 v0, v16

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v16

    .line 340
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 345
    .end local v6    # "dex":Ljava/io/File;
    .end local v10    # "dexModified":J
    :cond_8
    cmp-long v22, v20, p1

    if-gez v22, :cond_a

    .line 348
    const-string/jumbo v22, "InstantRun"

    const/16 v23, 0x2

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v22

    if-eqz v22, :cond_9

    .line 349
    const-string/jumbo v22, "InstantRun"

    const-string/jumbo v23, "One or more slices were older than APK: extracting newer slices"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    :cond_9
    move-wide/from16 v0, p1

    invoke-static {v8, v7, v0, v1}, Lcom/android/tools/fd/runtime/FileManager;->extractSlices(Ljava/io/File;[Ljava/io/File;J)[Ljava/io/File;

    move-result-object v7

    .line 359
    .end local v4    # "arr$":[Ljava/io/File;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v20    # "oldestColdSwapPatch":J
    :cond_a
    :goto_3
    cmp-long v22, v18, v16

    if-lez v22, :cond_c

    .line 360
    const-string/jumbo v15, "Your app does not have the latest code changes because it was restarted manually. Please run from IDE instead."

    .line 363
    .local v15, "message":Ljava/lang/String;
    const-string/jumbo v22, "InstantRun"

    const/16 v23, 0x2

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v22

    if-eqz v22, :cond_b

    .line 364
    const-string/jumbo v22, "InstantRun"

    move-object/from16 v0, v22

    invoke-static {v0, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    :cond_b
    move-object/from16 v0, p0

    invoke-static {v0, v15}, Lcom/android/tools/fd/runtime/Restarter;->showToastWhenPossible(Landroid/content/Context;Ljava/lang/String;)V

    .line 372
    .end local v15    # "message":Ljava/lang/String;
    :cond_c
    new-instance v14, Ljava/util/ArrayList;

    array-length v0, v7

    move/from16 v22, v0

    move/from16 v0, v22

    invoke-direct {v14, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 373
    .local v14, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v4, v7

    .restart local v4    # "arr$":[Ljava/io/File;
    array-length v13, v4

    .restart local v13    # "len$":I
    const/4 v12, 0x0

    .restart local v12    # "i$":I
    :goto_4
    if-ge v12, v13, :cond_f

    aget-object v6, v4, v12

    .line 374
    .restart local v6    # "dex":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v22

    const-string/jumbo v23, ".dex"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_d

    .line 375
    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 373
    :cond_d
    add-int/lit8 v12, v12, 0x1

    goto :goto_4

    .line 353
    .end local v4    # "arr$":[Ljava/io/File;
    .end local v6    # "dex":Ljava/io/File;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v14    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_e
    const-wide/16 v22, 0x0

    cmp-long v22, v18, v22

    if-lez v22, :cond_a

    .line 356
    invoke-static {v5}, Lcom/android/tools/fd/runtime/FileManager;->purgeTempDexFiles(Ljava/io/File;)V

    goto :goto_3

    .line 381
    .restart local v4    # "arr$":[Ljava/io/File;
    .restart local v12    # "i$":I
    .restart local v13    # "len$":I
    .restart local v14    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_f
    invoke-static {}, Ljava/util/Collections;->reverseOrder()Ljava/util/Comparator;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-static {v14, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto/16 :goto_0
.end method

.method public static getExternalResourceFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 268
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getReadFolder()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/android/tools/fd/runtime/FileManager;->getResourceFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 269
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 270
    const-string/jumbo v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 271
    const-string/jumbo v1, "InstantRun"

    const-string/jumbo v2, "Cannot find external resources, not patching them in"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    :cond_0
    const/4 v0, 0x0

    .line 276
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    return-object v0
.end method

.method public static getFileSize(Ljava/lang/String;)J
    .locals 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 752
    const-string/jumbo v1, "resources.ap_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 753
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getExternalResourceFile()Ljava/io/File;

    move-result-object v0

    .line 754
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 755
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 759
    .end local v0    # "file":Ljava/io/File;
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public static getMostRecentTempDexTime(Ljava/io/File;)J
    .locals 10
    .param p0, "dataFolder"    # Ljava/io/File;

    .prologue
    const-wide/16 v6, 0x0

    .line 706
    invoke-static {p0}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 707
    .local v1, "dexFolder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_1

    .line 722
    :cond_0
    return-wide v6

    .line 710
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 711
    .local v3, "files":[Ljava/io/File;
    if-eqz v3, :cond_0

    .line 715
    const-wide/16 v6, 0x0

    .line 716
    .local v6, "newest":J
    move-object v0, v3

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v2, v0, v4

    .line 717
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ".dex"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 718
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 716
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public static getNativeLibraryFolder()Ljava/io/File;
    .locals 3

    .prologue
    .line 138
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/tools/fd/runtime/Paths;->getMainApkDataDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "lib"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getReadFolder()Ljava/io/File;
    .locals 3

    .prologue
    .line 146
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->leftIsActive()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "left"

    .line 147
    .local v0, "name":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1

    .line 146
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    const-string/jumbo v0, "right"

    goto :goto_0
.end method

.method private static getResourceFile(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p0, "base"    # Ljava/io/File;

    .prologue
    .line 106
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "resources.ap_"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getTempDexFile()Ljava/io/File;
    .locals 17

    .prologue
    .line 512
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    .line 513
    .local v2, "dataFolder":Ljava/io/File;
    invoke-static {v2}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 514
    .local v3, "dexFolder":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_1

    .line 515
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 516
    .local v1, "created":Z
    if-nez v1, :cond_2

    .line 517
    const-string/jumbo v13, "InstantRun"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Failed to create directory "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    const/4 v4, 0x0

    .line 560
    .end local v1    # "created":Z
    :cond_0
    :goto_0
    return-object v4

    .line 526
    :cond_1
    sget-boolean v13, Lcom/android/tools/fd/runtime/FileManager;->sHavePurgedTempDexFolder:Z

    if-nez v13, :cond_2

    .line 527
    invoke-static {v2}, Lcom/android/tools/fd/runtime/FileManager;->purgeTempDexFiles(Ljava/io/File;)V

    .line 531
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .line 532
    .local v6, "files":[Ljava/io/File;
    const/4 v9, -0x1

    .line 535
    .local v9, "max":I
    if-eqz v6, :cond_4

    .line 536
    move-object v0, v6

    .local v0, "arr$":[Ljava/io/File;
    array-length v8, v0

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_1
    if-ge v7, v8, :cond_4

    aget-object v4, v0, v7

    .line 537
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    .line 538
    .local v11, "name":Ljava/lang/String;
    const-string/jumbo v13, "reload"

    invoke-virtual {v11, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    const-string/jumbo v13, ".dex"

    invoke-virtual {v11, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 539
    const-string/jumbo v13, "reload"

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v14

    const-string/jumbo v15, ".dex"

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    sub-int/2addr v14, v15

    invoke-virtual {v11, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 542
    .local v10, "middle":Ljava/lang/String;
    :try_start_0
    invoke-static {v10}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    .line 543
    .local v12, "version":I
    if-le v12, v9, :cond_3

    .line 544
    move v9, v12

    .line 536
    .end local v10    # "middle":Ljava/lang/String;
    .end local v12    # "version":I
    :cond_3
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 552
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v4    # "file":Ljava/io/File;
    .end local v7    # "i$":I
    .end local v8    # "len$":I
    .end local v11    # "name":Ljava/lang/String;
    :cond_4
    const-string/jumbo v13, "%s0x%04x%s"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "reload"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    add-int/lit8 v16, v9, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string/jumbo v16, ".dex"

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 554
    .local v5, "fileName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 556
    .restart local v4    # "file":Ljava/io/File;
    const-string/jumbo v13, "InstantRun"

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 557
    const-string/jumbo v13, "InstantRun"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Writing new dex file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 546
    .end local v5    # "fileName":Ljava/lang/String;
    .restart local v0    # "arr$":[Ljava/io/File;
    .restart local v7    # "i$":I
    .restart local v8    # "len$":I
    .restart local v10    # "middle":Ljava/lang/String;
    .restart local v11    # "name":Ljava/lang/String;
    :catch_0
    move-exception v13

    goto :goto_2
.end method

.method private static getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p0, "base"    # Ljava/io/File;

    .prologue
    .line 134
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "dex-temp"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getWriteFolder(Z)Ljava/io/File;
    .locals 6
    .param p0, "wipe"    # Z

    .prologue
    .line 163
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->leftIsActive()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string/jumbo v2, "right"

    .line 164
    .local v2, "name":Ljava/lang/String;
    :goto_0
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 165
    .local v0, "folder":Ljava/io/File;
    if-eqz p0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 166
    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->delete(Ljava/io/File;)V

    .line 167
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 168
    .local v1, "mkdirs":Z
    if-nez v1, :cond_0

    .line 169
    const-string/jumbo v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to create folder "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .end local v1    # "mkdirs":Z
    :cond_0
    return-object v0

    .line 163
    .end local v0    # "folder":Ljava/io/File;
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    const-string/jumbo v2, "left"

    goto :goto_0
.end method

.method private static leftIsActive()Z
    .locals 7

    .prologue
    const/4 v5, 0x1

    .line 194
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v0

    .line 195
    .local v0, "folder":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v6, "active"

    invoke-direct {v3, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 196
    .local v3, "pointer":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 208
    :goto_0
    return v5

    .line 200
    :cond_0
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    .local v4, "reader":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "line":Ljava/lang/String;
    const-string/jumbo v6, "left"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    .line 205
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    move v5, v6

    goto :goto_0

    .end local v2    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v6

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    throw v6
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 207
    .end local v4    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 208
    .local v1, "ignore":Ljava/io/IOException;
    goto :goto_0
.end method

.method public static purgeTempDexFiles(Ljava/io/File;)V
    .locals 10
    .param p0, "dataFolder"    # Ljava/io/File;

    .prologue
    .line 729
    const/4 v7, 0x1

    sput-boolean v7, Lcom/android/tools/fd/runtime/FileManager;->sHavePurgedTempDexFolder:Z

    .line 731
    invoke-static {p0}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 732
    .local v2, "dexFolder":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_1

    .line 748
    :cond_0
    return-void

    .line 735
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 736
    .local v4, "files":[Ljava/io/File;
    if-eqz v4, :cond_0

    .line 740
    move-object v0, v4

    .local v0, "arr$":[Ljava/io/File;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v3, v0, v5

    .line 741
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ".dex"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 742
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    .line 743
    .local v1, "deleted":Z
    if-nez v1, :cond_2

    .line 744
    const-string/jumbo v7, "InstantRun"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Could not delete temp dex file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    .end local v1    # "deleted":Z
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method public static readRawBytes(Ljava/io/File;)[B
    .locals 13
    .param p0, "source"    # Ljava/io/File;

    .prologue
    const/4 v8, 0x0

    const/4 v12, 0x2

    .line 818
    :try_start_0
    const-string/jumbo v9, "InstantRun"

    const/4 v10, 0x2

    invoke-static {v9, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 819
    const-string/jumbo v9, "InstantRun"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Reading the bytes for file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 821
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 822
    .local v4, "length":J
    const-wide/32 v10, 0x7fffffff

    cmp-long v9, v4, v10

    if-lez v9, :cond_2

    .line 823
    const-string/jumbo v9, "InstantRun"

    const/4 v10, 0x2

    invoke-static {v9, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 824
    const-string/jumbo v9, "InstantRun"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "File too large ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    move-object v7, v8

    .line 857
    .end local v4    # "length":J
    :goto_0
    return-object v7

    .line 828
    .restart local v4    # "length":J
    :cond_2
    long-to-int v9, v4

    new-array v7, v9, [B

    .line 830
    .local v7, "result":[B
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 832
    .local v1, "input":Ljava/io/BufferedInputStream;
    const/4 v0, 0x0

    .line 833
    .local v0, "index":I
    :try_start_1
    array-length v9, v7

    sub-int v6, v9, v0

    .line 834
    .local v6, "remaining":I
    :goto_1
    if-lez v6, :cond_3

    .line 835
    invoke-virtual {v1, v7, v0, v6}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v3

    .line 836
    .local v3, "numRead":I
    const/4 v9, -0x1

    if-ne v3, v9, :cond_7

    .line 842
    .end local v3    # "numRead":I
    :cond_3
    const-string/jumbo v9, "InstantRun"

    const/4 v10, 0x2

    invoke-static {v9, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 843
    const-string/jumbo v9, "InstantRun"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Returning length "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, v7

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " for file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 847
    :cond_4
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 849
    .end local v0    # "index":I
    .end local v1    # "input":Ljava/io/BufferedInputStream;
    .end local v4    # "length":J
    .end local v6    # "remaining":I
    .end local v7    # "result":[B
    :catch_0
    move-exception v2

    .line 850
    .local v2, "ioe":Ljava/io/IOException;
    const-string/jumbo v9, "InstantRun"

    const/4 v10, 0x6

    invoke-static {v9, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 851
    const-string/jumbo v9, "InstantRun"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Failed to read file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 854
    :cond_5
    const-string/jumbo v9, "InstantRun"

    invoke-static {v9, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 855
    const-string/jumbo v9, "InstantRun"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "I/O error, no bytes returned for "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    move-object v7, v8

    .line 857
    goto/16 :goto_0

    .line 839
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v0    # "index":I
    .restart local v1    # "input":Ljava/io/BufferedInputStream;
    .restart local v3    # "numRead":I
    .restart local v4    # "length":J
    .restart local v6    # "remaining":I
    .restart local v7    # "result":[B
    :cond_7
    add-int/2addr v0, v3

    .line 840
    sub-int/2addr v6, v3

    .line 841
    goto/16 :goto_1

    .line 847
    .end local v3    # "numRead":I
    .end local v6    # "remaining":I
    :catchall_0
    move-exception v9

    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    throw v9
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
.end method

.method private static setLeftActive(Z)V
    .locals 8
    .param p0, "active"    # Z

    .prologue
    .line 213
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    .line 214
    .local v2, "folder":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v5, "active"

    invoke-direct {v3, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 215
    .local v3, "pointer":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 216
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    .line 217
    .local v1, "deleted":Z
    if-nez v1, :cond_0

    .line 218
    const-string/jumbo v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Failed to delete file "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    .end local v1    # "deleted":Z
    :cond_0
    :try_start_0
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    .local v4, "writer":Ljava/io/Writer;
    if-eqz p0, :cond_3

    :try_start_1
    const-string/jumbo v5, "left"

    :goto_0
    invoke-virtual {v4, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 234
    :try_start_2
    invoke-virtual {v4}, Ljava/io/Writer;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 238
    .end local v4    # "writer":Ljava/io/Writer;
    :cond_1
    :goto_1
    return-void

    .line 220
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 221
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 222
    .local v0, "create":Z
    if-nez v0, :cond_1

    .line 223
    const-string/jumbo v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Failed to create directory "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 232
    .end local v0    # "create":Z
    .restart local v4    # "writer":Ljava/io/Writer;
    :cond_3
    :try_start_3
    const-string/jumbo v5, "right"
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 234
    :catchall_0
    move-exception v5

    :try_start_4
    invoke-virtual {v4}, Ljava/io/Writer;->close()V

    throw v5
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 236
    .end local v4    # "writer":Ljava/io/Writer;
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method public static startUpdate()V
    .locals 1

    .prologue
    .line 639
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->getWriteFolder(Z)Ljava/io/File;

    .line 640
    return-void
.end method

.method public static swapFolders()V
    .locals 1

    .prologue
    .line 155
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->leftIsActive()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->setLeftActive(Z)V

    .line 156
    return-void

    .line 155
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static writeAaptResources(Ljava/lang/String;[B)V
    .locals 7
    .param p0, "relativePath"    # Ljava/lang/String;
    .param p1, "bytes"    # [B

    .prologue
    .line 661
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/android/tools/fd/runtime/FileManager;->getWriteFolder(Z)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/android/tools/fd/runtime/FileManager;->getResourceFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 662
    .local v3, "resourceFile":Ljava/io/File;
    move-object v1, v3

    .line 666
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 667
    .local v2, "folder":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_1

    .line 668
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 669
    .local v0, "created":Z
    if-nez v0, :cond_1

    .line 670
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 671
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Cannot create local resource file directory "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 687
    .end local v0    # "created":Z
    :cond_0
    :goto_0
    return-void

    .line 677
    :cond_1
    const-string/jumbo v4, "resources.ap_"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 682
    invoke-static {v1, p1}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    goto :goto_0

    .line 685
    :cond_2
    invoke-static {v1, p1}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    goto :goto_0
.end method

.method public static writeDexShard([BLjava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 650
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/android/tools/fd/runtime/FileManager;->getDexFileFolder(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v0

    .line 651
    .local v0, "dexFolder":Ljava/io/File;
    if-nez v0, :cond_0

    .line 652
    const/4 v1, 0x0

    .line 656
    :goto_0
    return-object v1

    .line 654
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 655
    .local v1, "file":Ljava/io/File;
    invoke-static {v1, p0}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    goto :goto_0
.end method

.method public static writeRawBytes(Ljava/io/File;[B)Z
    .locals 6
    .param p0, "destination"    # Ljava/io/File;
    .param p1, "bytes"    # [B

    .prologue
    const/4 v5, 0x1

    .line 565
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 567
    .local v1, "output":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 568
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 571
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    return v5

    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 573
    .end local v1    # "output":Ljava/io/BufferedOutputStream;
    :catch_0
    move-exception v0

    .line 574
    .local v0, "ioe":Ljava/io/IOException;
    const-string/jumbo v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Failed to write file, clean project and rebuild "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 575
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "InstantRun could not write file %1$s, clean project and rebuild "

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static writeTempDexFile([B)Ljava/lang/String;
    .locals 3
    .param p0, "bytes"    # [B

    .prologue
    .line 691
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFile()Ljava/io/File;

    move-result-object v0

    .line 692
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 693
    invoke-static {v0, p0}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    .line 694
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 698
    :goto_0
    return-object v1

    .line 696
    :cond_0
    const-string/jumbo v1, "InstantRun"

    const-string/jumbo v2, "No file to write temp dex content to"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 698
    const/4 v1, 0x0

    goto :goto_0
.end method
