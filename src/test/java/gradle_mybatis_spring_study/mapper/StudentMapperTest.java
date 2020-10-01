package gradle_mybatis_spring_study.mapper;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gradle_mybatis_spring_study.config.ContextRoot;
import gradle_mybatis_spring_study.dto.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class} )
public class StudentMapperTest {
    protected static final Log log = LogFactory.getLog(StudentMapperTest.class);

	@Autowired
	private StudentMapper mapper;
	
	@Test
	public void testSelectStudentByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

        Student student = new Student();
        student.setStudId(1);
        Student selectStudent = mapper.selectStudentByNo(student);
        log.debug(selectStudent.toString());
        Assert.assertNotNull(student);
	}

	@Test
	public void testSelectStudentByNoWithResultMap() {
	    log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

        Student student = new Student();
        student.setStudId(1);
        Student selectStudent = mapper.selectStudentByNoWithResultMap(student);
        log.debug(selectStudent.toString());
        Assert.assertNotNull(student);
	}
	
	@Test
	public void testSelectStudentByAll() {
	    log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	    List<Student> list = mapper.selectStudentByAll();
	    Assert.assertNotNull(list); 
	    list.stream().forEach(System.out::println);
	}

}
