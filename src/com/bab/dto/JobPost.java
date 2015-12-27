package com.bab.dto;

public class JobPost {
	
	private String jobPosterName;
	private String jobID;
	private String jobPosterEmail;
	
	private String jobTitle;
	private String jobDescription;
	private String interviewDate;
	private String companyName;
	private String expLevel;
	private String skills;
	private String jobLocation;
	
	
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	private String jobPostDate;
	
	
	
	public String getJobPostDate() {
		return jobPostDate;
	}
	public void setJobPostDate(String jobPostDate) {
		this.jobPostDate = jobPostDate;
	}
	public String getJobID() {
		return jobID;
	}
	public void setJobID(String jobID) {
		this.jobID = jobID;
	}
	public String getJobPosterEmail() {
		return jobPosterEmail;
	}
	public void setJobPosterEmail(String jobPosterEmail) {
		this.jobPosterEmail = jobPosterEmail;
	}
	public String getJobPosterName() {
		return jobPosterName;
	}
	public void setJobPosterName(String jobPosterName) {
		this.jobPosterName = jobPosterName;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public String getInterviewDate() {
		return interviewDate;
	}
	public void setInterviewDate(String interviewDate) {
		this.interviewDate = interviewDate;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getExpLevel() {
		return expLevel;
	}
	public void setExpLevel(String expLevel) {
		this.expLevel = expLevel;
	}
	
	
}
