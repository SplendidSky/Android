.class Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/fd/runtime/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketServerReplyThread"
.end annotation


# instance fields
.field private final mSocket:Landroid/net/LocalSocket;

.field final synthetic this$0:Lcom/android/tools/fd/runtime/Server;


# direct methods
.method constructor <init>(Lcom/android/tools/fd/runtime/Server;Landroid/net/LocalSocket;)V
    .locals 0
    .param p2, "socket"    # Landroid/net/LocalSocket;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 181
    iput-object p2, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->mSocket:Landroid/net/LocalSocket;

    .line 182
    return-void
.end method

.method private authenticate(Ljava/io/DataInputStream;)Z
    .locals 6
    .param p1, "input"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    .line 348
    .local v0, "token":J
    sget-wide v2, Lcom/android/tools/fd/runtime/AppInfo;->token:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 349
    const-string/jumbo v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Mismatched identity token from client; received "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " and expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/android/tools/fd/runtime/AppInfo;->token:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    # operator++ for: Lcom/android/tools/fd/runtime/Server;->sWrongTokenCount:I
    invoke-static {}, Lcom/android/tools/fd/runtime/Server;->access$208()I

    .line 352
    const/4 v2, 0x0

    .line 354
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private handle(Ljava/io/DataInputStream;Ljava/io/DataOutputStream;)V
    .locals 30
    .param p1, "input"    # Ljava/io/DataInputStream;
    .param p2, "output"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v16

    .line 210
    .local v16, "magic":J
    const-wide/32 v26, 0x35107124

    cmp-long v25, v16, v26

    if-eqz v25, :cond_1

    .line 211
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Unrecognized header format "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    :cond_0
    :goto_0
    return-void

    .line 215
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v24

    .line 218
    .local v24, "version":I
    const/16 v25, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 220
    const/16 v25, 0x4

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_2

    .line 221
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Mismatched protocol versions; app is using version 4 and tool is using version "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 241
    .local v15, "message":I
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    move-object/from16 v25, v0

    # getter for: Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;
    invoke-static/range {v25 .. v25}, Lcom/android/tools/fd/runtime/Server;->access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/app/Application;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v25

    if-eqz v25, :cond_3

    const/4 v4, 0x1

    .line 242
    .local v4, "active":Z
    :goto_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 243
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 244
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Received Ping message from the IDE; returned active = "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .end local v4    # "active":Z
    .end local v15    # "message":I
    :cond_2
    :goto_2
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v15

    .line 229
    .restart local v15    # "message":I
    packed-switch v15, :pswitch_data_0

    .line 334
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x6

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 335
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Unexpected message type: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 231
    :pswitch_1
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 232
    const-string/jumbo v25, "InstantRun"

    const-string/jumbo v26, "Received EOF from the IDE"

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 241
    :cond_3
    const/4 v4, 0x0

    goto :goto_1

    .line 251
    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v18

    .line 252
    .local v18, "path":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Lcom/android/tools/fd/runtime/FileManager;->getFileSize(Ljava/lang/String;)J

    move-result-wide v20

    .line 253
    .local v20, "size":J
    move-object/from16 v0, p2

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 254
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 255
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Received path-exists("

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ") from the "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "IDE; returned size="

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 262
    .end local v18    # "path":Ljava/lang/String;
    .end local v20    # "size":J
    :pswitch_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 263
    .local v6, "begin":J
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v18

    .line 264
    .restart local v18    # "path":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Lcom/android/tools/fd/runtime/FileManager;->getCheckSum(Ljava/lang/String;)[B

    move-result-object v9

    .line 265
    .local v9, "checksum":[B
    if-eqz v9, :cond_4

    .line 266
    array-length v0, v9

    move/from16 v25, v0

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 267
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/io/DataOutputStream;->write([B)V

    .line 268
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 269
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 270
    .local v10, "end":J
    new-instance v25, Ljava/math/BigInteger;

    const/16 v26, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-direct {v0, v1, v9}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v26, 0x10

    invoke-virtual/range {v25 .. v26}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v14

    .line 271
    .local v14, "hash":Ljava/lang/String;
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Received checksum("

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ") from the "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "IDE: took "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v28, v10, v6

    move-object/from16 v0, v26

    move-wide/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "ms to compute "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 275
    .end local v10    # "end":J
    .end local v14    # "hash":Ljava/lang/String;
    :cond_4
    const/16 v25, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 276
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 277
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Received checksum("

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, ") from the "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string/jumbo v27, "IDE: returning <null>"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 285
    .end local v6    # "begin":J
    .end local v9    # "checksum":[B
    .end local v18    # "path":Ljava/lang/String;
    :pswitch_4
    invoke-direct/range {p0 .. p1}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->authenticate(Ljava/io/DataInputStream;)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    move-object/from16 v25, v0

    # getter for: Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;
    invoke-static/range {v25 .. v25}, Lcom/android/tools/fd/runtime/Server;->access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/app/Application;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    .line 290
    .local v5, "activity":Landroid/app/Activity;
    if-eqz v5, :cond_2

    .line 291
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_5

    .line 292
    const-string/jumbo v25, "InstantRun"

    const-string/jumbo v26, "Restarting activity per user request"

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    :cond_5
    invoke-static {v5}, Lcom/android/tools/fd/runtime/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V

    goto/16 :goto_2

    .line 300
    .end local v5    # "activity":Landroid/app/Activity;
    :pswitch_5
    invoke-direct/range {p0 .. p1}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->authenticate(Ljava/io/DataInputStream;)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 304
    invoke-static/range {p1 .. p1}, Lcom/android/tools/fd/runtime/ApplicationPatch;->read(Ljava/io/DataInputStream;)Ljava/util/List;

    move-result-object v8

    .line 305
    .local v8, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    if-eqz v8, :cond_2

    .line 309
    # invokes: Lcom/android/tools/fd/runtime/Server;->hasResources(Ljava/util/List;)Z
    invoke-static {v8}, Lcom/android/tools/fd/runtime/Server;->access$400(Ljava/util/List;)Z

    move-result v13

    .line 310
    .local v13, "hasResources":Z
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v23

    .line 311
    .local v23, "updateMode":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move/from16 v1, v23

    # invokes: Lcom/android/tools/fd/runtime/Server;->handlePatches(Ljava/util/List;ZI)I
    invoke-static {v0, v8, v13, v1}, Lcom/android/tools/fd/runtime/Server;->access$500(Lcom/android/tools/fd/runtime/Server;Ljava/util/List;ZI)I

    move-result v23

    .line 313
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v19

    .line 316
    .local v19, "showToast":Z
    const/16 v25, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move/from16 v1, v23

    move/from16 v2, v19

    # invokes: Lcom/android/tools/fd/runtime/Server;->restart(IZZ)V
    invoke-static {v0, v1, v13, v2}, Lcom/android/tools/fd/runtime/Server;->access$600(Lcom/android/tools/fd/runtime/Server;IZZ)V

    goto/16 :goto_2

    .line 323
    .end local v8    # "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    .end local v13    # "hasResources":Z
    .end local v19    # "showToast":Z
    .end local v23    # "updateMode":I
    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v22

    .line 324
    .local v22, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    move-object/from16 v25, v0

    # getter for: Lcom/android/tools/fd/runtime/Server;->mApplication:Landroid/app/Application;
    invoke-static/range {v25 .. v25}, Lcom/android/tools/fd/runtime/Server;->access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/app/Application;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v12

    .line 325
    .local v12, "foreground":Landroid/app/Activity;
    if-eqz v12, :cond_6

    .line 326
    move-object/from16 v0, v22

    invoke-static {v12, v0}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 327
    :cond_6
    const-string/jumbo v25, "InstantRun"

    const/16 v26, 0x2

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 328
    const-string/jumbo v25, "InstantRun"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v27, "Couldn\'t show toast (no activity) : "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 229
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 187
    :try_start_0
    new-instance v1, Ljava/io/DataInputStream;

    iget-object v3, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 188
    .local v1, "input":Ljava/io/DataInputStream;
    new-instance v2, Ljava/io/DataOutputStream;

    iget-object v3, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .local v2, "output":Ljava/io/DataOutputStream;
    :try_start_1
    invoke-direct {p0, v1, v2}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->handle(Ljava/io/DataInputStream;Ljava/io/DataOutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    :try_start_2
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 197
    :goto_0
    :try_start_3
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 206
    .end local v1    # "input":Ljava/io/DataInputStream;
    .end local v2    # "output":Ljava/io/DataOutputStream;
    :cond_0
    :goto_1
    return-void

    .line 192
    .restart local v1    # "input":Ljava/io/DataInputStream;
    .restart local v2    # "output":Ljava/io/DataOutputStream;
    :catchall_0
    move-exception v3

    .line 193
    :try_start_4
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 197
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 199
    :goto_3
    :try_start_6
    throw v3
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 201
    .end local v1    # "input":Ljava/io/DataInputStream;
    .end local v2    # "output":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v3, "InstantRun"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 203
    const-string/jumbo v3, "InstantRun"

    const-string/jumbo v4, "Fatal error receiving messages"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 194
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "input":Ljava/io/DataInputStream;
    .restart local v2    # "output":Ljava/io/DataOutputStream;
    :catch_1
    move-exception v3

    goto :goto_0

    .line 198
    :catch_2
    move-exception v3

    goto :goto_1

    .line 194
    :catch_3
    move-exception v4

    goto :goto_2

    .line 198
    :catch_4
    move-exception v4

    goto :goto_3
.end method
