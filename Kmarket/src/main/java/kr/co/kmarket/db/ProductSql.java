package kr.co.kmarket.db;

public class ProductSql {

	public static final String INSERT_PRODUCT = "insert into `km_product` set "
												+ "`prodCate1`=?, `prodCate2`=?, `prodName`=?, "
												+ "`descript`=?, `company`=?, `price`=?, "
												+ "`discount`=?, `point`=?, `stock`=?, "
												+ "`delivery`=?, `thumb1`=?, `thumb2`=?, "
												+ "`thumb3`=?, `detail`=?";
	public static final String SELECT_PRODCATE1 = "select * from `km_product_cate1`";
}
