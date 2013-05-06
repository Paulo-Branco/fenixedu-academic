package net.sourceforge.fenixedu.presentationTier.Action.projectsManagement.adistInstitucionalProjectsManagement;

import pt.ist.fenixWebFramework.struts.annotations.Forward;
import pt.ist.fenixWebFramework.struts.annotations.Forwards;
import pt.ist.fenixWebFramework.struts.annotations.Mapping;

@Mapping(module = "adistInstitucionalProjectsManagement", path = "/overheadReport", attribute = "rubricForm",
        formBean = "rubricForm", scope = "request", parameter = "method")
@Forwards(value = {
        @Forward(name = "showgeneratedOverheadsReport", path = "/projectsManagement/showGeneratedOverheadsReport.jsp"),
        @Forward(name = "index", path = "/projectsManagement/firstPage.jsp"),
        @Forward(name = "showoverheadsSummaryReport", path = "/projectsManagement/showOverheadsSummaryReport.jsp"),
        @Forward(name = "showtransferedOverheadsReport", path = "/projectsManagement/showTransferedOverheadsReport.jsp"),
        @Forward(name = "helpPage", path = "/projectsManagement/helpPage.jsp") })
public class OverheadReportsDispatchActionForInstitucionalADISTProjectsManagement extends
        net.sourceforge.fenixedu.presentationTier.Action.projectsManagement.OverheadReportsDispatchAction {
}