package gradle_mybatis_spring_study.mapper;

import org.apache.ibatis.annotations.Mapper;

import gradle_mybatis_spring_study.dto.Student;

@Mapper
public interface StudentMapper {
    Student selectStudentByNo(Student student);
}
