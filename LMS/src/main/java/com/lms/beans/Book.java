package com.lms.beans;

public class Book {
	private int bid;
	private String bname;
	private String author;
	private int price;
	private String publisher;
	private int publishingYear;
	private int quantityAvailable;
	
		
	public Book(int bid, String bname) {
		super();
		this.bid = bid;
		this.bname = bname;
	}

	public Book(int bid, String bname, String author, int price, String publisher, int publishingYear,
			int quantityAvailable) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.publisher = publisher;
		this.publishingYear = publishingYear;
		this.quantityAvailable = quantityAvailable;
	}

	public Book(String bname, String author, int price, String publisher, int publishingYear,
			int quantityAvailable) {
		super();
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.publisher = publisher;
		this.publishingYear = publishingYear;
		this.quantityAvailable = quantityAvailable;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPublishingYear() {
		return publishingYear;
	}

	public void setPublishingYear(int publishingYear) {
		this.publishingYear = publishingYear;
	}

	public int getQuantityAvailable() {
		return quantityAvailable;
	}

	public void setQuantityAvailable(int quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}
	
}
