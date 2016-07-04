<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<g:render template="/templates/nav" />
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-project" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="project" />
    <g:form resource="${this.project}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.project}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>

    <h1>Requests</h1>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="reqNumber" title="Request Number" />
            <g:sortableColumn property="description" title="Description" />
            <g:sortableColumn property="budget" title="Budget" />
            <g:sortableColumn property="rasDate" title="RAS Date" />
            <g:sortableColumn property="estLeadTime" title="Est Lead Time" />
            <g:sortableColumn property="strategy" title="Strategy" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${project.requests}" var="requestItem" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link method="GET" controller="requestItem" action="show" id="${requestItem?.id}"><f:display bean="${requestItem}" property="reqNumber" /></g:link></td>
                <td><f:display bean="${requestItem}" property="description" /></td>
                <td><f:display bean="${requestItem}" property="budget" /></td>
                <td><f:display bean="${requestItem}" property="rasDate" /></td>
                <td><f:display bean="${requestItem}" property="estLeadTime" /> <f:display bean="${requestItem}" property="leadTime" /></td>
                <td><f:display bean="${requestItem}" property="strategy" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>
