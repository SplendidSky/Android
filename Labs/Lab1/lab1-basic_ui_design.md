# 实验一 基本UI界面设计

> 最近更新注意：整个界面统一为中文

[TOC]

### 【实验目的】

1. 熟悉 Android Studio 开发工具操作
2. 熟悉 Android 基本 UI 开发，并进行 UI 基本设计

### 【实验内容】

实现一个Android应用，界面呈现如下效果：

 ![screen](doc_resource\screen.PNG)



> **要求：**
>
> 1. 该界面为应用启动后看到的第一个界面
>
> 2. 各控件的要求
>
>    1. 标题字体大小`20sp`，与顶部距离`20dp`，居中
>    2. 图片与上下控件的间距均为`20dp`，居中
>    3. 输入框整体距左右屏幕各间距`20dp`，上下两栏间距`10dp`，内容（包括提示内容）如图所示，内容字体大小`18sp`
>    4. 四个单选按钮整体居中，字体大小`18sp`，间距`10dp`，默认选中的按钮为第一个；
>    5. 两个按钮整体居中，与上方控件间距`20dp`，按钮间的间距`5dp`，文字大小`18sp`。按钮背景框左右边框与文字间距`10dp`，上下边框与文字间距`5dp`，圆角半径`10dp`，背景色为`#3F51B5`
>
> 3. 使用的组件：
>
>    `TextView`, `EditText`, `LinearLayout`, `TableLayout`, `Button`, `ImageView`, `RadioGroup`, `RadioButton`

### 【基础知识】

Android的组件分为布局和控件。布局，就是让控件在里面按一定的次序排列好的一种组件，本身并不提供内容。控件，就是显示内容的组件，比如显示一张图片，显示文字等等。最基本也最常用的布局有以下四种：LinearLayout、RelativeLayout、TableLayout、FrameLayout。最常用的控件有以下几种：用于显示文字的TextView、用于显示图片的ImageView、用于接受用户输入的输入框EditText、按钮Button、单选按钮RadioButton，等等。

#### 1. 组件介绍

以下简要介绍本次实验使用到的组件。

##### 1) LinearLayout

Android的组件分为布局和控件。布局，就是让控件在里面按一定的次序排列好的一种组件，本身并不提供内容。控件，就是显示内容的组件，比如显示一张图片，显示文字等等。最基本也最常用的布局有以下四种：LinearLayout、RelativeLayout、TableLayout、FrameLayout。最常用的控件有以下几种：用于显示文字的TextView、用于显示图片的ImageView、用于接受用户输入的输入框EditText、按钮Button、单选按钮RadioButton，等等。以下简要介绍本次实验使用到的组件。

 ![linear_layout_horizontal](doc_resource\linear_layout_horizontal.PNG)

 ![linear_layout_vertical](doc_resource\linear_layout_vertical.PNG)

LinearLayout比较重要的属性还有`layout_weight`, `gravity`等，用法自行查阅资料。

##### 2) TableLayout

表格布局，当需要布局内的组件像表格一样排列时，使用TableLayout比较方便。表格布局采用行、列的形式来管理UI组件，TableLayout并不需要明确地声明包含多少行、多少列，而是通过添加TableRow、其他组件来控制表格的行数和列数。

每次向TableLayout中添加一个TableRow，该TableRow就是一个表格行，TableRow也是容器，因此它也可以不断地添加其他组件，每添加一个子组件该表格就增加一列。

如果直接向TableLayout中添加组件，那么这个组件将直接占用一行。

在表格布局中，列的宽度由该列中最宽的那个单元格决定，整个表格布局的宽度则取决于父容器的宽度（默认总是占满父容器本身）

三个重要的xml属性：

- `collapseColumns`：设置需要被隐藏的列的列序号。多个列序号之间用逗号隔开
- `shrinkColumns`：设置允许被收缩的列序号。多个列序号之间用逗号隔开
- `stretchColumns`：设置允许被拉伸的列序号。多个列序号之间用逗号隔开

