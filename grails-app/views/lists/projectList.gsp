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
        <h2>${project?.toString()} [${project.budget}]</h2>
        <g:if test="${project?.requests}">
            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="reqNumber" title="Request Number" width="20%" />
                    <g:sortableColumn property="description" title="Description" width="30%" />
                    <g:sortableColumn property="budget" title="Budget" width="20%" />
                    <th width="10%" class="sortable">Commited</th>
                    <th width="10%" class="sortable">Accrued</th>
                    <th width="10%" class="sortable">Incurred</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${project?.requests}" var="requestItem" status="i">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:fieldValue bean="${requestItem}" field="reqNumber" /></td>
                        <td><g:fieldValue bean="${requestItem}" field="description" /></td>
                        <td><g:fieldValue bean="${requestItem}" field="budget" /></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </g:if>
    </g:each>
</div>
</body>
</html>