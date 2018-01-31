using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Popover.Menu.RNPopoverMenu
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNPopoverMenuModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNPopoverMenuModule"/>.
        /// </summary>
        internal RNPopoverMenuModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNPopoverMenu";
            }
        }
    }
}
