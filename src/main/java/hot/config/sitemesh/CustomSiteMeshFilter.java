package hot.config.sitemesh;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {
	@Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
          // Assigning default decorator if no path specific decorator found
            builder.addDecoratorPath("/*", "/WEB-INF/views/template/MainDecorator.jsp");
    }
}
