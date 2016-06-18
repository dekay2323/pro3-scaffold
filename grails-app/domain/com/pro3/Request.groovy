package com.pro3

import com.pro3.type.LeadTime
import com.pro3.type.RequestStatus
import com.pro3.type.Strategy

class Request {
    String reqNumber
    Client client
    String description
    BigDecimal budget
    RequestStatus status
    Date rasDate
    String estLeadTime
    LeadTime leadTime
    Strategy strategy
    String technicalInstructions
    User enteredBy
    Date enteredByDate
    User approvedBy
    Date approvedByDate
    User modifiedBy
    Date modifiedByDate

    Date dateCreated
    Date lastUpdated

    static belongsTo = [project: Project]
    static hasMany = [
            bidders: Vendor,
            lineItems: LineItem,
            vddrs: Vddr,
            criteria: Criteria,
            rfqs: Rfq
    ]

    static constraints = {
        reqNumber nullable: true, unique: true, size: 0..25
        client nullable: false
        project nullable: false
        description nullable: true, blank: false, size: 0..500
        budget nullable: true, scale: 2
        status nullable: false
        rasDate nullable: true
        estLeadTime nullable: true, size: 0..25
        leadTime nullable: true
        strategy nullable: true
        technicalInstructions nullable: true, size: 0..500
//
//        bidders nullable: true
//        lineItems nullable: true
//        vddrs nullable: true
//        criteria nullable: true
//        rfqs nullable: true

        enteredBy nullable: true
        enteredByDate nullable: true
        approvedBy nullable: true
        approvedByDate nullable: true
        modifiedBy nullable: true
        modifiedByDate nullable: true
        dateCreated display: false
        lastUpdated display: false
    }

    public String toString() {
        "${reqNumber}"
    }
}
