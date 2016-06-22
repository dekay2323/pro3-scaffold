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
</div>
<div id="show-requestItem" class="content scaffold-show" role="main">
    <h1>Request Item</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list">
        <li class="fieldcontain">
            <span id="client-label" class="property-label">Client</span>
            <div class="property-value">${requestItem?.client}</div>
        </li>
        <li class="fieldcontain">
            <span id="project-label" class="property-label">Project</span>
            <div class="property-value">${requestItem?.project?.projectNumber} ${requestItem?.project?.name}</div>
        </li>
        <li class="fieldcontain">
            <span id="reqNumber-label" class="property-label">Requistion Number</span>
            <div class="property-value">${requestItem?.reqNumber}</div>
        </li>
        <li class="fieldcontain">
            <span id="description-label" class="property-label">Description</span>
            <div class="property-value">${requestItem?.description}</div>
        </li>
        <li class="fieldcontain">
            <span id="budget-label" class="property-label">Budget</span>
            <div class="property-value">${requestItem?.budget}</div>
        </li>
        <li class="fieldcontain">
            <span id="rasDate-label" class="property-label">RAS Date</span>
            <div class="property-value">${requestItem?.rasDate}</div>
        </li>
        <li class="fieldcontain">
            <span id="estLeadTime-label" class="property-label">Estimated Lead Time</span>
            <div class="property-value">${requestItem?.estLeadTime} ${requestItem?.leadTime}</div>
        </li>
        <li class="fieldcontain">
            <span id="strategy-label" class="property-label">Strategy</span>
            <div class="property-value">${requestItem?.strategy}</div>
        </li>
    </ol>

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
            <g:sortableColumn property="code" title="Code" />
            <g:sortableColumn property="wbs" title="WBS" />
            <g:sortableColumn property="description" title="Description" />
            <g:sortableColumn property="quantity" title="Qty" />
            <g:sortableColumn property="unitOfMeasure" title="UoM" />
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

    <g:form resource="${this.requestItem}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="editRequestItem" id="${this.requestItem.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
