import { finishPage } from '@abner/router'

@Entry()
@Component
export struct SharedIndex {

  build() {
    Column() {
      RelativeContainer() {
        Text("shared动态共享包页面")
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
            finishPage({ param: "我是回传参数" })
          })
      }
      .width("100%")
      .height(50)
      .backgroundColor(Color.Red)
    }
    .width('100%')

  }
}