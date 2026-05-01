package com.Urbannest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.RequestDispatcher;

@WebServlet("/houseImagesRegisterServlet")
@MultipartConfig
public class HouseImagesRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HouseImagesRegisterServlet() {
        super();
    }

    public static void deleteHouse(int houseNo) {
        Connection conn;
        PreparedStatement ps;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/housedesk", "postgres", "#shreya_5504#");

            ps = conn.prepareStatement("delete from housedetails where houseno = ?");
            ps.setInt(1, houseNo);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        PreparedStatement ps;
        Connection conn;
        RequestDispatcher rdlogin = null;
        int houseNo = 0;
        int imgNo = 1;

        // To validate if the user is logged in or not
        String activeUser = (String) session.getAttribute("user");
        if (activeUser == null) {
            System.out.println("Not Logged in.");
            rdlogin = request.getRequestDispatcher("index.jsp");
            rdlogin.forward(request, response);
            return;
        }

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/housedesk", "postgres", "rushi");

            // Get the house no
            ps = conn.prepareStatement("select max(houseno) from housedetails");
            ResultSet rs = ps.executeQuery();
            while (rs.next())
                houseNo = rs.getInt("max");

            // Get the last img no
            ps = conn.prepareStatement("select max(imgno) from houseimages");
            rs = ps.executeQuery();
            while (rs.next())
                imgNo = rs.getInt("max") + 1;

            // Handle file uploads using Part
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if (part.getContentType() != null) {
                    String itemName = getSubmittedFileName(part);
                    InputStream inputStream = part.getInputStream();

                    // Save the file to a specified directory
                    String uploadDirectory = getServletContext().getRealPath("/HouseDesk_Images/"); // Replace with your desired directory
                    File savedFile = new File(uploadDirectory + File.separator + itemName);

                    try (OutputStream out = new FileOutputStream(savedFile)) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                    } catch (IOException e) {
                        deleteHouse(houseNo); // Rollback in case of an error
                        e.printStackTrace();
                    }

                    // Update the database
                    try {
                        ps = conn.prepareStatement("insert into houseimages values(?,?,?)");
                        ps.setInt(1, imgNo++);
                        ps.setString(2, itemName);
                        ps.setInt(3, houseNo);
                        ps.executeUpdate();
                    } catch (SQLException e) {
                        deleteHouse(houseNo); // Rollback in case of an error
                        e.printStackTrace();
                    }
                }
            }

            // On successful writing images to the folder and image names to the database, redirect to the welcome page
            rdlogin = request.getRequestDispatcher("homePage.jsp");
            rdlogin.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            deleteHouse(houseNo);
            e.printStackTrace();
        }
    }

    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
