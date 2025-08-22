import { getARouter,routerInitConfig } from '@abner/router';
import { AbilityStage } from '@kit.AbilityKit';
import { EntryRouterConfig } from '../../../EntryRouterConfig';

import { StaticRouterConfig } from 'static';

import { RouterRouterConfig } from '@abner/router';

import { SharedRouterConfig } from 'shared';

export class App extends AbilityStage {
  onCreate(): void {
    routerInitConfig([
      new StaticRouterConfig(),
      new RouterRouterConfig(),
      new SharedRouterConfig(getARouter()),
      new EntryRouterConfig()
    ])
  }
}