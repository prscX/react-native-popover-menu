
package ui.popovermenu;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.support.annotation.DrawableRes;
import android.view.ViewGroup;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;

import com.github.zawadz88.materialpopupmenu.MaterialPopupMenuBuilder;
import com.github.zawadz88.materialpopupmenu.MaterialPopupMenuBuilder.*;
import com.github.zawadz88.materialpopupmenu.MaterialPopupMenu;

import java.net.URL;
import java.util.ArrayList;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;


public class RNPopoverMenuModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNPopoverMenuModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNPopoverMenu";
  }


  @ReactMethod
  public void Show(final int view, final ReadableMap props, final Callback onDone, final Callback onCancel) {

    final RNPopoverMenuModule me = this;
    final Activity activity = this.getCurrentActivity();
    ViewGroup viewGroup = activity.findViewById(view);

    String title = props.getString("title");
    String tintColor = props.getString("tintColor");

    int perferedWidth = props.getInt("perferedWidth");
    int rowHeight = props.getInt("rowHeight");

    final ReadableArray menus = props.getArray("menus");

    MaterialPopupMenuBuilder popupMenuBuilder = new MaterialPopupMenuBuilder();

    for (int i = 0; i < menus.size(); i++) {
      final int index = i;

      Function1 secFunc = new Function1() {
        @Override
        public Object invoke(Object o) {

          SectionHolder sectionHolder = (SectionHolder) o;

          ReadableMap menu = menus.getMap(index);

          if (!menu.isNull("label")) {
            ((SectionHolder) o).setTitle(menu.getString("label"));
          }

          if (!menu.isNull("menus")) {
            ReadableArray subMenus = menu.getArray("menus");

            for (int j = 0; j < subMenus.size(); j++) {

              final ReadableMap subMenu = subMenus.getMap(j);

              final Function1 itemFunc = new Function1() {
                @Override
                public Object invoke(Object o) {
                  ItemHolder item = (ItemHolder) o;

                  if (!subMenu.isNull("label")) {
                    ((ItemHolder) o).setLabel(subMenu.getString("label"));
                  }
                  if (!subMenu.isNull("icon")) {
                    ReadableMap icon = subMenu.getMap("icon");
                    Drawable drawable = me.getIcon(icon);


                    ((ItemHolder) o).setIcon(drawable.);
                  }

                  return item;
                }
              };


              ((SectionHolder) o).item(itemFunc);
            }
          }

          return o;
        }
      };

      popupMenuBuilder.section(secFunc);
    }


    MaterialPopupMenu menu = popupMenuBuilder.build();
    menu.show(activity, viewGroup);
  }


  private Drawable getIcon(ReadableMap icon) {
    if (icon == null) return null;

    try {
      URL url = new URL(icon.getString("uri"));
      Bitmap bitmap = BitmapFactory.decodeStream(url.openStream());

      return new BitmapDrawable(reactContext.getResources(), bitmap);
    } catch (Exception e) {

    }

    return null;
  }
}