import { finishPage, routerGetParams, startPage } from '@abner/router'
import { SharedBean } from './SharedBean'
import { HashMap } from '@kit.ArkTS'

@Component
export struct SharedParams {
  @State stringParams?: string = ""

  aboutToAppear(): void {
    //接收传递的参数
    let params = routerGetParams()
    this.stringParams = params?.toString()
  }

  build() {
    Column() {
      RelativeContainer() {
        Text("传递参数案例")
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

      Text("接收参数：" + this.stringParams)
        .margin({ top: 20 })

      Button("传递字符串")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("shared_show_params", { param: "一个字符串" })
        })

      Button("传递number")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("shared_show_params", { param: 100 })
        })

      Button("传递boolean")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("shared_show_params", { param: true })
        })

      Button("传递数组")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("shared_show_params", { param: [1, 2, 3, 4, 5, 6] })
        })

      Button("传递对象")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("shared_show_params", { param: new SharedBean() })
        })

      Button("直接传递对象")
        .margin({ top: 20 })
        .onClick(() => {
          startPage("shared_show_params", { param: { "name": "AbnerMing", "age": 20 } })
        })

      Button("传递Map[控制台自己打印进行展示]")
        .margin({ top: 20 })
        .onClick(() => {
          let map = new HashMap<string, Object>()
          map.set("name", "AbnerMing")
          map.set("age", 18)
          startPage("shared_show_params", { param: map })
        })
    }
    .width('100%')

  }
}