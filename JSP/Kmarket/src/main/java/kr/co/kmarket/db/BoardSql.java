package kr.co.kmarket.db;

public class BoardSql {
	public static final String SELECT_CATE1 = "SELECT * FROM `km_cs_cate1`";
	public static final String SELECT_CATE2 = "SELECT * FROM `km_cs_cate2` WHERE `cate1`=?";
}
