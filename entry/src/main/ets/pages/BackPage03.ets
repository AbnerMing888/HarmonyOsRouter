import { finishPage, finishPageToName, routerClearPage } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/4
 * INTRODUCE:测试返回
 * */
@Component
export struct BackPage03 {
  build() {
    Column() {
      RelativeContainer() {
        Text("返回页面03")
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

      Button("直接返回首页")
        .fontSize(16)
        .fontColor(Color.White)
        .margin({ top: 50 })
        .onClick(() => {
          routerClearPage()
        })

      Button("返回到第一个页面")
        .fontSize(16)
        .fontColor(Color.White)
        .margin({ top: 50 })
        .onClick(() => {
          finishPageToName("entry_back_01")
        })

    }.width("100%")
    .height("100%")

  }
}

