
package ui.popovermenu;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.os.StrictMode;
import androidx.annotation.DrawableRes;
import androidx.appcompat.widget.AppCompatDrawableManager;
import androidx.appcompat.widget.AppCompatImageView;
import android.util.Log;
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

import com.facebook.react.views.text.ReactFontManager;
import com.github.zawadz88.materialpopupmenu.MaterialPopupMenuBuilder;
import com.github.zawadz88.materialpopupmenu.MaterialPopupMenuBuilder.*;
import com.github.zawadz88.materialpopupmenu.MaterialPopupMenu;
import com.oblador.vectoricons.VectorIconsModule;

import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;


public class RNPopoverMenuModule extends ReactContextBaseJavaModule {

  public RNPopoverMenuModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RNPopoverMenu";
  }


  @TargetApi(21)
  @ReactMethod
  public void Show(final int view, final ReadableMap props, final Callback onDone) {

    final RNPopoverMenuModule me = this;
    final Activity activity = getCurrentActivity();
    final View viewGroup = activity.findViewById(view);

    String title = props.getString("title");
    String tintColor = props.getString("tintColor");

    int menuWidth = props.getInt("menuWidth");
    int rowHeight = props.getInt("rowHeight");

    final ReadableArray menus = props.getArray("menus");

    final MaterialPopupMenuBuilder popupMenuBuilder = new MaterialPopupMenuBuilder();

    if (props.getString("theme").equalsIgnoreCase("dark")) {
      popupMenuBuilder.setStyle(R.style.Widget_MPM_Menu_Dark_CustomBackground);
    }

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
                  CustomItemHolder item = (CustomItemHolder) o;
                  item.setLayoutResId(R.layout.mpm_popup_menu_item);

                  final Function1 customItemLayout = new Function1() {
                    @Override
                    public Object invoke(Object o) {
                      LinearLayout layout = (LinearLayout) o;

                      AppCompatImageView imageView = (AppCompatImageView) layout.findViewById(R.id.mpm_popup_menu_item_icon);
                      if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
                          imageView.setImageTintMode(PorterDuff.Mode.DST);
                      }

                      TextView textView = (TextView) layout.findViewById(R.id.mpm_popup_menu_item_label);

                      if (subMenu.hasKey("label") && !subMenu.isNull("label")) {
                        textView.setText(subMenu.getString("label"));
                      }
                      if (subMenu.hasKey("icon") && !subMenu.isNull("icon")) {
                        ReadableMap icon = subMenu.getMap("icon");
                        Drawable drawable = null;

                        try {
                          Class<?> clazz = Class.forName("prscx.imagehelper.RNImageHelperModule"); //Controller A or B
                          Class params[] = {ReadableMap.class};
                          Method method = clazz.getDeclaredMethod("GenerateImage", params);

                          drawable = (Drawable) method.invoke(null, icon);
                          Log.d("", "");
                        } catch (Exception e) {
                          Log.d("", "");
                        }

                        if (drawable != null) {
                          imageView.setVisibility(View.VISIBLE);
                          imageView.setImageDrawable(drawable);                          
                        }
                      }

                      return o;
                    }
                  };


                  item.setViewBoundCallback(customItemLayout);

                  final Function0 onDoneCallback = new Function0() {
                    @Override
                    public Object invoke() {
                      onDone.invoke(index, menuIndex);

                      return null;
                    }
                  };

                  item.setCallback(onDoneCallback);

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


    this.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        MaterialPopupMenu menu = popupMenuBuilder.build();
        menu.show(activity, viewGroup);

        // final Function0 onCancelCallback = new Function0() {
        //   @Override
        //   public Object invoke() {
        //     onCancel.invoke();

        //     return null;
        //   }
        // };

        // menu.setOnDismissListener(onCancelCallback);
      }
    });
  }
}
