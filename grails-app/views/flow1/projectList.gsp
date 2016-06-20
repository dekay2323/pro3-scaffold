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
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-project" class="content scaffold-list" role="main">
    <h1>Project List</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:each in="${projectList}" var="project">
        <h2>${project?.name}</h2>
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="reqNumber" title="Client" />
                <g:sortableColumn property="budget" title="Budget" />
                <th class="sortable">Commited</th>
                <th class="sortable">Accrued</th>
                <th class="sortable">Incurred</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${project?.requests}" var="requestItem" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:fieldValue bean="${requestItem}" field="reqNumber" /></td>
                    <td><g:fieldValue bean="${requestItem}" field="budget" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:each>
</div>
</body>
</html>