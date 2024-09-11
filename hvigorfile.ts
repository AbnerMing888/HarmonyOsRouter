import { appTasks } from '@ohos/hvigor-ohos-plugin';
// 导入接口
import { HvigorNode, HvigorPlugin } from '@ohos/hvigor';

export default {
  system: appTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: []         /* Custom plugin to extend the functionality of Hvigor. */
}

