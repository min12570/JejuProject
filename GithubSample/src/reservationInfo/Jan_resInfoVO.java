package reservationInfo;

/*
 * 1월 예약 중, 날짜(일)에 따른 객실 잔여 갯수 확인 VO
 * */

public class Jan_resInfoVO {

	private int jan_day; // 1월 n일
	private int d_ondol; // 더블 온돌
	private int d_twin; // 더블 트윈
	private int t_ondol; // 트윈 온돌
	private int o_ondol; // 오션 온돌
	private int suite_a; // 스위트 A
	private int suite_b; // 스위트 B
	private int suite_o; // 스위트 O

	public int getJan_day() {
		return jan_day;
	}

	public void setJan_day(int jan_day) {
		this.jan_day = jan_day;
	}

	public int getD_ondol() {
		return d_ondol;
	}

	public void setD_ondol(int d_ondol) {
		this.d_ondol = d_ondol;
	}

	public int getD_twin() {
		return d_twin;
	}

	public void setD_twin(int d_twin) {
		this.d_twin = d_twin;
	}

	public int getT_ondol() {
		return t_ondol;
	}

	public void setT_ondol(int t_ondol) {
		this.t_ondol = t_ondol;
	}

	public int getO_ondol() {
		return o_ondol;
	}

	public void setO_ondol(int o_ondol) {
		this.o_ondol = o_ondol;
	}

	public int getSuite_a() {
		return suite_a;
	}

	public void setSuite_a(int suite_a) {
		this.suite_a = suite_a;
	}

	public int getSuite_b() {
		return suite_b;
	}

	public void setSuite_b(int suite_b) {
		this.suite_b = suite_b;
	}

	public int getSuite_o() {
		return suite_o;
	}

	public void setSuite_o(int suite_o) {
		this.suite_o = suite_o;
	}

}
