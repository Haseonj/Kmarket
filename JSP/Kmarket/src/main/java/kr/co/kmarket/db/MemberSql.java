package kr.co.kmarket.db;

public class MemberSql {

	public static final String SELECT_MEMBER  = "select * from `km_member` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String INSERT_MEMBER= "insert into `km_member` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`gender`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";

}
