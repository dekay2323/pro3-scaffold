<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="material" />
    <title>Project List</title>
</head>
<body>
<div class="container">
    <div class="dash-widgets">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div id="site-visits" class="dw-item bgm-teal">
                    <div class="list-group lg-even-white">
                        <div class="list-group-item media sv-item">
                            <div class="media-body">
                                <small>Project Number</small>
                                <h3>${project.projectNumber}</h3>
                            </div>
                        </div>

                        <div class="list-group-item media sv-item">
                            <div class="media-body">
                                <small>Name</small>
                                <h3>${project.name}</h3>
                            </div>
                        </div>

                        <div class="list-group-item media sv-item">
                            <div class="media-body">
                                <small>Short Description</small>
                                <h3>${project.shortDescription}</h3>
                            </div>
                        </div>

                        <div class="list-group-item media sv-item">
                            <div class="media-body">
                                <small>Client</small>
                                <h3>${project.client}</h3>
                            </div>
                        </div>


                        <div class="list-group-item media sv-item">
                            <div class="media-body">
                                <small>Budget</small>
                                <h3><g:formatNumber number="${project.budget}" type="currency" /></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h2>Requests</h2>
        </div>

        <div class="card-body table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th data-column-id="received">Request Number</th>
                    <th data-column-id="received">Description</th>
                    <th data-column-id="received">Budget</th>
                    <th data-column-id="received">RAS Date</th>
                    <th data-column-id="received">Est Lead Time</th>
                    <th data-column-id="received">Strategy</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${project.requests}" var="requestItem">
                    <tr>
                        <td><g:link method="GET" controller="requestItem" action="show" id="${requestItem?.id}"><f:display bean="${requestItem}" property="reqNumber" /></g:link></td>
                    <td><f:display bean="${requestItem}" property="description" /></td>
                    <td><g:formatNumber number="${requestItem.budget}" type="currency" /></td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${requestItem?.rasDate}"/></td>
                    <td><f:display bean="${requestItem}" property="estLeadTime" /> <f:display bean="${requestItem}" property="leadTime" /></td>
                    <td><f:display bean="${requestItem}" property="strategy" /></td>
                    <g:if test="${requestItem?.lineItems?.size() > 0}">
                        <tr>
                            <td colspan="6">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th data-column-id="received">Line Item</th>
                                        <th data-column-id="received">WBS</th>
                                        <th data-column-id="received">Description</th>
                                        <th data-column-id="received">Quantity</th>
                                        <th data-column-id="received">UoM</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${requestItem?.lineItems}" var="lineItems" status="j">
                                        <tr>
                                            <td><g:link method="GET" controller="lineItem" action="show" id="${lineItems?.id}"><f:display bean="${lineItems}" property="code" /></g:link></td>
                                            <td><f:display bean="${lineItems}" property="wbs" /></td>
                                            <td><f:display bean="${lineItems}" property="description" /></td>
                                            <td><f:display bean="${lineItems}" property="quantity" /></td>
                                            <td><f:display bean="${lineItems}" property="unitOfMeasure" /></td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </g:if>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>
