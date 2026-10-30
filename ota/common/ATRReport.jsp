<%@ page import="java.io.*, java.util.*, com.bccl.ota.web.controllerbeans.OtaWebController" %>
<%
    response.setHeader("Content-Disposition", "attachment; filename=\"ATR_REPORT.xlsx\"");

    OtaWebController controller = new OtaWebController();
    Object[] bindParams = new Object[] { }; // Fill if needed
    File excelFile = null;

    try {
        excelFile = controller.generateExcelTempFile(bindParams);

        // Stream the Excel file to the browser
        try (FileInputStream fis = new FileInputStream(excelFile);
             OutputStream os = response.getOutputStream()) {

            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.flush();
        }

    } catch (Exception e) {
        // Print errors to server log, not to JSP output
        e.printStackTrace();
    } finally {
        if (excelFile != null && excelFile.exists()) {
            excelFile.delete();
        }
    }
%>