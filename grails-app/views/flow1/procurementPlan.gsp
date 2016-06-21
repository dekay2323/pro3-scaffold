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
</div>
<div id="list-project" class="content" role="main">
    <h1>${project.client} ${project.projectNumber} ${project.name}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>
        <thead>
        <tr>
            <g:sortableColumn property="reqNumber" title="Request ID" />
            <g:sortableColumn property="description" title="Description" />
            <th>PO #</th>
            <g:sortableColumn property="budget" title="Budget" />
            <g:sortableColumn property="rasDate" title="RAS Date" />
            <th>Estimated Delivery</th>
            <g:sortableColumn property="strategy" title="Strategy" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${project?.requests}" var="requestItem" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="showRequestItem" id="${requestItem.id}"><g:fieldValue bean="${requestItem}" field="reqNumber" /></g:link></td>
                <td><g:fieldValue bean="${requestItem}" field="description" /></td>
                <td></td>
                <td><g:fieldValue bean="${requestItem}" field="budget" /></td>
                <td><g:fieldValue bean="${requestItem}" field="rasDate" /></td>
                <td></td>
                <td><g:fieldValue bean="${requestItem}" field="strategy" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>