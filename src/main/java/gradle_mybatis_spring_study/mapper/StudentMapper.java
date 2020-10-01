package gradle_mybatis_spring_study.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gradle_mybatis_spring_study.dto.Student;

@Mapper
public interface StudentMapper {
    Student selectStudentByNo(Student student);
    Student selectStudentByNoWithResultMap(Student student);
    List<Student> selectStudentByAll();
    
    int insertStudent(Student student);
    int deleteStudent(int id);
    int updateStudent(Student student);

    /* ResultMap - List */
    List<Student> selectStudentByAllForResutlMap();

    /* ResultMap - HashMap */
    List<Map<String, Object>> selectStudentByAllForHashMap();

    /* 내포된 결과매핑(ResultMap)을 사용한 일대일 매핑 */
    Student selectStudentByNoAssociation(Student student);

    /* enum 타입 다루기 */
    int insertEnumStudent(Student student);

}
