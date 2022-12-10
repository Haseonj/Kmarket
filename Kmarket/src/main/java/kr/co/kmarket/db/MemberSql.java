package kr.co.kmarket.db;

public class MemberSql {

	public static final String SELECT_Member  = "select * from `km_member` where `uid`=? and `pass`=SHA2(?, 256)";
}
