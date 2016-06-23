<%@ page import="com.pro3.Vendor; com.pro3.type.LeadTime" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'requestItem.label', default: 'RequestItem')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-requestItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<g:render template="/templates/nav" />

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="procurementPlan" id="${requestItem?.project?.id}">Procurement Plan</g:link></li>
    </ul>
</div>

<div id="show-requestItem" class="content scaffold-show" role="main">
    <h1>Request Item</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:form action="saveRequestItem" method="POST">
        <g:hiddenField name="version" value="${requestItem?.version}" />
        <fieldset class="form">
            <div class="fieldcontain">
                <label for="client">Client</label>
                <g:fieldValue field="client" bean="${requestItem.project}" />
                <g:hiddenField name="client" value="${requestItem?.project?.client?.id}" />
            </div>
            <div class="fieldcontain">
                <label for="project">Project</label>
                <g:fieldValue field="project" bean="${requestItem}" />
                <g:hiddenField name="project" value="${requestItem?.project?.id}" />
            </div>
            <f:field bean="requestItem" property="reqNumber"></f:field>
            <f:field bean="requestItem" property="description"></f:field>
            <f:field bean="requestItem" property="budget"></f:field>
            <f:field bean="requestItem" property="rasDate"></f:field>
            <f:field required="true" bean="requestItem" property="status"></f:field>
            <div class="fieldcontain">
                <label for="estLeadTime">Est Lead Time</label>
                <g:field type="text" field="estLeadTime" />
                <g:select name="leadTime.id" from="${com.pro3.type.LeadTime.list()}" value="${requestItem?.leadTime}" noSelection="${['null':'']}"/>
            </div>
            <f:field bean="requestItem" property="strategy"></f:field>
        </fieldset>

        <h1>Recommended Bidders</h1>
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="name" title="Name" />
            </tr>
            </thead>
            <tbody>
            <g:if test="${!requestItem?.lineItems}">
                <tr class="even"><td>None</td></tr>
            </g:if>
            <g:each in="${requestItem?.bidders}" var="vendors" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:fieldValue bean="${vendors}" field="name" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <h1>Scope of Supply</h1>
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="code" title="code" />
                <g:sortableColumn property="wbs" title="wbs" />
                <g:sortableColumn property="description" title="description" />
                <g:sortableColumn property="quantity" title="quantity" />
                <g:sortableColumn property="unitOfMeasure" title="unitOfMeasure" />
            </tr>
            </thead>
            <tbody>
            <g:if test="${!requestItem?.lineItems}">
                <tr class="even"><td>None</td></tr>
            </g:if>
            <g:each in="${requestItem?.lineItems}" var="lineItem" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:fieldValue bean="${lineItem}" field="code" /></td>
                    <td><g:fieldValue bean="${lineItem}" field="wbs" /></td>
                    <td><g:fieldValue bean="${lineItem}" field="description" /></td>
                    <td><g:fieldValue bean="${lineItem}" field="quantity" /></td>
                    <td><g:fieldValue bean="${lineItem}" field="unitOfMeasure" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
