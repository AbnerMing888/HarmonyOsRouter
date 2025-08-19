import { SharedStepPage } from './src/main/ets/pages/SharedStepPage';
import { SharedShowParams } from './src/main/ets/pages/SharedShowParams';
import { SharedParams } from './src/main/ets/pages/SharedParams';
import { SharedIndex } from './src/main/ets/pages/SharedIndex';
import {  ARouter, setARouter, RouterConfig,routerGetBuilderType, routerInitBuilder,NavDestinationView } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置路径
 * */
function importPath(builderName: string) {
  switch (builderName) {
    case "shared_step":
      import("./src/main/ets/pages/SharedStepPage")
      break
    case "shared_show_params":
      import("./src/main/ets/pages/SharedShowParams")
      break
    case "shared_params":
      import("./src/main/ets/pages/SharedParams")
      break
    case "shared_main":
      import("./src/main/ets/pages/SharedIndex")
      break

  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:动态配置组件
 * */
@Builder
export function viewBuilder() {
  NavDestinationView() {
    if (routerGetBuilderType() == "shared_step") {
      SharedStepPage()
    } else 
    if (routerGetBuilderType() == "shared_show_params") {
      SharedShowParams()
    } else 
    if (routerGetBuilderType() == "shared_params") {
      SharedParams()
    } else 
    if (routerGetBuilderType() == "shared_main") {
      SharedIndex()
    } 

  }

}


/**
 * AUTHOR:AbnerMing
 * DATE:2025年8月19日 11时14分3秒
 * INTRODUCE:路由配置,此路由配置文件为自动生成，无特殊情况下请无须改动
 * */
export class SharedRouterConfig implements RouterConfig {
  constructor(router: ARouter) {
    setARouter(router)
  }
  getModuleName(): string {
    return "shared"
  }

  async initRouter(builderName: string): Promise<void> {
    return await new Promise((resolve: Function) => {
      importPath(builderName)
      routerInitBuilder(builderName, wrapBuilder(viewBuilder))
      resolve()
    })
  }
}