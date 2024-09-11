import { finishPage } from '@abner/router';

@Component
export struct StaticStepPage {
  build() {
    Column() {
      RelativeContainer() {
        Text("我是跨组件跳转过来的")
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

      Text("我是static模块")
        .margin({ top: 20 })
    }
    .width('100%')
  }
}
