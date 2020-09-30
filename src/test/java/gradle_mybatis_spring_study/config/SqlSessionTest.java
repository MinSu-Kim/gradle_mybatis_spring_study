package gradle_mybatis_spring_study.config;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class} )
public class SqlSessionTest {
    private static final Log log = LogFactory.getLog(SqlSessionTest.class);

    @After
    public void tearDown() throws Exception {
        System.out.println();
    }
    
    @Autowired
    private SqlSessionFactory sessionFactory;

    @Test
    public void testOpenSession() {
        log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
        SqlSession session = sessionFactory.openSession();
        log.debug("session " + session);
        Assert.notNull(session, "The class must not be null");
    }
}
