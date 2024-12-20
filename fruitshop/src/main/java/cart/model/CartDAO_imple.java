package cart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cart.domain.CartVO;
import product.domain.ProductVO;

public class CartDAO_imple implements CartDAO {

	private DataSource ds;	// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public CartDAO_imple() {	
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/semioracle");		// 파라미터가 web.xml, tomcat 내 context.xml 에 정의한 name 과 일치 해야 함
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}// end of public CartDAO_imple() --------------------
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if (rs != null) 	{ rs.close(); rs = null;}
			if (pstmt != null)  { pstmt.close(); pstmt = null;}
			if (conn != null)   { conn.close(); conn = null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// end of private void close() -----------------
	
	
	
	
	// 장바구니 리스트 보기 //
	@Override
	public List<CartVO> cartListSelectAll(int user_no) throws SQLException {
		
		
		List<CartVO> cartList = new ArrayList<>();
		
		try {
	        conn = ds.getConnection();
	        

	        String sql = " SELECT c.fk_user_no, c.cart_no, c.cart_prodcount, " 
	                   + "        p.prod_thumnail, p.prod_name, p.prod_price " 
	                   + " FROM tbl_cart c " 
	                   + " INNER JOIN tbl_products p " 
	                   + " ON c.fk_prod_no = p.prod_no "
	                   + " where fk_user_no = ? ";

	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, user_no);
	        
	        rs = pstmt.executeQuery();
	        
	        
	        
	        while (rs.next()) {
	            // ProductVO 설정
	            ProductVO pdvo = new ProductVO();
	            pdvo.setProd_thumnail(rs.getString("prod_thumnail"));
	            pdvo.setProd_name(rs.getString("prod_name"));
	            pdvo.setProd_price(rs.getInt("prod_price"));

	            // CartVO 설정
	            CartVO cartvo = new CartVO();
	            cartvo.setCart_no(rs.getInt("cart_no"));
	            cartvo.setCart_prodcount(rs.getInt("cart_prodcount"));
	            cartvo.setProduct(pdvo);

	            cartList.add(cartvo);
	        }

	    } finally {
	        close();
	    }

	    return cartList;
		
	}// end of public List<CartVO> cartListSelectAll() throws SQLException {
	
	
	// 장바구니 X버튼 눌렀을 때 한 행 삭제 //
	@Override
	public boolean deleteCartItem(int cart_no) throws SQLException {
		
		boolean isDeleted = false;

        try {
        	
            conn = ds.getConnection();
            String sql = " delete from tbl_cart "
            		   + " where cart_no = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cart_no);

            int n = pstmt.executeUpdate();
            
            if (n != 0) {
            	isDeleted = true;
            }
            
            
        } finally {
            close();
        }

        return isDeleted;
	}

}
