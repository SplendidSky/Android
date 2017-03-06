.class public Lcom/android/tools/fd/runtime/MonkeyPatcher;
.super Ljava/lang/Object;
.source "MonkeyPatcher.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .line 254
    if-nez p1, :cond_0

    .line 255
    :try_start_0
    const-string/jumbo v7, "android.app.ActivityThread"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 257
    :cond_0
    const-string/jumbo v7, "currentActivityThread"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {p1, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 258
    .local v3, "m":Ljava/lang/reflect/Method;
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 259
    const/4 v7, 0x0

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v3, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 260
    .local v1, "currentActivityThread":Ljava/lang/Object;
    if-nez v1, :cond_1

    if-eqz p0, :cond_1

    .line 264
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "mLoadedApk"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 265
    .local v5, "mLoadedApk":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 266
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 267
    .local v0, "apk":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "mActivityThread"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 268
    .local v4, "mActivityThreadField":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 269
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 273
    .end local v0    # "apk":Ljava/lang/Object;
    .end local v1    # "currentActivityThread":Ljava/lang/Object;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    .end local v4    # "mActivityThreadField":Ljava/lang/reflect/Field;
    .end local v5    # "mLoadedApk":Ljava/lang/reflect/Field;
    :cond_1
    :goto_0
    return-object v1

    .line 272
    :catch_0
    move-exception v2

    .local v2, "ignore":Ljava/lang/Throwable;
    move-object v1, v6

    .line 273
    goto :goto_0
.end method

.method public static monkeyPatchApplication(Landroid/content/Context;Landroid/app/Application;Landroid/app/Application;Ljava/lang/String;)V
    .locals 25
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "bootstrap"    # Landroid/app/Application;
    .param p2, "realApplication"    # Landroid/app/Application;
    .param p3, "externalResourceFile"    # Ljava/lang/String;

    .prologue
    .line 165
    :try_start_0
    const-string/jumbo v23, "android.app.ActivityThread"

    invoke-static/range {v23 .. v23}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 166
    .local v2, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    .line 169
    .local v5, "currentActivityThread":Ljava/lang/Object;
    const-string/jumbo v23, "mInitialApplication"

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v19

    .line 170
    .local v19, "mInitialApplication":Ljava/lang/reflect/Field;
    const/16 v23, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 171
    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/Application;

    .line 172
    .local v13, "initialApplication":Landroid/app/Application;
    if-eqz p2, :cond_0

    move-object/from16 v0, p1

    if-ne v13, v0, :cond_0

    .line 173
    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 178
    :cond_0
    if-eqz p2, :cond_2

    .line 179
    const-string/jumbo v23, "mAllApplications"

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v17

    .line 180
    .local v17, "mAllApplications":Ljava/lang/reflect/Field;
    const/16 v23, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 181
    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 183
    .local v3, "allApplications":Ljava/util/List;, "Ljava/util/List<Landroid/app/Application;>;"
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v23

    move/from16 v0, v23

    if-ge v10, v0, :cond_2

    .line 184
    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_1

    .line 185
    move-object/from16 v0, p2

    invoke-interface {v3, v10, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 195
    .end local v3    # "allApplications":Ljava/util/List;, "Ljava/util/List<Landroid/app/Application;>;"
    .end local v10    # "i":I
    .end local v17    # "mAllApplications":Ljava/lang/reflect/Field;
    :cond_2
    :try_start_1
    const-string/jumbo v23, "android.app.LoadedApk"

    invoke-static/range {v23 .. v23}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v16

    .line 199
    .local v16, "loadedApkClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    :try_start_2
    const-string/jumbo v23, "mApplication"

    move-object/from16 v0, v16

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v18

    .line 200
    .local v18, "mApplication":Ljava/lang/reflect/Field;
    const/16 v23, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 201
    const-string/jumbo v23, "mResDir"

    move-object/from16 v0, v16

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v21

    .line 202
    .local v21, "mResDir":Ljava/lang/reflect/Field;
    const/16 v23, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 206
    const/16 v20, 0x0

    .line 208
    .local v20, "mLoadedApk":Ljava/lang/reflect/Field;
    :try_start_3
    const-class v23, Landroid/app/Application;

    const-string/jumbo v24, "mLoadedApk"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v20

    .line 219
    :goto_2
    const/16 v23, 0x2

    :try_start_4
    move/from16 v0, v23

    new-array v4, v0, [Ljava/lang/String;

    const/16 v23, 0x0

    const-string/jumbo v24, "mPackages"

    aput-object v24, v4, v23

    const/16 v23, 0x1

    const-string/jumbo v24, "mResourcePackages"

    aput-object v24, v4, v23

    .local v4, "arr$":[Ljava/lang/String;
    array-length v14, v4

    .local v14, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    move v12, v11

    .end local v11    # "i$":I
    .local v12, "i$":I
    :goto_3
    if-ge v12, v14, :cond_7

    aget-object v9, v4, v12

    .line 220
    .local v9, "fieldName":Ljava/lang/String;
    invoke-virtual {v2, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 221
    .local v8, "field":Ljava/lang/reflect/Field;
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 222
    invoke-virtual {v8, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .line 225
    .local v22, "value":Ljava/lang/Object;
    check-cast v22, Ljava/util/Map;

    .end local v22    # "value":Ljava/lang/Object;
    invoke-interface/range {v22 .. v22}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .end local v12    # "i$":I
    .local v11, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_6

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 226
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/ref/WeakReference<*>;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/ref/WeakReference;

    invoke-virtual/range {v23 .. v23}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 227
    .local v15, "loadedApk":Ljava/lang/Object;
    if-eqz v15, :cond_3

    .line 231
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_3

    .line 232
    if-eqz p2, :cond_4

    .line 233
    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 235
    :cond_4
    if-eqz p3, :cond_5

    .line 236
    move-object/from16 v0, v21

    move-object/from16 v1, p3

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 239
    :cond_5
    if-eqz p2, :cond_3

    if-eqz v20, :cond_3

    .line 240
    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v15}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_4

    .line 245
    .end local v2    # "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v5    # "currentActivityThread":Ljava/lang/Object;
    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/ref/WeakReference<*>;>;"
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "fieldName":Ljava/lang/String;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "initialApplication":Landroid/app/Application;
    .end local v14    # "len$":I
    .end local v15    # "loadedApk":Ljava/lang/Object;
    .end local v16    # "loadedApkClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v18    # "mApplication":Ljava/lang/reflect/Field;
    .end local v19    # "mInitialApplication":Ljava/lang/reflect/Field;
    .end local v20    # "mLoadedApk":Ljava/lang/reflect/Field;
    .end local v21    # "mResDir":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v6

    .line 246
    .local v6, "e":Ljava/lang/Throwable;
    new-instance v23, Ljava/lang/IllegalStateException;

    move-object/from16 v0, v23

    invoke-direct {v0, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v23

    .line 196
    .end local v6    # "e":Ljava/lang/Throwable;
    .restart local v2    # "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v5    # "currentActivityThread":Ljava/lang/Object;
    .restart local v13    # "initialApplication":Landroid/app/Application;
    .restart local v19    # "mInitialApplication":Ljava/lang/reflect/Field;
    :catch_1
    move-exception v6

    .line 197
    .local v6, "e":Ljava/lang/ClassNotFoundException;
    :try_start_5
    const-string/jumbo v23, "android.app.ActivityThread$PackageInfo"

    invoke-static/range {v23 .. v23}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v16

    .restart local v16    # "loadedApkClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto/16 :goto_1

    .line 219
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v4    # "arr$":[Ljava/lang/String;
    .restart local v8    # "field":Ljava/lang/reflect/Field;
    .restart local v9    # "fieldName":Ljava/lang/String;
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v14    # "len$":I
    .restart local v18    # "mApplication":Ljava/lang/reflect/Field;
    .restart local v20    # "mLoadedApk":Ljava/lang/reflect/Field;
    .restart local v21    # "mResDir":Ljava/lang/reflect/Field;
    :cond_6
    add-int/lit8 v11, v12, 0x1

    .local v11, "i$":I
    move v12, v11

    .end local v11    # "i$":I
    .restart local v12    # "i$":I
    goto :goto_3

    .line 248
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "fieldName":Ljava/lang/String;
    :cond_7
    return-void

    .line 209
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v12    # "i$":I
    .end local v14    # "len$":I
    :catch_2
    move-exception v23

    goto/16 :goto_2
.end method

.method public static monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V
    .locals 40
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "externalResourceFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 280
    .local p2, "activities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    if-nez p1, :cond_1

    .line 440
    :cond_0
    return-void

    .line 319
    :cond_1
    :try_start_0
    const-class v35, Landroid/content/res/AssetManager;

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v35

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/content/res/AssetManager;

    .line 320
    .local v25, "newAssetManager":Landroid/content/res/AssetManager;
    const-class v35, Landroid/content/res/AssetManager;

    const-string/jumbo v36, "addAssetPath"

    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    const-class v39, Ljava/lang/String;

    aput-object v39, v37, v38

    invoke-virtual/range {v35 .. v37}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v13

    .line 321
    .local v13, "mAddAssetPath":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v13, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 322
    const/16 v35, 0x1

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    aput-object p1, v35, v36

    move-object/from16 v0, v25

    move-object/from16 v1, v35

    invoke-virtual {v13, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/lang/Integer;

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Integer;->intValue()I

    move-result v35

    if-nez v35, :cond_2

    .line 323
    new-instance v35, Ljava/lang/IllegalStateException;

    const-string/jumbo v36, "Could not create new AssetManager"

    invoke-direct/range {v35 .. v36}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v35
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 437
    .end local v13    # "mAddAssetPath":Ljava/lang/reflect/Method;
    .end local v25    # "newAssetManager":Landroid/content/res/AssetManager;
    :catch_0
    move-exception v6

    .line 438
    .local v6, "e":Ljava/lang/Throwable;
    new-instance v35, Ljava/lang/IllegalStateException;

    move-object/from16 v0, v35

    invoke-direct {v0, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v35

    .line 328
    .end local v6    # "e":Ljava/lang/Throwable;
    .restart local v13    # "mAddAssetPath":Ljava/lang/reflect/Method;
    .restart local v25    # "newAssetManager":Landroid/content/res/AssetManager;
    :cond_2
    :try_start_1
    const-class v35, Landroid/content/res/AssetManager;

    const-string/jumbo v36, "ensureStringBlocks"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    invoke-virtual/range {v35 .. v37}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v16

    .line 329
    .local v16, "mEnsureStringBlocks":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 330
    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    if-eqz p2, :cond_3

    .line 333
    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 334
    .local v3, "activity":Landroid/app/Activity;
    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v28

    .line 337
    .local v28, "resources":Landroid/content/res/Resources;
    :try_start_2
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 338
    .local v14, "mAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 339
    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 349
    .end local v14    # "mAssets":Ljava/lang/reflect/Field;
    :goto_1
    :try_start_3
    invoke-virtual {v3}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v31

    .line 352
    .local v31, "theme":Landroid/content/res/Resources$Theme;
    :try_start_4
    const-class v35, Landroid/content/res/Resources$Theme;

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v21

    .line 353
    .local v21, "ma":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 354
    move-object/from16 v0, v21

    move-object/from16 v1, v31

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    .line 364
    :goto_2
    :try_start_5
    const-class v35, Landroid/view/ContextThemeWrapper;

    const-string/jumbo v36, "mTheme"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v23

    .line 365
    .local v23, "mt":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 366
    const/16 v35, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 367
    const-class v35, Landroid/view/ContextThemeWrapper;

    const-string/jumbo v36, "initializeTheme"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    invoke-virtual/range {v35 .. v37}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v24

    .line 368
    .local v24, "mtm":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 369
    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    const-class v35, Landroid/content/res/AssetManager;

    const-string/jumbo v36, "createTheme"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    invoke-virtual/range {v35 .. v37}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    .line 372
    .local v15, "mCreateTheme":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 373
    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v35

    invoke-virtual {v15, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 374
    .local v12, "internalTheme":Ljava/lang/Object;
    const-class v35, Landroid/content/res/Resources$Theme;

    const-string/jumbo v36, "mTheme"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v20

    .line 375
    .local v20, "mTheme":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 376
    move-object/from16 v0, v20

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v12}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    .line 382
    .end local v12    # "internalTheme":Ljava/lang/Object;
    .end local v15    # "mCreateTheme":Ljava/lang/reflect/Method;
    .end local v20    # "mTheme":Ljava/lang/reflect/Field;
    .end local v21    # "ma":Ljava/lang/reflect/Field;
    .end local v23    # "mt":Ljava/lang/reflect/Field;
    .end local v24    # "mtm":Ljava/lang/reflect/Method;
    :goto_3
    :try_start_6
    invoke-static/range {v28 .. v28}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCaches(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 340
    .end local v31    # "theme":Landroid/content/res/Resources$Theme;
    :catch_1
    move-exception v9

    .line 341
    .local v9, "ignore":Ljava/lang/Throwable;
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mResourcesImpl"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v19

    .line 342
    .local v19, "mResourcesImpl":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 343
    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    .line 344
    .local v27, "resourceImpl":Ljava/lang/Object;
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v35

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 345
    .local v11, "implAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 346
    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_1

    .line 355
    .end local v9    # "ignore":Ljava/lang/Throwable;
    .end local v11    # "implAssets":Ljava/lang/reflect/Field;
    .end local v19    # "mResourcesImpl":Ljava/lang/reflect/Field;
    .end local v27    # "resourceImpl":Ljava/lang/Object;
    .restart local v31    # "theme":Landroid/content/res/Resources$Theme;
    :catch_2
    move-exception v9

    .line 356
    .local v9, "ignore":Ljava/lang/NoSuchFieldException;
    :try_start_7
    const-class v35, Landroid/content/res/Resources$Theme;

    const-string/jumbo v36, "mThemeImpl"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v32

    .line 357
    .local v32, "themeField":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v32

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 358
    move-object/from16 v0, v32

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 359
    .local v10, "impl":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v35

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v21

    .line 360
    .restart local v21    # "ma":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 361
    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v10, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3

    goto/16 :goto_2

    .line 377
    .end local v9    # "ignore":Ljava/lang/NoSuchFieldException;
    .end local v10    # "impl":Ljava/lang/Object;
    .end local v21    # "ma":Ljava/lang/reflect/Field;
    .end local v32    # "themeField":Ljava/lang/reflect/Field;
    :catch_3
    move-exception v6

    .line 378
    .restart local v6    # "e":Ljava/lang/Throwable;
    :try_start_8
    const-string/jumbo v35, "InstantRun"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v37, "Failed to update existing theme for activity "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3

    .line 388
    .end local v3    # "activity":Landroid/app/Activity;
    .end local v6    # "e":Ljava/lang/Throwable;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v28    # "resources":Landroid/content/res/Resources;
    .end local v31    # "theme":Landroid/content/res/Resources$Theme;
    :cond_3
    sget v35, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v36, 0x13

    move/from16 v0, v35

    move/from16 v1, v36

    if-lt v0, v1, :cond_5

    .line 390
    const-string/jumbo v35, "android.app.ResourcesManager"

    invoke-static/range {v35 .. v35}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v30

    .line 391
    .local v30, "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v35, "getInstance"

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v36, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v17

    .line 392
    .local v17, "mGetInstance":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 393
    const/16 v35, 0x0

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0

    move-result-object v29

    .line 395
    .local v29, "resourcesManager":Ljava/lang/Object;
    :try_start_9
    const-string/jumbo v35, "mActiveResources"

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 396
    .local v7, "fMActiveResources":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 398
    move-object/from16 v0, v29

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/ArrayMap;

    .line 400
    .local v5, "arrayMap":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    invoke-virtual {v5}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;
    :try_end_9
    .catch Ljava/lang/NoSuchFieldException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_0

    move-result-object v26

    .line 417
    .end local v5    # "arrayMap":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v7    # "fMActiveResources":Ljava/lang/reflect/Field;
    .end local v17    # "mGetInstance":Ljava/lang/reflect/Method;
    .end local v29    # "resourcesManager":Ljava/lang/Object;
    .end local v30    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v26, "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    :goto_4
    :try_start_a
    invoke-interface/range {v26 .. v26}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_4
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/ref/WeakReference;

    .line 418
    .local v34, "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    invoke-virtual/range {v34 .. v34}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Landroid/content/res/Resources;
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_0

    .line 419
    .restart local v28    # "resources":Landroid/content/res/Resources;
    if-eqz v28, :cond_4

    .line 422
    :try_start_b
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 423
    .restart local v14    # "mAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 424
    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_5

    .line 434
    .end local v14    # "mAssets":Ljava/lang/reflect/Field;
    :goto_6
    :try_start_c
    invoke-virtual/range {v28 .. v28}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v35

    invoke-virtual/range {v28 .. v28}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v36

    move-object/from16 v0, v28

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    goto :goto_5

    .line 401
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v26    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v28    # "resources":Landroid/content/res/Resources;
    .end local v34    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    .restart local v17    # "mGetInstance":Ljava/lang/reflect/Method;
    .restart local v29    # "resourcesManager":Ljava/lang/Object;
    .restart local v30    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_4
    move-exception v9

    .line 402
    .restart local v9    # "ignore":Ljava/lang/NoSuchFieldException;
    const-string/jumbo v35, "mResourceReferences"

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v18

    .line 403
    .local v18, "mResourceReferences":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 405
    move-object/from16 v0, v18

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/util/Collection;

    .restart local v26    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    goto :goto_4

    .line 408
    .end local v9    # "ignore":Ljava/lang/NoSuchFieldException;
    .end local v17    # "mGetInstance":Ljava/lang/reflect/Method;
    .end local v18    # "mResourceReferences":Ljava/lang/reflect/Field;
    .end local v26    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v29    # "resourcesManager":Ljava/lang/Object;
    .end local v30    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5
    const-string/jumbo v35, "android.app.ActivityThread"

    invoke-static/range {v35 .. v35}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 409
    .local v4, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v35, "mActiveResources"

    move-object/from16 v0, v35

    invoke-virtual {v4, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 410
    .restart local v7    # "fMActiveResources":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 411
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v33

    .line 413
    .local v33, "thread":Ljava/lang/Object;
    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/util/HashMap;

    .line 415
    .local v22, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    invoke-virtual/range {v22 .. v22}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v26

    .restart local v26    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    goto/16 :goto_4

    .line 425
    .end local v4    # "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "fMActiveResources":Ljava/lang/reflect/Field;
    .end local v22    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v33    # "thread":Ljava/lang/Object;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v28    # "resources":Landroid/content/res/Resources;
    .restart local v34    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :catch_5
    move-exception v9

    .line 426
    .local v9, "ignore":Ljava/lang/Throwable;
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mResourcesImpl"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v19

    .line 427
    .restart local v19    # "mResourcesImpl":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 428
    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    .line 429
    .restart local v27    # "resourceImpl":Ljava/lang/Object;
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v35

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 430
    .restart local v11    # "implAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 431
    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_0

    goto/16 :goto_6
.end method

.method private static pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z
    .locals 13
    .param p0, "resources"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 514
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    .line 517
    .local v6, "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    invoke-virtual {v6, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v1

    .line 521
    .local v1, "cacheField":Ljava/lang/reflect/Field;
    :goto_0
    const/4 v8, 0x1

    :try_start_2
    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 522
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 525
    .local v0, "cache":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    .line 526
    .local v7, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x10

    if-ge v8, v9, :cond_1

    .line 527
    instance-of v8, v0, Landroid/util/SparseArray;

    if-eqz v8, :cond_0

    .line 528
    check-cast v0, Landroid/util/SparseArray;

    .end local v0    # "cache":Ljava/lang/Object;
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 529
    const/4 v8, 0x1

    .line 583
    .end local v1    # "cacheField":Ljava/lang/reflect/Field;
    .end local v6    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    return v8

    .line 518
    .restart local v6    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v5

    .line 519
    .local v5, "ignore":Ljava/lang/NoSuchFieldException;
    const-class v8, Landroid/content/res/Resources;

    invoke-virtual {v8, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .restart local v1    # "cacheField":Ljava/lang/reflect/Field;
    goto :goto_0

    .line 530
    .end local v5    # "ignore":Ljava/lang/NoSuchFieldException;
    .restart local v0    # "cache":Ljava/lang/Object;
    .restart local v7    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xe

    if-lt v8, v9, :cond_2

    instance-of v8, v0, Landroid/util/LongSparseArray;

    if-eqz v8, :cond_2

    .line 534
    check-cast v0, Landroid/util/LongSparseArray;

    .end local v0    # "cache":Ljava/lang/Object;
    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    .line 535
    const/4 v8, 0x1

    goto :goto_1

    .line 537
    .restart local v0    # "cache":Ljava/lang/Object;
    :cond_1
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x17

    if-ge v8, v9, :cond_5

    .line 539
    const-string/jumbo v8, "mColorStateListCache"

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 542
    instance-of v8, v0, Landroid/util/LongSparseArray;

    if-eqz v8, :cond_2

    .line 544
    check-cast v0, Landroid/util/LongSparseArray;

    .end local v0    # "cache":Ljava/lang/Object;
    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    .line 583
    .end local v1    # "cacheField":Ljava/lang/reflect/Field;
    .end local v6    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_2
    const/4 v8, 0x0

    goto :goto_1

    .line 546
    .restart local v0    # "cache":Ljava/lang/Object;
    .restart local v1    # "cacheField":Ljava/lang/reflect/Field;
    .restart local v6    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    const-class v8, Landroid/util/ArrayMap;

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 547
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "clearDrawableCachesLocked"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Landroid/util/ArrayMap;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 549
    .local v2, "clearArrayMap":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 550
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v9, 0x1

    const/4 v10, -0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v2, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    const/4 v8, 0x1

    goto :goto_1

    .line 552
    .end local v2    # "clearArrayMap":Ljava/lang/reflect/Method;
    :cond_4
    const-class v8, Landroid/util/LongSparseArray;

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 553
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "clearDrawableCachesLocked"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Landroid/util/LongSparseArray;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 555
    .local v3, "clearSparseMap":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 556
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v9, 0x1

    const/4 v10, -0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v3, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    const/4 v8, 0x1

    goto/16 :goto_1

    .line 568
    .end local v3    # "clearSparseMap":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v8

    .line 571
    invoke-virtual {v7}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v7

    .line 561
    :cond_5
    if-eqz v7, :cond_2

    .line 563
    :try_start_3
    const-string/jumbo v8, "onConfigurationChange"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 565
    .local v4, "configChangeMethod":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 566
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, -0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v4, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    .line 567
    const/4 v8, 0x1

    goto/16 :goto_1

    .line 574
    .end local v0    # "cache":Ljava/lang/Object;
    .end local v1    # "cacheField":Ljava/lang/reflect/Field;
    .end local v4    # "configChangeMethod":Ljava/lang/reflect/Method;
    .end local v6    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_2
    move-exception v8

    goto/16 :goto_2
.end method

.method private static pruneResourceCaches(Ljava/lang/Object;)V
    .locals 11
    .param p0, "resources"    # Ljava/lang/Object;

    .prologue
    const/16 v10, 0x17

    .line 445
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x15

    if-lt v8, v9, :cond_1

    .line 447
    :try_start_0
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "mTypedArrayPool"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 449
    .local v7, "typedArrayPoolField":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 450
    invoke-virtual {v7, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 451
    .local v4, "pool":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 452
    .local v5, "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v8, "acquire"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 453
    .local v0, "acquireMethod":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 455
    :cond_0
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v6

    .line 456
    .local v6, "typedArray":Ljava/lang/Object;
    if-nez v6, :cond_0

    .line 464
    .end local v0    # "acquireMethod":Ljava/lang/reflect/Method;
    .end local v4    # "pool":Ljava/lang/Object;
    .end local v5    # "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "typedArray":Ljava/lang/Object;
    .end local v7    # "typedArrayPoolField":Ljava/lang/reflect/Field;
    :cond_1
    :goto_0
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v10, :cond_2

    .line 467
    :try_start_1
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "mResourcesImpl"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 468
    .local v3, "mResourcesImpl":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 471
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object p0

    .line 477
    .end local v3    # "mResourcesImpl":Ljava/lang/reflect/Field;
    :cond_2
    :goto_1
    const/4 v2, 0x0

    .line 478
    .local v2, "lock":Ljava/lang/Object;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x12

    if-lt v8, v9, :cond_5

    .line 480
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string/jumbo v9, "mAccessLock"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 481
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 482
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v2

    .line 494
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "lock":Ljava/lang/Object;
    :goto_2
    if-nez v2, :cond_3

    .line 495
    const-class v2, Lcom/android/tools/fd/runtime/MonkeyPatcher;

    .line 499
    :cond_3
    monitor-enter v2

    .line 501
    :try_start_3
    const-string/jumbo v8, "mDrawableCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 502
    const-string/jumbo v8, "mColorDrawableCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 503
    const-string/jumbo v8, "mColorStateListCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 504
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v10, :cond_4

    .line 505
    const-string/jumbo v8, "mAnimatorCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 506
    const-string/jumbo v8, "mStateListAnimatorCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 508
    :cond_4
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 509
    return-void

    .line 487
    .restart local v2    # "lock":Ljava/lang/Object;
    :cond_5
    :try_start_4
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "mTmpValue"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 488
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 489
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v2

    goto :goto_2

    .line 508
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "lock":Ljava/lang/Object;
    :catchall_0
    move-exception v8

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v8

    .line 490
    .restart local v2    # "lock":Ljava/lang/Object;
    :catch_0
    move-exception v8

    goto :goto_2

    .line 483
    :catch_1
    move-exception v8

    goto :goto_2

    .line 472
    .end local v2    # "lock":Ljava/lang/Object;
    :catch_2
    move-exception v8

    goto :goto_1

    .line 460
    :catch_3
    move-exception v8

    goto :goto_0
.end method
