import { StaticStepPage } from './src/main/ets/pages/StaticStepPage';
import { StaticReturnParamsPage } from './src/main/ets/pages/StaticReturnParamsPage';
import { StaticPage } from './src/main/ets/pages/StaticPage';
import { RouterConfig,routerGetBuilderType, routerInitBuilder,NavDestinationView } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置路径
 * */
function importPath(builderName: string) {
  switch (builderName) {
    case "static_step":
      import("./src/main/ets/pages/StaticStepPage")
      break
    case "static_return_params":
      import("./src/main/ets/pages/StaticReturnParamsPage")
      break
    case "static_main":
      import("./src/main/ets/pages/StaticPage")
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
    if (routerGetBuilderType() == "static_step") {
      StaticStepPage()
    } else 
    if (routerGetBuilderType() == "static_return_params") {
      StaticReturnParamsPage()
    } else 
    if (routerGetBuilderType() == "static_main") {
      StaticPage()
    } 

  }

}


/**
 * AUTHOR:AbnerMing
 * DATE:2025年8月22日 10时26分6秒
 * INTRODUCE:路由配置,此路由配置文件为自动生成，无特殊情况下请无须改动
 * */
export class StaticRouterConfig implements RouterConfig {
  getModuleName(): string {
    return "static"
  }

  async initRouter(builderName: string): Promise<void> {
    return await new Promise((resolve: Function) => {
      importPath(builderName)
      routerInitBuilder(builderName, wrapBuilder(viewBuilder))
      resolve()
    })
  }
}