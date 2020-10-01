package gradle_mybatis_spring_study.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gradle_mybatis_spring_study.dto.Address;

@Service
public class AddressService {
    private final String namespace = "gradle_mybatis_spring_study.mapper.AddressMapper";

    
    @Autowired
    private SqlSession sqlSession;
    
    /* row 바운드 */
    public List<Address> selectAddressByAll(RowBounds rowBounds){
        return sqlSession.selectList(namespace + ".selectAddressByAll", null, rowBounds);
    }
}
