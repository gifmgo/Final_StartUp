package kr.or.com.admin;

public class QuizDTO {
   
	private int quiz_no;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String answer;
	private String id;
	
	public int getQuiz_no() {
		return quiz_no;
	}
	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "QuizDTO [quiz_no=" + quiz_no + ", question=" + question + ", option1=" + option1 + ", option2="
				+ option2 + ", option3=" + option3 + ", answer=" + answer + ", id=" + id + "]";
	}

	
	
	
	
}
