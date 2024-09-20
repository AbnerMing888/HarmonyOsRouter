import { finishPage, setRouterLifeCycle } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/4
 * INTRODUCE:entry 下的page测试
 * */
@Component
export struct EntryPage {
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

  build() {
    Column() {
      RelativeContainer() {
        Text("我是entry的页面")
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

    }.width("100%")
    .height("100%")
  }
}

