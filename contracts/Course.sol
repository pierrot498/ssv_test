// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

/* 
@note 
We made an analogy since students are "non fungible"  we assume they detain 
a nature similar to   NFTs where the courses are the owners.

note: we didn't implement access control features because it seems not really the point of exercise, but could have

note : getters aren't optimised
 */
contract Course {
    struct CourseData {
        string name;
        uint256[] teachers;
    }

    /// @dev course_id => courseData
    mapping(uint256 => CourseData) public courses;
    uint256 coursesLength;

    /// @dev student_id => course_id
    mapping(uint256 => uint256) public registrations;
    uint256 regLength;

    /// @dev student_id => grades
    mapping(uint256 => uint256) public grades;

    //events

    event Registration(string _name, uint256 _grade, uint256 _course_id);
    event Transfer(uint256 _studentId, uint256 _courseId);

    function registerStudent(
        string memory _name,
        uint256 _grade,
        uint256 _course_id
    ) external {
        registrations[regLength] = _course_id;
        grades[regLength] = _grade;

        unchecked {
            regLength++;
        }
        emit Registration(_name, _grade, _course_id);
    }

    function registerCourse(string memory _name, uint256[] memory _teachers)
        external
    {
        courses[coursesLength] = CourseData(_name, _teachers);
        unchecked {
            coursesLength++;
        }
    }

    function transfer(uint256 _studentId, uint256 _courseId) external {
        require(_courseId < coursesLength, " non existent courseId");
        require(_studentId < regLength, " non existent studentId");
        registrations[_studentId] = _courseId;

        emit Transfer(_studentId, _courseId);
    }

    function getAverageGrade(uint256 _courseId)
        external
        view
        returns (uint256 average)
    {
        uint256 count;
        for (uint256 i = 0; i < regLength; i++) {
            if (registrations[i] == _courseId) {
                unchecked {
                    average += grades[i];
                    count++;
                }
            }
        }

        return average / count;
    }

    function getStudentCount(uint256 _teacherId)
        external
        view
        returns (uint256 studentCount)
    {
        for (uint256 i = 0; i < regLength; i++) {
            uint256[] memory teachers = courses[registrations[i]].teachers;
            for (uint256 j = 0; j < teachers.length; j++) {
                if (teachers[i] == _teacherId) {
                    unchecked {
                        studentCount++;
                    }
                    break;
                }
            }
        }
    }

    function getAverageGradeByTeacher(uint256 _teacherId)
        external
        view
        returns (uint256 average)
    {
        uint256 studentCount;
        for (uint256 i = 0; i < regLength; i++) {
            uint256[] memory teachers = courses[registrations[i]].teachers;
            for (uint256 j = 0; j < teachers.length; j++) {
                if (teachers[i] == _teacherId) {
                    unchecked {
                        studentCount++;
                        average += grades[i];
                    }

                    break;
                }
            }
            unchecked {}
        }
        return 0;
    }
}