> 注意：列序号从0开始计数。

##### 3) TextView

用于显示文字内容的控件，通过设置text的值来显示要显示的内容，常用的属性有textColor，用于设置文字的颜色，textSize，用于设置文字大小。示例：

```xml
<TextView
	android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_margin="10dp"
    android:textColor="@color/colorAccent"
    android:textSize="25sp"
    android:text="第一次试验" />
```

效果图： ![textview](doc_resource\textview.PNG)

> 关于`@color/colorAccent`这种形式的资源引用后面会讲

##### 4) EditText

用于接受用户输入的输入框，常用属性除了和TextView相同的textColor和 textSize之外，还有inputType，用于设置输入框中文本的类型，如果设置为textPassword，会使输入的文字变为小点（·），hint，用于设置当输入框为空时的提示内容。以一个密码输入框做示例：

```xml
<EditText
	android:layout_width="match_parent"
    android:layout_height="wrap_content"
	android:textColor="@color/primary_black"
	android:textSize="@dimen/normal_text"
	android:inputType="textPassword"
	android:hint="请输入密码" />
```

效果：

未输入前： ![edittext_before](doc_resource\edittext_before.PNG)

输入之后： ![edittext_after](doc_resource\edittext_after.PNG)

##### 5) ImageView

显示图片的控件，通过设置src来设置要显示的图片

```xml
<ImageView
	android:layout_width="wrap_content"
	android:layout_height="wrap_content"
	android:src="@mipmap/sysu"/>
```

 ![imageview](doc_resource\imageview.PNG)

> 关于ImageView的`src`和`background`属性的区别，自行查阅资料。

##### 6) RadioButton & RadioGroup

RadioButton是单选按钮，一组单选按钮需要包括在一个RadioGroup中，并且需要对RadioGroup和其包括的每一个RadioButton都设置id，RadioButton才能正常工作。示例：

```xml
<RadioGroup
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:id="@+id/id0"
    android:orientation="horizontal">
    <RadioButton
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:id="@+id/id1"
        android:text="男"/>
    <RadioButton
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:id="@+id/id2"
        android:text="女"/>
</RadioGroup>
```

可通过设置checked属性来使某个RadioButton被选中。

#### 2. 通用属性介绍

下面简单介绍以下几个重要的通用属性：

##### 1) layout_width & layout_height 

这两个属性分别指定所属组件的宽度和高度，属性值可以是具体的距离，如：20dp，更常见的是指定为match_parent或者wrap_content，match_parent指的是组件的宽度或高度与父组件的宽度或高度一致，如果组件没有父组件，那么组件的宽度或高度与屏幕的宽度或高度一致。wrap_content指组件的宽度或高度刚好可以包裹住组件内的子组件即可。

##### 1) layout_gravity & gravity

这两个属性的基本属性值有五种：top、bottom、center、left、right，可以使用组合属性，如left|bottom表示左下角。区别在于layout_gravity用于指定设置该属性的组件相对于父组件的位置，gravity用于指定指定设置该属性的组件下的子组件的位置。

##### 1) layout_margin & padding

layout_margin指定外边距，padding指定内边距，这两个属性配合上四个方向还各有四个属性，如layout_marginTop，paddingTop等。

#### 3. 关于自定义背景边框

当需要将一个button设置为圆角矩形时，光设置button的属性是达不到效果的，需要定义一个背景边框来达到这个效果：

 ![diy_background](doc_resource\diy_background.PNG)

这种自定义的背景边框定义在drawable文件夹下，所以为了不把它和图片混杂在一起，习惯上把图片放在mipmap文件夹下。

定义的方法如下：

1. rawable文件夹下新建一个Drawable resource file，填写file name，然后把自动生成的selector标签改为shape，shape下有多个属性，padding，radius，solid等等，具体怎么使用参见这篇教程：http://blog.csdn.net/sysukehan/article/details/52022307
2. 在Button中设置background为@drawable/加上刚刚填写的文件名即可引用这个自定义的背景。

