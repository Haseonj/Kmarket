package kr.co.kmarket.db;

public class ProductSql {

	public static final String INSERT_PRODUCT = "insert into `km_product` set "
												+ "`prodCate1`=?, `prodCate2`=?, `prodName`=?, "
												+ "`descript`=?, `company`=?, `seller`=?, "
												+ "`price`=?, `discount`=?, `point`=?, "
												+ "`stock`=?,`delivery`=?, `thumb1`=?, "
												+ "`thumb2`=?,`thumb3`=?, `detail`=?, "
												+ "`ip`=?, `rdate`=NOW()";
	public static final String SELECT_PRODUCT = "select * from `km_product` where `prodNo`=?";
	public static final String SELECT_PRODUCT_FOR_ORDER = "select * from `km_product` where `prodNo`=?";
	public static final String SELECT_PRODUCTS = "SELECT "
												+ "	a.*, "
												+ "	FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
												+ "from `km_product` AS a where `prodCate1`=? and `prodCate2`=? limit 10;";
	public static final String SELECT_ADMIN_PRODUCTS ="SELECT * FROM `km_product`";
	public static final String SELECT_SEARCH_ADMIN_PRODUCTS_PRODNAME ="SELECT * FROM `km_product` where `prodName` like ?";
	public static final String SELECT_SEARCH_ADMIN_PRODUCTS_PRODNO ="SELECT * FROM `km_product` where `prodNo` like ?";
	public static final String SELECT_SEARCH_ADMIN_PRODUCTS_COMPANY ="SELECT * FROM `km_product` where `company` like ?";
	public static final String SELECT_SEARCH_ADMIN_PRODUCTS_SELLER ="SELECT * FROM `km_product` where `seller` like ?";
	public static final String SELECT_ADMIN_COUNT_TOTAL = "select count(`prodNo`) from `km_product`";
	public static final String SELECT_PRODCATE1 = "select * from `km_product_cate1`";
	public static final String SELECT_PRODCATE2 = "select * from `km_product_cate2` where `cate1`=?";
	public static final String SELECT_PRODCATES = "SELECT * FROM `km_product_cate1` AS a "
													+ "JOIN `km_product_cate2` AS b ON a.cate1 = b.cate1 "
													+ "WHERE a.`cate1`=? AND b.`cate2`=?";
	public static final String SELECT_COUNT_TOTAL = "select count(`prodNo`) from `km_product` where `prodCate1`=? and `prodCate2`=?";
	public static final String SELECT_ORDER_BY_HIGHSOLD = "select * from `km_product` where `prodCate1`=? and `prodCate2`=? order by `sold` desc limit 10 ";
	public static final String SELECT_ORDER_BY_LOWPRICE = "select * from `km_product` where `prodCate1`=? and `prodCate2`=? order by `price` asc limit 10 ";
	public static final String SELECT_ORDER_BY_HIGHPRICE = "select * from `km_product` where `prodCate1`=? and `prodCate2`=? order by `price` desc limit 10 ";
	public static final String SELECT_ORDER_BY_HIGHRATING = "select * from `km_product` where `prodCate1`=? and `prodCate2`=? order by `score` desc limit 10 ";
	public static final String SELECT_ORDER_BY_HIGHREVIEW = "select * from `km_product` where `prodCate1`=? and `prodCate2`=? order by `review` desc limit 10 ";
	public static final String SELECT_ORDER_BY_NEWOLD = "select * from `km_product` where `prodCate1`=? and `prodCate2`=? order by `rdate` desc limit 10 ";

	// cart
	public static final String INSERT_CART = "insert into `km_product_cart` set "
											+ "`uid`=?, `prodNo`=?, `count`=?, `price`=?, `discount`=?, `point`=?, `delivery`=?, `total`=?, `rdate`=NOW()";
	public static final String SELECT_CARTS = "SELECT a.*, b.prodName, b.descript, b.company, b.seller, b.thumb1, "
												+ "FLOOR(a.price * (1 - a.discount / 100)) AS `salePrice` "
												+ "from `km_product_cart` AS a "
												+ "JOIN `km_product` AS b ON a.prodNo = b.prodNo "
												+ "where `uid`=?";
	
	public static final String SELECT_CART = "SELECT * FROM `km_product_cart` AS a "
												+ "JOIN `km_product` AS b "
												+ "ON a.prodNo = b.prodNo "
												+ "WHERE `cartNo`=?";
	
	public static final String DELETE_CART_LIST = "delete from `km_product_cart` where `uid`=? and `cartNo`=?";
			
	// order
	public static final String INSERT_ORDER = "insert into `km_product_order` set "
												+ "`ordUid`=?, `ordCount`=?, `ordPrice`=?, `ordDiscount`=?, `ordDelivery`=?, `savePoint`=?, `usedPoint`=?, `ordTotPrice`=?, "
												+ "`recipName`=?, `recipHp`=?, `recipZip`=?, `recipAddr1`=?, `recipAddr2`=?, `ordPayment`=?, `ordComplete`=?, `ordDate`=NOW()";
	public static final String SELECT_LATEST_ORDER = "select `ordNo` from `km_product_order` where `ordUid`=? order by `ordNo` desc limit 1";
	public static final String SELECT_ORDER = "SELECT * "
												+ "from `km_product_order` "
												+ "where `ordUid`=? order by `ordNo` desc limit 1";
	public static final String SELECT_ORDER_NO = "SELECT `ordNo` "
													+ "from `km_product_order` "
													+ "where `ordUid`=?";
	public static final String SELECT_ORDER_PRODUCTS = "select `price`, `discount`, `point`, `delivery` from `km_product` where `prodNo`=?";
	public static final String INSERT_ORDER_ITEM = "insert into `km_product_order_item` set "
													+"`ordNo`=?, `prodNo`=?, `count`=?, `price`=?, `discount`=?, `point`=?, `delivery`=?, `total`=?";
	public static final String INSERT_MEMBER_POINT = "insert into `km_member_point` set `uid`=?, `ordNo`=?, `point`=?, `pointDate`=NOW()";
	public static final String SELECT_MEMBER_POINT = "SELECT `point` FROM `km_member` WHERE `uid`=?";
	public static final String UPDATE_SAVE_MEMBER_POINT = "update `km_member` set `point`=`point`+?-? WHERE `uid`=?";
}
