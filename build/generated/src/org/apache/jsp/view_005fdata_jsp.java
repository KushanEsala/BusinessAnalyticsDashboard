package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Map;
import java.util.List;

public final class view_005fdata_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Data Views</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1 class=\"mt-4\">Employee Performance Summary</h1>\n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Employee ID</th>\n");
      out.write("                    <th>Name</th>\n");
      out.write("                    <th>Position</th>\n");
      out.write("                    <th>Rating</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
 
                    List<Map<String, Object>> employeePerformanceData = (List<Map<String, Object>>) request.getAttribute("employeePerformanceData");
                    for (Map<String, Object> record : employeePerformanceData) {
                
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( record.get("employee_id") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("employee_name") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("position") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("rating") );
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        <h1 class=\"mt-4\">Monthly Revenue Summary</h1>\n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Year</th>\n");
      out.write("                    <th>Month</th>\n");
      out.write("                    <th>Total Revenue</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
 
                    List<Map<String, Object>> monthlyRevenueData = (List<Map<String, Object>>) request.getAttribute("monthlyRevenueData");
                    for (Map<String, Object> record : monthlyRevenueData) {
                
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( record.get("year") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("month") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("total_revenue") );
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        <h1 class=\"mt-4\">Sales Summary</h1>\n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Product Name</th>\n");
      out.write("                    <th>Total Quantity Sold</th>\n");
      out.write("                    <th>Total Sales</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
 
                    List<Map<String, Object>> salesSummaryData = (List<Map<String, Object>>) request.getAttribute("salesSummaryData");
                    for (Map<String, Object> record : salesSummaryData) {
                
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( record.get("product_name") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("total_quantity_sold") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( record.get("total_sales") );
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
