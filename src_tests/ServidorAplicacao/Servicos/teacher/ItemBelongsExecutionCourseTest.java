/*
 * Created on 7/Out/2003
 *
 */
package ServidorAplicacao.Servicos.teacher;

import ServidorAplicacao.Servico.exceptions.NotAuthorizedException;
import ServidorAplicacao.Servicos.ServiceNeedsAuthenticationTestCase;

/**
 * @author  Luis Egidio, lmre@mega.ist.utl.pt
 * 			Nuno Ochoa,  nmgo@mega.ist.utl.pt
 *
 */
public abstract class ItemBelongsExecutionCourseTest
	extends ServiceNeedsAuthenticationTestCase {

	protected ItemBelongsExecutionCourseTest(String name) {
		super(name);
	}

	public void testItemBelongsExecutionCourse() {

		Object serviceArguments[] = getTestItemSuccessfullArguments();

		try {
			gestor.executar(
				userView,
				getNameOfServiceToBeTested(),
				serviceArguments);
			System.out.println(
				"testItemBelongsExecutionCourse was SUCCESSFULY runned by service: "
					+ getNameOfServiceToBeTested());

		} catch (NotAuthorizedException ex) {
			fail(
				getNameOfServiceToBeTested()
					+ "fail testItemBelongsExecutionCourse"
					+ ex);

		} catch (Exception ex) {
			fail(
				getNameOfServiceToBeTested()
					+ " testItemBelongsExecutionCourse "
					+ ex);
		}

	}

	public void testItemNotBelongsExecutionCourse() {

		Object serviceArguments[] = getTestItemUnsuccessfullArguments();

		try {
			gestor.executar(
				userView,
				getNameOfServiceToBeTested(),
				serviceArguments);
			fail(
				getNameOfServiceToBeTested()
					+ "testItemNotBelongsExecutionCourse");

		} catch (NotAuthorizedException ex) {
			System.out.println(
				"testItemNotBelongsExecutionCourse was SUCCESSFULY runned by service: "
					+ getNameOfServiceToBeTested());

		} catch (Exception ex) {
			fail(
				getNameOfServiceToBeTested()
					+ " testItemNotBelongsExecutionCourse "
					+ ex);
		}
	}

	protected abstract Object[] getAuthorizeArguments();
	protected abstract String[] getAuthorizedUser();
	protected abstract String getDataSetFilePath();
	protected abstract String getNameOfServiceToBeTested();
	protected abstract String[] getNonTeacherUser();
	protected abstract String[] getUnauthorizedUser();
	protected abstract Object[] getTestItemSuccessfullArguments();
	protected abstract Object[] getTestItemUnsuccessfullArguments();
	protected abstract String getApplication();

}
