package com.pro3

import javax.sound.sampled.Line

class QuoteLineItem {
    BigDecimal price
    Date shipDate

    Date dateCreated
    Date lastUpdated
    
    static belongsTo = [quote: Quote, lineItem: Line]

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 0..25
        price nullable: false, scale: 2
        shipDate nullable: false
    }

    public String toString() {
        "${name}"
    }
}
