<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<g:render template="/templates/nav" />
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="createProject">New Project</g:link></li>
    </ul>
</div>
<div id="list-project" class="content" role="main">
    <h1>Project List</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:each in="${projectList}" var="project">
        <table>
            <thead>
            <tr>
                <th colspan="2" width="40%"><g:link action="procurementPlan" id="${project.id}">${project?.name}</g:link></th>
                <g:sortableColumn property="budget" title="Budget" width="20%" />
                <th width="20%" class="sortable">Commited</th>
                <th width="20%" class="sortable">Accrued</th>
                <th width="20%" class="sortable">Incurred</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${project?.requests}" var="requestItem" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td width="10%"><g:fieldValue bean="${requestItem}" field="reqNumber" /></td>
                    <td width="30%"><g:fieldValue bean="${requestItem}" field="description" /></td>
                    <td width="20%"><g:fieldValue bean="${requestItem}" field="budget" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:each>
</div>
</body>
</html>