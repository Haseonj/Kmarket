package kr.co.kmarket.db;

public class MainSql {

	public static final String SELECT_BEST_PRODUCT = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
													+ "FROM `km_product` AS a "
													+ "ORDER BY `sold` DESC LIMIT 5";
	
	public static final String SELECT_HIT_PRODUCT = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
													+ "FROM `km_product` AS a "
													+ "ORDER BY `hit` DESC LIMIT 8";
	
	public static final String SELECT_REC_PRODUCT = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
													+ "FROM `km_product` AS a "
													+ "ORDER BY `review` DESC LIMIT 8";
	
	public static final String SELECT_LATEST_PRODUCT = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
														+ "FROM `km_product` AS a "
														+ "ORDER BY `rdate` DESC LIMIT 8";
	
	public static final String SELECT_DIS_PRODUCT = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
													+ "FROM `km_product` AS a "
													+ "ORDER BY `discount` DESC LIMIT 8";
	
	public static final String SELECT_HOT_PRODUCT = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `salePrice` "
													+ "FROM `km_product` AS a "
													+ "ORDER BY `sold` DESC LIMIT 8";
}
