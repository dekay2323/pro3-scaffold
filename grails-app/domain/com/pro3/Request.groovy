package com.pro3

import com.pro3.type.Strategy

class Request {
    Client client
    String description
    String reqNumber
    BigDecimal budget
    Date rasDate
    String estLeadTime
    Strategy strategy
    String technicalInstructions

    Date dateCreated
    Date lastUpdated

    static belongsTo = [project: Project]
    static hasMany = [bidders: Vendor]

    static constraints = {
        client nullable: false
        project nullable: false
        reqNumber nullable: true
        description nullable: true, blank: false
        budget nullable: true, scale: 2
        rasDate nullable: true
        estLeadTime nullable: true
        strategy nullable: true
        technicalInstructions nullable: true


        dateCreated nullable: false
        lastUpdated nullable: false
    }
}
