import { routerGetBuilderType, routerInitBuilder, RouterConfig } from '@abner/router';
import { StaticPage } from './src/main/ets/pages/StaticPage';
import { StaticStepPage } from './src/main/ets/pages/StaticStepPage';
import { StaticReturnParamsPage } from './src/main/ets/pages/StaticReturnParamsPage';

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置路径
 * */
function importPath(builderName: string) {
  switch (builderName) {
    case "static_main":
      import("./src/main/ets/pages/StaticPage")
      break
    case "static_step":
      import("./src/main/ets/pages/StaticStepPage")
      break
    case "static_return_params":
      import("./src/main/ets/pages/StaticReturnParamsPage")
      break
  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置组件
 * */
@Builder
export function viewBuilder() {
  NavDestination() {
    if (routerGetBuilderType() == "static_main") {
      StaticPage()
    } else if (routerGetBuilderType() == "static_step") {
      StaticStepPage()
    } else if (routerGetBuilderType() == "static_return_params") {
      StaticReturnParamsPage()
    }
  }
  .hideTitleBar(true)
  .height('100%')

}


/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/4
 * INTRODUCE:路由配置
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
