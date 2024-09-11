import { finishPage, startPage } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/7
 * INTRODUCE:跨组件跳转，跳转到其他组件的页面
 * */
@Component
export struct SharedStepPage {
  build() {
    Column() {
      RelativeContainer() {

        Text("跨组件跳转")
          .fontSize(20)
          .fontColor(Color.White)
          .alignRules({
            center: { anchor: "__container__", align: VerticalAlign.Center },
            middle: { anchor: "__container__", align: HorizontalAlign.Center }
          })
        Text("返回")
          .fontSize(16)
          .fontColor(Color.White)
          .margin({ left: 10 })
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          })
          .onClick(() => {
            //点击返回
            finishPage()
          })
      }
      .width("100%")
      .height(50)
      .backgroundColor(Color.Red)

      Text("我是shared模块")
        .margin({ top: 20 })

      Button("当前模块跳转到其他模块")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("static_step")
        })
    }
    .width('100%')

  }
}