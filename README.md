# HarmonyOsRouter

**HarmonyOSRouter**，基于官方推荐路由组件Navigation封装，目的简化配置与使用，让路由跳转一个注解，一行代码便可轻松搞定！

## 主要特点

没有别的特点，就是简单！，简单！！，简单！！！

### 案例：

一行代码一个注解就搞定。

执行跳转

```typescript
 startPage("test")
```

相关页面

```typescript
@RouterPath("test")
@Component
export struct Test{
  build(){
    Column(){}
  }
}
```

## 开发环境

DevEco Studio NEXT Developer Beta1,Build Version: 5.0.3.706

Api版本：**11**

modelVersion：5.0.0


## 快速使用

### 第一步，配置依赖项

方式一：在需要Module中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/router": "^1.0.1"}
```

方式二：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/router
```

最终会在使用的模块中，生成一个oh_modules文件，并创建源代码文件，有则成功，无则失败，如下：


<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/router/router_01.jpg" width="300"></p>


### 第二步，配置插件

配置插件前，请务必保障你的**所有Module**都依赖了@abner/router，当然你也可以采用中间件的方式进行依赖。

#### 依赖插件

找到项目中的hvigor目录，在hvigor-config.json5文件中dependencies配置插件。

代码如下：当前版本为：1.0.8

```typescript
"dependencies": {
  "ohos-router": "1.0.8"
}
```

#### 执行插件方法

打开根目录中的hvigorfile.ts文件，在plugins数组中导入方法：

```typescript
plugins:[
  abnerRouter()
]
```

导包：

```typescript
import { abnerRouter } from 'ohos-router/router-plugin';
```

插件完成之后，编译项目，你会发现，每个Module中，都会生成一个路由配置文件，以Module名字+RouterConfig为文件命名。
此路由配置文件为自动生成，无特殊情况下无须改动，当然,再有特殊情况下，你可以进行手动更正。


## 一、基本配置

要实现Module之间跳转，@abner/router这个依赖是必须的，要求每个Module都必须进行依赖，如果你的项目里有中间件，可以直接放到中间件里。

### 1、全局初始化【自动生成，仅做了解】

全局初始化，主要配置各个模块中路由配置文件，为插件自动生成，无特殊情况，不需要大家手动配置。

主要在AbilityStage中，通过routerInitConfig方法进行配置。

```typescript
 routerInitConfig([
     
    ])
```


### 2、设置Navigation【必须】

Navigation一般作为Page页面的根容器使用，大家可以按照官方文档介绍使用即可，当然也可以使用我给出的模版，
考虑到旧的项目主页面有很多的逻辑性内容，这里就不自动生成了，大家手动配置即可。

模版代码，可以复制到项目中进行替换,只替换entry中主入口页面，仅配置一次即可。

```typescript
@Entry
@Component
struct Index {
  private navPathStack: NavPathStack = new NavPathStack()

  aboutToAppear() {
    routerInitNavPathStack(this.navPathStack)
  }

  @Builder
  routerMap(builderName: string, param: Object) {
    routerReturnBuilder(builderName).builder(param)
  }

  build() {
    Navigation(this.navPathStack) {
      RelativeContainer() {
        //其他组件
      }
      .height('100%')
      .width('100%')
    }.navDestination(this.routerMap)
  }
}
```

### 3、其他UI页面编写

除了主页面带有@Entry之外，建议其他的UI页面无须在设置@Entry，但是考虑到别的页面进行跳转，必须要进行导出，也就是加上export。

举例【export必须使用】：

```typescript
@RouterPath("entry_test")
@Component
export struct TestPage {
  build() {
    //UI组件
  }
}
```

### 4、注解使用

添加到每个页面的上面即可。

```typescript
@RouterPath("entry_test")
```

注解的作用很简单，用来标记页面的唯一标识，也就是别名，要求格式为：Module名字+下划线+定义的别名。

如entry Module下：entry_test1,entry_test2等等

如test Module下：test_test1,test_test2等等

如果你想对Module下的路由进行统一管理，便于查找路由和修改路由，目前进支持在Module根目录下进行配置。

比如entry目录下，你可以创建任意的管理类EntryRouter：

```typescript
export class EntryRouter {
  static EntryTest= "entry_test"//测试页面
}
```

使用不变，直接获取即可。

```typescript
@RouterPath(EntryRouter.EntryTest)
@Component
export struct TestPage {
  build() {
    //UI组件
  }
}
```


## 二、基本使用

### 1、普通跳转

startPage支持自己Module下跳转，同样也支持跨组件模式跳转。

```typescript
 startPage("entry_main") //entry_main和页面注解要一一对应
```

### 2、带数据跳转

支持常见的数据传递，比如对象、字符串、数组等等

#### 字符串
```typescript
startPage("shared_show_params", { param: "一个字符串" })
```
#### number
```typescript
startPage("shared_show_params", { param: 100 })
```
#### boolean
```typescript
startPage("shared_show_params", { param: true })
```
#### 数组
```typescript
startPage("shared_show_params", { param: [1, 2, 3, 4, 5, 6] })
```
#### 对象
```typescript
startPage("shared_show_params", { param: new SharedBean() })
```
#### 直接传递对象
```typescript
 startPage("shared_show_params", { param: { "name": "AbnerMing", "age": 20 } })
```
#### 传递Map
```typescript
  let map = new HashMap<string, Object>()
map.set("name", "AbnerMing")
map.set("age", 18)
startPage("shared_show_params", { param: map })
```

### 3、接收参数

通过getRouterParams()方法获取上一个页面传递的数据。

