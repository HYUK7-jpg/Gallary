package servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import pojo.DBcon;


@WebServlet("/register")
@MultipartConfig
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = DBcon.getCon();
			
			String title = request.getParameter("title");
			String artist = request.getParameter("artist");
			String comment = request.getParameter("comment");
			
			Part art = request.getPart("art");
			String fileName = art.getSubmittedFileName();
			System.out.println(fileName);
			
			String savePath = getServletContext().getRealPath("/arts");
			if( fileName != null && !fileName.isEmpty() ) {
				art.write( savePath + File.separator + fileName );
			}
			//프로젝트 내부의 저장소에 파일 저장
			
			//DB에 파일의 이름을 업로드
			String sql = "INSERT INTO gallary VALUES(?, ?, ?, ?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, title);
			pst.setString(2, artist);
			pst.setString(3, comment);
			pst.setString(4, fileName);
			
			pst.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("연결 오류");
		}
	}

}
