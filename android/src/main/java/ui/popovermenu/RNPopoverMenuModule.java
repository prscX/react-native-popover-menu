
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
import android.support.annotation.DrawableRes;
import android.support.v7.widget.AppCompatDrawableManager;
import android.support.v7.widget.AppCompatImageView;
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
  public void Show(final int view, final ReadableMap props, final Callback onDone, final Callback onCancel) {

    final RNPopoverMenuModule me = this;
    final Activity activity = getCurrentActivity();
    final ViewGroup viewGroup = activity.findViewById(view);

    String title = props.getString("title");
    String tintColor = props.getString("tintColor");

    int perferedWidth = props.getInt("perferedWidth");
    int rowHeight = props.getInt("rowHeight");

    final ReadableArray menus = props.getArray("menus");

    final MaterialPopupMenuBuilder popupMenuBuilder = new MaterialPopupMenuBuilder();

    if (props.getString("theme").equalsIgnoreCase("dark")) {
      popupMenuBuilder.setStyle(R.style.Widget_MPM_Menu_Dark);
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
                      imageView.setImageTintMode(PorterDuff.Mode.DST);

                      TextView textView = (TextView) layout.findViewById(R.id.mpm_popup_menu_item_label);

                      if (subMenu.hasKey("label") && !subMenu.isNull("label")) {
                        textView.setText(subMenu.getString("label"));
                      }
                      if (subMenu.hasKey("icon") && !subMenu.isNull("icon")) {
                        ReadableMap icon = subMenu.getMap("icon");
                        Drawable drawable = me.generateVectorIcon(icon);

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


    this.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        MaterialPopupMenu menu = popupMenuBuilder.build();
        menu.show(activity, viewGroup);
      }
    });
  }

  @TargetApi(21)
  private Drawable generateVectorIcon(ReadableMap icon) {
    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
    StrictMode.setThreadPolicy(policy);

    String family = icon.getString("family");
    String name = icon.getString("name");
    String glyph = icon.getString("glyph");
    String color = icon.getString("color");
    int size = icon.getInt("size");

    if (name != null && name.length() > 0 && name.contains(".")) {
      Resources resources = getReactApplicationContext().getResources();
      name = name.substring(0, name.lastIndexOf("."));

      final int resourceId = resources.getIdentifier(name, "drawable", getReactApplicationContext().getPackageName());
      return getReactApplicationContext().getDrawable(resourceId);
    }

    float scale = getReactApplicationContext().getResources().getDisplayMetrics().density;
    String scaleSuffix = "@" + (scale == (int) scale ? Integer.toString((int) scale) : Float.toString(scale)) + "x";
    int fontSize = Math.round(size * scale);

    Typeface typeface = ReactFontManager.getInstance().getTypeface(family, 0, getReactApplicationContext().getAssets());
    Paint paint = new Paint();
    paint.setTypeface(typeface);
    paint.setColor(Color.parseColor(color));
    paint.setTextSize(size);
    paint.setAntiAlias(true);
    Rect textBounds = new Rect();
    paint.getTextBounds(glyph, 0, glyph.length(), textBounds);

    Bitmap bitmap = Bitmap.createBitmap(textBounds.width(), textBounds.height(), Bitmap.Config.ARGB_8888);
    Canvas canvas = new Canvas(bitmap);
    canvas.drawText(glyph, -textBounds.left, -textBounds.top, paint);

    return new BitmapDrawable(getReactApplicationContext().getResources(), bitmap);
  }
}