import {
  routerInitNavPathStack,
  routerReturnBuilder,
  startPage,
  startPageByName,
  startPageDestination
} from '@abner/router';

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
      Column() {
        Button("跳转到自己Module页面")
          .onClick(() => {
            startPage("entry_main")
          })
        Button("跳转到har静态共享包页面")
          .margin({ top: 20 })
          .onClick(() => {
            startPage("static_main")
          })
        Button("跳转到shared动态共享包页面")
          .margin({ top: 20 })
          .onClick(() => {
            startPage("shared_main")
          })
        Button("跨模块跳转")
          .margin({ top: 20 })
          .onClick(() => {
            startPage("shared_step")
          })
        Button("携带参数跳转")
          .margin({ top: 20 })
          .onClick(() => {
            startPage("shared_params", { param: "简单传递一个字符串" })
          })
        Button("获取返回参数")
          .margin({ top: 20 })
          .onClick(() => {
            startPage("static_return_params", {
              result: (params) => {
                //获取返回的数据
                console.log("==========" + params?.toString())
              }
            })
          })
        Button("返回跳转")
          .margin({ top: 20 })
          .onClick(() => {
            startPage("entry_back_01")
          })
      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }.navDestination(this.routerMap)
  }
}