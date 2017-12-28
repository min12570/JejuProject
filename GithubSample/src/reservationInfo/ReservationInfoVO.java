package reservationInfo;

public class ReservationInfoVO {
	private int res_id;
	private int p_id;
	private int room_id;
	private int res_personCnt;
	private String user_id;
	private int res_cost;
	private String res_payment;
	private String res_checkIn;
	private String res_checkOut;
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getRes_personCnt() {
		return res_personCnt;
	}
	public void setRes_personCnt(int res_personCnt) {
		this.res_personCnt = res_personCnt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getRes_cost() {
		return res_cost;
	}
	public void setRes_cost(int res_cost) {
		this.res_cost = res_cost;
	}
	public String getRes_payment() {
		return res_payment;
	}
	public void setRes_payment(String res_payment) {
		this.res_payment = res_payment;
	}
	public String getRes_checkIn() {
		return res_checkIn;
	}
	public void setRes_checkIn(String res_checkIn) {
		this.res_checkIn = res_checkIn;
	}
	public String getRes_checkOut() {
		return res_checkOut;
	}
	public void setRes_checkOut(String res_checkOut) {
		this.res_checkOut = res_checkOut;
	}
	
	
}
