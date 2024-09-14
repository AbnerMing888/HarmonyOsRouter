import { ARouter, routerGetBuilderType, routerInitBuilder, RouterConfig, setARouter } from '@abner/router';
import { SharedIndex } from './src/main/ets/pages/SharedIndex';
import { SharedParams } from './src/main/ets/pages/SharedParams';
import { SharedShowParams } from './src/main/ets/pages/SharedShowParams';
import { SharedStepPage } from './src/main/ets/pages/SharedStepPage';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/9/4
 * INTRODUCE:路由配置
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
      this.importPath(builderName)
      routerInitBuilder(builderName, wrapBuilder(viewBuilder))
      resolve()
    })
  }

  importPath(builderName: string) {
    switch (builderName) {
      case "shared_main":
        import("./src/main/ets/pages/SharedIndex")
        break
      case "shared_params":
        import("./src/main/ets/pages/SharedParams")
        break
      case "shared_show_params":
        import("./src/main/ets/pages/SharedShowParams")
        break
      case "shared_step":
        import("./src/main/ets/pages/SharedStepPage")
        break
    }
  }
}

/**
 * AUTHOR:AbnerMing
 * INTRODUCE:
 * @param value 传递的数据，可以单独传递给组件
 * */
@Builder
export function viewBuilder(_: Object) {
  NavDestination() {
    if (routerGetBuilderType() == "shared_main") {
      SharedIndex()
    } else if (routerGetBuilderType() == "shared_params") {
      SharedParams()
    } else if (routerGetBuilderType() == "shared_show_params") {
      SharedShowParams()
    } else if (routerGetBuilderType() == "shared_step") {
      SharedStepPage()
    }
  }
  .hideTitleBar(true)
  .height('100%')
}
