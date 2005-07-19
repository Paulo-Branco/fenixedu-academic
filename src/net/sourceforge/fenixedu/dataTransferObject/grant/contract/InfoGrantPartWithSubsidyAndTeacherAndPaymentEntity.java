/*
 * Created on Jun 18, 2004
 *
 */
package net.sourceforge.fenixedu.dataTransferObject.grant.contract;

import net.sourceforge.fenixedu.dataTransferObject.InfoTeacherWithPerson;
import net.sourceforge.fenixedu.domain.grant.contract.IGrantPart;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;

/**
 * @author Pica
 * @author Barbosa
 */
public class InfoGrantPartWithSubsidyAndTeacherAndPaymentEntity extends InfoGrantPart {
    public void copyFromDomain(IGrantPart grantPart) {
        super.copyFromDomain(grantPart);
        if (grantPart != null) {
            setInfoGrantPaymentEntity(InfoGrantPaymentEntity.newInfoFromDomain(grantPart
                    .getGrantPaymentEntity()));
            setInfoResponsibleTeacher(InfoTeacherWithPerson.newInfoFromDomain(grantPart
                    .getResponsibleTeacher()));
            setInfoGrantSubsidy(InfoGrantSubsidyWithContract.newInfoFromDomain(grantPart
                    .getGrantSubsidy()));
        }
    }

    public static InfoGrantPart newInfoFromDomain(IGrantPart grantPart) {
        InfoGrantPartWithSubsidyAndTeacherAndPaymentEntity infoGrantPartWithSubsidyAndTeacherAndPaymentEntity = null;
        if (grantPart != null) {
            infoGrantPartWithSubsidyAndTeacherAndPaymentEntity = new InfoGrantPartWithSubsidyAndTeacherAndPaymentEntity();
            infoGrantPartWithSubsidyAndTeacherAndPaymentEntity.copyFromDomain(grantPart);
        }
        return infoGrantPartWithSubsidyAndTeacherAndPaymentEntity;
    }

    public void copyToDomain(InfoGrantPart infoGrantPart, IGrantPart grantPart)
            throws ExcepcaoPersistencia {
        super.copyToDomain(infoGrantPart, grantPart);

        grantPart.setGrantPaymentEntity(InfoGrantPaymentEntity.newDomainFromInfo(infoGrantPart
                .getInfoGrantPaymentEntity()));
        grantPart.setResponsibleTeacher(InfoTeacherWithPerson.newDomainFromInfo(infoGrantPart
                .getInfoResponsibleTeacher()));
        grantPart.setGrantSubsidy(InfoGrantSubsidyWithContract.newDomainFromInfo(infoGrantPart
                .getInfoGrantSubsidy()));
    }

}
