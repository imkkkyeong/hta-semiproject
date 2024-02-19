package web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import dao.SellerDao;
import dao.SellerEstimateDao;
import dto.LoginUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.Seller;
import vo.SellerEstimate;
import vo.SellerEstimateStatus;
import vo.UserEstimate;

@WebServlet(urlPatterns = "/seller/fos/InsertSellerEstimate")
@MultipartConfig
public class InsertSellerEstimateServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userEstimateNo = Integer.valueOf(request.getParameter("userEstimateNo"));
		String amountSetting = request.getParameter("amountSetting");
		int amount = Integer.valueOf(request.getParameter("amount"));
		String content = request.getParameter("content");

		
		
		SellerDao sellerDao = new SellerDao();
		
		HttpSession session = request.getSession();
		LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
		if(loginUser == null){
			response.sendRedirect("../loginform.jsp?error=deny");
			return;
		}
		
		Seller seller = null;
		try {
			seller = sellerDao.getSellerById(loginUser.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
		
		int sellerEstimateNo = 0;
		try {
			sellerEstimateNo = sellerEstimateDao.getSequence();
		} catch (SQLException e) {
		}
		
		UserEstimate userEstimate = new UserEstimate();
		userEstimate.setNo(userEstimateNo);
		
		SellerEstimateStatus sellerEstimateStatus =  new SellerEstimateStatus();
		sellerEstimateStatus.setNo(100000);
		
		SellerEstimate sellerEstimate = new SellerEstimate();
		sellerEstimate.setSellerEstimateNo(sellerEstimateNo);
 		sellerEstimate.setSeller(seller);
		sellerEstimate.setUserEstimate(userEstimate);
		sellerEstimate.setAmountSetting(amountSetting);
		sellerEstimate.setAmount(amount);
		sellerEstimate.setContent(content);
		sellerEstimate.setStatus(sellerEstimateStatus);
		
		try {
			sellerEstimateDao.insertSellerEstimate(sellerEstimate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			
			if (part.getSubmittedFileName() != null && part.getSize() > 0) {
				String fileName = System.currentTimeMillis() + part.getSubmittedFileName();
				
				InputStream in = part.getInputStream();
				String saveDirectory = "C:\\semi-workspace\\moobb\\src\\main\\webapp\\resources\\images\\fos\\seller";
				//String saveDirectory = request.getServletContext().getRealPath("/upload");
				String filePath = saveDirectory + File.separator + fileName;
				
				OutputStream out = new FileOutputStream(filePath);
			
				byte[] buf = new byte[1024];
				int len = 0;
				while((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				out.close();
				
				Map<String, Object> param = new HashMap<>();
				param.put("sellerEstimateNo", sellerEstimateNo);
				param.put("imgPath", filePath);
				System.out.println(param);
				try {
					sellerEstimateDao.insertSellerEstimateImages(param);
				} catch (SQLException e) {
				}
			}
		}
		
		response.sendRedirect("SellerInsertEstimateCompleted.jsp");
	}
}
