package com.pro3

import com.pro3.type.Strategy

class Request {
    String reqNumber
    Client client
    String description
    BigDecimal budget
    Date rasDate
    String estLeadTime
    Strategy strategy
    String technicalInstructions

    Date dateCreated
    Date lastUpdated

    static belongsTo = [project: Project]
    static hasMany = [bidders: Vendor, lineItems: LineItem]

    static constraints = {
        reqNumber nullable: true, unique: true, size: 0..25
        client nullable: false
        project nullable: false
        description nullable: true, blank: false, size: 0..500
        budget nullable: true, scale: 2
        rasDate nullable: true
        estLeadTime nullable: true, size: 0..25
        strategy nullable: true
        technicalInstructions nullable: true, size: 0..500
        bidders nullable: true
        lineItems nullable: true
    }

    public String toString() {
        "${reqNumber}"
    }
}