```typescript
 aboutToAppear(): void {
  let params = routerGetParams()
  // let map = params as number//number
  // let map = params?.toString() //string
  // let map = params as boolean //boolean
  // let map = params as string[] //数组
  // let map = params as SharedBean //对象
  // let map = params as HashMap<string, Object>//如果是传递的map，自己遍历即可

}
```

### 4、返回上一页面

```typescript
finishPage()
```

### 5、返回指定页面

传递页面路由即可。

```typescript
 finishPageToName("entry_back_01")
```

### 6、直接返回首页

```typescript
   routerClearPage()
```

### 7、返回带数据

跳转时，使用result进行监听返回的参数

```typescript
startPage("static_return_params", {
  result: (params) => {
    //获取返回的数据
    console.log("==========" + params?.toString())
  }
})
```

销毁页面时携带返回数据即可。

```typescript
   finishPage({ param: "我是返回的数据" })
```

### 8、关于生命周期

当子组件使用了NavDestination之后，会和组件的生命周期发生冲突，为解决这个问题，大家可以使用NavDestination的生命周期进行解决。

目前提供了setRouterLifeCycle方法用于监听其生命周期，可以在子页面中进行实现。

案例如下：

```typescript
  aboutToAppear(): void {
    setRouterLifeCycle({
      onShown: () => {
        console.log("==========显示")
      },
      onHidden: () => {
        console.log("==========隐藏")
      }
    })
  }
```

相关方法一览：

| 方法      | 概述 |
|---------|----|
|onWillAppear|NavDestination创建后，挂载到组件树之前执行，在该方法中更改状态变量会在当前帧显示生效|
|onAppear|通用生命周期事件，NavDestination组件挂载到组件树时执行。|
|onWillShow|NavDestination组件布局显示之前执行，此时页面不可见（应用切换到前台不会触发）。|
| onShown | NavDestination组件布局显示之后执行，此时页面已完成布局。   |
|onWillHide|NavDestination组件触发隐藏之前执行（应用切换到后台不会触发）。|
|onHidden|NavDestination组件触发隐藏后执行（非栈顶页面push进栈，栈顶页面pop出栈或应用切换到后台）|
|onWillDisappear|NavDestination组件即将销毁之前执行，如果有转场动画，会在动画前触发（栈顶页面pop出栈）|
|onDisappear|通用生命周期事件，NavDestination组件从组件树上卸载销毁时执行。|


## 三、常见方法汇总

| 方法                             | 参数                                                                          | 概述                                                                                                                   |
|--------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| startPage                      | builderName: string, model?: RouterModel                                    | 跳转页面                                                                                                                 |
| replacePage                    | builderName: string, model?: RouterModel                                    | 替换页面栈操作                                                                                                              |
| startPageByName                | name: string, param: Object, onPop: Callback\<PopInfo\>, animated?: boolean | 将name指定的NavDestination页面信息入栈，传递的数据为param，添加onPop回调接收入栈页面出栈时的返回结果，并进行处理。                                              |
| startPageDestination           | info: NavPathInfo, options?: NavigationOptions                              | 将info指定的NavDestination页面信息入栈，使用Promise异步回调返回接口调用结果，具体根据options中指定不同的LaunchMode，有不同的行为。                               |
| startPageDestinationByName     | name: string, param: Object, onPop: Callback\<PopInfo\>,animated?: boolean  | 将name指定的NavDestination页面信息入栈，传递的数据为param，并且添加用于页面出栈时处理返回结果的OnPop回调，使用Promise异步回调返回接口调用结果。                            |
| finishPage                     | model?: PopModel                                                            | 销毁页面                                                                                                                 |
| finishPageToName               | name: string, model?: PopModel                                              | 回退路由栈到由栈底开始第一个名为name的NavDestination页面。                                                                               |
| routerSetInterception          | interception: NavigationInterception                                        | 设置Navigation页面跳转拦截回调。                                                                                                |
| routerClearPage                | animated?: boolean                                                          | 清除栈中所有页面                                                                                                             |
| routerGetParentNavPathStack    | 无参                                                                          | 清除栈中所有页面                                                                                                             |
| routerDisableAnimation         | value: boolean                                                              | 关闭（true）或打开（false）当前Navigation中所有转场动画。                                                                               |
| routerMoveIndexToTop           | index: number, animated?: boolean                                           | 将index指定的NavDestination页面移到栈顶。                                                                                       |
| routerMoveToTop                | name: string, animated?: boolean                                            | 将index指定的NavDestination页面移到栈顶                                                                                        |
| routerPopToIndex               | index: number, result: Object, animated?: boolean                           | 回退路由栈到index指定的NavDestination页面，并触发onPop回调传入页面处理结果。                                                                   |
| routerRemoveByName             | name: string                                                                | 将页面栈内指定name的NavDestination页面删除。                                                                                      |
| routerRemoveByIndexes          | indexes: Array\<number\>                                                    | 将页面栈内索引值在indexes中的NavDestination页面删除。                                                                                |
| routerReplacePathByName        | name: string, param: Object, animated?: boolean                             | 将当前页面栈栈顶退出，将name指定的页面入栈                                                                                              |
| routerRemoveByNavDestinationId | navDestinationId: string                                                    | 将页面栈内指定navDestinationId的NavDestination页面删除。navDestinationId可以在NavDestination的onReady回调中获取，也可以在NavDestinationInfo中获取。 |
| routerInitBuilder              | builderName: string, builder: WrappedBuilder\<\[Object]\>                   | 初始化Builder                                                                                                           |
| routerInitConfig               | routerConfig?: RouterConfig\[\]                                             | 初始化配置                                                                                                                |
| routerGetParams                | 无参                                                                          | 获取传递的参数                                                                                                              |


## 四、咨询或关注作者

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>


## License

```
Copyright (C) AbnerMing, HarmonyOsRouter Open Source Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```