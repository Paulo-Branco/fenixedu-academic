package net.sourceforge.fenixedu.applicationTier.Servico.student;

import net.sourceforge.fenixedu.applicationTier.Service;
import net.sourceforge.fenixedu.domain.Country;
import net.sourceforge.fenixedu.domain.DislocatedStudent;
import net.sourceforge.fenixedu.domain.District;
import net.sourceforge.fenixedu.domain.DomainFactory;
import net.sourceforge.fenixedu.domain.Student;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;

public class WriteDislocatedStudentAnswer extends Service {

    public void run(Integer studentID, Integer countryID, Integer dislocatedCountryID, Integer districtID) throws ExcepcaoPersistencia{
        Student student = rootDomainObject.readStudentByOID(studentID);
        Country country = rootDomainObject.readCountryByOID(countryID);
        Country dislocatedCountry = null;
        if(dislocatedCountryID != null){
            dislocatedCountry = rootDomainObject.readCountryByOID(dislocatedCountryID);
        }
        District district = rootDomainObject.readDistrictByOID(districtID);
        
        DislocatedStudent dislocatedStudent = DomainFactory.makeDislocatedStudent();
        dislocatedStudent.setStudent(student);
        dislocatedStudent.setCountry(country);
        dislocatedStudent.setDislocatedCountry(dislocatedCountry);
        dislocatedStudent.setDistrict(district);
    }
    
}
