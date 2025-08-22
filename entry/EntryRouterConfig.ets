import { EntryPage } from './src/main/ets/pages/EntryPage';
import { BackPage03 } from './src/main/ets/pages/BackPage03';
import { BackPage02 } from './src/main/ets/pages/BackPage02';
import { BackPage01 } from './src/main/ets/pages/BackPage01';
import { RouterConfig,routerGetBuilderType, routerInitBuilder,NavDestinationView } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置路径
 * */
function importPath(builderName: string) {
  switch (builderName) {
    case "entry_main":
      import("./src/main/ets/pages/EntryPage")
      break
    case "entry_back_03":
      import("./src/main/ets/pages/BackPage03")
      break
    case "entry_back_02":
      import("./src/main/ets/pages/BackPage02")
      break
    case "entry_back_01":
      import("./src/main/ets/pages/BackPage01")
      break

  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置组件
 * */
@Builder
export function viewBuilder(params?:Object) {
  NavDestinationView() {
    if (routerGetBuilderType() == "entry_main") {
      EntryPage()
    } else 
    if (routerGetBuilderType() == "entry_back_03") {
      BackPage03()
    } else 
    if (routerGetBuilderType() == "entry_back_02") {
      BackPage02()
    } else 
    if (routerGetBuilderType() == "entry_back_01") {
      BackPage01()
    } 

  }

}


/**
 * AUTHOR:AbnerMing
 * DATE:2025年8月22日 10时26分6秒
 * INTRODUCE:路由配置,此路由配置文件为自动生成，无特殊情况下请无须改动
 * */
export class EntryRouterConfig implements RouterConfig {
  getModuleName(): string {
    return "entry"
  }

  async initRouter(builderName: string): Promise<void> {
    return await new Promise((resolve: Function) => {
      importPath(builderName)
      routerInitBuilder(builderName, wrapBuilder(viewBuilder))
      resolve()
    })
  }
}