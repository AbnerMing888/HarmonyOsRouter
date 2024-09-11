import { finishPage, routerGetParams } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/7
 * INTRODUCE:接收各种类型参数
 * */
@Component
export struct SharedShowParams {
  aboutToAppear(): void {
    let params = routerGetParams()
    // let map = params as number//number
    // let map = params?.toString() //string
    // let map = params as boolean //boolean
    // let map = params as string[] //数组
    // let map = params as SharedBean //对象
    // let map = params as HashMap<string, Object>//如果是传递的map，自己遍历即可

  }

  build() {
    Column() {
      RelativeContainer() {
        Text("接收参数展示")
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

      Text("接收参数：" + JSON.stringify(routerGetParams()))
        .fontColor(Color.Red)
        .margin({ top: 50 })

    }
    .width('100%')

  }
}