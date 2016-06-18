package com.pro3

class QuoteLineItem {
    BigDecimal price
    Date shipDate

    Date dateCreated
    Date lastUpdated
    
    static belongsTo = [quote: Quote, lineItem: LineItem]

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 0..25
        price nullable: false, scale: 2
        shipDate nullable: false
        dateCreated display: false
        lastUpdated display: false
    }

    public String toString() {
        "${name}"
    }
}
