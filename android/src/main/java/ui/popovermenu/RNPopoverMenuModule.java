
package ui.popovermenu;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.support.annotation.DrawableRes;
import android.support.v7.widget.AppCompatDrawableManager;
import android.support.v7.widget.AppCompatImageView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

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


  @TargetApi(21)
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

          if (menu.hasKey("label") && !menu.isNull("label")) {
            ((SectionHolder) o).setTitle(menu.getString("label"));
          }

          if (menu.hasKey("menus") && !menu.isNull("menus")) {
            ReadableArray subMenus = menu.getArray("menus");

            for (int j = 0; j < subMenus.size(); j++) {

              final int menuIndex = j;
              final ReadableMap subMenu = subMenus.getMap(j);

              final Function1 itemFunc = new Function1() {
                @Override
                public Object invoke(Object o) {
//                  ItemHolder item = (ItemHolder) o;

//                      if (subMenu.hasKey("label") && !subMenu.isNull("label")) {
//                        item.setLabel(subMenu.getString("label"));
//                      }
//                      if (subMenu.hasKey("icon") && !subMenu.isNull("icon")) {
//                        ReadableMap icon = subMenu.getMap("icon");
//                        Drawable drawable = me.getIcon(icon);
//
//                        item.setIconDrawable(drawable);
//                      }

                  CustomItemHolder item = (CustomItemHolder) o;
                  item.setLayoutResId(R.layout.mpm_popup_menu_item);


                  final Function1 customItemLayout = new Function1() {
                    @Override
                    public Object invoke(Object o) {
                      LinearLayout layout = (LinearLayout) o;

                      AppCompatImageView imageView = (AppCompatImageView) layout.findViewById(R.id.mpm_popup_menu_item_icon);
                      imageView.setImageTintMode(PorterDuff.Mode.DST);

                      TextView textView = (TextView) layout.findViewById(R.id.mpm_popup_menu_item_label);

                      if (subMenu.hasKey("label") && !subMenu.isNull("label")) {
                        textView.setText(subMenu.getString("label"));
                      }
                      if (subMenu.hasKey("icon") && !subMenu.isNull("icon")) {
                        ReadableMap icon = subMenu.getMap("icon");
                        Drawable drawable = me.getIcon(icon);

                        imageView.setVisibility(View.VISIBLE);
                        imageView.setImageDrawable(drawable);
                      }

                      return o;
                    }
                  };


                  item.setViewBoundCallback(customItemLayout);

                  final Function0 callback = new Function0() {
                    @Override
                    public Object invoke() {
                      onDone.invoke(index, menuIndex);

                      return null;
                    }
                  };

                  item.setCallback(callback);

                  return item;
                }
              };


              ((SectionHolder) o).customItem(itemFunc);
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
      String path = icon.getString("uri");
      URL url = new URL(path);
      Bitmap bitmap = BitmapFactory.decodeStream(url.openStream());

      return new BitmapDrawable(reactContext.getResources(), bitmap);
    } catch (Exception e) {

    }

    return null;
  }
}