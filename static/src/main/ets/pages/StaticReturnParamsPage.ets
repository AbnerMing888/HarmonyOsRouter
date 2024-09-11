import { finishPage } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/7
 * INTRODUCE:返回参数
 * */
@Component
export struct StaticReturnParamsPage {
  build() {
    Column() {
      RelativeContainer() {
        Text("返回参数案例")
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

      Button("点击销毁并返回数据")
        .margin({ top: 50 })
        .onClick(() => {
          finishPage({ param: "我是返回的数据" })
        })
    }
    .width('100%')
  }
}
