package net.sourceforge.fenixedu.applicationTier.Servico.masterDegree.commons.candidate;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.NonExistingServiceException;
import net.sourceforge.fenixedu.dataTransferObject.InfoMasterDegreeCandidateWithInfoPerson;
import net.sourceforge.fenixedu.domain.CandidateSituation;
import net.sourceforge.fenixedu.domain.ExecutionDegree;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;
import net.sourceforge.fenixedu.persistenceTier.IPersistentExecutionDegree;
import net.sourceforge.fenixedu.persistenceTier.ISuportePersistente;
import net.sourceforge.fenixedu.persistenceTier.PersistenceSupportFactory;
import net.sourceforge.fenixedu.applicationTier.Service;

/**
 * @author Nuno Nunes (nmsn@rnl.ist.utl.pt) Joana Mota (jccm@rnl.ist.utl.pt)
 */
public class ReadCandidatesForSelection extends Service {

	public List run(Integer executionDegreeID, List situations)
			throws FenixServiceException, ExcepcaoPersistencia {

		ISuportePersistente sp = null;
		List resultTemp = null;

		sp = PersistenceSupportFactory.getDefaultPersistenceSupport();
		// Read the candidates

		IPersistentExecutionDegree executionDegreeDAO = sp
				.getIPersistentExecutionDegree();
		ExecutionDegree executionDegree = (ExecutionDegree) executionDegreeDAO
				.readByOID(ExecutionDegree.class, executionDegreeID);

		resultTemp = sp.getIPersistentCandidateSituation()
				.readActiveSituationsByExecutionDegreeAndNames(
						executionDegree.getIdInternal(), situations);

		if ((resultTemp == null) || (resultTemp.size() == 0)) {
			throw new NonExistingServiceException();
		}

		Iterator candidateIterator = resultTemp.iterator();
		List result = new ArrayList();
		while (candidateIterator.hasNext()) {
			CandidateSituation candidateSituation = (CandidateSituation) candidateIterator
					.next();
			result.add(InfoMasterDegreeCandidateWithInfoPerson
					.newInfoFromDomain(candidateSituation
							.getMasterDegreeCandidate()));
		}

		return result;

	}

}