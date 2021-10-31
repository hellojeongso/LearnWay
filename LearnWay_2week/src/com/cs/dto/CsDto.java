package com.cs.dto;

import java.util.Date;

public class CsDto {
	private int board_no;
	private int board_group;
	private int boardgroup_no;
	private String board_id;
	private String board_title;
	private String board_content;
	private String board_category;
	private Date board_date;
	
	public CsDto() {
		
	}

	public CsDto(int board_no, int board_group, int boardgroup_no, String board_id, String board_title,
			String board_content, String board_category, Date board_date) {
	
		this.board_no = board_no;
		this.board_group = board_group;
		this.boardgroup_no = boardgroup_no;
		this.board_id = board_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_category = board_category;
		this.board_date = board_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_group() {
		return board_group;
	}

	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}

	public int getBoardgroup_no() {
		return boardgroup_no;
	}

	public void setBoardgroup_no(int boardgroup_no) {
		this.boardgroup_no = boardgroup_no;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	
	
}

