import { getARouter, routerInitConfig } from '@abner/router';
import { AbilityStage } from '@kit.AbilityKit';
import { EntryRouterConfig } from '../../../EntryRouterConfig';
import { StaticRouterConfig } from '@abner/static';
import { SharedRouterConfig } from '@abner/shared';

export class App extends AbilityStage {
  onCreate(): void {
    routerInitConfig([
      new EntryRouterConfig(),
      new StaticRouterConfig(),
      new SharedRouterConfig(getARouter())
    ])
  }
}