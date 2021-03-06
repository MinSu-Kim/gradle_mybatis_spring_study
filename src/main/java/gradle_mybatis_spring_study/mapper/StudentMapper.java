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

    /* 여러 개의 입력 파라미터 전달 */
    Student selectStudentByMap(Map<String, String> map);
    List<Student> selectAllStudentByMap(Map<String, String> map);

    /* ResultSet 처리방식의 재정의 */
    Map<Integer, String> selectStudentForMap(int studId);

    /* 동적 SQL - set 조건 */
    int updateSetStudent(Student student);

}
