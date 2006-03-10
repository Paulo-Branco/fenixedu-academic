package net.sourceforge.fenixedu.presentationTier.renderers;

import java.util.Collection;
import java.util.Iterator;

import net.sourceforge.fenixedu.renderers.OutputRenderer;
import net.sourceforge.fenixedu.renderers.components.HtmlComponent;
import net.sourceforge.fenixedu.renderers.components.HtmlText;
import net.sourceforge.fenixedu.renderers.layouts.FlowLayout;
import net.sourceforge.fenixedu.renderers.layouts.Layout;
import net.sourceforge.fenixedu.renderers.utils.RenderKit;
import net.sourceforge.fenixedu.renderers.utils.RenderUtils;

/**
 * This renderer allows you to present a collection of objects using
 * a flow layout, that is, every object is presented just after the previous
 * without any special interface organization.
 * 
 * <p>
 * Example:
 * <em>&ltobject A presentation&gt;</em> <em>&ltobject B presentation&gt;</em>
 * <em>&ltobject C presentation&gt;</em>
 * @author naat
 */
public class FlowRenderer extends OutputRenderer {

    private String eachLayout;

    private String eachSchema;

    private String eachClasses;
    
    private String eachStyle;
    
    private String htmlSeparator;

    private String emptyMessageKey;

    private String emptyMessageClasses;

    private String eachInline;
    
    public FlowRenderer() {
        super();
    }

    public String getEachLayout() {
        return eachLayout;
    }

    /**
     * The layout to be used when presenting each sub object.
     * 
     * @property
     */
    public void setEachLayout(String eachLayout) {
        this.eachLayout = eachLayout;
    }

    public String getEachSchema() {
        return eachSchema;
    }

    public String getEachClasses() {
        return this.eachClasses;
    }

    /**
     * The css classes to be set in each sub object's presentation.
     * 
     * @property
     */
    public void setEachClasses(String eachClasses) {
        this.eachClasses = eachClasses;
    }

    public String getEachStyle() {
        return this.eachStyle;
    }

    /**
     *  The css style to be used for each sub object's presentation.
     * 
     * @property
     */
    public void setEachStyle(String eachStyle) {
        this.eachStyle = eachStyle;
    }

    /**
     * The schema to be used when presenting each sub object.
     * 
     * @property
     */
    public void setEachSchema(String eachSchema) {
        this.eachSchema = eachSchema;
    }

    public String getHtmlSeparator() {
        return htmlSeparator;
    }

    /**
     * If you specify this property then value given will be inserted between 
     * any two object's presentations. This, depending on the individual 
     * presentation of each object, can be used to force line breaks or just
     * provide a visual separator.
     * 
     * @property
     */
    public void setHtmlSeparator(String htmlSeparator) {
        this.htmlSeparator = htmlSeparator;
    }

    public String getEmptyMessageKey() {
        return emptyMessageKey;
    }

    /**
     * When the given collection is empty this key will be used
     * to fecth an according message for the situation. The bundle
     * used is the module's default bundle. 
     * 
     * @property
     */
    public void setEmptyMessageKey(String emptyMessageKey) {
        this.emptyMessageKey = emptyMessageKey;
    }

    public String getEmptyMessageClasses() {
        return emptyMessageClasses;
    }

    /**
     * This property can be used to costumize the css classes of the 
     * message shown when the given collection is empty.
     * 
     * @property
     */
    public void setEmptyMessageClasses(String emptyMessageClasses) {
        this.emptyMessageClasses = emptyMessageClasses;
    }

    public String getEachInline() {
        return this.eachInline;
    }

    /**
     * Indicates if the each object's presentation should be placed 
     * inside a <code>&lt;div&gt;</code> or a <code>&lt;span&gt;</code>.
     * 
     * @param eachInline
     */
    public void setEachInline(String eachInline) {
        this.eachInline = eachInline;
    }

    @Override
    protected Layout getLayout(final Object object, Class type) {
        final Iterator iterator = ((Collection) object).iterator();

        return new FlowLayout() {

            private boolean insertSeparator;

            private boolean empty;

            @Override
            public HtmlComponent createComponent(Object object, Class type) {
                HtmlComponent component = null;

                if ((getEmptyMessageKey() != null) && (hasMoreComponents() == false)) {
                    component = new HtmlText(RenderUtils.getResourceString(getEmptyMessageKey()));
                    this.empty = true;
                } else {
                    component = super.createComponent(object, type);
                    this.empty = false;
                }

                return component;

            }

            @Override
            public void applyStyle(HtmlComponent component) {
                if (this.empty) {
                    component.setClasses(getEmptyMessageClasses());
                } else {
                    super.applyStyle(component);
                }
            }

            @Override
            protected boolean hasMoreComponents() {
                return iterator.hasNext();
            }

            @Override
            protected HtmlComponent getNextComponent() {
                if (this.insertSeparator) {
                    this.insertSeparator = false;
                    return new HtmlText(getHtmlSeparator());
                } else if (hasMoreComponents() && getHtmlSeparator() != null) {
                    this.insertSeparator = true;
                }

                return renderValue(iterator.next(), RenderKit.getInstance().findSchema(getEachSchema()),
                        getEachLayout());
            }
        };
    }

}
