package gradle_mybatis_spring_study.service;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.RowBounds;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gradle_mybatis_spring_study.config.ContextRoot;
import gradle_mybatis_spring_study.dto.Address;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {
        ContextRoot.class
})
public class AddressServiceTest {
    protected static final Log log = LogFactory.getLog(AddressServiceTest.class);

    @After
    public void tearDown() throws Exception {
        System.out.println();
    }

    @Autowired
    private AddressService service;
    
    @Test
    public void testSelectAddressByAll() {
        log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

        RowBounds rowBounds_0 = new RowBounds(0, 2);
        List<Address> list = service.selectAddressByAll(rowBounds_0);
        Assert.assertNotNull(list);
        list.stream().forEach(System.out::println);

        RowBounds rowBounds_2 = new RowBounds(2, 2);
        list = service.selectAddressByAll(rowBounds_2);
        Assert.assertNotNull(list);
        list.stream().forEach(System.out::println);
    }

}
