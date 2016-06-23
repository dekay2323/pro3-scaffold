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
    <h1>Procurement Statistics</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list">
        <li class="fieldcontain">
            <span id="PoIssued-label" class="property-label">POs Issued YTD</span>
            <div class="property-value" aria-labelledby="PoIssued-label">${stats?.poIssued}</div>
        </li>
        <li class="fieldcontain">
            <span id="PoValueIssued-label" class="property-label">PO Value Issued YTD</span>
            <div class="property-value" aria-labelledby="PoValueIssued-label">${stats?.poValueIssued}</div>
        </li>
        <li class="fieldcontain">
            <span id="PoIssuedAll-label" class="property-label">POs Issued All Time</span>
            <div class="property-value" aria-labelledby="PoIssuedAll-label">${stats?.poIssuedAll}</div>
        </li>
        <li class="fieldcontain">
            <span id="PoValueIssuedAll-label" class="property-label">POs Value Issued All Time</span>
            <div class="property-value" aria-labelledby="PoValueIssuedAll-label">${stats?.poValueIssuedAll}</div>
        </li>
    </ol>

    <h1>Critical Procurement Status Update</h1>
    <br />
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="client" title="Client" />
            <g:sortableColumn property="projectNumber" title="Project" />
            <th class="sortable">PO#</th>
            <g:sortableColumn property="shortDescription" title="Short Desc" />
            <th class="sortable">Short Desc</th>
            <th class="sortable">RAS Date</th>
            <th class="sortable">Ship Date</th>
            <th class="sortable">Delta Weeks</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${projectList}" var="project" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:fieldValue bean="${project}" field="client" /></td>
                <td><g:link action="procurementPlan" id="${project?.id}">${project?.projectNumber}</g:link> ${project?.name}</td>
                <td></td>
                <td><g:fieldValue bean="${project}" field="shortDescription" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${projectCount ?: 0}" />
    </div>
</div>
</body>
</html>