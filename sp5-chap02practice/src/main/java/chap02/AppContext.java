package chap02;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration //아래 클래스를 스프링 설정 클래스로 지정
public class AppContext {

	@Bean //스프링이 생성하는 객체를 빈 객체라고 부른다
	//스프링이 관리하는 빈객체로 등록
	public Greeter greeter() {
		Greeter g = new Greeter();
		g.setFormat("%s, 안녕하세요");
		return g;
	}

}
