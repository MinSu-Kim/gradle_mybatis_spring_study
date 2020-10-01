package gradle_mybatis_spring_study.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import gradle_mybatis_spring_study.dto.Address;

public interface AddressMapper {
    /* row 바운드 */
    List<Address> selectAddressByAll(RowBounds rowBounds);
}