#### 4. 如何在应用中显示布局

1. 首先，需要在res/layout文件夹下写好布局文件

    ![create_layout_1](doc_resource\create_layout_1.PNG)

2. 然后创建一个java文件

    ![create_layout_2](doc_resource\create_layout_2.PNG)

3. 在该文件中将布局引入

   ```java
   public class MainActivity extends AppCompatActivity {

       @Override
       protected void onCreate(Bundle savedInstanceState) {
           super.onCreate(savedInstanceState);
           setContentView(R.layout.main_layout);
   }
   ```

4. 然后在注册文件中注册，将该Activity设置为应用启动时第一个加载的Activity

   ```xml
   <activity android:name=".MainActivity">
   	<intent-filter>
   		<action android:name="android.intent.action.MAIN" />
   		<category android:name="android.intent.category.LAUNCHER" />
   	</intent-filter>
   </activity>
   ```

5. 然后就可以运行了

### 【扩展知识】

#### 1. 关于资源的引用

Android项目中不建议使用硬编码来使用资源，建议将各类资源定义在res文件夹中的values文件夹下，字符串资源定义在strings.xml中，颜色资源定义在colors.xml中，距离，字体大小资源定义在dimens.xml中。图片资源例外，是存放在res文件夹中的mipmap文件夹下或者drawable文件夹下。给个示例看一下怎么定义：

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="colorPrimary">#3F51B5</color>
    <color name="colorPrimaryDark">#303F9F</color>
    <color name="colorAccent">#FF4081</color>
  
  	<color name="primary_black">#D5000000</color>
	<color name="primary_white">#FFFFFFFF</color>
</resources>
```

通过键值对来定义，使用的时候用@color/colorAccent即可引用到对应资源，注意是@color不是@colors，这里和文件名是不相同的。其它资源的引用也一样。

#### 2. 关于自定义style

style定义在res/values/styles.xml文件中，也是一种资源。例如当多个TextView具有相同的layout_height，layout_width，textSize，textColor设定时，如果每次都要把这些属性设定一次会很烦，而且如果全部需要修改的话（改变字体大小）也不方便，因此可以把这些属性统一定义为一个style，这样使用的时候只要直接引用这个style即可。

定义style的方法：

```xml
<style name="my_edittext_style">
    <item name="android:layout_width">wrap_content</item>
    <item name="android:layout_height">wrap_content</item>
    <item name="android:textColor">@color/primary_black</item>
    <item name="android:textSize">@dimen/normal_text</item>
</style>
```

一个自定义style下包含多个键值对，引用的时候设置style=“@style/my_edittext_style”即可，注意不要写成android:style=“@style/my_edittext_style”。在引用style之后，还可以继续定义属性，如果有重复，以继续定义的属性为准。

### 【提交说明】

1. Deadline：下一次实验课前一天晚上12点

2. 提交邮箱：

   作业班（周三）：android16_class1@163.com

   作业班（周五）：android16_class2@163.com

3. 命名要求：

   附件命名及格式要求：学号\_姓名\_labX.zip（姓名中文拼音均可）

   邮件主题命名要求：学号\_姓名\_labX

   重复提交命名格式要求：学号\_姓名\_labX\_Vn.zip，主题：学号\_姓名\_labX\_Vn

4. 目录结构：

    ![dir_structure](doc_resource\dir_structure.PNG)

   其中项目代码文件为项目文件夹，提交之前先clean

### 【检查要求】

基础版：

1. 布局是否与要求相同
2. radiobutton切换是否正常
3. 密码输入框输入是否显示的是黑点（·）
4. 两个输入框铺满剩余空间的方式（必须是可以适配屏幕的方式，不可以用硬编码的方式）
5. “用户名：”和“密码：”右边是否对齐，各自与对应的EditText是否在同一水平线上（检查是否使用了gravity或者layout_gravity）

拓展版：

1. 每种资源的引用都要用一次，包括string，color，dimen，style

