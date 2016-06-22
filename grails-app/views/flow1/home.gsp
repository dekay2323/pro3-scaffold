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
    <h1>Pro3</h1>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <div id="controllers" role="navigation">
                <ul>
                    <li class="controller">
                        <g:link controller="client" action="create">Client</g:link>
                    </li>
                    <li class="controller">

                        <g:link controller="requestStatus" action="create">Request Status</g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="strategy" action="create">Strategy</g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="vendor" action="create">Vendor</g:link>
                    </li>
                </ul>
            </div>
        </section>
    </div>

</div>
</body>
</html>